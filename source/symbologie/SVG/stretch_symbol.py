#!/usr/bin/env python3
# coding: utf-8

"""
Outil pour modifier un symbole svg à partir d'un template et de coef d'etirement.

Le fichier généré possede un nom qui est derivé des paramètres donnés en entrée.

Les 3 paramètres transmis sont :
- le nom du fichier svg template
- kx le coefficient éventuellement négatif en x
- ky le coefficient éventuellement négatif en y

Exemple d'utilisation
./stretch_symbol.py template_arbre.svg -3.1 -1

"""

# Import
# Sys pour les parametres
import sys
#Utilisation de la librairie de lecture des fichier .xml
import xml.etree.ElementTree as ET



def stretch_symbol(inFile, outFile, kx, ky):
    # Lecture du fichier SVG (comme un XML) en entree
    tree = ET.parse(inFile)
    # Mise en memoire
    root = tree.getroot()
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

    # Décalage si necessaire
    if kx<0 and ky>0:
       root.set('transform','translate(' + str(float(w)) + ',' + str(0) + ')')
    if kx>0 and ky<0:
       root.set('transform','translate(' + str(0) + ',' + str(float(h)) + ')')
    if kx<0 and ky<0:
       root.set('transform','translate(' + str(float(w)) + ',' + str(float(h)) + ')')

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

    #Ecriture du fichier en sortie
    tree.write(outFile)


if __name__ == '__main__':
    """


    """
    try:
        # Premier parametre : le nom du fichier svg a traiter (fichier template)
        #fichierEntree = 'C:\\Temp\\SVG\\'+str(sys.argv[1])
        fichierEntree = str(sys.argv[1])

        ## Version ratio
        ## Deuxieme parametre, x ou y selon que l'on agrandit x ou y
        #XY = str(sys.argv[2])
        ## Troisieme parametre : ratio abs(round(x/y,1)) ou abs(round(y/x,1))
        #ratio = str(sys.argv[3])

        ## Version kx et ky
        # deuxième paramètre : kx
        kx = str(sys.argv[2])
        # troisième paramètre : ky
        ky = str(sys.argv[3])
    except:
        ## Version ratio
        #print("Ce script s'utilise ainsi : './strech_symbol.py symbol.svg direction ratio'")
        ## version kx/ky
        print("Ce script s'utilise ainsi : './stretch_symbol.py symbol.svg kx ky'")
        sys.exit()

    # A partir des paramètres, on en déduit le nom du fichier svg qui sera generé
    # fichierSortie='C:\\Temp\\SVG\\ratios\\'+str(sys.argv[1]).split('.')[0]+'_'+XY+ratio+'.svg'
    #XY = xy_from_kxky(kx, ky)
    #ratio = ratio_from_kxky(kx, ky)

    #fichierSortie = 'ratios/'+str(sys.argv[1]).split('.')[0] + '_' + XY + '_' + str(ratio) + '.svg'
    #print('old = > {}, {}, {}, {}'.format(fichierEntree, fichierSortie, XY, ratio))

    kx = float(kx)
    ky = float(ky)
    nomx = str(round(kx / min(abs(kx), abs(ky)) * 1.0, 1))
    nomy = str(round(ky / min(abs(kx), abs(ky)) * 1.0, 1))
    #print("{} {}".format(nomx, nomy))

    fichierSortie = 'ratios/'+str(sys.argv[1]).split('.')[0] + '_' + nomx + '_' + nomy + '.svg'
    #print('new = > {}, {}, {}, {}'.format(fichierEntree, fichierSortie, kx, ky))
    #main(fichierEntree, fichierSortie, XY, ratio)
    stretch_symbol(fichierEntree, fichierSortie, kx, ky)
