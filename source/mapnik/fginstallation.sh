#!/bin/sh

# suivi de la doc avec les sources
# 
# installation, clonage de quelques projets, dans le repertoire ~/src
mkdir ~/src
cd ~/src

# mapnik
git clone git://github.com/mapnik/mapnik
cd ~/src/mapnik
git fetch origin master

#
git clone git://github.com/openstreetmap/mod_tile.git
cd ~/src/mod_tile
git fetch origin master

#
svn co http://svn.openstreetmap.org/applications/rendering/mapnik mapnik-style
cd ~/src/mapnik-style

# pour installer carto, il faut installer npm
git clone git://github.com/isaacs/npm.git
cd ~/src/npm
git fetch origin master

#
git clone https://github.com/mapbox/carto
cd ~/src/carto
git fetch origin master

# openstreetmap-carto
git clone https://github.com/gravitystorm/openstreetmap-carto
cd ~/src/openstreetmap-carto
git fetch origin master


# installation et compilation de carto 
# avant de pouvoir installer carto, il faut installer npm
# or npm ne peut pas être installé avec un simple aptitude install# car il y a un problème de version
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
# On utilise pluto l'astuce vu sur cette page :
# http://stackoverflow.com/questions/10776405/npm-cant-install-appjs-error-cannot-find-module-graceful-fs
#sudo aptitude install npm
cd ~/src/npm/scripts
chmod +x install.sh
sudo ./install.sh

cd ~/src/carto/
sudo npm install -g carto
sudo npm install -g millstone



# suivi de la doc avec les paquets
# cela n'est pas une bonne idee d'utiliser les paquets ...
# en effet, renderd n'est plus à jour : 
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


# installation de mod_tile et de renderd a partir des sources
sudo aptitude remove libapache2-mod-tile renderd
# pour compiler mod_tile, on a besoin du bianaire apxs2
sudo aptitude install apache2-threaded-dev

cd ~/src/mod_tile
./autogen.sh
./configure
make
sudo make install
sudo make install-mod_tile
sudo ldconfig

# modification de la configuration de renderd
sudo sed -i -e 's/;socketname=/socketname=/' /usr/local/etc/renderd.conf
sudo sed -i -e 's/font_dir=\/usr\/share\/fonts\/truetype/font_dir=\/usr\/share\/fonts\/truetype\/ttf-dejavu/' /usr/local/etc/renderd.conf
sudo sed -i -e 's/URI=\/osm_tiles\//URI=\/osm\//' /usr/local/etc/renderd.conf
sudo sed -i -e 's/XML=\/home\/jburgess\/osm\/svn.openstreetmap.org\/applications\/rendering\/mapnik\/osm-local.xml/XML=\/home\/fred\/src\/mapnik-style\/osm.xml/' /usr/local/etc/renderd.conf
sudo sed -i -e 's/HOST=tile.openstreetmap.org/HOST=localhost/' /usr/local/etc/renderd.conf



# modification de la configuration de mod_tile
sudo cp ~/Travail/ecriture_sphinx/technic/source/mapnik/tile.load /etc/apache2/mods-available/tile.load
sudo sed -i -e 's/LoadTileConfigFile \/etc\/renderd.conf/LoadTileConfigFile \/usr\/local\/etc\/renderd.conf/' ~/Travail/ecriture_sphinx/technic/source/mapnik/tileserver_site
sudo cp ~/Travail/ecriture_sphinx/technic/source/mapnik/tileserver_site /etc/apache2/sites-available/tileserver_site

