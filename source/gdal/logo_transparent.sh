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

# info
file logo_3946.png
identify logo_3946.png
gdalinfo logo_3946.png | grep -E Files\|Driver\|Band

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

# le but est d'obtenir un png que l'on aura reprojeté
# limites : gdalwarp n'a pas de sortie en png
#           le tiff en sortie est en gris 16
# essai 1 : on deforme avec en sortie du vrt
#           puis on converti le fichier vrt en png avec gdal_translate
# ici, l'option dstalpha, c'est pourt dire que les bors noires doivent être transparents
rm logo_3857_bordtransparent.vrt
gdalwarp -s_srs 'EPSG:3946' \
         -t_srs 'EPSG:3857' \
         -dstalpha \
         -of vrt \
         logo_3946.png \
         logo_3857_bordtransparent.vrt

# info
gdalinfo logo_3857_bordtransparent.vrt | grep -E Files\|Driver\|Band

# nettoyage
# attention, ici il ne faut pas supprimer le fihcier png logo_3946.png

# conversion
rm logo_3857_bordtransparent.png
rm logo_3857_bordtransparent.wld
gdal_translate -of png \
               -co 'WORLDFILE=yes' \
               logo_3857_bordtransparent.vrt \
               logo_3857_bordtransparent.png

# info
file logo_3857_bordtransparent.png
identify logo_3857_bordtransparent.png
gdalinfo logo_3857_bordtransparent.png | grep -E Files\|Driver\|Band

# nettoyage
rm logo_3857_bordtransparent.vrt
rm logo_3946.png
rm logo_3946.pgw

# on transforme ensuite la couleur blanche des images en transparent
# blanc = #ffffff
convert logo_3857_bordtransparent.png \
        -transparent "#ffffff" \
        logo_3857_bordtransparent_blanctransparent.png

cp logo_3857_bordtransparent.wld logo_3857_bordtransparent_blanctransparent.wld

# nettoyage
rm logo_3857_bordtransparent.png
rm logo_3857_bordtransparent.wld
rm logo_3857_bordtransparent.png.aux.xml

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
              logo_3857_bordtransparent_blanctransparent.png \
              tuiles

# transformation en mbtiles
wget -q -O raster2mb https://raw.githubusercontent.com/crschmidt/raster2mb/master/raster2mb
chmod +x raster2mb

rm logo_3857.mbtiles
./raster2mb logo_3857_bordtransparent_blanctransparent.png \
            logo_3857.mbtiles

rm tmp.png
