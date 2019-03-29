#!/usr/bin/env python3
# coding: utf-8

"""
Outil pour générer une série de symbole svg à partir d'un template et de coefficients d'étirement.

Les fichiers symboles générés possedent un nom qui est derivé des paramètres donnés en entrée.

Les paramètres transmis sont :
- le nom du fichier svg template

Exemple d'utilisation
python ./manipuleSymbole.py ../data/Symbole/fromQgis/Grille_original.svg
"""

# Import
import sys
import re
import lxml.etree as et
import os
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
    #print("{} {}".format(Obs_LargeurX,Obs_HauteurY))

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
    try:
        Obs_Ratio = round((max(abs(Obs_LargeurX), abs(Obs_HauteurY))
                           / min(abs(Obs_LargeurX), abs(Obs_HauteurY))), 1)
    except ZeroDivisionError:
        Obs_Ratio = 999.9
    try:
        Obs_InvRatio = round((min(abs(Obs_LargeurX), abs(Obs_HauteurY))
                              / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3)
    except ZeroDivisionError:
        Obs_InvRatio = 999.9

    # On definit 8 zones : chaque quadrant est divisé en deux
    if (abs(Obs_LargeurX) >= abs(Obs_HauteurY)) and (Obs_LargeurX >= 0.0 and Obs_HauteurY >= 0.0):
        Obs_QuadrantSigneSigne = "pp"
        Obs_AxeDirection = "x"
        param = {
            'Obs_QuadrantSigneSigne': Obs_QuadrantSigneSigne,
            'Obs_AxeDirection': Obs_AxeDirection,
            'Obs_Ratio': Obs_Ratio,
            'Obs_RatioLabel': Obs_RatioLabel,
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
            'Svg_Suffixe':  "_" + Obs_QuadrantSigneSigne + "_" + Obs_AxeDirection + "_" + str(Obs_RatioLabel),
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
    # Pour chacun des noeuds de type path, transformation geometrique (etirement_x, etirement_y, translation)
    for path in root.iter('{http://www.w3.org/2000/svg}path'):
        # on recupere les valeurs de la matrice de transformation initiale
        # puis on fabrique la nouvelle matrice
        #print('3 tag {}, {}'.format(text.tag, \
        #                           text.attrib["transform"]))
        try :
            StartXOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<2>', path.attrib["transform"]))
            StartYOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<3>', path.attrib["transform"]))
        except:
            StartXOld = 0.0
            StartYOld = 0.0
        #print('4 Old {}, {}'.format(StartXOld, \
        #                           StartYOld))
        StartXNew = str(1250*(1-param['Svg_ScaleX'])+StartXOld*param['Svg_ScaleX'])
        StartYNew = str(1250*(1-param['Svg_ScaleY'])+StartYOld*param['Svg_ScaleY'])
        #print('4 New {}, {}'.format(StartXNew, \
        #                           StartYNew))
        path.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         StartXNew + ' ,' +
                                         StartYNew + ')')
    # Pour chacun des noeuds de type rect, transformation geometrique (etirement_x, etirement_y, translation)
    for rect in root.iter('{http://www.w3.org/2000/svg}rect'):
        # on recupere les valeurs de la matrice de transformation initiale
        # puis on fabrique la nouvelle matrice
        #print('3 tag {}, {}'.format(text.tag, \
        #                           text.attrib["transform"]))
        try:
            StartXOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<2>', rect.attrib["transform"]))
            StartYOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<3>', rect.attrib["transform"]))
        except:
            StartXOld = 0.0
            StartYOld = 0.0
        #print('4 Old {}, {}'.format(StartXOld, \
        #                           StartYOld))
        StartXNew = str(1250*(1-param['Svg_ScaleX'])+StartXOld*param['Svg_ScaleX'])
        StartYNew = str(1250*(1-param['Svg_ScaleY'])+StartYOld*param['Svg_ScaleY'])
        #print('4 New {}, {}'.format(StartXNew, \
        #                           StartYNew))
        rect.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         StartXNew + ' ,' +
                                         StartYNew + ')')
    # Pour chacun des noeuds de type polygon, transformation geometrique (etirement_x, etirement_y, translation)
    for polygon in root.iter('{http://www.w3.org/2000/svg}polygon'):
        # on recupere les valeurs de la matrice de transformation initiale
        # puis on fabrique la nouvelle matrice
        #print('3 tag {}, {}'.format(text.tag, \
        #                           text.attrib["transform"]))
        try:
            StartXOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<2>', polygon.attrib["transform"]))
            StartYOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<3>', polygon.attrib["transform"]))
        except:
            StartXOld = 0.0
            StartYOld = 0.0
        #print('4 Old {}, {}'.format(StartXOld, \
        #                           StartYOld))
        StartXNew = str(1250*(1-param['Svg_ScaleX'])+StartXOld*param['Svg_ScaleX'])
        StartYNew = str(1250*(1-param['Svg_ScaleY'])+StartYOld*param['Svg_ScaleY'])
        #print('4 New {}, {}'.format(StartXNew, \
        #                           StartYNew))
        polygon.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         StartXNew + ' ,' +
                                         StartYNew + ')')
    # Pour chacun des noeuds de type circle, transformation geometrique (etirement_x, etirement_y, translation)
    for circle in root.iter('{http://www.w3.org/2000/svg}circle'):
        # on recupere les valeurs de la matrice de transformation initiale
        # puis on fabrique la nouvelle matrice
        #print('3 tag {}, {}'.format(text.tag, \
        #                           text.attrib["transform"]))
        try:
            StartXOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<2>', circle.attrib["transform"]))
            StartYOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<3>', circle.attrib["transform"]))
        except:
            StartXOld = 0.0
            StartYOld = 0.0
        #print('4 Old {}, {}'.format(StartXOld, \
        #                           StartYOld))
        StartXNew = str(1250*(1-param['Svg_ScaleX'])+StartXOld*param['Svg_ScaleX'])
        StartYNew = str(1250*(1-param['Svg_ScaleY'])+StartYOld*param['Svg_ScaleY'])
        #print('4 New {}, {}'.format(StartXNew, \
        #                           StartYNew))
        circle.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         StartXNew + ' ,' +
                                         StartYNew + ')')
    # Pour chacun des noeuds de type text, transformation geometrique (etirement_x, etirement_y, translation)
    for text in root.iter('{http://www.w3.org/2000/svg}text'):
        # on recupere les valeurs de la matrice de transformation initiale
        # puis on fabrique la nouvelle matrice
        #print('3 tag {}, {}'.format(text.tag, \
        #                           text.attrib["transform"]))
        try:
            StartXOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<2>', text.attrib["transform"]))
            StartYOld = float(re.sub('(.*)\,(.*)\,(.*)\)', '\g<3>', text.attrib["transform"]))
        except:
            StartXOld = 0.0
            StartYOld = 0.0
        #print('4 Old {}, {}'.format(StartXOld, \
        #                           StartYOld))
        StartXNew = str(1250*(1-param['Svg_ScaleX'])+StartXOld*param['Svg_ScaleX'])
        StartYNew = str(1250*(1-param['Svg_ScaleY'])+StartYOld*param['Svg_ScaleY'])
        #print('4 New {}, {}'.format(StartXNew, \
        #                           StartYNew))
        text.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         StartXNew + ' ,' +
                                         StartYNew + ')')
    # Pour mémoire (semble inutile) :
    # Pour chacun des noeuds de type flowRoot, transformation geometrique (etirement_x, etirement_y, translation)
    #for flowRoot in root.iter('{http://www.w3.org/2000/svg}flowRoot'):
    #    flowRoot.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
    #                                     str(param['Svg_ScaleY']) + ', ' +
    #                                     str(1250*(1-param['Svg_ScaleX'])) + ' ,' +
    #                                     str(1250*(1-param['Svg_ScaleY'])) + ')')
    #    # Remise a l'echelle 1,1 donc pas d'echelle des path dans les flowRoot ?
    #    for path in flowRoot.iter('{http://www.w3.org/2000/svg}path'):
    #        path.set('transform','')
    #   # Remise a l'echelle 1,1 donc pas d'echelle des text dans les flowRoot ?
    #    for text in flowRoot.iter('{http://www.w3.org/2000/svg}text'):
    #        text.set('transform','')

    # Pour mémoire :
    # Suivant la méthode de fabrication du symbole initial,
    # si le groupe g (qui est parent d'un texte ou d'un chemin),
    # contient deja une matrice de transformation,
    # alors, on a essayé de paramétrer cette matrice de manière automatique,
    # mais cela est apparu trop compliqué
    # (il faut deporter la translation du groupe directement sur la géometrie de l'objet)
    #
    # IL FAUT DONC MODIFIER LE SYMBOLE MANUELLEMENT
    #
    # Modification de la matrice de transformation du groupe g contenant le texte
    #for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g"):
    #    if element.findall('{http://www.w3.org/2000/svg}path'):
    #        element.set('transform','matrix(1, 0, 0, 1, ' +
    #                                         str(0) + ' ,' +
    #                                         str(0) + ')')
    #        pass
    #    elif element.findall('{http://www.w3.org/2000/svg}text'):
    #        element.set('transform','matrix(1, 0, 0, 1, ' +
    #                                         str(0) + ' ,' +
    #                                         str(0) + ')')
    #        pass

    # Ecriture du fichier en sortie
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
        elif element.findall('{http://www.w3.org/2000/svg}rect'):
            #print('rect {}, {}'.format(element.tag, \
            #                           element.attrib))
            pass
        elif element.findall('{http://www.w3.org/2000/svg}circle'):
            #print('circle {}, {}'.format(element.tag, \
            #                           element.attrib))
            pass
        elif element.findall('{http://www.w3.org/2000/svg}text'):
            #print('text {}, {}'.format(element.tag, \
            #                           element.attrib))
            pass
        else:
            #print('supperflu {}, {}'.format(element.tag, \
            #                                element.attrib))
            # https://stackoverflow.com/questions/7981840/how-to-remove-an-element-in-lxml
            element.getparent().remove(element)

    # Ecriture du fichier en sortie
    tree.write(outFile)


def prepare_svg_2de_passe(inFile, outFile):
    """
    1. Suppression des branches dont (la couleur est blanche(#ffffff)) AND (opacity est 1)
    2. Suppression des branches dont (la couleur est noire(#000000)) AND (opacity est 1)
    3. transfert des matrices de transformation du groupe vers ses elements fils
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

    for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g[@fill='#000000']"):
        if element.findall("[@fill-opacity='1']"):
            #print('opactity {}, {}'.format(element.tag, \
            #                           element.attrib))
            element.getparent().remove(element)
        if element.findall("[@fill-opacity='0']"):
            #print('opactity {}, {}'.format(element.tag, \
            #                           element.attrib))
            element.getparent().remove(element)
        #if element.findall("[@fill-opacity='0']/rect"):
        #    print('opactity {}, {}'.format(element.tag, \
        #                               element.attrib))
        #    element.getparent().remove(element)

    # maintenant, on va reecrire, si besoin, la matrice de transformation
    # on la passe de l'element g, a ses elements fils
    for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g"):
        if element.findall("[@transform='matrix(1,0,0,1,0,0)']"):
            #print('1 tag {}, {}'.format(element.tag, \
            #                           element.attrib["transform"]))
            pass
        else:
            sauve_transform = element.attrib["transform"]
            #print('2 tag {}, {}'.format(element.tag, \
            #                            element.attrib["transform"]))
            for element_fils in element.iter('{http://www.w3.org/2000/svg}path'):
                element_fils.set('transform', sauve_transform )
            for element_fils in element.iter('{http://www.w3.org/2000/svg}rect'):
                element_fils.set('transform', sauve_transform )
            for element_fils in element.iter('{http://www.w3.org/2000/svg}circle'):
                element_fils.set('transform', sauve_transform )
            for element_fils in element.iter('{http://www.w3.org/2000/svg}text'):
                element_fils.set('transform', sauve_transform )
            element.set('transform', 'matrix(1,0,0,1,0,0)' )

    # Ecriture du fichier en sortie
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
    root.set('width', '1000 px')
    root.set('width', '2500 px')
    # Modification de la hauteur
    root.set('height', '2000 px')
    root.set('height', '2500 px')
    # Modification de la viewbox
    root.set('viewBox', '0 0 1000 2000')
    root.set('viewBox', '0 0 2500 2500')

    # Ecriture du fichier en sortie
    tree.write(outFile)


def prepare_svg_4eme_passe(inFile, outFile,
                           qgisCompatible=True,
                           valueFill='#494949', valueFillOpacity='0.2',
                           valueOutline='#494949', valueOutlineWidth='0.02'):
    """
    Faire en sorte que le symbole soit personnalisable depuis qgis,
    c'est à dire que l'on modifie ici le svg, en remplaçant les couleurs et les
    épaisseurs, par une commande de type param,
    de façon à ce que, depuis qgis, le symbole soit personnalisable
    http://www.portailsig.org/content/ajouter-et-personnaliser-des-symboles-svg-depuis-qgis
    Les modifications à faire :

    fill="param(fill) #FFF" --> modifie le remplissage
    fill-opacity="param(fill-opacity) 0.2" --> modifie la transparence du remplissage
    stroke="param(outline) #000" --> modifie la couleur de bordure
    stroke-width="param(outline-width) 1" --> modifie l'épaisseur du contour

    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = et.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    if qgisCompatible == True:
        valueFill = 'param(fill) {}'.format(valueFill)
        valueFillOpacity = 'param(fill-opacity) {}'.format(valueFillOpacity)
        valueOutline = 'param(outline) {}'.format(valueOutline)
        valueOutlineWidth = 'param(outline-width) {}'.format(valueOutlineWidth)
    #else:
    #    valueFill = '{}'.format(valueFill)
    #    valueFillOpacity = '{}'.format(valueFillOpacity)
    #    valueOutline = '{}'.format(valueOutline)
    #    valueOutlineWidth = '{}'.format(valueOutlineWidth)

    for element in root.iter('{http://www.w3.org/2000/svg}path'):
        element.set('style', '')
        element.set('fill', valueFill)
        element.set('fill-opacity', valueFillOpacity)
        element.set('stroke', valueOutline)
        element.set('stroke-width', valueOutlineWidth)
        #element.set('stroke-opacity', 'param(stroke-opacity) 1')

    for element in root.iter('{http://www.w3.org/2000/svg}rect'):
        element.set('style', '')
        element.set('fill', valueFill)
        element.set('fill-opacity', valueFillOpacity)
        element.set('stroke', valueOutline)
        element.set('stroke-width', valueOutlineWidth)
        #element.set('stroke-opacity', 'param(stroke-opacity) 1')

    for element in root.iter('{http://www.w3.org/2000/svg}circle'):
        element.set('style', '')
        element.set('fill', valueFill)
        element.set('fill-opacity', valueFillOpacity)
        element.set('stroke', valueOutline)
        element.set('stroke-width', valueOutlineWidth)
        #element.set('stroke-opacity', 'param(stroke-opacity) 1')

    for element in root.iter('{http://www.w3.org/2000/svg}text'):
        element.set('style', '')
        element.set('fill', valueFill)
        element.set('fill-opacity', valueFillOpacity)
        element.set('stroke', valueOutline)
        element.set('stroke-width', valueOutlineWidth)
        #element.set('stroke-opacity', 'param(stroke-opacity) 1')

    # Ecriture du fichier en sortie
    tree.write(outFile)

def prepare_svg_5eme_passe(inPath, outPath, inFile):
    """
    Etirement
    """
    fichierEntree = inPath + inFile

    # Les valeurs de debut et de fin correpondent
    # aux coefficient de deformation multiplié par 10,
    # ou, exprimé autrement, à des valeurs en unité décimétriques
    # Par exemple, -20 correspont à -2 en coefficient,
    # et comme le symbole initial a 1 mètre de coté,
    # alors, cela correspond à une valeur de -2 mètres
    #
    # Le pas, ici 10, correspond au "grain", à la "finesse",
    # ici, pour un pas de 10, alors, on aura les rapports suivants :
    # 20/10 ; 10/10 et 10/20
    #
    #for Obs_LargeurX in [-3, -2, -1, -0.5, 0.5, 1, 2, 3, 4]:
    #for X in range(-20, 21, 1):
    for X in range(-20, 21, 10):
    #for X in range(10, 11, 1):
        Obs_LargeurX = X / 10.0
        #for Obs_HauteurY in [-3, -2, -1, -0.5, 0.5, 1, 2, 3, 4]:
        #for Y in range(-20, 21, 1):
        for Y in range(-20, 21, 10):
        #for Y in range(10, 11, 1):
            Obs_HauteurY = Y / 10.0
            # Les parametres de deformation sont calculés dans une autre fonction
            param = param_from_XY(Obs_LargeurX, Obs_HauteurY)
            nouveau_suffixe = param['Svg_Suffixe']
            #print('{}'.format(param['Svg_Suffixe']))

            if nouveau_suffixe != "_pp_x_010":
                # on ne deforme pas le fichier initial....
                fichierSortieSansChemin = re.sub(r'_pp_x_010_5',
                                                 nouveau_suffixe,
                                                 inFile)
                fichierSortie = outPath + fichierSortieSansChemin
                stretch_symbol(fichierEntree, fichierSortie, Obs_LargeurX, Obs_HauteurY)
            elif nouveau_suffixe == "_pp_x_010":
                # on ne deforme pas le fichier initial....
                fichierSortieSansChemin = re.sub(r'_pp_x_010_5',
                                                 nouveau_suffixe,
                                                 inFile)
                fichierSortie = outPath + fichierSortieSansChemin
                stretch_symbol(fichierEntree, fichierSortie, Obs_LargeurX, Obs_HauteurY)
                fichierSortieSansChemin = re.sub(r'_pp_x_010_5',
                                                 '',
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
      ~/.qgis2/python/expressions/manipuleSymbole.py
      ou, pour la version 3
      ~/.local/share/QGIS/QGIS3/profile/default/python/expressions/manipuleSymbole.py

    Quand il est utilisé en ligne de commande, ce script prend donc en entrée
    un fichier svg modele, et plusieurs manipulations successives sont réalisées
    sur ce fichier de départ.

    - la première passe consiste à nettoyer/compacter le fichier svg original

    - la seconde passe continue le nettoyage pour supprimer les elements de couleur blanche...

    - la troisième passe permet de fixer les dimensions du symbole (2500 x 2500)

    - la quatrième passe modifie les couleurs et les épaisseurs des elements dans le svg :
      ces informations deviennent des paramètres et pourront être utilisés à partir de qgis

    - la cinquième passe est celle qui va générer la série de symbole à partir de ce dernier modele.
      pour x allant de -5 à 5, et y allant de -5 à 5, chaque symbole généré est personnalisé
      grace à une matrice de transformation géométrique (ScaleX, 0, 0, ScaleY, TranslationX, TranslationY)
    """

    try:
        # Premier parametre : le nom du fichier svg a traiter (fichier template)
        # le fichier en entrée doit respecter quelques caractéristiques,
        # par exemple, son nom doit finir par le suffixe _original.svg
        fichierEntree = str(sys.argv[1])
    except:
        print("Ce script s'utilise ainsi :")
        print("python ./manipuleSymbole.py ../data/Symbole/fromQgis/Grille_original.svg")
        return

    cheminEntree = '/'.join(fichierEntree.split('/')[0:-1]) + '/'
    cheminSortie = cheminEntree
    fichierEntreeSansChemin = fichierEntree.split('/')[-1]
    fichierSortieSansChemin = re.sub(r'_original', r'_pp_x_010_2', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("1ere passe => {}".format(fichierSortie))
    prepare_svg_1ere_passe(fichierEntree, fichierSortie)

    ## 2de passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'_pp_x_010_2', r'_pp_x_010_3', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("2de passe  => {}".format(fichierSortie))
    prepare_svg_2de_passe(fichierEntree, fichierSortie)
    ## nettoyage
    os.remove(fichierEntree)

    ## 3eme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'_pp_x_010_3', r'_pp_x_010_4', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("3eme passe => {}".format(fichierSortie))
    prepare_svg_3eme_passe(fichierEntree, fichierSortie)
    os.remove(fichierEntree)

    ## 4eme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'_pp_x_010_4', r'_pp_x_010_5', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("4eme passe => {}".format(fichierSortie))
    # pour des symboles "qgisCompatible", avec des couleurs grises
    prepare_svg_4eme_passe(fichierEntree, fichierSortie,
                           qgisCompatible=True,
                           valueFill='#494949', valueFillOpacity='0.2',
                           valueOutline='#494949', valueOutlineWidth='0.02')
    # pour des symboles "qgisCompatible", avec des couleurs assainissement 125,73,0
    #prepare_svg_4eme_passe(fichierEntree, fichierSortie,
    #                       qgisCompatible=True,
    #                       valueFill='#7d4900', valueFillOpacity='0.2',
    #                       valueOutline='#7d4900', valueOutlineWidth='25')
    # pour des symboles non "qgisCompatible", avec des couleurs assainissement 125,73,0
    # pour les symboles non "qgisCompatible", ne pas hésiter à mettre une epaisseur ~ 25
    #prepare_svg_4eme_passe(fichierEntree, fichierSortie,
    #                       qgisCompatible=False,
    #                       valueFill='#7d4900', valueFillOpacity='0.2',
    #                       valueOutline='#7d4900', valueOutlineWidth='25')
    os.remove(fichierEntree)

    ## 5eme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    #fichierSortieSansChemin = re.sub(r'pp_x_010_5', r'pp_x_010_6', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    #fichierSortie = cheminSortie + fichierSortieSansChemin
    #print("5eme passe => {}".format(fichierSortie))
    print("5eme passe => {} {} {}".format(cheminEntree, cheminSortie, fichierEntreeSansChemin))
    prepare_svg_5eme_passe(cheminEntree, cheminSortie, fichierEntreeSansChemin)
    os.remove(fichierEntree)


    ## Nettoyage
    fichierEntreeSansChemin = fichierSortieSansChemin
    liste_suffixe_a_supprimer = [r'_mp_x_999', r'_pm_y_999', r'_pp_x_999', r'_pp_y_999']
    for suffixe in liste_suffixe_a_supprimer:
        fichierEntree = cheminEntree + re.sub(r'_pp_x_010_5', suffixe, fichierEntreeSansChemin)
        os.remove(fichierEntree)
        print('os.remove({})'.format(fichierEntree))


if __name__ == '__main__':
    main()
