#!/bin/sh

# Export des données pluviales


# export au format shp
# attention, les noms des colonnes sont tronques

rm -rf shp
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "ESRI Shapefile" \
        shp \
        PG:"host='dsibdd09' port='5432' user='contrib' password='alambic' dbname='eaupluviale' schemas=sig,public active_schema=sig"

# export au format geopackage
# visible avec spatialite_gui

#ogr2ogr -skipfailures \
#        -progress \
#        -overwrite \
#        -f "GPKG" \
#        VLR_Reseau_Eaux_Pluviales.gpkg \
#        PG:"host='dsibdd09' port='5432' user='contrib' password='alambic' dbname='eaupluviale' schemas=sig,public active_schema=sig list_all_tables=yes"


#ogr2ogr -skipfailures \
#        -progress \
#        -overwrite \
#        -f "GPKG" \
#        VLR_Reseau_Eaux_Pluviales.gpkg \
#        PG:"host='dsibdd09' port='5432' user='contrib' password='alambic' dbname='eaupluviale' list_all_tables=yes"


ogr2ogr -oo LIST_ALL_TABLES=YES \
        -skipfailures \
        -progress \
        -overwrite \
        \
        -f "GPKG" \
        VLR_Reseau_Eaux_Pluviales.gpkg \
        PG:"host='dsibdd09' port='5432' user='contrib' password='alambic' dbname='eaupluviale' schemas=sig,public active_schema=sig"
