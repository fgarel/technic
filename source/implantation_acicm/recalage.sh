#!/bin/sh

# Calage d'un raster


# Il faut :
#  - gerer la netteté des traits
#  - gerer la couleur de tranparence
#  - caler / georeferencer (on utilise qgis, en remplacement de http://www.georeferencer.com)
#  - gerer la taille du fichier et le rendu des couleurs sous qgis


# 1. Netteté, résolution de l'image originale

# Plus de netteté : http://www.imagemagick.org/Usage/resize/
echo "Manip à faire avant le calage raster sous qgis : changement de resolution"
convert -density 600 \
        /home/fred/Documents/technic/source/implantation_acicm/rdc2.png \
        -magnify \
        -magnify \
        -magnify \
        /home/fred/Documents/technic/source/implantation_acicm/rdc2-magnify.png


# 2. Dans un second temps, on choisit d'imposer de la transparence pour certaines couleurs

# Pour choir les couleurs à convertir en transparent, il faut ouvrir dans gimp le fichier
# /home/fred/Documents/technic/source/implantation_acim/rdc2.png
# et noter les couleurs à passer en transparent
# gimp / fenetre / nouvelle boite à outil
# outil pipette
#
# option fuzz
#      -fuzz 5% \
echo "Manip à faire avant le calage raster sous qgis : couleur et transparence"
convert -density 600 \
        /home/fred/Documents/technic/source/implantation_acicm/rdc2-magnify.png \
        -median 2 \
        -fuzz 2% \
        -transparent white \
        -transparent '#8a8a8a' \
        -transparent '#fdeee7' \
        -transparent '#a3ae86' \
        /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent.png


# 3. Points de calage sous QGIS : il s'agit de trouver des points de calage (4 au minimum) (3 ?)
echo "# ################################## #"
echo "# Georeferencement à faire sous QGis #"
echo "# ################################## #"

# Le but de ce calage est de fabriquer un fichier de point de calage au format text
# avec l'extension .point


# 4. Déformation, warp de l'image

# Nous avons 2 possiblités après la déformation de l'image :
# (mise à l'echelle, rotation, translation) :
#   - soit on laisse le georeferenceur de qgis faire tout
#     le fichier geotif est gros (on peut eventuellement le reconvertir en png)
#   - soit on fait la transformation nous-meme avec gdal et le fichier de point de calage
#     le rendu est plus joli

# 4.1. Déformation automatique : complement
echo "Manip à faire après le calage raster sous qgis, option 4.1 : transformation du tif en png"
gdal_translate -of PNG \
               -co "WORLDFILE=YES" \
               /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent_georef.tif \
               /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent_georef.png

rm /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent_georef.tif

# 4.2. Déformmation a l'aide de gdal : deformation + conversion


# L'astuce avec gdal, c'est d'utiliser les GCP (ground control point):
#
# https://stackoverflow.com/questions/1662317/geo-question-how-to-generate-a-wld-file-given-some-ground-control-points
# https://gis.stackexchange.com/questions/38987/how-can-i-add-all-the-4-corners-as-gcp-in-an-image-that-i-want-to-reproject
#
# gcp est une option de gdal_translate et non de gdalwarp :
# https://www.gdal.org/gdal_translate.html
# on utilise donc les deux outils l'un après l'autre
#

# Todo :
# Il faut scripter la lecture de ce fichier .points
# en prevoyant en plus, une sortie pour jag3d

#
# Extrait du fichier rdc2.png.point
#

# mapX,mapY,pixelX,pixelY,enable,dX,dY,residual
# mapX,mapY,pixelX,pixelY,enable,dX,dY,residual
# 1382048.34350189892575145,5224850.69221661053597927,690.84084084084122424,-731.35135135135203654,1,-0.90806626642597621,-0.4270251555062714,1.00346142310303454
# 1382103.5681049486156553,5224818.43766150530427694,9173.31831831831914315,-732.3723723723733201,1,-1.32545547081281256,0.92449867131472274,1.61602289537317589
# 1382084.20158788748085499,5224785.16899798158556223,9176.31831831831914315,-5838.3723723723742296,1,1.62446348940829921,0.41965074658673984,1.67779270994106899
# 1382028.92775627411901951,5224817.44324451591819525,688.31831831831914315,-5838.3723723723742296,1,0.60905817243792626,-0.91712431977612141,1.10093999624786099

# on ne garde que les 4 premieres colonnes
# 1382048.34350189892575145,5224850.69221661053597927,690.84084084084122424,-731.35135135135203654
# 1382103.5681049486156553,5224818.43766150530427694,9173.31831831831914315,-732.3723723723733201
# 1382084.20158788748085499,5224785.16899798158556223,9176.31831831831914315,-5838.3723723723742296
# 1382028.92775627411901951,5224817.44324451591819525,688.31831831831914315,-5838.3723723723742296

# on re(ordonne (3 4 1 2), on change le separateur, on supprime le signe - de la seconde colonne
# 690.84084084084122424 731.35135135135203654 1382048.34350189892575145 5224850.69221661053597927
# 9173.31831831831914315 732.3723723723733201 1382103.5681049486156553 5224818.43766150530427694
# 9176.31831831831914315 5838.3723723723742296 1382084.20158788748085499 5224785.16899798158556223
# 688.31831831831914315 5838.3723723723742296 1382028.92775627411901951 5224817.44324451591819525


# les etapes du script :
#

#gdal_translate \
#  -gcp pixel1 line1 X1 Y1 \
#  -gcp pixel2 line2 X2 Y2 \
#  source.tif sourceGCP.tif

echo "Manip à faire après le calage raster sous qgis, option 4.2 : utilisation des points gcp"

gdal_translate \
  -gcp 690.84084084084122424 731.35135135135203654 1382048.34350189892575145 5224850.69221661053597927 \
  -gcp 9173.31831831831914315 732.3723723723733201 1382103.5681049486156553 5224818.43766150530427694 \
  -gcp 9176.31831831831914315 5838.3723723723742296 1382084.20158788748085499 5224785.16899798158556223 \
  -gcp 688.31831831831914315 5838.3723723723742296 1382028.92775627411901951 5224817.44324451591819525 \
  /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent.png \
  /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent-gcp.png

#gdalwarp -r bilinear \
#         -t_srs EPSG:xyz \
#         sourceGCP.tif \
#         sourceCRS.tif

#gdalwarp -t_srs EPSG:4326 \
#         sourceCRS.tif \
#         destCRS.tif

echo "Manip à faire après le calage raster sous qgis, option 4.2 : gdalwarp (reprojection)"
gdalwarp -r bilinear \
         -t_srs EPSG:3946 \
         /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent-gcp.png \
         /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent-crs.tif

echo "Manip à faire après le calage raster sous qgis, option 4.2 : transformation du tif en png"
gdal_translate -of PNG \
               -co "WORLDFILE=YES" \
               /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent-crs.tif \
               /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent-crs.png

rm /home/fred/Documents/technic/source/implantation_acicm/rdc2-transparent-crs.tif
