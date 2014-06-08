************
Installation
************


la meilleure doc que j'ai vue pour installer mapnik se trouve ici :
http://switch2osm.org/serving-tiles/manually-building-a-tile-server-12-04/

en suivant pas à pas la préocédure, on obtient un système qui est censé avoir un mapnik et un serveur de tuile

dans le repertoire ~/src/ on s'arrange pour avoir un clone de ces 4 dépots

.. code::
  git clone git://github.com/mapnik/mapnik
  git clone git://github.com/openstreetmap/mod_tile.git
  svn co http://svn.openstreetmap.org/applications/rendering/mapnik mapnik-style
  git clone https://github.com/mapbox/carto
  git https://github.com/gravitystorm/openstreetmap-carto

Les 3 premiers dépots sont mentionnés dans la doc, mais, par rapport cette doc, nous ajoutons deux dépots
permettant d'utiliser des feuilles de styles CSS au lieu de styles XML.

pour installer carto, on a besoin de nodejs et de npm

.. code::
  aptitude install npm

puis, on installe carto avec

.. code::
  cd ~/src/carto
  sudo npm install -g carto
  sudo npm install -g millstone

On peut désormais utiliser carto de la façon suivante

.. code::
  cd ~/src/openstreetmap-carto/
  carto project.mml > mapnik.xml

les modifications à apporter dans les fichiers ~/src/mapnik-style/inc/

il y a trois fichiers qui sont à personnaliser

settings.xml.inc
datasource-settings.xml.inc
fontset-settings.xml.inc
