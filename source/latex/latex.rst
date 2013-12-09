*****
latex
*****

Installation de autolatex
=========================

Ajout du depot suivant
deb http://download.tuxfamily.org/arakhne/ubuntu precise-arakhne universe

.. code::

  cat 'deb http://download.tuxfamily.org/arakhne/ubuntu precise-arakhne universe' > /etc/apt/sources.list.d/autolatex.list

Puis, on procede à l'installation

.. code::

  aptitude install autolatex

Utilisation de autolatex
========================

Pour utiliser autolatex, il suffit d'appeler la commande

.. code::

  autolatex -f mylatex.tex


En cas de probleme avec les fichers .sty, il fautra alors installer quelques paquets supplémentaires

.. code::

  aptitude install texlive-latex3
  aptitude install texlive-xetex
  aptitude install texlive-full
