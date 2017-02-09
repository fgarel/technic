#!/usr/bin/env python3
# coding: utf-8


# Creation d'un fichier sql qui contiendra les centres des prises de vue

fichier_sql = '04_pva.sql'
f = open(fichier_sql, 'w')

# ecriture de create table
f.write("CREATE TABLE poi (\n")
f.write("  poi_id INTEGER,\n")
f.write("  poi_name VARCHAR\n")
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
        f.write("INSERT iNTO poi (poi_id, poi_name, poi_geom)\n")
        f.write("  VALUES ({}, '{}', ST_GeomFromEWKT('SRID=3857;POINT({} {})'));\n".format(id, nom, x, y))
f.close()
