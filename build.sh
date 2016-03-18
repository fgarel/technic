#!/bin/sh

echo "#"
echo "# Se mettre dans l'environnement virtuel ecriture_sphinx"
echo "# pew workon ecriture_sphinx"
echo "#"
echo "# html : depuis index  : les includes doivent etre complet depuis source"
echo "#        depuis geogig : les includes doivent etre depuis sous-repertoire"
echo "#   => l'erreur n'est pas bloquante,"
echo "#      du coup, pour chaque fichier, on designe deux includes"
echo "#      .. include:: part01.rst"
echo "#      .. include:: geogig/part01.rst"
echo "make html"
      make html
echo "# latexpdf : depuis index  : les includes doivent etre complet depuis source"
echo "make latexpdf"
      make latexpdf

echo "# slidehie : les includes doivent etre complet depuis source"
echo "make slideshie"
      make slideshie
echo "# slidehov : les includes doivent etre complet depuis source"
echo "# dans les fichiers *_hov.rst"
echo "#      .. include:: source/geogig/part01.rst"
echo "make slideshov"
      make slideshov

#sphinx-build -b latex \
#    -b latex \
#    -d build/doctrees \
#    -D latex-paper-size=a4 \
#    source \
#    build/latex
