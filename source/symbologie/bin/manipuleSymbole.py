#!/usr/bin/env python
# coding: utf-8

"""
Outil pour générer une série de symbole svg à partir d'un template et de coefficients d'étirement.

Les fichiers symboles générés possedent un nom qui est derivé des paramètres donnés en entrée.

Les paramètres transmis sont :
- le nom du fichier svg template

Exemple d'utilisation
python ./manipuleSymbole.py ../data/Symbole/fromQgis/Grille_pp_x_010.svg
"""

# Import
import sys
import re
import lxml.etree as et
# Import necessaire pour pouvoir utiliser les fonctions décorées depuis qgis
from qgis.core import *
from qgis.gui import *

@qgsfunction(args='auto', group='Symbole')
def suffixe_from_XY(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Renvoie le suffixe (fin du nom) du fichier svg, en fonction des dimensions.
    """
    return param_from_XY(Obs_LargeurX, Obs_HauteurY)['Svg_Suffixe']


@qgsfunction(args='auto', group='Symbole')
def taille_from_XY(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Renvoie la taille (echelle d'insertion) du fichier svg, en fonction des dimensions.
    """
    return param_from_XY(Obs_LargeurX, Obs_HauteurY)['Svg_EchelleInsertion']


def param_from_XY(Obs_LargeurX, Obs_HauteurY):
    """
    Calcul des paramètres de la déformation.

    Tous les différents paramètres peuvent etre calculés à partir des
    2 seuls paramètres de départ : dimension en x et dimensin en y.
    """

    # Transformation en float
    Obs_LargeurX = (Obs_LargeurX) * 1.0
    Obs_HauteurY = (Obs_HauteurY) * 1.0

    # Des paramètres servent à définir les caractéristiques du symbole final :
    # c'est à dire son nom, ses paramètres de déformation, sa taille, ...
    # - Obs_QuadrantSigneSigne
    # - Obs_AxeDirection
    # - Obs_RatioLabel
    # - Obs_Ratio
    # - Obs_InvRatio
    # - Svg_ScaleX
    # - Svg_ScaleY
    # - Svg_Suffixe
    # - Svg_EchelleInsertion = max(abs(Obs_Largeur_X), abs(Obs_HauteurY))

    if (abs(Obs_LargeurX) >= abs(Obs_HauteurY)):
        Svg_EchelleInsertion = round(abs(Obs_LargeurX), 1)
        try:
            Obs_RatioLabel = int(round((abs(Obs_LargeurX) / abs(Obs_HauteurY)) * 10, 0))
        except ZeroDivisionError:
            Obs_RatioLabel = 999
    else:
        Svg_EchelleInsertion = round(abs(Obs_HauteurY), 1)
        try:
            Obs_RatioLabel = int(round((abs(Obs_HauteurY) / abs(Obs_LargeurX)) * 10, 0))
        except ZeroDivisionError:
            Obs_RatioLabel = 999
    Obs_RatioLabel = '{:0>3}'.format(Obs_RatioLabel)

    Obs_Ratio = round((max(abs(Obs_LargeurX), abs(Obs_HauteurY))
                       / min(abs(Obs_LargeurX), abs(Obs_HauteurY))), 1)
    Obs_InvRatio = round((min(abs(Obs_LargeurX), abs(Obs_HauteurY))
                          / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3)

    # On definit 8 zones : chaque quadrant est divisé en deux
    if (abs(Obs_LargeurX) >= abs(Obs_HauteurY)) and (Obs_LargeurX >= 0.0 and Obs_HauteurY >= 0.0):
        Obs_QuadrantSigneSigne = "pp"
        Obs_AxeDirection = "x"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "+" + Obs_AxeDirection,
            'Svg_ScaleX': 1.0,
            'Svg_ScaleY': Obs_InvRatio,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }
    elif (abs(Obs_LargeurX) >= abs(Obs_HauteurY)) and (Obs_LargeurX >= 0.0 and Obs_HauteurY < 0.0):
        Obs_QuadrantSigneSigne = "pm"
        Obs_AxeDirection = "x"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "+" + Obs_AxeDirection,
            'Svg_ScaleX': 1.0,
            'Svg_ScaleY': -Obs_InvRatio,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }
    elif (abs(Obs_LargeurX) >= abs(Obs_HauteurY)) and (Obs_LargeurX < 0.0 and Obs_HauteurY < 0.0):
        Obs_QuadrantSigneSigne = "mm"
        Obs_AxeDirection = "x"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "-" + Obs_AxeDirection,
            'Svg_ScaleX': -1.0,
            'Svg_ScaleY': -Obs_InvRatio,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }
    elif (abs(Obs_LargeurX) >= abs(Obs_HauteurY)) and (Obs_LargeurX < 0.0 and Obs_HauteurY >= 0.0):
        Obs_QuadrantSigneSigne = "mp"
        Obs_AxeDirection = "x"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "-" + Obs_AxeDirection,
            'Svg_ScaleX': -1.0,
            'Svg_ScaleY': Obs_InvRatio,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }
    elif (abs(Obs_LargeurX) < abs(Obs_HauteurY)) and (Obs_LargeurX >= 0.0 and Obs_HauteurY >= 0.0):
        Obs_QuadrantSigneSigne = "pp"
        Obs_AxeDirection = "y"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "+" + Obs_AxeDirection,
            'Svg_ScaleX': Obs_InvRatio,
            'Svg_ScaleY': 1.0,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }
    elif (abs(Obs_LargeurX) < abs(Obs_HauteurY)) and (Obs_LargeurX >= 0.0 and Obs_HauteurY < 0.0):
        Obs_QuadrantSigneSigne = "pm"
        Obs_AxeDirection = "y"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "-" + Obs_AxeDirection,
            'Svg_ScaleX': Obs_InvRatio,
            'Svg_ScaleY': -1.0,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }
    elif (abs(Obs_LargeurX) < abs(Obs_HauteurY)) and (Obs_LargeurX < 0.0 and Obs_HauteurY < 0.0):
        Obs_QuadrantSigneSigne = "mm"
        Obs_AxeDirection = "y"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "-" + Obs_AxeDirection,
            'Svg_ScaleX': -Obs_InvRatio,
            'Svg_ScaleY': -1.0,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }
    elif (abs(Obs_LargeurX) < abs(Obs_HauteurY)) and (Obs_LargeurX < 0.0 and Obs_HauteurY >= 0.0):
        Obs_QuadrantSigneSigne = "mp"
        Obs_AxeDirection = "y"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe': Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
            'SVg_QuadrantEtirement': "+" + Obs_AxeDirection,
            'Svg_ScaleX': -Obs_InvRatio,
            'Svg_ScaleY': 1.0,
            'Svg_EchelleInsertion': Svg_EchelleInsertion
        }

    return param


def stretch_symbol(inFile, outFile, Obs_LargeurX, Obs_HauteurY):
    """
    Lecture, déformation du symbole initial, ecriture d'un symbole en sortie
    """
    # Lecture du fichier SVG/XML en entree
    tree = et.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    # Les parametres de deformation sont calculés dans une autre fonction
    param = param_from_XY(Obs_LargeurX, Obs_HauteurY)
    """
    print('Obs_LargeurX = ' + str(Obs_LargeurX) + \
          ' ; Obs_HauteurY = ' + str(Obs_HauteurY) + \
          ' ; Svg_Suffixe = ' + str(param['Svg_Suffixe']) + \
          ' ; Svg_EchelleInsertion = ' + str(param['Svg_EchelleInsertion']) + \
          ' ; Svg_ScaleX = ' + str(param['Svg_ScaleX']) + \
          ' ; Svg_ScaleY = ' + str(param['Svg_ScaleY']) + \
          ' ; controleX = ' + str(round(Obs_LargeurX - param['Svg_ScaleX'] * param['Svg_EchelleInsertion'],3)) + \
          ' ; controleY = ' + str(round(Obs_HauteurY - param['Svg_ScaleY'] * param['Svg_EchelleInsertion'],3)))
    """
    # Ajout de la transformation pour tous les noeuds du XML.
    for path in root.iter('{http://www.w3.org/2000/svg}path'):
        path.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         str(1250*(1-param['Svg_ScaleX'])) + ' ,' +
                                         str(1250*(1-param['Svg_ScaleY'])) + ')')
    # Ajout de la transformation de mise a l'echelle pour tous les rectangles.
    for rect in root.iter('{http://www.w3.org/2000/svg}rect'):
        rect.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         str(1250*(1-param['Svg_ScaleX'])) + ' ,' +
                                         str(1250*(1-param['Svg_ScaleY'])) + ')')
    # Ajout de la transformation de mise a l'echelle pour tous les polygones.
    for polygon in root.iter('{http://www.w3.org/2000/svg}polygon'):
        polygon.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         str(1250*(1-param['Svg_ScaleX'])) + ' ,' +
                                         str(1250*(1-param['Svg_ScaleY'])) + ')')
    # Ajout de la transformation de mise a l'echelle pour tous les textes.
    for text in root.iter('{http://www.w3.org/2000/svg}text'):
        text.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         str(1250*(1-param['Svg_ScaleX'])) + ' ,' +
                                         str(1250*(1-param['Svg_ScaleY'])) + ')')
        # text.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
        #                                  str(param['Svg_ScaleY']) + ', ' +
        #                                  str(1250*(1-abs(param['Svg_ScaleX']))) + ' ,' +
        #                                  str(1000*(-param['Svg_ScaleY']) + 625 ) + ')')
    # Ajout de la transformation de mise a l'echelle pour tous les conteneur de textes.
    for flowRoot in root.iter('{http://www.w3.org/2000/svg}flowRoot'):
        flowRoot.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         str(1250*(1-param['Svg_ScaleX'])) + ' ,' +
                                         str(1250*(1-param['Svg_ScaleY'])) + ')')
        # Remise a l'echelle 1,1 donc pas d'echelle des path dans les flowRoot ?
        for path in flowRoot.iter('{http://www.w3.org/2000/svg}path'):
            path.set('transform','')

        # Remise a l'echelle 1,1 donc pas d'echelle des text dans les flowRoot ?
        for text in flowRoot.iter('{http://www.w3.org/2000/svg}text'):
            text.set('transform','')

    #Ecriture du fichier en sortie
    tree.write(outFile)



def prepare_svg_1ere_passe(inFile, outFile):
    """
    Suppression des branches de l'arbre xml qui sont inutiles
    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = et.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    # Suppression des branches sans path
    # on recherche les branches g/g qui sont inutiles
    # - une branche g/g/path est utile
    # - une branche g/g/vide est inutile

    for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g"):
        if element.findall('{http://www.w3.org/2000/svg}path'):
            #print('path {}, {}'.format(element.tag, \
            #                           element.attrib))
            pass
        elif element.findall('{http://www.w3.org/2000/svg}text'):
            #print('text {}, {}'.format(element.tag, \
            #                           element.attrib))
            pass
        else:
            #print('supperflu {}, {}'.format(element.tag, \
            #                                element.attrib))
            #
            # https://stackoverflow.com/questions/7981840/how-to-remove-an-element-in-lxml
            #
            element.getparent().remove(element)


    #Ecriture du fichier en sortie
    tree.write(outFile)


def prepare_svg_2de_passe(inFile, outFile):
    """
    Suppression des branches dont la couleur est blanche(ffffff) et opacity est 1
    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = et.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g[@fill='#ffffff']"):
        if element.findall("[@fill-opacity='1']"):
            #print('opactity {}, {}'.format(element.tag, \
            #                           element.attrib))
            element.getparent().remove(element)


    #Ecriture du fichier en sortie
    tree.write(outFile)


def prepare_svg_3eme_passe(inFile, outFile):
    """
    Modification de la Largeur, Hauteur et de la viewbox
    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = et.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    # Modification de la largeur
    root.set('width', '2500 px')
    # Modification de la hauteur
    root.set('height', '2500 px')
    # Modification de la viewbox
    root.set('viewBox', '0 0 2500 2500')

    # Modification de la matrice de transformation du groupe contenant le texte
    for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g"):
        if element.findall('{http://www.w3.org/2000/svg}path'):
            element.set('transform','matrix(1, 0, 0, 1, ' +
                                             str(0) + ' ,' +
                                             str(0) + ')')
            pass
        elif element.findall('{http://www.w3.org/2000/svg}text'):
            element.set('transform','matrix(1, 0, 0, 1, ' +
                                             str(0) + ' ,' +
                                             str(0) + ')')
            pass
        else:
            print('supperflu {}, {}'.format(element.tag, \
                                            element.attrib))
            #
            # https://stackoverflow.com/questions/7981840/how-to-remove-an-element-in-lxml
            #
            element.getparent().remove(element)


    #Ecriture du fichier en sortie
    tree.write(outFile)


def prepare_svg_4eme_passe(inFile, outFile):
    """

    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = et.parse(inFile)
    # Mise en memoire
    root = tree.getroot()




    #Ecriture du fichier en sortie
    tree.write(outFile)

def prepare_svg_5eme_passe(inPath, outPath, inFile):
    """
    Etirement
    """
    fichierEntree = inPath + inFile

    for Obs_LargeurX in [-3, -2, -1, -0.5, 0.5, 1, 2, 3, 4]:
        for Obs_HauteurY in [-3, -2, -1, -0.5, 0.5, 1, 2, 3, 4]:

            # Les parametres de deformation sont calculés dans une autre fonction
            param = param_from_XY(Obs_LargeurX, Obs_HauteurY)
            nouveau_suffixe = param['Svg_Suffixe']

            if nouveau_suffixe != "pp_x_010":
                # on ne deforme pas le fichier initial....
                fichierSortieSansChemin = re.sub(r'pp_x_010',
                                                 nouveau_suffixe,
                                                 inFile)
                fichierSortie = outPath + fichierSortieSansChemin
                stretch_symbol(fichierEntree, fichierSortie, Obs_LargeurX, Obs_HauteurY)


def main():
    """
    Entrée principale.

    Ce script peut etre :
    - autonome : il s'utilise alors ainsi
      python ./manipuleSymbole.py ../data/Symbole/fromQgis/Grille_pp_x_010.svg
    - utilisé a l'interieur de qgis : des fonctions ont un decorateur
      @qgsfunction(args='auto', group='Custom')
      ces fonctions peuvent etre appelées depuis qgis
      il faut que ce script soit placé dans le repertoire adéquat
      .qgis2/python/expressions/manipuleSymbole.py

    Quand il est utilisé en ligne de commande, ce script prend donc en entrée
    un fichier svg modele, et plusieurs manipulations successives sont réalisées
    sur ce fichier de départ.

    la première passe consiste à

    la seconde passe permet

    la troisième passe

    la quatrième passe
    """

    try:
        # Premier parametre : le nom du fichier svg a traiter (fichier template)
        # le fichier en entrée doit respecter quelques caractéristiques,
        # par exemple, son nom doit finir par le suffixe _pp_x_010.svg
        fichierEntree = str(sys.argv[1])
    except:
        print("Ce script s'utilise ainsi :")
        print("python ./manipuleSymbole.py ../data/Symbole/fromQgis/Grille_pp_x_010.svg")
        return

    cheminEntree = '/'.join(fichierEntree.split('/')[0:-1]) + '/'
    cheminSortie = cheminEntree
    fichierEntreeSansChemin = fichierEntree.split('/')[-1]
    fichierSortieSansChemin = re.sub(r'pp_x_010', r'pp_x_010_2', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("1ere passe => {}".format(fichierSortie))
    prepare_svg_1ere_passe(fichierEntree, fichierSortie)

    ## 2de passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'pp_x_010_2', r'pp_x_010_3', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("2de passe  => {}".format(fichierSortie))
    prepare_svg_2de_passe(fichierEntree, fichierSortie)

    ## 3eme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'pp_x_010_3', r'pp_x_010_4', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("3eme passe => {}".format(fichierSortie))
    prepare_svg_3eme_passe(fichierEntree, fichierSortie)

    ## 4eme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'pp_x_010_4', r'pp_x_010', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("4eme passe => {}".format(fichierSortie))
    prepare_svg_4eme_passe(fichierEntree, fichierSortie)

    ## 5eme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    #fichierSortieSansChemin = re.sub(r'pp_x_010_2', r'pp_x_010_4', fichierEntreeSansChemin)
    #fichierEntree = cheminEntree + fichierEntreeSansChemin
    #fichierSortie = cheminSortie + fichierSortieSansChemin
    #print("5eme passe => {}".format(fichierSortie))
    print("5eme passe => {}".format(fichierSortie))
    prepare_svg_5eme_passe(cheminEntree, cheminSortie, fichierEntreeSansChemin)


if __name__ == '__main__':
    main()
