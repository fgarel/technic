#!/bin/sh

# Script pour convertir les fichiers pdf en image png
# On en profite pour rogner une partie de l image

for i in `seq 0 440`;do
  # Pour le poster
  # pour memoire (trop dense) : convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/$i.pdf /home/fred/h/cartographie/pva/$i.png
  # convert -density 75 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/$i.pdf /home/fred/hugin/case21/$i.png
  #
  # pour les cases (21)
  convert -density 75 -gravity Center -shave '1534x1020' -level +0%,+100%,1.5 /home/fred/PDF/$i.pdf /home/fred/hugin/case21/$i.png
done

