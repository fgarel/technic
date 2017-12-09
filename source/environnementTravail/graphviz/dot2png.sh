#!/bin/bash

FILE='organigram'

# nettoyage des fichiers temporaires...
rm -f $FILE.png
rm -f $FILE.svg
rm -f $FILE-notugly.svg
rm -f $FILE-notugly.png

# conversion d'un fichier dot en svg
dot -Tsvg $FILE.dot > $FILE.svg

# le xsl a pour but de rendre le svg joli
# ici on a ajoute l'option novalid pour supprimer l'erreur de dtd
# /usr/share/xml/svg/svg11.dtd:2278: validity warning : Attribute space of element style: already defined
# https://mail.gnome.org/archives/xslt/2011-July/msg00004.html
#
xsltproc --novalid notugly.xsl $FILE.svg > $FILE-notugly.svg

# conversion du svg en png
rsvg-convert $FILE-notugly.svg $FILE-notugly.png
rsvg-convert $FILE.svg $FILE.png

# affichage du fichier png
#display $FILE-notugly.png &
