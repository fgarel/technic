===================================
Procédures et scénarii de l'exemple
===================================



Creation de données exemples
============================
le premier fichier sample.ods permet de montrer
l'évolution des emprises geographiques de 4 utilisateurs.

Le deuxième fichier, sample2.ods, permet de fabriquer le fichier sql
qui correspond aux 25 cases de l'emprise totale

A partir de ce deuxième fichier sample2.ods, nous allons fabriquer
3 fichiers sql :

  - create_sample.sql
  - insert_sample.sql
  - update_sample.sql

En executant ces trois fichiers, on obtient notre base exemple.
L'installation de Postgresql est détaillée dans le fichier

.. code::
  ~/Documents/install/source/environnementTravail/installPostgresql.sh

.. code::

  psql -h localhost -d gis -U fred -f create_sample.sql
  psql -h localhost -d gis -U fred -f insert_sample.sql
  psql -h localhost -d gis -U fred -f update_sample.sql

Utilisation du script

.. code::
  ./Documents/install/source/geogig/installGeogigSample.sh


Installation de geogig
======================

L'installation est automatisée et détaillée
via l'execution du script

.. code::

  ~/Documents/install/source/geogig/installGeogig.sh

Installation d'utilitaires divers
=================================
 petl
 https://pypi.python.org/pypi/petl
 https://petl.readthedocs.org/en/latest/index.html
 https://github.com/alimanfoo/petlx
 http://petlx.readthedocs.org/en/latest/index.html

 setl
 https://stetl.readthedocs.org/en/latest/
 https://github.com/justb4/stetl
 http://fr.slideshare.net/justb4/stetl-foss4g20131024v1

 manipulation de fichier svg et graphviz
 https://www.npmjs.com/package/rsvg
 http://www.hokstad.com/making-graphviz-output-pretty-with-xsl-updated
 http://www.hokstad.com/making-graphviz-output-pretty-with-xsl
 https://github.com/vidarh/diagram-tools
 http://www.hokstad.com/graphviz
 
 plantuml
 http://fr.plantuml.com/usecase.html#Skinparam
 http://plantuml.com/sequence.html

 aafig
 https://pythonhosted.org/sphinxcontrib-aafig/
 https://github.com/thewtex/sphinx-contrib/tree/master/aafig



Creation de 5 depots geogig
===========================
Il y a 1 dépot git par acteur plus un dépot git central.

Cette mise en place est assurée par le script 

.. code::

  ~/Documents/install/source/geogig/installationGeogig2.sh

Scénario proposé
================
L'acteur A
Format privilégié : DXF
Emprise : Case
Liste des objets levés : commun, puis à partir d'une certaine date, Arbre + Haie

L'acteur B
Format : Postgis
Emprise : Case
Liste des objets levés : commun, puis à partir d'une certaine date, Arbre + AffleurantSymbole

L'acteur C
Format : ShapeFile
Emprise : Polygone irrégulier
Liste des objets levés : commun, puis à partir d'une certaine date, Haie + PointCanevas

L'acteur D
Format : Spatialite
Emprise : Polygone irrégulier
Liste des objets levés : commun, puis à partir d'une certaine date, PointCanevas + AffleurantSymbole


Les différentes étapes
======================

Les étapes dans le temps
========================

1. Etape 1
Dessin initial
commun = emprise + facade + bordure + mur

.. note::
[M11, M51, M55, M15]
A_1 = M11(emprise) + M11(facade) + M11(bordure) + M11(mur)

B_1 = M11 ()

2. Etape 2
Chaque acteur met à disposition de nouveaux plans : agrandissement de la zone

Versionning : Comment l'evolution temporelle de l'emprise géographique dans le temps ?

.. note::
A_2 = A_1 + M21(emprise) + M21() + ...
          + M12() + M12() + ...

B_2 =

3. Etape 3
Chaque acteur complète (enrichit) son levé avec des nouveaux objets

Versionning : comment visualiser l'evolution de 
