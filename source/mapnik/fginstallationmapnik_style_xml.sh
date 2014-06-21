#!/bin/sh

#POSTGIS_HOST='10.2.10.38'
#POSTGIS_HOST='192.168.0.21'

# A Suivi de la doc avec les sources
# http://switch2osm.org/serving-tiles/manually-building-a-tile-server-12-04/


# 2.2. Les styles mapnik
# 2.2.1. old school : xml
# Installation de mapnik-style à partir des sources
# mapnik-style est basé sur du XML
cd ~/src
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
sed -i -e "s/name\="host">%(host)s</name="host">$POSTGIS_HOST</" ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="port">%(port)s</name="port">5432</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="dbname">%(dbname)s</name="dbname">gis</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="user">%(user)s</name="user">contrib</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="password">%(password)s</name="password">alambic</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="estimate_extent">%(estimate_extent)s</name="estimate_extent">false</' ~/src/mapnik-style/inc/datasource-settings.xml.inc
sed -i -e 's/name="extent">%(extent)s</name="extent">-20037508,-19929239,20037508,19929239</' ~/src/mapnik-style/inc/datasource-settings.xml.inc


# Generation du fichier xml
cd ~/src/mapnik-style
./generate_xml.py --host $POSTGIS_HOST \
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




