#!/bin/sh
#

# creation d'une image de dimension 1024x1024
# utilisation d'imageMagick
#rm logo_tmp.png
#convert logo: -geometry 1365x1024 logo_tmp.png
#identify logo_tmp.png
#convert -gravity center logo_tmp.png -crop 1024x1024+0+0 +repage logo0.png
#identify logo0.png
#rm logo_tmp.png
#rm logo0.png

#rm logo_3946.png
convert -gravity center logo: -geometry 1365x1024 -crop 1024x1024+0+0 +repage logo_3946.png
#identify logo_3946.png

# creation d'un fichier worldfile (cc46)
#rm logo_3946.pgw
cat <<EOF > logo_3946.pgw
0.1
0
0
-0.1
1379241
5227395
EOF

# creation d'un dessin
# la documentation sur image magick :
#   les chemins SVG sous image magick
#   http://www.imagemagick.org/Usage/draw/#paths
#   les couleurs sous image magick
#   http://www.imagemagick.org/script/color.php
# le principe du dessin :
#   dans un canvas de 1000x1000,
#   on dessine, avec des instructions tirées du langage svg,
#   en utilisant des couleurs avec transparence,
#   dans l'ordre suivant :
#     on dessine la parcelle avec un trait gris et une couleur de remplissage jaune
#     on dessine ensuite le batiment en orange avec un coutour orange plus foncé
#     on redessine la parcelle avec un remplissage transparent
#rm maison_3946.png
convert -size 1000x1000 \
        xc:white \
        -alpha transparent \
        -fill '#FFF68F7F' \
        -stroke '#7F7F7F' \
        -draw "path 'M 100,900 500,900 500,700 900,100 700,100 250,700 Z'" \
        -fill '#FFA5007F' \
        -stroke '#CD8500' \
        -draw "path 'M 100,900 500,900 500,700 250,700 Z'" \
        -fill '#FFF68F00' \
        -stroke '#7F7F7F' \
        -strokewidth 3 \
        -draw "path 'M 100,900 500,900 500,700 900,100 700,100 250,700 Z'" \
        maison_3946.png

# creation d'un fichier worldfile (cc46)
#rm logo_3946.pgw
cat <<EOF > maison_3946.pgw
0.1
0
0
-0.1
1379241
5227395
EOF

# info
#gdalinfo logo_3946.png

# recopie du fichier de calage
cp maison_3946.pgw maison_3946-flatten.pgw

# applatissement pour supprimer la transparence
convert -flatten maison_3946.png maison_3946-flatten.png

# suppression des fichiers avec transparence,
# a partir de maintenant, nous travaillons avec des fichiers aplatis
#rm maison_3946.png
#rm maison_3946.pgw
# transformation du système de coordonnées
# l'image resultante est en geotif
rm maison_3857.tfw
rm maison_3857.tif
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -of GTiff \
         -co 'TFW=yes'\
         -co 'ALPHA=yes'\
         maison_3946.png \
         maison_3857.tif
#rm maison_3946-flatten.png
#rm maison_3946-flatten.pgw

# info
#gdalinfo logo_3857.tif

# le but est d'obtenir un png que l'on aura reprojeté
# limites : gdalwarp n'a pas de sortie en png
#           le tiff en sortie est en gris 16
# essai 1 : on devorme en tiff
#           puis on convertit le tiff en png

# conversion
#rm maison_3857.png
#rm maison_3857.wld
gdal_translate -of png \
               -co 'WORLDFILE=yes' \
               maison_3857.tif \
               maison_3857.png
#rm maison_3857.tfw
#rm maison_3857.tif

# essai 2 : on deforme avec en sortie du vrt
# puis on converti le fichier vrt en png avec gdal_translate
rm maison_3857_v2.vrt
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -of vrt \
         maison_3946.png \
         maison_3857_v2.vrt

# conversion
rm maison_3857_v2.png
rm maison_3857_v2.wld
gdal_translate -of png \
               -co 'WORLDFILE=yes' \
               maison_3857_v2.vrt \
               maison_3857_v2.png
#rm maison_3857.tfw
#rm maison_3857.tif

# essai 3 : on converti le fichier  en png avec gdal_translate
# puis on deforme avec en sortie du vrt
# puis on converti le fichier vrt en png avec gdal_translate
# info
#gdalinfo logo_3857.png

# creation d'une mosaique
rm -r tuiles
gdal2tiles.py -p mercator \
              -s 'EPSG:3857' \
              -t "logo" \
              maison_3857_v2.png \
              tuiles

# transformation en mbtiles
wget -O raster2mb https://raw.githubusercontent.com/crschmidt/raster2mb/master/raster2mb
chmod +x raster2mb

rm maison_3857.mbtiles
./raster2mb maison_3857.png \
            maison_3857.mbtiles

rm tmp.png
