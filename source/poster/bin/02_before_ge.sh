#!/bin/sh

# 1ere partie : preparation avant google earth

# fabrication des points aux coordonnées des centre de PVA
#./03_make_pva.py
# TODO : la ligne suivante est a remettre
#####./03_prepare_pva_et_genere_scripts_im_et_hugin.py

# Ce script python va fabrquer un sql
# il faut executer ce script
# psql -h localhost -d sandbox -f 04_pva.sql


# fabrication
#  - des polygones
#  - et des points aux coordonnées des centre de PVA
./03_make_poi_polygon.py

# Ce script python va fabrquer un sql
# il faut executer ce script
psql -h localhost -d sandbox -f 04_make_poi_polygon.sql

# une fois que les données sont au format postgis, on va
#   - recuperer les polygons au format shape
#ogrinfo PG:'host=localhost dbname=pcrs user=fred password=fred' poi_polygon
ogr2ogr -f "ESRI ShapeFile" \
        05_mypoi.shp \
        PG:'host=localhost dbname=sandbox user=fred password=fred' \
        poi_polygon

#   - et recuperer les points au forme kml
#ogrinfo PG:'host=localhost dbname=sandbox user=fred password=fred' poi
#ogr2ogr -f "KML" 05_mypoi.kml PG:'host=localhost dbname=sandbox user=fred password=fred' poi
# pour faire le mappage entre les champs de la table et le kml
# http://www.gdal.org/drv_libkml.html
export LIBKML_NAME_FIELD=poi_name
export LIBKML_DESCRIPTION_FIELD=poi_id
export LIBKML_CAMERA_LONGITUDE_FIELD=longitude
export LIBKML_CAMERA_LATITUDE_FIELD=latitude
export LIBKML_CAMERA_ALTITUDE_FIELD=altitude
export LIBKML_CAMERA_ALTITUDEMODE_FIELD=altitudemode
export LIBKML_TILT_FIELD=tilt
export LIBKML_ROLL_FIELD=roll
ogr2ogr -f "LIBKML" \
        05_mypoi.kml \
        -dsco NAME=centrePVA_pour_poster \
        -dsco DESCRIPTION="marker pour automatiser l'impression" \
        -lco NAME="centre" \
        PG:'host=localhost dbname=sandbox user=fred password=fred' \
        -sql "SELECT * FROM poi_point ORDER BY poi_idhg;"
