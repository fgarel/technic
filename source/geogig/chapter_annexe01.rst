
========================
Environnement de travail
========================

Description de l'environnement de Travail pour ce travail sur les plans topos

Nous allons utiliser byobu pour le mode console

Nous allons utiliser sphinx et hovercraft pour la rédaction de la documentation

Utilisation de Byobu pour le mode console
=========================================

1er Terminal : Pour l'administration
------------------------------------
Le premier ecran est destiné au repertoire

.. code::
  ~/Documents/install source

L'ecran peut-etre divisé en deux :

En haut, acces au sous-repentoire
.. code::
  ~/Documents/install/source/environnementTravail/

pour modifier les fichiers de type
.. code::
  ./installPostgresqlGeogig*.sh

En bas, accès au sous-repertoire
.. code::
  /Documents/install/source/geogig/

pour modifier les fichiers de type
.. code::
  ./installGeogig.sh
  ./dxfToPostgis.sh # utilitaire pour convertir dxf en postgis

2d Terminal : Pour l'utilisation
--------------------------------
Le second écran est destiné au repertoire
.. code::
  ~/Documents/technic/source/geogig/


3ème Terminal : Pour la rédaction de la documentation
-----------------------------------------------------
Le troisième écran est dédié à la documentation
Cet écran peut lui aussi etre divisé en plusieurs frames :

En haut (Edition), acces au sous-repertoire
.. code::
  ~/Documents/technic/source/geogig
  cd ~/Documents/technic/source/geogig/
pour modifier les fichiers rst
.. code::
  vi chapter01_hov.rst

En bas (Compilation), acces au sous-repertoire
.. code::
  ~/Documents/technic
  cd ~/Documents/technic
pour compiler la documentation.
Avant, il faut se mettre dans l'environemment virtuel ecriture_sphinx
.. code::
  pew workon_ecriture_sphinx
  ./build.sh ; ./visualize.sh


Utilisation de Sphinx et hovercraft pour générer la documentation
=================================================================

Conventions de syntaxe pour les fichiers restructured text

geogig.rst :
     ### : pour le nom du projet
part01.rst :
     *** : pour les parties
chapter01.rst :
     === : pour les chapitres

Outils pour faciliter la génération de cette documentation
==========================================================

Transformation du fichier /chapter_annexe05.rst en fichier _hov.rst


