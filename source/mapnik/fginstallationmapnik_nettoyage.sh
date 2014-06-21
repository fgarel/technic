#!/bin/sh

#POSTGIS_HOST='10.2.10.38'
#POSTGIS_HOST='192.168.0.21'

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




