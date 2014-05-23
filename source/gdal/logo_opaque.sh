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

rm logo_3946.png
convert -gravity center logo: -geometry 1365x1024 -crop 1024x1024+0+0 +repage logo_3946.png

# le fichier généré est de type 8-bit (????)
# info
file logo_3946.png
identify logo_3946.png
gdalinfo logo_3946.png | grep -E Files\|Driver\|Band


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


# transformation du système de coordonnées
# l'image resultante est en geotif
rm logo_3857.tfw
rm logo_3857.tif
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -of GTiff \
         -co 'TFW=yes'\
         logo_3946.png \
         logo_3857.tif

# suppression des fichiers png
rm logo_3946.png
rm logo_3946.pgw

# info
file logo_3857.tif
identify logo_3857.tif
gdalinfo logo_3857.tif | grep -E Files\|Driver\|Band

# conversion de tif vers png
rm logo_3857.png
rm logo_3857.wld
gdal_translate -of png \
               -co 'WORLDFILE=yes' \
               logo_3857.tif \
               logo_3857.png

#rm logo_3857.png
#convert logo_3857.tif logo_3857.png

# suppression des fichiers tif
#rm logo_3857.tfw
#rm logo_3857.tif

# info
file logo_3857.png
identify logo_3857.png
gdalinfo logo_3857.png | grep -E Files\|Driver\|Band

# creation d'une mosaique
rm -r tuiles
gdal2tiles.py -p mercator \
              -s 'EPSG:3857' \
              -t "logo" \
              logo_3857.png \
              tuiles

# transformation en mbtiles
wget -q -O raster2mb https://raw.githubusercontent.com/crschmidt/raster2mb/master/raster2mb
chmod +x raster2mb

rm logo_3857.mbtiles
./raster2mb logo_3857.png \
            logo_3857.mbtiles

rm tmp.png
