#!/usr/bin/python

#Sys pour les parametres
import sys
#Deuxieme parametre, x ou y selon que l'on agrandit x ou y
XY = str(sys.argv[2])
#Troisieme parametre : ratio abs(round(x/y,1)) ou abs(round(y/x,1))
ratio = str(sys.argv[3])
#Premier parametre : le nom du fichier svg a traiter
fichierEntree='C:\\Temp\\SVG\\'+str(sys.argv[1])
fichierSortie='C:\\Temp\\SVG\\ratios\\'+str(sys.argv[1]).split('.')[0]+'_'+XY+ratio+'.svg'

#Utilisation de la librairie de lecture des fichier .xml
import xml.etree.ElementTree as ET
#Lecture du fichier en entree
tree = ET.parse(fichierEntree)
#Mise en memoire
root = tree.getroot()
#Calcul de l'augmentation du fichier
px = str(int(580*float(ratio)))
#Definition des variables selon XY vaut x ou y
if XY == 'x':
 #definition des facteurs x et y et hauteur et largeur
 fx=ratio
 fy='1'
 w=px
 h='580'
else:
 #definition des facteurs x et y et hauteur et largeur (inversion)
 fy=ratio
 fx='1'
 h=px
 w='580'

#Modification du SVG :
#Modification de la viewbox
root.set('viewBox','0 0 '+w+' '+h)
#Modification de la largeur
root.set('width',w+'px')
#Modification de la hauteur
root.set('height',h+'px')
#Modification du enable-background
root.set('enable-background','new 0 0 '+w+' '+h)
#Ajout de la transformation de mise a l'echelle pour tous les chemins.
for path in root.iter('{http://www.w3.org/2000/svg}path'):
 path.set('transform','scale('+fx+','+fy+')')
#Ajout de la transformation de mise a l'echelle pour tous les rectangles.
for rect in root.iter('{http://www.w3.org/2000/svg}rect'):
 rect.set('transform','scale('+fx+','+fy+')')
#Ajout de la transformation de mise a l'echelle pour tous les polygones.
for polygon in root.iter('{http://www.w3.org/2000/svg}polygon'):
 polygon.set('transform','scale('+fx+','+fy+')')
#Ajout de la transformation de mise a l'echelle pour tous les conteneur de textes.
for flowRoot in root.iter('{http://www.w3.org/2000/svg}flowRoot'):
 flowRoot.set('transform','scale('+fx+','+fy+')')
 #Remise a l'echelle 1,1 donc pas d'echelle des rectangles dans les flowRoot ?
 for rect in flowRoot.iter('{http://www.w3.org/2000/svg}rect'):
  rect.set('transform','')

#Ecriture du fichier en sortie
tree.write(fichierSortie)
