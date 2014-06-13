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
        -alpha transparent \
        -fill '#FFF68F5F' \
        -stroke '#7F7F7F' \
        -draw "path 'M 100,900 500,900 500,700 900,100 700,100 250,700 Z'" \
        -fill '#FFA500BF' \
        -stroke '#CD8500' \
        -draw "path 'M 100,900 500,900 500,700 250,700 Z'" \
        -fill '#FFF68F00' \
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
0.09
0
0
-0.09
1379230
5227465
EOF

# A = k cos $
# B = -k sin $
# B = -k sin $
# B = -k cos $
#
# si $=0 degre, alors sin$ = 0
# si $=45 degre, alors sin = cos, 1er quadrant, donc sin et cos > 0
# si $=45+180 = 225, alors 3ème quadrant, donc sin et cos < 0
cat <<EOF > maison_3946.pgw
-0.038
0.038
0.038
0.038
1379210
5227355
EOF


# creation d'un fichier de type png32
# recopie du fichier de calage
cp maison_3946.pgw maison_3946-png32.pgw

# en sortie, on force le format png32
convert maison_3946.png png32:maison_3946-png32.png

# info
file maison_3946-png32.png
identify maison_3946-png32.png
gdalinfo maison_3946-png32.png | grep -E Files\|Driver\|Band

# a partir de maintenant, nous travaillons avec des fichiers aplatis
rm maison_3946.png
rm maison_3946.pgw

# transformation du système de coordonnées
# on utilise pour cela gdalwarp
# l'image resultante est soit en geotif
# soit en vrt, mais pas en png
# nous allons travailler avec le format d'image vrt

# le but est d'obtenir un png que l'on aura reprojeté
# limites : gdalwarp n'a pas de sortie en png
#           le tiff en sortie est en gris 16
# solution : on deforme avec en sortie du vrt
#            puis on converti le fichier vrt en png avec gdal_translate
rm maison_3857_bordtransparent.vrt
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -of vrt \
         maison_3946-png32.png \
         maison_3857_bordtransparent.vrt

# info
gdalinfo maison_3857_bordtransparent.vrt | grep -E Files\|Driver\|Band

# conversion
rm maison_3857_bordtransparent.png
rm maison_3857_bordtransparent.wld
gdal_translate -of png \
               -co 'WORLDFILE=yes' \
               maison_3857_bordtransparent.vrt \
               maison_3857_bordtransparent.png

# info
file maison_3857_bordtransparent.png
identify maison_3857_bordtransparent.png
gdalinfo maison_3857_bordtransparent.png | grep -E Files\|Driver\|Band

# nettoyage
rm maison_3857_bordtransparent.vrt
rm maison_3946-png32.png
rm maison_3946-png32.pgw
#rm maison_3857.tfw
#rm maison_3857.tif

# on transforme ensuite la couleur blanche des images en transparent
# blanc = #ffffff
# nota : on force aussi en sortie le type png32
convert maison_3857_bordtransparent.png \
        -transparent "#ffffff" \
        png32:maison_3857_bordtransparent_blanctransparent.png


cp maison_3857_bordtransparent.wld maison_3857_bordtransparent_blanctransparent.wld

# info
file maison_3857_bordtransparent_blanctransparent.png
identify maison_3857_bordtransparent_blanctransparent.png
gdalinfo maison_3857_bordtransparent_blanctransparent.png | grep -E Files\|Driver\|Band

# nettoyage
rm maison_3857_bordtransparent.png
rm maison_3857_bordtransparent.wld
rm maison_3857_bordtransparent.png.aux.xml


# creation d'une mosaique
rm -r tuiles
gdal2tiles.py -p mercator \
              -s 'EPSG:3857' \
              -t "logo" \
              maison_3857_bordtransparent_blanctransparent.png \
              tuiles

# transformation en mbtiles
wget -O raster2mb https://raw.githubusercontent.com/crschmidt/raster2mb/master/raster2mb
chmod +x raster2mb

rm maison_3857.mbtiles
./raster2mb maison_3857_bordtransparent_blanctransparent.png \
            maison_3857.mbtiles

rm tmp.png
