#!/bin/sh

# 1ere partie : preparation avant google earth

# fabrication des points aux coordonnées des centre de PVA
./03_make_pva.py

# ce script python va fabrquer un sql
# il faut executer ce script
psql -h localhost -d sandbox -f 04_pva.sql

# une fois que les données sont au format posgis, on va les recuperer sous forme kml
ogrinfo PG:'host=localhost dbname=sandbox user=fred password=fred' poi
ogr2ogr -f "KML" 05_mypoi.kml PG:'host=localhost dbname=sandbox user=fred password=fred' poi

