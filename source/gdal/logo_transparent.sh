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

# info
file logo_3946.png
identify logo_3946.png
gdalinfo logo_3946.png

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

convert logo_3946.png \
        -alpha Set \
        logo_3946_transparent.png

# info
file logo_3946_transparent.png
identify logo_3946_transparent.png
gdalinfo logo_3946_transparent.png

# transformation du système de coordonnées
# l'image resultante est en geotif
rm logo_3857_transparent.tfw
rm logo_3857_transparent.tif
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -of GTiff \
         -co 'TFW=yes'\
         -co 'ALPHA=yes'\
         logo_3946.png \
         logo_3857_transparent.tif
#rm maison_3946-flatten.png
#rm maison_3946-flatten.pgw

# info
file logo_3857_transparent.tif
identify logo_3857_transparent.tif
gdalinfo logo_3857_transparent.tif

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
               logo_3857_transparent.tif \
               logo_3857_transparent.png
#rm maison_3857.tfw
#rm maison_3857.tif

# info
file logo_3857_transparent.png
identify logo_3857_transparent.png
gdalinfo logo_3857_transparent.png

# essai 2 : on deforme avec en sortie du vrt
# puis on converti le fichier vrt en png avec gdal_translate
rm logo_3857_transparent_v2.vrt
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -of vrt \
         logo_3857.png \
         logo_3857_transparent_v2.vrt

# info
gdalinfo logo_3857_transparent_v2.vrt

# conversion
rm logo_3857_transparent_v2.png
rm logo_3857_transparent_v2.wld
gdal_translate -of png \
               -co 'WORLDFILE=yes' \
               logo_3857_transparent_v2.vrt \
               logo_3857_transparent_v2.png
#rm maison_3857.tfw
#rm maison_3857.tif

# info
file logo_3857_transparent_v2.png
identify logo_3857_transparent_v2.png
gdalinfo logo_3857_transparent_v2.png

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
