************************************************
Présentation générale l'environnement de Travail
************************************************


Comme cela a déjà été évoqué en introduction, l'outil central de cet
environnement est sphinx.

L'installation et l'utilisation de sphinx est simplifié grace à l'utilisation
d'un environnement virtuel python.

De plus, du fait de notre volonté de gerer l'historique de nos documents
et la possibilité de travailler à plusieurs, nous utilisons aussi git.

Arborescence des fichiers et des répertoires dans un système de fichiers
========================================================================
Les documents que nous écrivons sont regroupés par projet
(c'est à dire par sous-repertoire).
Par exemple, 

 - le sous-repertoire "technic" regroupe les documents liés aux
   trucs et astuces concernant le boulot.
 - le sous repertoire "perso" regroupe les documents liés aux
   informations personnelles
 - le sous repertoire "report" regroupe les documents correspondant
   aux présentations.

Ces projets (ou sous-repertoire) sont créés à l'aide d'une commande de sphinx,
sphinx-quickstart

En choisissant la bonne option, Sphinx permet de séparer un projet
en deux sous-dossiers, un sous-dossier source et un sous-dossier build.

Avec git, nous allons faire la gestion des versions de fichiers
uniquement sur le sous-repertoire source.

La racine de tout cet environnement est :

.. code::

  ~/Travail/ecriture_sphinx

Voici donc l'arborescence que nous allons obtenir :

.. code::

  ~/Travail/ecriture_sphinx
                           /technic
                                   /build
                                   /.git
                                   /Makefile
                                   /README.md
                                   /source
                                          /conf.py
                           /perso
                                   /build
                                   /.git
                                   /Makefile
                                   /README.md
                                   /source
                                          /conf.py
                           /projet_00
                                   /build
                                   /.git
                                   /Makefile
                                   /README.md
                                   /source
                                          /conf.py

Utilisation de cet environnement
================================

Fabriquer le livre technic.pdf
------------------------------

Se placer au bon endroit dans l'arborescence (au dessus de source et de build)

.. code::

  cd ~/Travail/ecriture_sphinx/technic

Il faut aussi activer l'environnement virtuel python

.. code::

  workon ecriture_sphinx

Alors, on peut lancer la commande pour fabriquer le pdf

.. code::

  make latexpdf

Le fichier résultat est 

.. code::

  ~/Travail/ecriture_sphinx/technic/build/latex/technic.pdf

Fabriquer une présentation
--------------------------

La commande pour fabriquer les diapos est

.. code::

  make slides

Le fichier résultat est 

.. code::

  ~/Travail/ecriture_sphinx/technic/build/slides/index.html
