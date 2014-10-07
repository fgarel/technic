#!/bin/sh
# differents niveaux de details de la cote
# JJL - http://kubuntu.free.fr

AREA=-7/2/47.5/51.5
NAME=gmt_details

pscoast -R$AREA -P -JM10c -Dc -Ggreen -Sblue > ${NAME}_c.ps
pscoast -R$AREA -P -JM10c -Di -Ggreen -Sblue > ${NAME}_i.ps
pscoast -R$AREA -P -JM10c -Dl -Ggreen -Sblue > ${NAME}_l.ps
pscoast -R$AREA -P -JM10c -Df -Ggreen -Sblue > ${NAME}_f.ps
ps2raster -Tg -A ${NAME}*.ps
