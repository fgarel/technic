#!/bin/sh
# cartes de la manche
# JJL - http://kubuntu.free.fr

## Les variables suivantes doivent etre positionnees
# export NETCDFHOME=/usr/lib
# export GMTHOME=/usr/lib/gmt
# export PATH=$PATH:$GMTHOME/bin


## Ma 1ere carte, la manche avec les rivieres
pscoast -R-7/2/47.5/51.5 -JM10c -P -Ggreen -Sblue -W -Df -Ir -B1g1 > gmt_manche_01.ps
ps2raster -Tg -A gmt_manche_01.ps

## Generer le fichier grd des informations de topographie
## 1) a partir de la base complete
####grdreformat /usr/share/gmt/dbase/ETOPO2v2g_f4.nc gmt_manche_02.grd -R
## 2) a partir d'un fichier xyz de http://www.ngdc.noaa.gov/mgg/gdas/gd_designagrid.html
xyz2grd -Ggmt_manche_02.grd -I2m -R manche02_1630.xyz
grdinfo gmt_manche_02.grd

## Tracons la carte avec des lignes de niveaux
pscoast -R -JM20c -Ggreen -Sblue -W -Df -B -K  > gmt_manche_02.ps
#grdcontour gmt_manche_02b.grd -J -S4 -C20 -O >> gmt_manche_02.ps
grdcontour gmt_manche_02.grd -J -S4 -C20 -O >> gmt_manche_02.ps
# un "petit" png
ps2raster -Tg -A gmt_manche_02.ps
# on le fait tourner avec imagemagick
mogrify -rotate 90 gmt_manche_02.png

## generation d'une palette de couleur
makecpt -Crelief -T-450/450/20 -Z > gmt_manche_03.cpt
# on va creer une echelle pour voir la palette
psscale -Cgmt_manche_03.cpt -D10c/2c/20c/1ch -Ba100 > gmt_manche_03_cpt.ps
# en png
ps2raster -Tg -A gmt_manche_03_cpt.ps
# rotation et redimensionnement tjs avec imagemagick
mogrify -resize x800 -rotate 90 gmt_manche_03_cpt.png

## Carte topographique
grdimage gmt_manche_02.grd -J -Cgmt_manche_03.cpt -E50 -K > gmt_manche_03.ps
# lignes de niveaux
grdcontour gmt_manche_02.grd -J -S4 -C25 -O >> gmt_manche_03.ps
# et le jpeg
ps2raster -Tj -A gmt_manche_03.ps
mogrify -resize 75% -rotate 90 gmt_manche_03.jpg
