*********************
Utilisation de mapnik
*********************

Les tests
=========
Pour commencer, nous allons apprendre à utliser mapnik en suivant le tutorial.
Nous allons créer plusieurs scripts python qui font appel aux fonctionnalités de mapnik

tutorial01.py
-------------
Ce script genere une carte du monde.
En entrée, les données sont issues d'un fichier shape que l'on a précedemment télachargé
En sortie, on peut affichier le résultat

.. code::
  tycat ~/geodata/raster/world/world.png


tutorial02.py
-------------
Ce script genere une carte du monde.
En entrée, les données sont issues d'un fichier shape que l'on a précedemment télachargé
Ce second script est quasi équivalent au premier, à la différence qu'ici, 
les paramètres de mapnik sont dans un fichier xml externe (tutorial2.xml)
En sortie, on peut affichier le résultat

.. code::
  tycat hello_world_using_xml_config.png

tutorial03.py
-------------
Cette fois, on s'attaque aux données locales.
Les sources de données sont de plusieurs types (raster, postgis, shape),
les systèmes de projection sont aussi différents (2154 = lambert 93, 3946 = cc46.

En entrée, les données sont :
 - _layer_001 : raster    mamaison.tiff ; _style_001 : style_ortho
 - _layer_002 : postgis   dsibdd09      ; _style_002 : style_cad_parcelle_sig
 - _layer_003 : shapefile parcelle.shp  ; _style_003 : style_cad_parcelle_topo
 - _layer_004 : shapefile bati.shp      ; _style_004 : style_cad_bati_topo
 - _layer_005 : shapefile poi.shp       ; _style_005 : style_poi_A
 - _layer_006 : postgis   debian        ; _style_006 : style_poi_B
 - _layer_007 : postgis   debian        ; _style_007 : style_poi_C

En sortie, on peut affichier le résultat

.. code::
  tycat ~/geodata/raster/raster/test/larochelle_001000.png
  tycat ~/geodata/raster/raster/test/larochelle_000500.png

tutorial04.py
-------------
Factorisation du code, et ecriture POO




Generer une image à partir d'une emprise
========================================

Les données initiales
---------------------


La generation de l'image
------------------------



.. code::
  tycat ~/geodata/raster/world/world.png



Generer une image à partir d'une emprise
========================================

Les données initiales
---------------------


La generation de l'image
------------------------



Generer une image à partir d'une emprise
========================================

Les données initiales
---------------------


La generation de l'image
------------------------


