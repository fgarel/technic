#!/bin/sh
#

# manipulation des données raster

# info sur la donnee jp2
gdalinfo ~/k/sig_donnees/raster/orthophotoplan/vue_2013/jp2/ortho_2013_lr_cc46.jp2

# transformation du format jp2 en tif
#gdal_translate -of GTiff \
#               ~/k/sig_donnees/raster/orthophotoplan/vue_2013/jp2/ortho_2013_lr_cc46.jp2 \
#               ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013/ortho_2013_lr_cc46.tif

# info sur la donnee tif
gdalinfo ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013/ortho_2013_lr_cc46.tif

# changement de système de coordonnées
# 2154 = RGF93 / Lambert-93 - France
# 3857 = WGS 84 / Pseudo-Mercator - Spherical Mercator, Google Maps, OpenStreetMap, Bing, ArcGIS, ESRI
# 3946 = RGF93 / CC46
# 4326 = WGS 84 - WGS84 - World Geodetic System 1984, used in GPS

#gdalwarp -s_srs EPSG:3946 \
#         -t_srs EPSG:3857 \
#         ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013/ortho_2013_lr_cc46.tif \
#         ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/ortho_2013_lr_3857.tif

# info sur la donnee tif
gdalinfo ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/ortho_2013_lr_3857.tif

# tuilage V2
#gdal2tiles.py -p mercator \
#              -w openlayers \
#              -t ortho_2013_pseudomercator \
#              ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/ortho_2013_lr_3857.tif \
#              ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/

# Attention, il faut ensuite modifier manuellement le fichier openlayers.html

#vi openlayers.html

#    ....
#    var mapMaxZoom = 20;   // modifié par fg : la valeur originale était 20
#    var emptyTileURL = "http://www.maptiler.org/img/none.png";
#    OpenLayers.IMAGE_RELOAD_ATTEMPTS = 3;
#    function init(){
#        var options = {
#            div: "map",
#            controls: [],
#            projection: "EPSG:900913",
#            displayProjection: new OpenLayers.Projection("EPSG:4326"),
#            numZoomLevels: 21
#        };   // modifié par fg : la valeur originale était 20

# transformation en MBTiles
# pour cela, on utilise pas tilecloud, ni gdal, mais un autre utilitaire pris ici
wget -O raster2mb https://raw.githubusercontent.com/crschmidt/raster2mb/master/raster2mb
chmod +x raster2mb
#rm ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/ortho_2013_lr_3857.mbtiles
#./raster2mb ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/ortho_2013_lr_3857.tif \
#            ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/ortho_2013_lr_3857.mbtiles
rm ortho_2013_lr_3857.mbtiles
./raster2mb ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013_3857/ortho_2013_lr_3857.tif \
            ortho_2013_lr_3857.mbtiles

# on peut ensuite utiliser tilcloud pour interroger ce fichier mbtiles


