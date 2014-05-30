************
Introduction
************

le but est de creer et utiliser un utilitaire permettant de recaler des pdf

il y a plusieurs aspects :

ihm :

l'idée est d'avoir une page web avec plusieurs fenetres de type carte.
Le latyout ressemblerait à celui utilisé pour comparer plusieurs cartes
http://mc.bbbike.org/mc/


lien pour extraire des données d'osm
http://extract.bbbike.org/

Ligne de commande pour telecharger un site

.. code::
  rm -r api.maps.yahoo.com maps.googleapis.com mc.bbbike.org
  wget -H -N -k -p http://mc.bbbike.org/mc/
  wget -N -k -p http://mc.bbbike.org/mc/

  rm -r mc.bbike.org ; wget -N -k -p http://mc.bbbike.org/mc/ ; wget -x -r http://mc.bbbike.org/mc/img/

-H = Allows wget to go to span a foreign host. Required since tumblr does not have its images on the front page on the same address, they are using secure.assets.tumblr.com see note on excluding domains

-N = will grab only files that are newer that what you currently have, in case you are downloading the same page again over time

-k = convert your links to view it offline properly

-p = grabs all required elements to view it correctly (css, images, etc)
