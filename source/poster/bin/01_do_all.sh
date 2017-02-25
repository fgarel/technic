#!/bin/sh

# 1ere partie : preparation avant google earth
#./02_before_ge.sh

# puis travail sous google earth

# 2de partie : traitement des pdf
# les fichiers pdf sont recupérés a partir de google earth
# les pdf sont tranformées en png, eclarcis et resizé
./07_imagemagick.sh

# un projet hugin est généré à partir des png
./08_lance_hugin_01.sh

# les images sont recalées dans ce projet hugin
./09_lance_hugin_02.sh

# on reassemble le tout
./10_lance_hugin_03.sh


