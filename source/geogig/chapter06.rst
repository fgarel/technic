===================================
Jeu de données "test", scenarios d'utilisation
===================================


Cas d'utilisation
=================

Au niveau départemental
-----------------------

La Ville de La Rochelle initialise son depot PCRS_public

Combien d'objets (combien de cases) sont présent dans le depot PCRS_public
de la Ville de La Rochelle, branche PlanTopoControle ?
git log
git blame
git diff

ERDF initialise son depot PCRS_public

Combien d'objets (combien de cases) sont présent dans le depot PCRS_public
d'ERDF, branche PlanTopoControle ?

Quelles sont les différences entre les deux dépots ?

Comment la Ville de La Rochelle peut récuperer les plans (cases) qui sont disponibles dans le dépot d'Erdf ?

git merge

Comment ERDF peut récupérer les plans de la Ville de La Rochelle ?
git merge

Des modifications sont apportés par un acteur : il modifie son dépot.
Quelle est la procédure à suivre par le partenaire pour récupérer cette modification ?
(partage et publication)

Au niveau local
---------------

Le service Aménagement et Construction est missionné pour conduire un projet sur une zone couvrant
un carrfour et deux voies perpendiculaires

Le service carto ne dispose d'aucun plan topographique.

ErDF dispose d'un plan avec une voie et une partie du carrefour
La CDA dispose d'un plan avec une partie de l'autre voie et du carrefour en entier

User Story


Point de vue du service Carto

-

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
----------
Dessin initial
commun = emprise + facade + bordure + mur

.. note::

  [M11, M51, M55, M15]
  A_1 = M11(emprise) + M11(facade) + M11(bordure) + M11(mur)

  B_1 = M11 ()

2. Etape 2
----------
Chaque acteur met à disposition de nouveaux plans : agrandissement de la zone

Versionning : Comment l'evolution temporelle de l'emprise géographique dans le temps ?

.. note::

  A_2 = A_1 + M21(emprise) + M21() + ...
            + M12() + M12() + ...

  B_2 =

3. Etape 3
----------
Chaque acteur complète (enrichit) son levé avec des nouveaux objets

Versionning : comment visualiser l'evolution de
