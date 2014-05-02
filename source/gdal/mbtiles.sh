#!/bin/sh
#

# creation d'une image de dimension 1024x1024
# utilisation d'imageMagick
rm logo_tmp.png
convert logo: -geometry 1365x1024 logo_tmp.png
identify logo_tmp.png
convert -gravity center logo_tmp.png -crop 1024x1024+0+0 +repage logo0.png
identify logo0.png
rm logo_tmp.png
rm logo0.png

rm logo_3946.png
convert -gravity center logo: -geometry 1365x1024 -crop 1024x1024+0+0 +repage logo_3946.png
identify logo_3946.png

# creation d'un fichier worldfile (cc46)
rm logo_3946.pgw
cat <<EOF > logo_3946.pgw
0.1
0
0
-0.1
1379241
5227395
EOF

# info
#gdalinfo logo_3946.png

# transformation du système de coordonnées
rm logo_3857.pgw
rm logo_3857.png
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -co 'WORLDFILE=yes'\
         logo_3946.png \
         logo_3857.png
rm logo_3946.png
rm logo_3946.pgw

# info
#gdalinfo logo_3857.png

# creation d'une mosaique
gdal2tiles.py -p mercator \
              -s 'EPSG:3857' \
              -t "logo" \
              logo_3857.png \
              tuiles

# transformation en mbtiles
wget -O raster2mb https://raw.githubusercontent.com/crschmidt/raster2mb/master/raster2mb
chmod +x raster2mb

./raster2mb logo_3857.png \
            logo_3857.mbtiles
