#!/usr/bin/env python3
# coding: utf-8


# Creation d'un fichier sql qui contiendra les centres des prises de vue

fichier_sql = '04_pva.sql'
f = open(fichier_sql, 'w')

# ecriture de create table
f.write("DROP TABLE if exists poi;\n")
f.write("\n")
f.write("CREATE TABLE poi (\n")
f.write("  poi_id INTEGER,\n")
f.write("  poi_name VARCHAR,\n")
f.write("  longitude float DEFAULT 0.0,\n")
f.write("  latitude float DEFAULT 0.0,\n")
f.write("  altitude float DEFAULT 2000.0,\n")
f.write("  altitudemode VARCHAR DEFAULT 'relativeToGround',\n")
f.write("  tilt float DEFAULT 0,\n")
f.write("  roll float DEFAULT 0\n")
f.write(");\n")
f.write("SELECT AddGeometryColumn('poi', 'poi_geom', 3857, 'POINT', 2);\n")
f.write("\n")

countx = 0
county = 0
id = 0
for x in range (-141375, -119999, 1125):
    countx += 1
    #print('x {} => x = {}'.format(countx, x))
    county = 0
    for y in range(5798785, 5813250, 815):
        county += 1
        id += 1
        nom = '{:0>2}.{:0>2}'.format(county, countx)
        print('id = {}, nom = yx = {}, x = {}, y = {}'.format(id, nom, x, y))
        f.write("INSERT INTO poi (poi_id, poi_name, poi_geom)\n")
        f.write("  VALUES ({}, '{}', ST_GeomFromEWKT('SRID=3857;POINT({} {})'));\n".format(id, nom, x, y))


f.write("\n")
f.write("UPDATE poi\n")
f.write("  SET \n")
f.write("      longitude = \n")
f.write("                 st_x(\n")
f.write("                   st_transform(\n")
f.write("                      poi_geom,\n")
f.write("                      4326)),\n")
f.write("      latitude = \n")
f.write("                 st_y(\n")
f.write("                   st_transform(\n")
f.write("                      poi_geom,\n")
f.write("                      4326));\n")

f.close()
