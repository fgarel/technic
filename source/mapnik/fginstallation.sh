#!/bin/sh

# suivi de la doc avec les sources
# 
# installation, clonage de 5 projets, dans le repertoire ~/src
mkdir ~/src
cd ~/src
git clone git://github.com/mapnik/mapnik
git clone git://github.com/openstreetmap/mod_tile.git
svn co http://svn.openstreetmap.org/applications/rendering/mapnik mapnik-style
git clone https://github.com/mapbox/carto
git clone https://github.com/gravitystorm/openstreetmap-carto
git clone git://github.com/isaacs/npm.git

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
# http://switch2osm.org/serving-tiles/building-a-tile-server-from-packages/
#for Ubuntu 12.04
sudo apt-get install python-software-properties
#for Ubunto 12.10 and later
#sudo apt-get install software-properties-common
#Add the repository containing the packages:
#sudo add-apt-repository ppa:kakrueger/openstreetmap
#Update the local package list to pick up the new repository:
#sudo apt-get update

# installation de libapache2-mod-tile
sudo apt-get install libapache2-mod-tile



# installation de osmosis
sudo apt-get install osmosis





