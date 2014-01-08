#!/bin/bash

# nettoyage des fichiers temporaires...
rm -f test.png
rm -f test.svg
rm -f test-notugly.svg
rm -f test-notugly.png

# conversion d'un fichier dot en svg
dot -Tsvg test.dot > test.svg

# le xsl a pour but de rendre le svg joli
xsltproc notugly.xsl test.svg > test-notugly.svg

# conversion du svg en png
rsvg test-notugly.svg test-notugly.png
rsvg test.svg test.png

# affichage du fichier png
#display test-notugly.png &
