#!/usr/bin/env python3
# coding: utf-8

"""
Outil pour preparer un symbole svg afin qu'il soit utilisable sous Qgis.

# Les différentes etapes

1. Dessin du symbole
   taille libre (hauteur libre et largeur libre)
   l'utiliisateur ne se precoccupe pas du point d'insertion ni de la rotation
   => ../data/template/01_Porte_PoussantGauche.svg

2. Gestion de la mise à l'échelle en x et de la mise à l'echelle en y
calcul de l'emprise du symbole
et soit :
 - agrandissement reduction en gardant la meme proportion
 - agrandissement reduction, etirement selon x et/ou y (deformation possible)
de facon a ce que le symbole a pour grande longueur 10000

3. gestion du point d'insertion
deplacement de ce carre ou de ce rectangle 1000 dans le view port 2000x2000 de facon à placer le point d'insertion

4. Gestion de la rotation
et rotation

5. gestion des couleurs
ajout de param-fill = ....
de facon a ce que le symbole soit paramétrable sous qgis


Exemple d'utilisation
./prepare_svg_pour_qgis.py ../data/template/01_Porte_PoussantGauche.svg

"""

# Import
# Sys pour les parametres
import sys
# Utilisation de la librairie de lecture des fichier .xml
import xml.etree.ElementTree as ET
# expressions regulieres
import re


def prepare_svg_1ere_passe_compactage(inFile, outFile):
    """
    Suppression des entrées inutiles
    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = ET.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    # suppression des branches sans path

    """
    for element in root.iter():
        print('>  {}'.format(element.tag))
        if element.tag == '{http://www.w3.org/2000/svg}g':
            for selement in element.iter():
                print('>> {}'.format(selement.tag))
                if selement.tag == '{http://www.w3.org/2000/svg}g':
                    for sselement in selement.iter():
                        print('>>>{}'.format(sselement.tag))
                        if sselement.tag == '{http://www.w3.org/2000/svg}path':
                            print('---{}'.format(sselement.tag, sselement.attrib))

    for element in root.iter('{http://www.w3.org/2000/svg}g'):
        #if element.findall('{http://www.w3.org/2000/svg}path') is None:
        #    print('A  {}'.format(element.tag))
        #else:
        #    print('B  {}'.format(element.attrib))

        for selement in element.findall('{http://www.w3.org/2000/svg}g'):
            compteurg = 0
            compteurpath = 0

            print('C  {}'.format(element.tag))
        else:
            print('D  {}, {}, {}'.format(element.tag, \
                                         element.attrib, \
                                         element[0].tag))
    """

    #for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}path"):
    #    print('>  {}'.format(element.tag))

    removeList = list()
    for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g"):
        if element.findall('{http://www.w3.org/2000/svg}path'):
            print('path {}, {}'.format(element.tag, \
                                       element.attrib))
            pass
        else:
            print('supperflu {}, {}'.format(element.tag, \
                                            element.attrib))
            #removeList.append(element)
            #https://stackoverflow.com/questions/7981840/how-to-remove-an-element-in-lxml
            print('parent {}, {}'.format(element.getparent().tag, \
                                            elementgetparent().attrib))
            #root.remove(element)
    #print(removeList)
    #for tag in removeList:
    #   parent = root.find("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g")
    #   parent.remove(tag)

    #for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g"):
    #    print('test {}, {}'.format(element.tag, \
    #                                    element.attrib))
        """
            if selement.tag == '{http://www.w3.org/2000/svg}path':
                ++compteurpath
            else:
                print('>>>{}'.format(selement.tag))
                pass
        if compteurpath > 0:
            print('>> {}'.format(element.tag))
            root.remove(element)
        """

    #Ecriture du fichier en sortie
    tree.write(outFile)


def prepare_svg_2de_passe(inFile, outFile):
    """
    Suppression des entrées inutiles
    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = ET.parse(inFile)
    # Mise en memoire
    root = tree.getroot()



    #Ecriture du fichier en sortie
    tree.write(outFile)


def prepare_svg_3eme_passe(inFile, outFile):
    """
    Suppression des entrées inutiles
    """
    # Lecture du fichier SVG (comme un XML) en entree
    tree = ET.parse(inFile)
    # Mise en memoire
    root = tree.getroot()



    #Ecriture du fichier en sortie
    tree.write(outFile)

def prepare_svg_gestion_couleurs(inFile, outFile):
    # Lecture du fichier SVG (comme un XML) en entree
    tree = ET.parse(inFile)
    # Mise en memoire
    root = tree.getroot()

    """
    # Calcul de l'augmentation du fichier
    #px = str(int(580*float(ratio)))
    w = str(abs(2000 * float(kx)))
    h = str(abs(2000 * float(ky)))
    # Modification du SVG :
    # Modification de la viewbox
    root.set('viewBox','0 0 ' + w + ' ' + h)
    # Modification de la largeur
    root.set('width', w + 'px')
    # Modification de la hauteur
    root.set('height', h + 'px')
    # Modification du enable-background
    root.set('enable-background', 'new 0 0 ' + w + ' ' + h)



    # Ajout de la transformation de mise a l'echelle pour tous les chemins.
    for path in root.iter('{http://www.w3.org/2000/svg}path'):
        path.set('transform','scale(' + str(kx) + ',' + str(ky) + ')')
    # Ajout de la transformation de mise a l'echelle pour tous les rectangles.
    for rect in root.iter('{http://www.w3.org/2000/svg}rect'):
        rect.set('transform','scale(' + str(kx) + ',' + str(ky) + ')')
    # Ajout de la transformation de mise a l'echelle pour tous les polygones.
    for polygon in root.iter('{http://www.w3.org/2000/svg}polygon'):
        polygon.set('transform','scale(' + str(kx) + ',' + str(ky) + ')')
    # Ajout de la transformation de mise a l'echelle pour tous les conteneur de textes.
    for flowRoot in root.iter('{http://www.w3.org/2000/svg}flowRoot'):
        flowRoot.set('transform','scale(' + str(fx) + ',' + str(fy) + ')')
        # Remise a l'echelle 1,1 donc pas d'echelle des rectangles dans les flowRoot ?
        for rect in text.iter('{http://www.w3.org/2000/svg}rect'):
            rect.set('transform','')

    for text in root.iter('{http://www.w3.org/2000/svg}text'):
        text.set('transform','scale(' + str(kx) + ',' + str(ky) + ')')
        # Remise a l'echelle 1,1 donc pas d'echelle des rectangles dans les flowRoot ?
        #for rect in text.iter('{http://www.w3.org/2000/svg}rect'):
        #    rect.set('transform','')
    """


    #Ecriture du fichier en sortie
    tree.write(outFile)


if __name__ == '__main__':
    """


    """
    try:
        # Premier parametre : le nom du fichier svg a traiter (fichier template)
        fichierEntree = str(sys.argv[1])

    except:
        #print("Ce script s'utilise ainsi : './prepare_svg_pour_qgis.py ../data/template/01_Porte_PoussantGauche.svg'")
        print("Ce script s'utilise ainsi : './5_prepare_svg_pour_qgis.py ../data/Symbole/fromQgis/symbole_bg_v01.svg'")
        sys.exit()

    # A partir des paramètres, on en déduit le nom du fichier svg qui sera generé
    # fichierSortie='C:\\Temp\\SVG\\ratios\\'+str(sys.argv[1]).split('.')[0]+'_'+XY+ratio+'.svg'
    #XY = xy_from_kxky(kx, ky)
    #ratio = ratio_from_kxky(kx, ky)

    #fichierSortie = 'ratios/'+str(sys.argv[1]).split('.')[0] + '_' + XY + '_' + str(ratio) + '.svg'
    #print('old = > {}, {}, {}, {}'.format(fichierEntree, fichierSortie, XY, ratio))


    cheminEntree = '/'.join(fichierEntree.split('/')[0:-1]) + '/'
    # print("{}".format(str(cheminEntree)))
    #cheminSortie = re.sub('/template/', '/output/', cheminEntree)
    cheminSortie = cheminEntree
    # print("{}".format(str(cheminSortie)))

    ## 1ere passe : compactage
    fichierEntreeSansChemin = fichierEntree.split('/')[-1]
    fichierSortieSansChemin = re.sub(r'_v01', r'_v02', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("1ere passe => {}".format(fichierSortie))
    prepare_svg_1ere_passe_compactage(fichierEntree, fichierSortie)

    ## 2de passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'_v02', r'_v03', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("2de passe  => {}".format(fichierSortie))
    prepare_svg_2de_passe(fichierEntree, fichierSortie)

    ## 3eme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'_v03', r'_v04', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("3eme passe  => {}".format(fichierSortie))
    prepare_svg_3eme_passe(fichierEntree, fichierSortie)

    ## xeme passe :
    fichierEntreeSansChemin = fichierSortieSansChemin
    fichierSortieSansChemin = re.sub(r'_v0w', r'_v0x', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("xeme passe  => {}".format(fichierSortie))
    prepare_svg_xeme_passe(fichierEntree, fichierSortie)
    #prepare_svg_gestion_couleurs(fichierEntree, fichierSortie)
