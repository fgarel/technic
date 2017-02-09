#!/bin/sh

# 1ere partie : preparation avant google earth
02_before_ge.sh

# puis travail sous google earth

# 2de partie : traitement des pdf
13_after_ge.sh
# les fichiers pdf sont recupérés a partir de google earth
# les pdf sont tranformées en png, eclarcis et resizé
./02_imagemagick.py

./03_imagemagick.sh
# un projet hugin est généré à partir des png

./04_lance_hugin.sh

