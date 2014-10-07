#!/bin/sh
# carte "marine" de la manche
# JJL - http://kubuntu.free.fr

# surface a cartographier
AREA=-7/2/47.5/51.5
# taille de l'image'
TAILLE=20c
# nom des fichiers
NOM=gmt_manche_marine

# donnees topographiques
grdreformat /usr/share/gmt/dbase/ETOPO2v2g_f4.nc ${NOM}.grd -R$AREA
# palette pour la mer
makecpt -Cocean -T-156/20/25 -Z > ${NOM}.cpt
# Couleurs de la mer
grdimage ${NOM}.grd -JM$TAILLE -C${NOM}.cpt -E100 -K > ${NOM}.ps
# Ligne de niveaux en mer
grdcontour ${NOM}.grd -JM$TAILLE -S4 -L-500/-10 -C20 -O -K >> ${NOM}.ps
# Dessin de la surface terrestre
pscoast -R$AREA -JM$TAILLE -G255/221/149 -W -B1g1 -Df -O -K >> ${NOM}.ps

## Ajout des positions de villes
# -: lat/lon, Scp: point
psxy -: -R -J -Scp -Gblack -O -K >> ${NOM}.ps << END
# LAT      long    size
# FR
48:23:27N 4:29:8W   4 # 145 200 Brest
47:59:48N 4:05:47W  3 # 64 900 Quimper
48:30:48N 2:45:54W  3 # 46 087 Saint-Brieuc
48:38:53N 2:00:27W  3 # 50 675 Saint-Malo
48:6:52N  1:40:45W  4 #588 684 Rennes
47:45N    3:21:36W  3 # 59 189 Lorient
48:1:12N  0:11:55E  4 #144 500 Le Mans
49:29:24N 0:06:00E  4 #183 900 Le Havre
50:56:53N 1:51:23E  3 # 73 200 Calais
# GB
50:22:12N 4:8:31W    4 #246 100 Plymouth
50.900857 -1.395551  4 #222 000 Southampton
END
## Ajout des noms de villes
pstext -: -R -J -Gblack -Dj0/3p  -O -K >> ${NOM}.ps << END
# LAT, long, size, inclinaison, font, alignement, texte
# FR
48:23:27N 4:29:8W  8 0 6 CB Brest
47:59:48N 4:05:47W 6 0 6 CB Quimper
48:30:48N 2:45:54W 6 0 6 RB St-Brieuc
48:38:53N 2:00:27W 6 -45 6 LB St-Malo
48:6:52N  1:40:45W 8 0 6 CB Rennes
47:45N    3:21:36W 6 0 6 CB Lorient
48:1:12N  0:11:55E 8 0 6 CB Le Mans
49:29:24N 0:06:00E 8 0 6 LB Le Havre
50:56:53N 1:51:23E 6 0 6 RT Calais
# GB
50:22:12N 4:8:31W    8  0 6 CB  Plymouth
50.900857 -1.395551  8  0 6 CB  Southampton
END

## Lignes de niveaux a terre
grdcontour ${NOM}.grd -J -S4 -L10/500 -C100 -O -K >> ${NOM}.ps

# Ajout de l'adresse web et fermeture du fichier
pstext -R -J -Gblack -Dj2p/2p  -O >> ${NOM}.ps << END
2 47.5 8 0 2 RB JJL - http://kubuntu.free.fr
END

# Generation d'un fichier JPEG
ps2raster -Tj -A ${NOM}.ps
mogrify -rotate 90 ${NOM}.jpg

