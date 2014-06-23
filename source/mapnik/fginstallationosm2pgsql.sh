#!/bin/sh

POSTGIS_HOST='10.2.10.38'
POSTGIS_HOST='192.168.0.21'

# A Suivi de la doc avec les sources
# Installation d'osm2pgsql
# Cet utilitaire va permettre de transférer les données osm vers une base de données postgresql
# http://wiki.openstreetmap.org/wiki/Osm2pgsql

# 1. Installation des dépendances
# On Debian Squeeze or Debian Lenny systems, it's highly recommended to
# compile from source to get the latest features,
# otherwise you get an outdated version which lacks
# important features like 64bit IDs, hstore or pbf support.

# When compiling under Ubuntu (12.04 LTS),
# you will need the following dependencies:

sudo apt-get install build-essential libxml2-dev libgeos++-dev libpq-dev libbz2-dev proj libtool automake git

#If you want PBF read support, you will also need libprotobuf-c0-dev and protobuf-c-compiler:
sudo apt-get install libprotobuf-c0-dev protobuf-c-compiler

#If you want to use lua scripts for tag_transform, you will need to install lua5.2 liblua5.2-0 liblua5.2-dev and liblua5.1-0
sudo apt-get install lua5.2 liblua5.2-0 liblua5.2-dev liblua5.1-0

# 2. recuperation des sources, configuration, compilation et installation
# installation, clonage de quelques projets, dans le repertoire ~/src
mkdir ~/src
cd ~/src

# 2.1. Installation d'osm2pgsql à partir des sources
cd ~/src
rm -rf ~/src/osm2pgsql
# You can get the source of osm2pgsql (28 mb) from git
git clone https://github.com/openstreetmap/osm2pgsql.git

# Next, enter the newly created directory containing the source for the utility:
cd osm2pgsql/

# If no Makefile and configure script exist, generate them with:
./autogen.sh
./configure

# Optionally, you can configure the compiler to produce a faster binary that can only run on CPUs that have the same capabilities as yours.
sed -i 's/-g -O2/-O2 -march=native -fomit-frame-pointer/' Makefile

# Finally, compile the sources into an executable program:
make

# Et, enfin, installation du binaire dans /usr/local/bin
sudo make install


# 2.2. Creation de la base de données
#La suppression de la base de données osm, puis la creation
# de la base de données osm, se fait
# en suivant le script suivant, mais qu'il faut modifier
# avec la bonne adresse IP

##vi ./dropcreatedatabase.sh
##./dropcreatedatabase.sh

# Ce script va appeler deux scripts sql qui sont dans le repertoire sql
# ./sql/dropdatabase.sql
 #./sql/createdatabase.sql

#Avant de lancer le script de creation, il faut créer sur le serveur de base de données un tablespace
#La creation de ce tablespace est detaillé dans le fichier sql/createdatabase.sql
#http://docs.postgresql.fr/9.3/manage-ag-tablespaces.html
#http://www.dj-j.net/waka/Linux:Administration_PostgreSQL#Utilisation_des_tablespaces
