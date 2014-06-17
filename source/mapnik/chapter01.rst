************
Installation
************


La meilleure doc que j'ai vue pour installer mapnik se trouve ici :
http://switch2osm.org/serving-tiles/manually-building-a-tile-server-12-04/

En suivant pas à pas la préocédure, on obtient un système qui est censé avoir un mapnik et un serveur de tuile

Dans le repertoire ~/src/ on s'arrange pour avoir un clone de ces 4 dépots

.. code::
  git clone git://github.com/mapnik/mapnik
  git clone git://github.com/openstreetmap/mod_tile.git
  svn co http://svn.openstreetmap.org/applications/rendering/mapnik mapnik-style
  git clone https://github.com/mapbox/carto
  git clone https://github.com/gravitystorm/openstreetmap-carto
  git clone git://githaub.com/isaacs/npm.git

Les 3 premiers dépots sont mentionnés dans la doc, mais, par rapport cette doc, nous ajoutons deux dépots
permettant d'utiliser des feuilles de styles CSS au lieu de styles XML.

Pour installer carto, on a besoin de nodejs et de npm
Or, pour installer la dernière version de npm, il ne faut pas prendre celle du paquet
mais il faut installer npm à partir du dépot

.. code::
  # aptitude install npm
  cd ~/src/npm/scripts
  chmod +x install.sh


puis, on installe carto avec

.. code::
  cd ~/src/carto
  sudo npm install -g carto
  sudo npm install -g millstone

On peut désormais utiliser carto de la façon suivante

.. code::
  cd ~/src/openstreetmap-carto/
  carto project.mml > mapnik.xml

Il faut aussi installer libapache2-mod-tile.

La solution simple, cela aurait été de prendre le paquet.

.. code::
  #sudo apt-get install libapache2-mod-tile_dir

Cependant, avec ce paquet, nous avons l'utilitaire renderd qui n'est plus à jour.
Les détails de l'installation du module mod_tile sont donc détaillés dans fginstallation.sh
cf fginstallation.sh

Cette installation aura pour effet de créer un site web
/etc/apache2/sites-available/tileserver_site
et un module
/etc/apache2/mods-available/tile.load

Il faut aussi installer renderd
.. code::
  #aptitude install renderd

Renderd sera aussi installé à partir des sources

Configuration de renderd
.. code::
  #vi /etc/renderd.conf

  #;XML=/etc/mapnik-osm-data/osm.xml
  #;XML=/home/fred/src/openstreetmap-carto/mapnik.xml
  #XML=/home/fred/src/mapnik-style/osm.xml

Si l'installation de renderd est réalisée à partir des sources,
alors le fichier de configuration se trouve ici :
/usr/local/etc/renderd.conf

Les modifications de la configuration de renderd sont détaillées dans fginstallation.sh

Les modifications à apporter dans les fichiers ~/src/mapnik-style/inc/

Il y a trois fichiers qui sont à personnaliser

settings.xml.inc
datasource-settings.xml.inc
fontset-settings.xml.inc


.. code::
  cd ~/src/mapnik-style/inc/
  cp fontset-settings.xml.inc.template fontset-settings.xml.inc
  cp datasource-settings.xml.inc.template datasource-settings.xml.inc
  cp settings.xml.inc.template settings.xml.inc


Recuperation des shapes worldboundaries

Cette info a été vue sur cette page
http://fr.flossmanuals.net/openstreetmap/ch017_generer-des-cartes-pour-son-site-web

.. code::

  cd /usr/local/share
  sudo mkdir world_boundaries
  sudo wget http://tile.openstreetmap.org/world_boundaries-spherical.tgz
  sudo tar xzvf world_boundaries-spherical.tgz
  sudo wget http://tile.openstreetmap.org/processed_p.tar.bz2
  sudo tar xvjf processed_p.tar.bz2 -C world_boundaries
  sudo wget http://tile.openstreetmap.org/shoreline_300.tar.bz2
  sudo tar xjf shoreline_300.tar.bz2 -C world_boundaries
  sudo wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_populated_places.zip
  sudo unzip ne_10m_populated_places.zip -d world_boundaries
  sudo wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_boundary_lines_land.zip
  sudo unzip ne_110m_admin_0_boundary_lines_land.zip -d world_boundaries


Edition des fichiers de configuration
.. code::
  vi settings.xml.inc
  
  <!ENTITY symbols "symbols">
  <!ENTITY osm2pgsql_projection "&srs900913;">
  <!ENTITY dwithin_node_way "&dwithin_900913;">
  <!ENTITY world_boundaries "/usr/local/share/world_boundaries">
  <!ENTITY prefix "planet_osm">

.. code::
  vi datasource-settings.xml.inc
  
  <Parameter name="type">postgis</Parameter>
  <Parameter name="host">10.2.10.38</Parameter>
  <Parameter name="port">5432</Parameter>
  <Parameter name="dbname">gis</Parameter>
  <Parameter name="user">contrib</Parameter>
  <Parameter name="password">alambic</Parameter>
  <Parameter name="estimate_extent">false</Parameter>
  <Parameter name="extent">-20037508,-19929239,20037508,19929239</Parameter>

Si on a bien telechargé les fichiers shape, si on correctement configuré les fichiers xml, alors
on peut maintenant tester la configuration en lancant renderd en mode foreground.

Lancement de renderd

.. code::
  #renderd -f
  sudo -u www-data renderd -f -c /usr/local/etc/renderd.conf

Normallement, si les fichiers shapes sont présents dans /usr/local/share/world_boundaries/
alors, il ne doit pas y avoir d'erreurs d'execution

Essai de generation d'une image
vue ici : http://fr.flossmanuals.net/openstreetmap/ch017_generer-des-cartes-pour-son-site-web
.. code::
  cd ~/src/mapnik-style
  ./generate_xml.py --host 10.2.10.38\
                    --dbname gis \
                    --user contrib \
                    --password alambic \
                    --world_boundaries /usr/local/share/world_boundaries \
                    --accept-none

Avant de lancer la generation de l'image, nous allons modifier le script generate_image.py
pour donner une nouvelle emprise
(car, par default, ce script genere une image de l'angleterre)

.. code::
  vi generate_image.py
  bounds = (-6.5, 49.5, 2.1, 59)
  bounds = (-1.250, 46.140, -1.080, 46.170)
  z = 12
  imgx = 500 * z
  imgy = 500 * z

.. code::
  ./generate_image.py ; display image.png


Avant de lancer la generation des tuiles, nous allons modifier le script generate_tiles.py
pour ajouter une nouvelle emprise

.. code::
  vi generate_tiles.py
  bbox = (-1.250, 46.140, -1.080, 46.170)
  render_tiles(bbox, mapfile, tile_dir, 10, 16, "La Rochelle")

Lancement de la génération des tuiles

.. code::
  export MAPNIK_MAP_FILE=osm.xml; export MAPNIK_TILE_DIR=/var/lib/mod_tile; ./generate_tiles.py

Configuration de mod-tile
cf fginstallation.sh

activation du module, du site, et relance d'apache
.. code::
  sudo a2enmod tile
  sudo a2ensite tileserver_site
  sudo service apache2 restart

Solution non trouvée pour configurer mod_tile
L'astuce est donc de faire un lien symbolique

.. code::
  cd /var/www
  sudo ln -s /var/lib/mod_tile osm
  cd /var/lib/mod_tile
  cp ~/src/mod_tile/slippymap.html /var/lib/mod_tile/slippymap.html

On essaye
.. code::
  http://localhost/osm/16/32548/23274.png
  http://localhost/mod_tiles
  http://localhost/osm/slippymap.html
  
