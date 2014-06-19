*****************************************************************
Installation des utilitaires pour manipuler les données initiales
*****************************************************************

Mapnik a besoin de lire des données en entrée.

Pour des fichiers shape, il n'y a pas de problème particulier.
Par contre, pour les fichiers raster (orthophoto) ou pour le plan Open Street Map (OSM),
il y a quelques petites manipulations à faire au préalable

Les données raster
==================
Le fichier image d'origine est un très gros fichier, qui de plus, est sur le réseau.
Dans le script python, la commande mapnik.Gdal()
semble etre tres longue à s'éxecuter.

Un tips a ete vu ici : https://trac.osgeo.org/gdal/wiki/FAQRaster

L'idée est, à partir du gros fichier raster qui se trouve sur le réseau,
d'extraire une partie de cette image et de la copier sur le disque local

Il faut en faire un extrait en utilisant la commande suivante :

.. code::
  gdal_translate -projwin 1378100 5226400 1378200 5226300 \
                 ortho_2013_lr_cc46.jp2 \
                 ~/geodata/raster/test/mamaison2.tif

La commande dans le script, sera donc modifié.
A la place de :
.. code::
  _datasource_001 = mapnik.Gdal(
    file='/home/fred/k/sig_donnees/raster/orthophotoplan/vue_2013/jp2/ortho_2013_lr_cc46.jp2')

on aura :
.. code::
  _datasource_001 = mapnik.Gdal(
    file='/home/fred/geodata/raster/test/mamaison2.tif')


Les données OSM
===============

Avec mapnik, il est possible d'utiliser les données d'Open Street Map (OSM).
D'après ce wiki, http://wiki.openstreetmap.org/wiki/Mapnik_Example,
il faut récuperer les données d'osm, les injecter dans une base postgis.
Alors, mapnik pourra utiliser cette source d'informations, accompagnée d'une feuille de style,
pour générer l'image.


Récuperer les données d'OSM
---------------------------
la méthode simple consiste à aller sur ce site, http://extract.bbbike.org/,
ou ce site, http://download.geofabrik.de/europe/france/poitou-charentes.html,
puis de lancer l'extraction.
Un fichier planet est inclus dans ce répertoire.
le lien pour le rechercher est :
https://mail.ville-larochelle.fr/owa/redir.aspx?C=YFr5HgFf50KtqMvXn8fyIG0_6yKTVNEI0AOnbB6uavB1I1DLYSaJwn8t3LyvBpgaslmAqznKiIc.&URL=http%3a%2f%2fextract.bbbike.org%2f%3fsw_lng%3d-1.2498%26sw_lat%3d46.1263%26ne_lng%3d-1.0831%26ne_lat%3d46.2022%26format%3dosm.pbf%26city%3dLa%2520Rochelle

Transférer les données OSM vers postGis
---------------------------------------
nous allons avoir beoin de quelques utilitaires, dont :
  - osmconvert
  - osm2psql

osmconvert
----------
Ce petit utilitaire va nous permettre de manipuler le fichier pbf que l'on a telechargé.
http://wiki.openstreetmap.org/wiki/Osmconvert

Installation

.. code::
  wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert

Utilisation

.. code::

osm2pgsql
---------
Cet utilitaire va permettre de transférer les données osm vers une base de données postgresql
http://wiki.openstreetmap.org/wiki/Osm2pgsql

Installation à partir des sources
On Debian Squeeze or Debian Lenny systems, it's highly recommended to compile from source to get the latest features,
otherwise you get an outdated version which lacks important features like 64bit IDs, hstore or pbf support.

When compiling under Ubuntu (12.04 LTS), you will need the following dependencies:
.. code::
  sudo apt-get install build-essential libxml2-dev libgeos++-dev libpq-dev libbz2-dev proj libtool automake git

If you want PBF read support, you will also need libprotobuf-c0-dev and protobuf-c-compiler:
.. code::
  sudo apt-get install libprotobuf-c0-dev protobuf-c-compiler

libprotobuf-c0-dev needs to be at least in version 0.14-1.
Ubuntu <= 10.04 has only 0.11, so you need to build it from source [2]. To compile from source:

.. code::
  #sudo apt-get install protobuf-compiler libprotobuf-dev libprotoc-dev subversion
  #svn checkout http://protobuf-c.googlecode.com/svn/trunk/ protobuf-c-read-only
  #cd protobuf-c-read-only
  #./autogen.sh
  #make
  #sudo make install

If you want to use lua scripts for tag_transform, you will need to install lua5.2 liblua5.2-0 liblua5.2-dev and liblua5.1-0

.. code::
  sudo apt-get install lua5.2 liblua5.2-0 liblua5.2-dev liblua5.1-0

You can get the source of osm2pgsql (28 mb) from git
.. code::
  git clone https://github.com/openstreetmap/osm2pgsql.git

Next, enter the newly created directory containing the source for the utility:
.. code::
  cd osm2pgsql/

If no Makefile and configure script exist, generate them with:
.. code::

  ./autogen.sh
  ./configure

Optionally, you can configure the compiler to produce a faster binary that can only run on CPUs that have the same capabilities as yours.
.. code::
  sed -i 's/-g -O2/-O2 -march=native -fomit-frame-pointer/' Makefile

Finally, compile the sources into an executable program:
.. code::
  make

Et, enfin, installation du binaire dans /usr/local/bin
.. code::
  sudo make install

Nettoyage, suppression des sources
.. code::
  cd ..
  rm -rf osm2pgsql


Utilisation de osm2pgsql pour transférer les données osm vers postgresql
------------------------------------------------------------------------

Création d'une base de données
La suppression de la base de données osm, puis la creation de la base de données osm, se fait
en suivant le script suivant, mais qu'il faut modifier avec la bonne adresse IP
.. code::
  vi ./dropcreatedatabase.sh
  ./dropcreatedatabase.sh

Ce script va appeler deux scripts sql qui sont dans le repertoire sql
.. code::
  ./sql/dropdatabase.sql
  ./sql/createdatabase.sql

Avant de lancer le script de creation, il faut créer sur le serveur de base de données un tablespace
La creation de ce tablespace est detaillé dans le fichier sql/createdatabase.sql
http://docs.postgresql.fr/9.3/manage-ag-tablespaces.html
http://www.dj-j.net/waka/Linux:Administration_PostgreSQL#Utilisation_des_tablespaces

Utilisation de la commande osm2pgsql
------------------------------------

Pour un premier test, nous allons lancer la commande suivante :

.. code::
  osm2pgsql -s \
            -c \
            -d osm \
            -U contrib \
            -H 10.2.10.37 \
            planet_-1.2498,46.1263_-1.0831,46.2022.osm.pbf


Cependant, cette ligne de commande ne fait qu'utiliser un syle par defaut.

Nous allons essqyer d'utiliser cartoCSS en suivant cette doc vue sur cette page :

https://github.com/gravitystorm/openstreetmap-carto
installation des fonts
----------------------
.. code::
  sudo apt-get install ttf-dejavu fonts-droid ttf-unifont fonts-sipa-arundina fonts-sil-padauk fonts-khmeros \
  ttf-indic-fonts-core ttf-tamil-fonts ttf-kannada-fonts

Clonage du projet
-----------------

.. code::
  git clone https://github.com/gravitystorm/openstreetmap-carto.git

Lancement du script pour récupérer des fichiers shape
.. code::
  ./openstreetmap-carto/get-shapefile.sh

Nettoyage des shapes
.. code::
  ogr2ogr ne_10m_populated_places_fixed.shp ne_10m_populated_places.shp

.. code::
  osm2pgsql -s \
            -c \
            -d osm \
            -U contrib \
            -H 10.2.10.37 \
            planet_-1.2498,46.1263_-1.0831,46.2022.osm.pbf \
            --style openstreetmap-carto/openstreetmap-carto.style

Interrogation de la base
.. code::
  psql -h 10.2.10.37 -d osm -U contrib -c "select osm_id, name frome planet_osm_point where amenty='cinema' limit 5;"

Les autres infos sur mapnik et les styles
-----------------------------------------
mapnik style osm


http://wiki.openstreetmap.org/wiki/Mapnik_Example

https://github.com/mapnik/mapnik/wiki/StyleShare

http://wiki.openstreetmap.org/wiki/Stylesheet

https://github.com/gravitystorm/openstreetmap-carto

http://wiki.openstreetmap.org/wiki/CartoCSS

https://github.com/mapbox/carto
