#!/bin/sh

# recuperation de l'emprise geographique d'un declaration, en lisant le fichier pdf (document.pdf)
./pdf2txt.sh

rm report.pdf
ipython pdf_generator.py

display report.pdf


