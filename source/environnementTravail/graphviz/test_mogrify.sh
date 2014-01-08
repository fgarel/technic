#!/bin/bash


# test des options de resize d'image magick
# le but est d'obtenir
# une image finale de 640x480
# si l'image est plus petite, elle n'est pas agrandie
# par contre, si l'image est plus grande, elle est diminuée
# cf http://www.imagemagick.org/Usage/resize/
# Only Shrink Larger Images ('>' flag)


# creation des images de depart
# -----------------------------
convert logo: -resize 320x240! logo_0320_0240.png
convert logo: -resize 600x450! logo_0600_0450.png
convert logo: -resize 640x480! logo_0640_0480.png
convert logo: -resize 1200x900! logo_1200_0900.png
convert logo: -resize 1280x960! logo_1280_0960.png

convert logo: -resize 1280x480! logo_1280_0480.png
convert logo: -resize 640x960! logo_0640_0960.png

# affichage des dimensions initales
# ---------------------------------
identify logo_0320_0240.png
identify logo_0600_0450.png
identify logo_0640_0480.png
identify logo_1200_0900.png
identify logo_1280_0960.png

identify logo_1280_0480.png
identify logo_0640_0960.png

# 1er mogrify
# -----------
mogrify -gravity center -background grey -resize 640x480+0+0\> -extent 640x480 logo_0320_0240.png
mogrify -gravity center -background grey -resize 640x480+0+0\> -extent 640x480 logo_0600_0450.png
mogrify -gravity center -background grey -resize 640x480+0+0\> -extent 640x480 logo_0640_0480.png
mogrify -gravity center -background grey -resize 640x480+0+0\> -extent 640x480 logo_1200_0900.png
mogrify -gravity center -background grey -resize 640x480+0+0\> -extent 640x480 logo_1280_0960.png

mogrify -gravity center -background grey -resize 640x480+0+0\> -extent 640x480 logo_1280_0480.png
mogrify -gravity center -background grey -resize 640x480+0+0\> -extent 640x480 logo_0640_0960.png

# affichage des nouvelles dimensions
# ----------------------------------
identify logo_0320_0240.png
identify logo_0600_0450.png
identify logo_0640_0480.png
identify logo_1200_0900.png
identify logo_1280_0960.png

identify logo_1280_0480.png
identify logo_0640_0960.png

# affichage des images
# --------------------
display logo_0320_0240.png
display logo_0600_0450.png
display logo_0640_0480.png
display logo_1200_0900.png
display logo_1280_0960.png

display logo_1280_0480.png
display logo_0640_0960.png

