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
  
Installation de texlive 2013
============================

Ubuntu embarque un paquet de texlive qui date de 2009

et autolatex a besoin d'une version plus récente

http://zeroset.mnim.org/2012/05/03/tex-live-on-ubuntu-why-fontspec-does-not-work-with-lualatex-on-ubuntu-12-04-2-2/

Il faut donc installer texlive 2013 et cela se fait grace à un script qui s'occupe de tout

http://www.latex-community.org/forum/viewtopic.php?f=12&t=23749

https://github.com/scottkosty/install-tl-ubuntu

.. code::

  git clone https://github.com/scottkosty/install-tl-ubuntu
  cd install-tl-ubuntu
  sudo ./install-tl-ubuntu

Attention, après l'install, il ne faut pas oublier de modifier le PATH

http://www.tug.org/texlive/quickinstall.html

.. code::
  
    PATH=/usr/local/texlive/2013/bin/x86_64-linux:$PATH
