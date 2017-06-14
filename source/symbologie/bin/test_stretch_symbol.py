#!/usr/bin/env python3
# coding: utf-8

"""
Outil pour modifier un symbole svg à partir d'un template et de coef d'etirement.

Le fichier généré possede un nom qui est derivé des paramètres donnés en entrée.

Les 3 paramètres transmis sont :
- le nom du fichier svg template
- xy (x ou y selon que l'on agrandit x ou y)
- le ratio (ratio abs(round(x/y,1)) ou abs(round(y/x,1)))

Exemple d'utilisation
./stretch_symbol.py template_arbre.svg x .2

"""

# Import
# Sys pour les parametres
import sys
import re
import lxml.etree as et
#import stretch_symbol as ss



def stretchSymbol(inFile, outFile, Obs_LargeurX, Obs_HauteurY):
    """
    Déformation du symbole
    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = et.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    # Les parametres de deformation sont calculés dans une autre fonction
    param = paramFromXY(Obs_LargeurX, Obs_HauteurY)
    #print(param['Svg_Suffixe'])
    print('Obs_LargeurX = ' + str(Obs_LargeurX) + \
          ' ; Obs_HauteurY = ' + str(Obs_HauteurY) + \
          ' ; Svg_Suffixe = ' + str(param['Svg_Suffixe']) + \
          #' ; Obs_AxeDirection = ' + str(Obs_AxeDirection) + \
          ' ; Svg_EchelleInsertion = ' + str(param['Svg_EchelleInsertion']) + \
          #' ; etirement = ' + str(echelleDeformation['etirement']) + \
          #' ; signeSigne = ' + str(echelleDeformation['signeSigne']) + \
          ' ; Svg_ScaleX = ' + str(param['Svg_ScaleX']) + \
          ' ; Svg_ScaleY = ' + str(param['Svg_ScaleY']) + \
          ' ; controleX = ' + str(round(Obs_LargeurX - param['Svg_ScaleX'] * param['Svg_EchelleInsertion'],3)) + \
          ' ; controleY = ' + str(round(Obs_HauteurY - param['Svg_ScaleY'] * param['Svg_EchelleInsertion'],3)))

    # Calcul de l'augmentation du fichier
    #px = str(int(580*float(ratio)))
    ##w = str(abs(2000 * float(Obs_LargeurX)))
    ##h = str(abs(2000 * float(Obs_HauteurY)))
    w = str(abs(2500 * float(Obs_LargeurX)))
    h = str(abs(2500 * float(Obs_HauteurY)))
    #print("w = " + str(w) + " ; h = " + str(h))
    # Modification du SVG :
    # Modification de la viewbox
    ##root.set('viewBox','0 0 ' + w + ' ' + h)
    # Modification de la largeur
    ##root.set('width', w + 'px')
    # Modification de la hauteur
    ##root.set('height', h + 'px')
    # Modification du enable-background
    ##root.set('enable-background', 'new 0 0 ' + w + ' ' + h)

    # Décalage si necessaire
    ##if Obs_LargeurX<0 and Obs_HauteurY>0:
    ##   root.set('transform','translate(' + str(float(w)) + ',' + str(0) + ')')
    ##if Obs_LargeurX>0 and Obs_HauteurY<0:
    ##   root.set('transform','translate(' + str(0) + ',' + str(float(h)) + ')')
    ##if Obs_LargeurX<0 and Obs_HauteurY<0:
    ##   root.set('transform','translate(' + str(float(w)) + ',' + str(float(h)) + ')')

    # Ajout de la transformation de mise a l'echelle pour tous les chemins.
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
    # Ajout de la transformation de mise a l'echelle pour tous les conteneur de textes.
    for flowRoot in root.iter('{http://www.w3.org/2000/svg}flowRoot'):
        flowRoot.set('transform','scale(' + str(param['Svg_ScaleX']) + ',' + str(param['Svg_ScaleY']) + ')')
        # Remise a l'echelle 1,1 donc pas d'echelle des rectangles dans les flowRoot ?
        for rect in text.iter('{http://www.w3.org/2000/svg}rect'):
            rect.set('transform','')

    for text in root.iter('{http://www.w3.org/2000/svg}text'):
        text.set('transform','matrix(' + str(param['Svg_ScaleX']) + ', 0, 0, ' +
                                         str(param['Svg_ScaleY']) + ', ' +
                                         str(1250*(1-param['Svg_ScaleX'])) + ' ,' +
                                         str(1250*(1-param['Svg_ScaleY'])) + ')')
        # Remise a l'echelle 1,1 donc pas d'echelle des rectangles dans les flowRoot ?
        #for rect in text.iter('{http://www.w3.org/2000/svg}rect'):
        #    rect.set('transform','')

    #Ecriture du fichier en sortie
    tree.write(outFile)


def axeDirectionFromXY(Obs_LargeurX, Obs_HauteurY):
    """
    Calcul de l'axe de Direction
    """
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
    else:
        Obs_AxeDirection = "y"
    #valeur = Obs_AxeDirection + "_" + str(Obs_LargeurX) + "_" + str(Obs_HauteurY)
    return Obs_AxeDirection


def ratioFromXY(Obs_LargeurX, Obs_HauteurY):
    """
    Calcul du ratio
    """
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_Ratio = 1.0
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_Ratio = round((Obs_LargeurX / Obs_HauteurY), 1)
    else:
        Obs_Ratio = round((Obs_HauteurY / Obs_LargeurX), 1)
    return Obs_Ratio


def echelleInsertionFromXY(Obs_LargeurX, Obs_HauteurY):
    """
    Calcul de l'echelle d'insertion
    """
    Obs_LargeurX = (Obs_LargeurX) * 1.0
    Obs_HauteurY = (Obs_HauteurY) * 1.0
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
        echelleInsertion = round(Obs_LargeurX, 1)
    else:
        Obs_AxeDirection = "y"
        echelleInsertion = round(Obs_HauteurY, 1)

    return echelleInsertion


def paramFromXY(Obs_LargeurX, Obs_HauteurY):
    """
    Calcul de la déformation (paramètre scale dans svg)
    """

    # Transformation en float
    Obs_LargeurX = (Obs_LargeurX) * 1.0
    Obs_HauteurY = (Obs_HauteurY) * 1.0

    # 4 paramètres, plus ou moins redondants,
    # servent à définir la déformation et la taille du symbole final
    # Obs_RatioLabel
    # Obs_Ratio
    # Obs_InvRatio
    # Svg_EchelleInsertion =

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
        Obs_AxeDirection = "+x"
        signeSigne = "pm"
        echelleDeformation = {
          'etirement': Obs_AxeDirection,
          'signeSigne': signeSigne,
          'scaleX': 1.0,
          'scaleY': -round((min(abs(Obs_LargeurX), abs(Obs_HauteurY)) / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3)
        }
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
        Obs_AxeDirection = "-x"
        signeSigne = "mm"
        echelleDeformation = {
          'etirement': Obs_AxeDirection,
          'signeSigne': signeSigne,
          'scaleX': -1.0,
          'scaleY': -round((min(abs(Obs_LargeurX), abs(Obs_HauteurY)) / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3)
        }
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
        Obs_AxeDirection = "-x"
        signeSigne = "mp"
        echelleDeformation = {
          'etirement': Obs_AxeDirection,
          'signeSigne': signeSigne,
          'scaleX': -1.0,
          'scaleY': round((min(abs(Obs_LargeurX), abs(Obs_HauteurY)) / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3)
        }
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
        Obs_AxeDirection = "+y"
        signeSigne = "pp"
        echelleDeformation = {
          'etirement': Obs_AxeDirection,
          'signeSigne': signeSigne,
          'scaleX': round((min(abs(Obs_LargeurX), abs(Obs_HauteurY)) / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3),
          'scaleY': 1.0
        }
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
        Obs_AxeDirection = "-y"
        signeSigne = "pm"
        echelleDeformation = {
          'etirement': Obs_AxeDirection,
          'signeSigne': signeSigne,
          'scaleX': round((min(abs(Obs_LargeurX), abs(Obs_HauteurY)) / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3),
          'scaleY': -1.0
        }
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
        Obs_AxeDirection = "-y"
        signeSigne = "mm"
        echelleDeformation = {
          'etirement': Obs_AxeDirection,
          'signeSigne': signeSigne,
          'scaleX': -round((min(abs(Obs_LargeurX), abs(Obs_HauteurY)) / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3),
          'scaleY': -1.0
        }
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
        Obs_AxeDirection = "+y"
        signeSigne = "mp"
        echelleDeformation = {
          'etirement': Obs_AxeDirection,
          'signeSigne': signeSigne,
          'scaleX': -round((min(abs(Obs_LargeurX), abs(Obs_HauteurY)) / max(abs(Obs_LargeurX), abs(Obs_HauteurY))), 3),
          'scaleY': 1.0
        }
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


def suffixeFromXY(Obs_LargeurX, Obs_HauteurY):
    """
    Calcul du suffixe du nom
    """
    Obs_LargeurX = round(Obs_LargeurX, 1) * 1.0
    Obs_HauteurY = round(Obs_HauteurY, 1) * 1.0

    # debut
    signeSigne = "pp"
    if (Obs_LargeurX >= 0.0 and Obs_HauteurY >= 0.0):
        signeSigne = "pp"
    elif (Obs_LargeurX >= 0.0 and Obs_HauteurY < 0.0):
        signeSigne = "pm"
    elif (Obs_LargeurX < 0.0 and Obs_HauteurY < 0.0):
        signeSigne = "mm"
    elif (Obs_LargeurX < 0.0 and Obs_HauteurY >= 0.0):
        signeSigne = "mp"

    # milieu
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
    else:
        Obs_AxeDirection = "y"

    # fin
    Obs_Ratio = 1.0
    if (Obs_LargeurX >= Obs_HauteurY):
        try:
            Obs_Ratio = int(round((Obs_LargeurX / Obs_HauteurY)*10, 0))
        except ZeroDivisionError:
            Obs_Ratio = 999
    else:
        try:
            Obs_Ratio = int(round((Obs_HauteurY / Obs_LargeurX)*10, 0))
        except ZeroDivisionError:
            Obs_Ratio = 999

    Obs_Ratio = '{:0>3}'.format(Obs_Ratio)

    # suffixe
    valeur = signeSigne + "_" + Obs_AxeDirection + "_" + str(Obs_Ratio)
    return valeur

def main():

    #for kx in [-3, -2, -1, 0.001, 1, 2, 3]:
    for kx in [-3, -2, 1, 2, 3, 4]:
        #for ky in [-3, -2, -1, 0.001, 1, 2, 3]:
        for ky in [-3, -2, 1, 2, 3, 4]:
            # print("kx = {}, ky = {}".format(kx,ky))
            # if (kx > ky):
            #     xy = "x"
            # else:
            #     xy = "y"
            #mmin = min(abs(x), abs(y))
            #mmax = max(abs(x), abs(y))
            #signe = y * x / abs(x) / abs (y)
            #ratio = signe * round(mmax / mmin, 1)
            #print("xy = {}, min = {}, max = {}, signe = {}, ratio = {}".format(xy, mmin, mmax, signe, str(ratio)))
            #fichierSortie = 'ratios/' + 'Template' + '_' + xy + '_' +  str(ratio) + '.svg'
            #ss.main("Template.svg", fichierSortie, xy, str(ratio))

            fichierEntree = "Template.svg"
            kx = float(kx)
            ky = float(ky)
            nomx = str(round(kx / min(abs(kx), abs(ky)) * 1.0, 1))
            nomy = str(round(ky / min(abs(kx), abs(ky)) * 1.0, 1))
            fichierSortie = 'ratios/'+str("Template" + '_' + nomx + '_' + nomy + '.svg')
            #print('new = > {}, {}, {}, {}'.format(fichierEntree, fichierSortie, kx, ky))
            #main(fichierEntree, fichierSortie, XY, ratio)
            ss.stretch_symbol(fichierEntree, fichierSortie, kx, ky)


def prepare_svg_4eme_passe(inPath, outPath, inFile):
    """
    Etirement
    """
    fichierEntree = inPath + inFile

    for Obs_LargeurX in [-3, -2, -1, -0.5, 0.5, 1, 2, 3, 4]:
        for Obs_HauteurY in [-3, -2, -1, -0.5, 0.5, 1, 2, 3, 4]:
            #print('_' + suffixeFromXY(Obs_LargeurX, Obs_HauteurY) + '.svg')

            fichierSortieSansChemin = re.sub(r'pp_x_010',
                                             suffixeFromXY(Obs_LargeurX, Obs_HauteurY),
                                             inFile)
            fichierSortie = outPath + fichierSortieSansChemin
            if suffixeFromXY(Obs_LargeurX, Obs_HauteurY) != "pp_x_010":
                stretchSymbol(fichierEntree, fichierSortie, Obs_LargeurX, Obs_HauteurY)


            # Lecture du fichier SVG (comme un XML) en entree
            ##tree = et.parse(fichierEntree)
            # Mise en memoire
            ##root = tree.getroot()
            #Ecriture du fichier en sortie
            ##tree.write(fichierSortie)


if __name__ == '__main__':
    """


    """

    try:
        # Premier parametre : le nom du fichier svg a traiter (fichier template)
        fichierEntree = str(sys.argv[1])

    except:
        print("Ce script s'utilise ainsi : './test_stretch_symbol.py ../data/Symbole/fromQgis/L4T_pp_x_010.svg'")
        sys.exit()
    cheminEntree = '/'.join(fichierEntree.split('/')[0:-1]) + '/'
    cheminSortie = cheminEntree
    fichierEntreeSansChemin = fichierEntree.split('/')[-1]

    #print("4eme passe => {}".format(fichierSortie))
    prepare_svg_4eme_passe(cheminEntree, cheminSortie, fichierEntreeSansChemin)


    #main()
