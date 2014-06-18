#!/bin/sh

# A Suivi de la doc avec les sources
# http://switch2osm.org/serving-tiles/manually-building-a-tile-server-12-04/

# 1. on supprime les paquets binaires
# First, remove any other old mapnik packages:

sudo aptitude remove \
                     libmapnik \
                     libmapnik-dev \
                     libmapnik2-2.0 \
                     libmapnik2-dev \
                     mapnik-doc \
                     mapnik-utils \
                     python-mapnik \
                     python-mapnik2 \
                     tilemill

sudo aptitude purge "~c"
sudo apt-get purge libmapnik* mapnik-utils python-mapnik

# 2. recuperation des sources, configuration, compilation et installation
# installation, clonage de quelques projets, dans le repertoire ~/src
mkdir ~/src
cd ~/src

# 2.1. Installation de mapnik à partir des sources
# mapnik
##rm -rf ~/src/mapnik
##git clone git://github.com/mapnik/mapnik
##cd ~/src/mapnik
##git checkout master
##git fetch origin master
# il faut se mettre sur une autre branche aue la branche master
# en effet, dans la bracnhe master, nous avons un problème de version de compiler
# au moment de .configure, nous avons cette erreur :
# Checking if compiler (g++) supports -std=c++11 flag... (cached) no
# C++ compiler does not support c++11 standard, which is required.
# Please use Mapnik 2.x instead of 3.x as an alternative
##git branch 2.3.x-topojson origin/2.3.x-topojson
##git checkout 2.3.x-topojson
##git fetch origin 2.3.x-topojson

# pour compiler, nous avons besoin de l'utilitaire freetype-config,
# qui se trouve dans le paquet libfreetype6-dev
##sudo aptitude install libfreetype6-dev
# le paquet libwebp-dev fournit les fichiers nécessaires
# pour la prise en charge du format webp (compression VP8)
##sudo aptitude install libwebp-dev
# le paquet libtiff4-dev fournit les fichiers nécessqires
# pour la prise en charge du format tiff
##sudo aptitude install libtiff4-dev
# le paquet libcairo2-dev fournit les fichiers nécessaires
# pour la prise en charge du rendu avec lissage
##sudo aptitude install libcairo2-dev
##sudo aptitude install python-cairo-dev
# le paquet libgdal-dev fournit les fichiers nécessaires
# pour la prise en charge de la librairie gdal
##sudo aptitude install libgdal-dev
# le paquet librasterlite-dev fournit les fichiers nécessaires
# pour la prise en charge de la librairie rasterlite
##sudo aptitude install librasterlite-dev

# concernant Oracle database library, l'installation ne prend pas en compte ce format
# pour de plus amples installations, il faut se reporter ici
# https://github.com/mapnik/mapnik/wiki/OCCI

##python scons/scons.py configure INPUT_PLUGINS=all OPTIMIZATION=3 SYSTEM_FONTS=/usr/share/fonts/truetype/
##python scons/scons.py
##sudo python scons/scons.py install
##sudo ldconfig

# 2.2. Les styles mapnik
# 2.2.1. old school : xml
# Installation de mapnik-style à partir des sources
# mapnik-style est basé sur du XML
rm -rf ~/src/mapnik-style
svn co http://svn.openstreetmap.org/applications/rendering/mapnik mapnik-style
cd ~/src/mapnik-style
# recuperation des shapes worldboundaries
#... cf chapter01.rst

# personnalisation des fichiers de configurations
cd ~/src/mapnik-style/inc/
cp fontset-settings.xml.inc.template fontset-settings.xml.inc
cp datasource-settings.xml.inc.template datasource-settings.xml.inc
cp settings.xml.inc.template settings.xml.inc

# modification du fichier settings.xml.inc
sed -i -e 's/symbols "%(symbols)s"/symbols "symbols"/' ~/src/mapnik-style/inc/settings.xml.inc
sed -i -e 's/osm2pgsql_projection "\&srs%(epsg)s;"/osm2pgsql_projection "\&srs900913;"/' ~/src/mapnik-style/inc/settings.xml.inc
sed -i -e 's/dwithin_node_way "\&dwithin_%(epsg)s;"/dwithin_node_way "\&dwithin_900913;"/' ~/src/mapnik-style/inc/settings.xml.inc
sed -i -e 's/world_boundaries "%(world_boundaries)s"/world_boundaries "\/usr\/local\/share\/world_boundaries"/' ~/src/mapnik-style/inc/settings.xml.inc
sed -i -e 's/prefix "%(prefix)s"/prefix "planet_osm"/' ~/src/mapnik-style/inc/settings.xml.inc
# modification du fichier datasource-settings.xml.inc
sed -i -e 's/Note:/Note :/' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="type">postgis</name="type">postgis</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name\="host">%(host)s</name="host">10.2.10.38</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="port">%(port)s</name="port">5432</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="dbname">%(dbname)s</name="dbname">gis</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="user">%(user)s</name="user">contrib</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="password">%(password)s</name="password">alambic</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="estimate_extent">%(estimate_extent)s</name="estimate_extent">false</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="extent">%(extent)s</name="extent">-20037508,-19929239,20037508,19929239</' ~/src/mapnik-style/inc/datasource-settings.xml.inc


# Generation du fichier xml
cd ~/src/mapnik-style
./generate_xml.py --host 10.2.10.38 \
                  --port 5432 \
                  --dbname gis \
                  --user contrib \
                  --password alambic \
                  --world_boundaries /usr/local/share/world_boundaries \
                  --accept-none


# Generation d'une image
sed -i -e 's/bounds = (-6.5, 49.5, 2.1, 59)/bounds = (-1.250, 46.140, -1.080, 46.170)/' ~/src/mapnik-style/generate_image.py
sed -i -e 's/imgy = 1000 \* z/imgy = 500 \* z/' ~/src/mapnik-style/generate_image.py

./generate_image.py

# generation des tuiles
sed -i -E -e 's/^    render_tiles\(bbox, mapfile, tile_dir,/    #render_tiles\(bbox, mapfile, tile_dir,/' ~/src/mapnik-style/generate_tiles.py
echo "" >> ~/src/mapnik-style/generate_tiles.py
echo "    # La Rochelle" >> ~/src/mapnik-style/generate_tiles.py
echo "    bbox = (-1.250, 46.140, -1.080, 46.170)" >> ~/src/mapnik-style/generate_tiles.py
echo "    render_tiles(bbox, mapfile, tile_dir, 8, 17, \"La Rochelle\")" >> ~/src/mapnik-style/generate_tiles.py

export MAPNIK_MAP_FILE=osm.xml; export MAPNIK_TILE_DIR=/var/lib/mod_tile; ./generate_tiles.py


# 2.2.2. new school : cartocss
# un projet, appelé openstreetmap-carto, a pour objectif
# de reprendre le style d'openstreetmap, non plus en dialecte xml, mais en dialecte cartocss
# ce projet a besoin de l'utilitaire carto qui va transformer du cartocss en xml
# pour installer carto, il faut installer npm

# 2.2.2.1. npm
# installation et compilation de carto 
# avant de pouvoir installer carto, il faut installer npm
# or npm ne peut pas être installé avec un simple aptitude install
# car il y a un problème de version
# How to fix npm "Cannot find module 'graceful-fs'" error
# Problem: When running any npm command, you get a stacktrace similar to the following:
# Error: Cannot find module 'graceful-fs'
# Solution: Your npm isn't properly installed. Execute (as root):
# curl https://npmjs.org/install.sh | bash
# This reinstalls npm on your computer, it should work afterwards.
# You might need to restart your shell after that for the changes to take effect.
# In some cases even the installer fails because of the graceful-fs error,
# in this case you might need to remove npm using your distribution's package manager first, e.g.
# sudo apt-get remove npm
# On utilise l'astuce vu sur cette page :
# http://stackoverflow.com/questions/10776405/npm-cant-install-appjs-error-cannot-find-module-graceful-fs
#sudo aptitude install npm
####git clone git://github.com/isaacs/npm.git
###cd ~/src/npm
#####git fetch origin master
########################cd ~/src/npm/scripts/s
########################chmod +x install.sh
########################sudo ./install.sh


# 2.2.2.2. carto
#####git clone https://github.com/mapbox/carto
####cd ~/src/carto
#### git fetch origin master
#################cd ~/src/carto/
################sudo npm install -g carto
##################sudo npm install -g millstone

# 2.2.2.3. openstreetmap-carto
####git clone https://github.com/gravitystorm/openstreetmap-carto
####cd ~/src/openstreetmap-carto
####git fetch origin master




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


