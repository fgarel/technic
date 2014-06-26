#!/bin/sh

POSTGIS_HOST='10.2.10.38'
POSTGIS_HOST='192.168.0.21'

# A Suivi de la doc avec les sources
# http://switch2osm.org/serving-tiles/manually-building-a-tile-server-12-04/

# 1. on supprime les paquets binaires
# First, remove any other old mapnik packages:
##./fginstallationmapnik_nettoyage.sh

# 2. recuperation des sources, configuration, compilation et installation
# installation, clonage de quelques projets, dans le repertoire ~/src
##mkdir ~/src

# 2.1. Installation de mapnik à partir des sources
# mapnik
##./fginstallationmapnik_mapnik.sh


# 2.2. Les styles mapnik
# 2.2.1. old school : xml
# Installation de mapnik-style à partir des sources
# mapnik-style est basé sur du XML
export POSTGIS_HOST=$POSTGIS_HOST; ./fginstallationmapnik_style_xml.sh


# 2.2.2. new school : cartocss
# un projet, appelé openstreetmap-carto, a pour objectif
# de reprendre le style d'openstreetmap, non plus en dialecte xml, mais en dialecte cartocss
# ce projet a besoin de l'utilitaire carto qui va transformer du cartocss en xml
# pour installer carto, il faut installer npm
./fginstallationmapnik_style_css.sh

# 2.3. Tilemill : interface graphique pour le design des cartes
./fginstallationmapnik_tilemill.sh


# 3. Installation d'un serveur de tuiles
##git clone git://github.com/openstreetmap/mod_tile.git
##cd ~/src/mod_tile
##git fetch origin master

# installation de mod_tile et de renderd a partir des sources
####sudo aptitude remove libapache2-mod-tile renderd
# pour compiler mod_tile, on a besoin du bianaire apxs2
####sudo aptitude install apache2-threaded-dev

#################cd ~/src/mod_tile
################./autogen.sh
################./configure
################make
##################sudo make install
##################sudo make install-mod_tile
#################sudo ldconfig

# modification de la configuration de renderd
####sudo sed -i -e 's/;socketname=/socketname=/' /usr/local/etc/renderd.conf
####sudo sed -i -e 's/font_dir=\/usr\/share\/fonts\/truetype/font_dir=\/usr\/share\/fonts\/truetype\/ttf-dejavu/' /usr/local/etc/renderd.conf
####sudo sed -i -e 's/URI=\/osm_tiles\//URI=\/osm\//' /usr/local/etc/renderd.conf
####sudo sed -i -e 's/XML=\/home\/jburgess\/osm\/svn.openstreetmap.org\/applications\/rendering\/mapnik\/osm-local.xml/XML=\/home\/fred\/src\/mapnik-style\/osm.xml/' /usr/local/etc/renderd.conf
####sudo sed -i -e 's/HOST=tile.openstreetmap.org/HOST=localhost/' /usr/local/etc/renderd.conf



# modification de la configuration de mod_tile
####sudo cp ~/Travail/ecriture_sphinx/technic/source/mapnik/tile.load /etc/apache2/mods-available/tile.load
####sudo sed -i -e 's/LoadTileConfigFile \/etc\/renderd.conf/LoadTileConfigFile \/usr\/local\/etc\/renderd.conf/' ~/Travail/ecriture_sphinx/technic/source/mapnik/tileserver_site
####sudo cp ~/Travail/ecriture_sphinx/technic/source/mapnik/tileserver_site /etc/apache2/sites-available/tileserver_site


# B. Suivi de la doc avec les paquets
# cela n'est pas une bonne idee d'utiliser les paquets ...
# en effet, renderd.conf n'est plus à jour : 
# https://github.com/openstreetmap/mod_tile/issues/51
# http://forum.openstreetmap.org/viewtopic.php?id=19291


# http://switch2osm.org/serving-tiles/building-a-tile-server-from-packages/
#for Ubuntu 12.04
#sudo apt-get install python-software-properties
#for Ubunto 12.10 and later
#sudo apt-get install software-properties-common
#Add the repository containing the packages:
#sudo add-apt-repository ppa:kakrueger/openstreetmap
#Update the local package list to pick up the new repository:
#sudo apt-get update

# installation de libapache2-mod-tile
#sudo apt-get install libapache2-mod-tile

# installation de osmosis
#sudo apt-get install osmosis


