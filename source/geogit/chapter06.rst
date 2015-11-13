***********************************
Utilisation de geogig pour la gestion du PCRS
***********************************



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

Creation de 5 depots geogig
===========================

Cette mise en place est assurée par le script 

.. code::

  ~/Documents/install/source/geogig/installationGeogig2.sh

