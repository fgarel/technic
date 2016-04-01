=====================
Les Cas d'Utilisation
=====================


Installation et Configuration
=============================

Installation
------------

Configuration
-------------
(UC32 Configure Owner's Identity) https://github.com/boundlessgeo/GeoGit/wiki/uc32
Avant de commencer à travailler avec des données géospatiales dans GeoGit,
vous devez fournir GeoGit avec un nom d'utilisateur et e-mail,
en utilisant la commande de configuration,
en substituant votre nom et votre e-mail:

.. code::

  geogit config --global user.name "Author"
  geogit config --global user.email "author@example.com"


Utilisation
===========

Initialisation
--------------
(UC01 Create Repository) https://github.com/boundlessgeo/GeoGit/wiki/uc01
Tout d'abord, nous devons créer un nouveau référentiel.
Créez un dossier de répertoire qui contiendra le référentiel,
s'y installer et initialiser le typage GeoGit de référentiel.

.. code::

  geogit init

Maintenant, votre repertoire GeoGit est prêt à gérer le versionning de vos données géospatiales.
Notez que le répertoire .geogit a été créé.


Exemple/Simulation
------------------
Cette archive contient plusieurs répertoires, nommés de snapshot1 à snapshot5.
Chaque répertoire contient un seul fichier shapefile,
qui contiennent tous de légères variations.
Pour les besoins de ce didacticiel, chaque fichier shapefile sera considéré
comme un «instantané» des données dans le temps.
Nous allons utiliser ces clichés pour simuler la création et l'édition des données dans GeoGit.

Extraire l'archive dans le répertoire de dépôt créé à l'étape précédente.

Importer les données
--------------------
(UC06 Import FeatureType) https://github.com/boundlessgeo/GeoGit/wiki/uc06
(UC34 Check modification status) https://github.com/boundlessgeo/GeoGit/wiki/uc34


Ajouter des données
-------------------
( ? )

Commiter les données
--------------------
(UC10 Commit Changes) https://github.com/boundlessgeo/GeoGit/wiki/uc10


Faire des Modifications
-----------------------
(UC34 Check modification status) https://github.com/boundlessgeo/GeoGit/wiki/uc34
()
(UC10 Commit Changes) https://github.com/boundlessgeo/GeoGit/wiki/uc10


Consulter l'historique
----------------------
(UC25 List changesets) https://github.com/boundlessgeo/GeoGit/wiki/uc25

Créer une branche
-----------------
(UC16 Manage branches) https://github.com/boundlessgeo/GeoGit/wiki/uc16

Fusionner deux branches
-----------------------
(UC20 Switch branch) https://github.com/boundlessgeo/GeoGit/wiki/uc20
(UC17 Merge branch with no conflicts) https://github.com/boundlessgeo/GeoGit/wiki/uc17

Résoudre les problèmes de fusion
--------------------------------
(UC11 Review Changeset) https://github.com/boundlessgeo/GeoGit/wiki/uc11
(UC42 Resolve conflicts) https://github.com/boundlessgeo/GeoGit/wiki/uc42


Etiquetter une version
----------------------
(UC40 Create tag) https://github.com/boundlessgeo/GeoGit/wiki/uc40

Exporter à partir d'un répertoire geogit
----------------------------------------
(UC07 Export FeatureType) https://github.com/boundlessgeo/GeoGit/wiki/uc07

Synchroniser des répertoires
----------------------------
(UC02 Clone Repository) https://github.com/boundlessgeo/GeoGit/wiki/uc02
(UC03 Pull from remote) https://github.com/boundlessgeo/GeoGit/wiki/uc03
(UC04 Push to remote) https://github.com/boundlessgeo/GeoGit/wiki/uc04
