#!/bin/sh

#POSTGIS_HOST='10.2.10.38'
#POSTGIS_HOST='192.168.0.21'

# A Suivi de la doc avec les sources
# http://switch2osm.org/serving-tiles/manually-building-a-tile-server-12-04/


# 2.4. Tilemill : interface graphique pour le design des cartes
cd ~/src

# Installation a partir des paquets ? non!
#rm -f ~/src/install-tilemill.tar.gz
#rm -f ~/src/install-tilemill.sh
#wget http://tilemill.s3.amazonaws.com/latest/install-tilemill.tar.gz
#tar xzvf install-tilemill.tar.gz
#~/src/install-tilemill.sh
# suppression du fichier tar.gz
#rm -rf ~/src/install-tilemill.tar.gz

# Installation à partir des sources ? Oui


# installation de la derniere version de nodejs

# Node.js.
# If you are building TileMill master, then you can see
# which Node.js versions are supported by checking the engines value
# in the package.json file here.

# At the time of writing Node.js v0.10.29 was the latest release, 
# works well with TileMill master (while v0.8.x is required for
# TileMill 0.10.x and older). Build node like:

NODE_VERSION="0.10.29"
rm -rf node-v${NODE_VERSION}
wget http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}.tar.gz
tar xf node-v${NODE_VERSION}.tar.gz
cd node-v${NODE_VERSION}
./configure && make && sudo make install
cd ../
# suppression du fichier tar.gz
rm -rf node-v${NODE_VERSION}.tar.gz


# installation de node-gyp
sudo npm install -g node-gyp

# Installation des dépendances
# Now, the last thing before building TileMill itself is
# to install a few more dependencies needed by TileMill 
# or its node modules.
# One specific need is for its Desktop windowing UI.
# On Debian systems this package is called libwebkit-dev 
# and can be installed with:

##sudo apt-get install libwebkit-dev

# Also we need to install git (to download tilemill) and
# the google protobuf library (which latest node-mapnik requires). 
# On debian systems you can do this like:

##sudo apt-get install -y git protobuf-compiler libprotobuf-lite7 libprotobuf-dev

# Finally, we are ready to install TileMill master itself:

rm -rf tilemill
git clone https://github.com/mapbox/tilemill.git
cd tilemill
npm install

# une fois installé, on peut lancer le serveur via la commande
~/src/tilemill/index.js

# pour le client, il suffit de pointer vers la page 
# http://localhost:20009/


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


