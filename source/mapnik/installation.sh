#!/bin/sh

# extraction d'une partie de raster
  gdal_translate -projwin 1378100 5226400 1378200 5226300 \
                 ortho_2013_lr_cc46.jp2 \
                 ~/geodata/raster/test/mamaison2.tif


# Installation d'osmconvert

  wget -O - http://m.m.i24.cc/osmconvert.c | cc -x c - -lz -O3 -o osmconvert


# Installation d'osm2pgsql

# When compiling under Ubuntu (12.04 LTS), you will need the following dependencies:
  sudo apt-get install build-essential libxml2-dev libgeos++-dev libpq-dev libbz2-dev proj libtool automake git

# If you want PBF read support, you will also need libprotobuf-c0-dev and protobuf-c-compiler:
  sudo apt-get install libprotobuf-c0-dev protobuf-c-compiler

# If you want to use lua scripts for tag_transform, you will need to install lua5.2 liblua5.2-0 liblua5.2-dev and liblua5.1-0
  sudo apt-get install lua5.2 liblua5.2-0 liblua5.2-dev liblua5.1-0

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

# Installation
  sudo make install

# Nettoyage
  cd ..
  rm -rf osm2pgsql

