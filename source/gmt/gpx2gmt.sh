#!/bin/sh
# trace une route sur la carte
# gpx2gmt <fichierTexte>
# FichierTexte de la forme : <Latitude> <Longitude> D
# JJL - http://kubuntu.free.fr

# TODO: convertir le gpx en texte

if [ -z "$1" ]
then
   echo "usage: $0 <FichierTexte>"
   echo "FichierTexte de la forme : <Latitude> <Longitude> D"
   exit 1
fi

# nom des fichiers de sortie
NOM=$1
# surface a cartographier
AREA=`minmax -: -I.5 $1`
# taille de l'image'
TAILLE=20c

# Dessin de la surface terrestre
pscoast $AREA -JM$TAILLE -G255/221/149 -W -B1g1 -Df -K > ${NOM}.ps

## Tracage de la ligne
# -: lat/lon
psxy $1 -: -R -Wthick -J -O >> ${NOM}.ps

# Generation d'un fichier JPEG
ps2raster -Tj -A ${NOM}.ps
mogrify -rotate 90 ${NOM}.jpg
rm ${NOM}.ps
