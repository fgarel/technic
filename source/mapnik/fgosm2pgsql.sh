#!/bin/sh

  osm2pgsql -s \
            -c \
            -d gis \
            -U contrib \
            -H 192.168.0.21 \
            planet_-1.2498,46.1263_-1.0831,46.2022.osm.pbf \
            --style ~/src/openstreetmap-carto/mapnik.xml

  psql -h 10.2.10.37 -d osm -U contrib -c "select osm_id, name frome planet_osm_point where amenty='cinema' limit 5;"

