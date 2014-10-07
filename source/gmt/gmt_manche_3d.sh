#!/bin/sh
# carte 3d de la manche
# JJL - http://kubuntu.free.fr

# surface à cartographier
AREA=-7/2/47.5/51.5/-6/-4
# taille image
TAILLE=10c
# nom des fichiers
NOM=gmt_manche_3d
# viewpoint
VP=185/89

## donnees topographiques
## 1) a partir de la base complete
## 2) à partir d'un fichier xyz de http://www.ngdc.noaa.gov/mgg/gdas/gd_designagrid.html
xyz2grd -G${NOM}.grd -I2m -R manche02_1630.xyz
# grdreformat /usr/share/gmt/dbase/ETOPO2v2g_f4.nc ${NOM}.grd -R$AREA
## palette
makecpt -Crelief -T-200/200/20 -Z > ${NOM}.cpt
psscale -D5c/5c/10c/2c -C${NOM}.cpt > scale.ps

## Perspective en couleurs
grdview ${NOM}.grd -R${AREA} -JM${TAILLE} -Jz0.1c -E${VP}  -Qs -C${NOM}.cpt -K > ${NOM}.ps
## Jz : echelle des Z
## E : élévation et azimuth
## Qs : dessin par polygones

# Ajout de l'adresse web et fermeture du fichier
pstext -R -J -Gblack -Dj2p/2p  -O >> ${NOM}.ps << END
2 47.5 8 0 2 RB JJL - http://kubuntu.free.fr
END

## Generation d'un fichier JPEG
ps2raster -Tj -A ${NOM}.ps
mogrify -rotate 90 ${NOM}.jpg

