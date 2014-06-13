#!/bin/sh

# après avoir fait l'installation
# fginstallation.sh

# on transforme le fichier de style
millstone ~/src/openstreetmap-carto/project.mml > /dev/null
carto ~/src/openstreetmap-carto/project.mml > ~/src/openstreetmap-carto/mapnik.xml

# on importe un extriat de planet-osm
# telechargement des données 
#wget http://download.geofabrik.de/europe/france/poitou-charentes-latest.osm.bz2 \
#     -N

# puis, on procede à l'import des données dans le serveur de base de données postgresql

  osm2pgsql -s \
            -c \
            -d gis \
            -U contrib \
            -H 10.2.10.38 \
            planet_-1.2498,46.1263_-1.0831,46.2022.osm.pbf

#  --style ~/src/openstreetmap-carto/mapnik.xml \

    psql -h 10.2.10.38 -d gis -U contrib -c "select osm_id, name, st_asewkt(way) from planet_osm_point where amenity='cinema' limit 5;"

# après le premier import des données, il faut avertir mod_tile qu'un premier import a été réalisé
# http://wiki.openstreetmap.org/wiki/Switch2osm/Translation/fr/serving-tiles/building-a-tile-server-from-packages/
# mod_tile is designed to always serve up-to-date tiles (see updating below). 
# As it is generally not feasible to re-render all changed tiles at the time of change,
# mod_tile initiates re-rendering of outdated tiles at the time of serving.
# As such mod_tile needs to know when the planet was imported.
# This is done by changing the timestamp on the file planet-import-complete

 sudo -u www-data touch /var/lib/mod_tile/planet-import-complete
 sudo -u www-data touch /usr/bin/openstreetmap-tiles-update-expire.sh 2014-06-11

# attention, le script openstreetmap-tiles-update-expire.sh ne peut plus etre utilisé en l'état.
# en effet, l'url toolserver.org/~mazder/ n'est plus disponible...
    cette derniere commande va créer un sous repertoire
#/var/lib/mod_tile/.osmosis
