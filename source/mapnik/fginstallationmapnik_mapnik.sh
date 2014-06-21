#!/bin/sh

#POSTGIS_HOST='10.2.10.38'
#POSTGIS_HOST='192.168.0.21'

# A Suivi de la doc avec les sources
# http://switch2osm.org/serving-tiles/manually-building-a-tile-server-12-04/


# 2. recuperation des sources, configuration, compilation et installation
# installation, clonage de quelques projets, dans le repertoire ~/src
mkdir ~/src
cd ~/src

# 2.1. Installation de mapnik à partir des sources
# mapnik
rm -rf ~/src/mapnik
git clone git://github.com/mapnik/mapnik
cd ~/src/mapnik
git checkout master
git fetch origin master
# il faut se mettre sur une autre branche aue la branche master
# en effet, dans la bracnhe master, nous avons un problème de version de compiler
# au moment de .configure, nous avons cette erreur :
# Checking if compiler (g++) supports -std=c++11 flag... (cached) no
# C++ compiler does not support c++11 standard, which is required.
# Please use Mapnik 2.x instead of 3.x as an alternative
git branch 2.3.x-topojson origin/2.3.x-topojson
git checkout 2.3.x-topojson
git fetch origin 2.3.x-topojson

# pour compiler, nous avons besoin de l'utilitaire freetype-config,
# qui se trouve dans le paquet libfreetype6-dev
sudo aptitude install libfreetype6-dev
# le paquet libwebp-dev fournit les fichiers nécessaires
# pour la prise en charge du format webp (compression VP8)
sudo aptitude install libwebp-dev
# le paquet libtiff4-dev fournit les fichiers nécessqires
# pour la prise en charge du format tiff
sudo aptitude install libtiff4-dev
# le paquet libcairo2-dev fournit les fichiers nécessaires
# pour la prise en charge du rendu avec lissage
sudo aptitude install libcairo2-dev
sudo aptitude install python-cairo-dev
# le paquet libgdal-dev fournit les fichiers nécessaires
# pour la prise en charge de la librairie gdal
sudo aptitude install libgdal-dev
# le paquet librasterlite-dev fournit les fichiers nécessaires
# pour la prise en charge de la librairie rasterlite
sudo aptitude install librasterlite-dev

# concernant Oracle database library, l'installation ne prend pas en compte ce format
# pour de plus amples installations, il faut se reporter ici
# https://github.com/mapnik/mapnik/wiki/OCCI

python scons/scons.py configure INPUT_PLUGINS=all OPTIMIZATION=3 SYSTEM_FONTS=/usr/share/fonts/truetype/
python scons/scons.py
sudo python scons/scons.py install
sudo ldconfig



