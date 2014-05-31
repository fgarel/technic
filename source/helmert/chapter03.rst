**********************************
Les transformations de coordonnées
**********************************

La page de référence est le page 
http://www.portailsig.org/content/les-transformations-affines-avec-numpy-ou-la-signification-geometrique-d-un-fichier-worldfil

Après examen de cette page, nous décidons d'utiliser le fichier transformations.py

Nous allons donc télécharger un fihcier transformations.py

.. code::
  wget http://http://www.lfd.uci.edu/~gohlke/code/transformations.py.html

il se trouve que le fichier est un fichier html...
il est donc préférable de faire un copier coller


Nous allons suivre cette page et créer 3 fichiers :
- traitement_numpy.py est le test utilisé au début de la page,
  qui utilise la bibliotheque numpy
- traitement_transformations.py est le test utilisé en milieu de page
  qui utilise le fichier transformations que l'on a préalablement téléchargé
- et traitement_osgeogdal est le script de controle utilisé en fin de page

En ce qui concerne notre besoin, on va s'inspiré du second script,
que l'on va renommer en fgtransformations.py, en lui ajoutant la lecture de fichier csv.

