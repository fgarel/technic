#!/bin/sh
#

# creation d'une image de dimension 1024x1024
# utilisation d'imageMagick

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
        -fill '#FFF68F' \
        -stroke '#7F7F7F' \
        -draw "path 'M 100,900 500,900 500,700 900,100 700,100 250,700 Z'" \
        -fill '#FFA500' \
        -stroke '#CD8500' \
        -draw "path 'M 100,900 500,900 500,700 250,700 Z'" \
        -fill '#FFF68F' \
        -stroke '#7F7F7F' \
        -strokewidth 3 \
        -draw "path 'M 100,900 500,900 500,700 900,100 700,100 250,700 Z'" \
        maison_3946.png

# info
file maison_3946.png
identify maison_3946.png
gdalinfo maison_3946.png | grep -E Files\|Driver\|Band

# creation d'un fichier worldfile (cc46)
#rm maison_3946.pgw
cat <<EOF > maison_3946.pgw
0.1
0
0
-0.1
1379241
5227395
EOF

# recopie du fichier de calage
#rm maison_3946-flatten.pgw
cp maison_3946.pgw maison_3946-flatten.pgw

# convert pour passer en image de type Byte (8-bit)
convert maison_3946.png png24:maison_3946-flatten.png

# applatissement pour supprimer la transparence
#convert -flatten maison_3946.png maison_3946-flatten.png

# info
file maison_3946-flatten.png
identify maison_3946-flatten.png
gdalinfo maison_3946-flatten.png | grep -E Files\|Driver\|Band

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
         maison_3946-flatten.png \
         maison_3857.tif

# suppression des fichiers png
#rm maison_3946-flatten.png
#rm maison_3946-flatten.pgw

# info
file maison_3857.tif
identify maison_3857.tif
gdalinfo maison_3857.tif | grep -E Files\|Driver\|Band

# conversion de tif vers png
rm maison_3857.png
rm maison_3857.wld
gdal_translate -of png \
               -co 'WORLDFILE=yes' \
               maison_3857.tif \
               maison_3857.png

#rm maison_3857.png
#convert maison_3857.tif maison_3857.png

# suppression des fichiers tif
#rm maison_3857.tfw
rm maison_3857.tif

# info
file maison_3857.png
identify maison_3857.png
gdalinfo maison_3857.png | grep -E Files\|Driver\|Band

# creation d'une mosaique
rm -r tuiles
gdal2tiles.py -p mercator \
              -s 'EPSG:3857' \
              -t "logo" \
              maison_3857.png \
              tuiles

# transformation en mbtiles
wget -O raster2mb https://raw.githubusercontent.com/crschmidt/raster2mb/master/raster2mb
chmod +x raster2mb

rm maison_3857.mbtiles
./raster2mb maison_3857.png \
            maison_3857.mbtiles

rm tmp.png
