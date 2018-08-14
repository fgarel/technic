#!/bin/sh


# Le but de ce script est d'extraire une signature


# 1. On signe sur une page A4, et on scanne (resolution 600, format tif) ces signatures : le fichier s'appelle
#   ../data/A4_signature_1.tif

# 2. A l'aide d'image magick, on extrait la singature
# Les options fuzz et median sont expliquées ici
# https://stackoverflow.com/questions/9155377/set-transparent-background-using-imagemagick-and-commandline-prompt
# une solution meilleure est ici
# https://github.com/hackerb9/mktrans/
convert -density 600 \
        ../data/A4_signature_1.tif \
        -crop 1332x524+3208+1148\! \
        -median 2 -fuzz 5% \
        -transparent white \
        ../data/A4_signature_3.png

identify ../data/A4_signature_3.png #; display ../data/signature2.pdf

# 3. Creation d'une page blanche
#convert -density 600 xc:white -page A4 ../data/A4_pageBlanche.pdf
# 4961 = 600 * 21 / 2.54
# 7016 = 600 * 29.7 / 2.54
# c'est donc du A4 avec résolution de 600 dpi
convert -size 4961x7016 xc:transparent ../data/A4_transparent.png

# 4. Positionnement de la signature dans cette page blanche
composite -geometry +3250+6300 ../data/A4_signature_3.png ../data/A4_transparent.png ../data/A4_signature_5.pdf

# 5. le coup de tampon !
# pdftk stamp
# https://stackoverflow.com/questions/8470808/stamp-pdf-file-with-control-for-position-of-stamp-file
pdftk ../data/recepisse.pdf stamp ../data/A4_signature_5.pdf output ../data/recepisse_signe.pdf
