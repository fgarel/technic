**********************************
Procédure pour le matériel Trimble
**********************************

Installation
============

Les différentes briques
-----------------------
Sur le serveur Cartes, installation d'un serveur de licence.

Sur les postes bureau, Installation de PathFinder Office (PFO) en version licence serveur.

Sur la tablette, installation de PathFinder Office en version "viewer", installation de TerraSync.

Installation sur la tablette
----------------------------
Installation de TerraSync
^^^^^^^^^^^^^^^^^^^^^^^^^

Installation sur un poste Bureau
--------------------------------
Installation de PFO en version licence serveur
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^




Préparation de la mission
=========================
Préparation des données au bureau avant d'aller sur le terrain

Description de la procédure
---------------------------
Dictionnaire
^^^^^^^^^^^^
La première étape consiste à définir quels sont les objets que l'on souhaite relever.
Utilisation d'un dictionnaire existant : oui ou non ?
Les dictionnaires sont des fichiers au format ddf.
Au fur et à mesure des besoins, ce dictionnaire sera amélioré.
A ce jour, le dictionnaire est 20130215.ddf

Création d'un dictionnaire d'attributs
--------------------------------------
Création d'un dictionnaire d'attributs avec l'Editeur de Dictionnaire d'Attributs
Un dictionnaire peut être constitué à partir d'une feuille blanche, mais il peut aussi être créé à partir d'un jeu de données.
Dans un premier temps, nous détaillerons la création du dictionnaire à partir de la feuille blanche.
Puis, nous détaillerons la création d'un dictionnaire à partir d'un jeu de fichier SIG.

2.2.1. A partir d'une feuille blanche
-------------------------------------

2.2.2. A partir d'un jeu de données SIG

2.2.1. De geomedia vers Mif/Mid
-------------------------------
Sous Geomedia, export des données au format Mif/Mid
Les fichiers sont mis dans le repertoire /home/fred/geodata/vecteur/gnss/01_mifmidFromGeomedia

Ces fichiers doivent être corrigés :
3 ou 4 (?) erreurs

.. code::

  # %*.mif : remplacement des tabulations par des espaces
  sed -i -e "s/\t/ /g" *.mif
  # %*.mid : suppression de la dernière virgule
  sed -i -e "s/,\r//g" *.mid
  # %*.mif : affectation du bon système de coordonnées
  CoordSys Earth Projection 3, 33, "m", 3, 46.5, 44, 49.00000000002, 700000, 6600000
  # problème de caractères (?)
  iconv -f iso-8859-1 -t utf-8 ep_regard_pluvial.mid > ep_regard_pluvial2.mid


2.2.2. Conversion de ces Mif/Mid en dictionnaire
------------------------------------------------
Une fois que ces Mif/Mid sont générés et valides, il faut les transformer en dictionnaire. (.ddf)

Sous PFO, 

Importation
Fichiers d'entrée : 
le maximum de fichiers mif
Fichier de sortie :
20130215.ddf
Choisir une configuration d'importation
creation dictionnaire par import

2.2.3. Mise en place de ce dictionnaire
---------------------------------------

Importation bases de données SIG/DAO
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Exporter des données de geomedia vers TerraSync

Préparer les données, qui sont disponibles sous geomedia, et que l'on souhaite visualiser sur le terrain.
Au final, on veut des fichiers :

  - portant l'extension .gis
  - et placés sur la tablette, dans le répertoire c:\My Documents\TerraSync\

Gestion des arrrière-plans Raster
---------------------------------

Transfert de données (dictionnaire d'attributs, arrière-plans...)
-----------------------------------------------------------------

Installation, paramétrage et prévision des orbites satellitaires avec Planning
------------------------------------------------------------------------------


Terrain
=======

Tablette

en mode autonome
login : VLR6500\user
password :

Comment faire "control + alt + suppr" avec le clavier visuel ?
=> Ctrl + AltGr + Suppr

Répertoire par défaut de TerraSync
c:\My Documents\TerraSync


Répertoire par défaut de GPS Pathfinder Office
fichier de fond
\user\Mes documents\GNSS Projects


Calcul au bureau
================

Description de la procédure
---------------------------
dans l'ordre :
1. TerraSync génère des fichiers portant l'extension .gis. Ces fichiers doivent être transférés vers PathFinder Office et convertis en .ssf.
2. PathFinderOffice va ensuite être utilisé pour effectuer la correction différentielle : le résultat est un fichier .cor
3. Ensuite les données sont exportées vers un SIG


Transfert des données enregistrées dans TerraSync vers l'ordinateur
-------------------------------------------------------------------
Cette manipulation se fait quand la tablette est connecté au reseau !

De TerraSync vers PFO
^^^^^^^^^^^^^^^^^^^^^
Sur la tablette, utilisation de PFO pour transformer les fichiers de TerraSync vers des fichiers .ssf
La tablette est connecté au réseau de la Mairie.
mairie.fr/frederic.garel
Sous PathFinderOffice, le projet à utiliser est PathFinderOffice_Reseau.



Correction différentielle (post-traitement)
-------------------------------------------
Sur le poste Bureau (license complete de PFO), utilisation de PFO pour corriger les données à partir des ephémérides de La Rochelle : fabrication de fichier .cor

Contrôle de la précision des mesures GPS (cercles d'incertitude, précisions...)
-------------------------------------------------------------------------------

Exportation des fichiers aux formars SIG standard (SHP, DXF, MIF/MID, csv, KML/KMZ...)
--------------------------------------------------------------------------------------

De PFO vers Mif/Mid
^^^^^^^^^^^^^^^^^^^
Export des données au format SIG

De Mif/Mid vers Geomedia
^^^^^^^^^^^^^^^^^^^^^^^^

