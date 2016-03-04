#!/bin/sh

echo "#"
echo "# Se mettre dans l'environnement virtuel ecriture_sphinx"
echo "# pew workon ecriture_sphinx"
echo "#"
echo "make slideshie"
      make slideshie
echo "make slideshov"
      make slideshov
echo "make html"
      make html
echo "make latexpdf"
      make latexpdf


sphinx-build -b latex \
    -b latex \
    -d build/doctrees \
    -D latex-paper-size=a4 \
    source \
    build/latex
