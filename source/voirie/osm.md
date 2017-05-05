# Les données Open Street Map

Les données OSM et la manipulation de ces données sont des thèmes qui sont abordés
dans :
 - ~/Documents/install/source/environnementTravail/installOSM.txt
 - ~/Documents/technic/source/voirie/
 - ~/Documents/technic/source/pcrs_geoplateforme
 - https://cloud.sagemath.com/projects/c9022f4a-0154-4034-bb05-bf3e56d3e3cd/files/osm/OpenStreetMap.md

## Organisation des données OSM

Dans cette partie, nous allons présenter les données OpenStreetMap

### Les Types
http://wiki.openstreetmap.org/wiki/FR:%C3%89l%C3%A9ments

Objet complexe = relation
  http://wiki.openstreetmap.org/wiki/FR:Relations
Objet simple linéaire = way
  http://wiki.openstreetmap.org/wiki/FR:Chemin
Objet simple ponctuel = node
  http://wiki.openstreetmap.org/wiki/FR:N%C5%93ud

### Les bases
Les bases de données et les schémas
http://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs
http://wiki.openstreetmap.org/wiki/Downloading_data

### Les schemas en fonction de l'usage (et de l'outil de dump)
http://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs#Database_Schemas


### Les API pour interroger la base
http://wiki.openstreetmap.org/wiki/Downloading_data#Huge_amounts_of_data
http://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs#Sources_of_OSM_Data
http://wiki.openstreetmap.org/wiki/Frameworks
http://wiki.openstreetmap.org/wiki/Osmapi
https://github.com/dezhin/osmread/
http://wiki.openstreetmap.org/wiki/API_v0.6
http://wiki.openstreetmap.org/wiki/Xapi
http://wiki.openstreetmap.org/wiki/Overpass_API
http://overpass-turbo.eu/
http://www.overpass-api.de/query_form.html

### Les outils pour dumper la base
http://wiki.openstreetmap.org/wiki/Osm2pgsql
http://wiki.openstreetmap.org/wiki/Osmosis
http://wiki.openstreetmap.org/wiki/OSMembrane
http://wiki.openstreetmap.org/wiki/Imposm
https://imposm.org/
https://github.com/omniscale/imposm3


### Les paramètres pour controler la structure des données dans la base locale
http://wiki.openstreetmap.org/wiki/Osm2pgsql#Import_style


### Les formats
Les différents formats pour l'extraction de données
http://wiki.openstreetmap.org/wiki/OSM_file_formats

  schema osm2pgsql
    http://wiki.openstreetmap.org/wiki/Osm2pgsql/schema
    tables planet_osm_line, planet_osm_point, planet_osm_polygon, planet_osm_roads, planet_osm_nodes, planet_osm_rels, planet_osm_ways

  schema imposm
    https://imposm.org/docs/imposm/latest/database_schema.html
    tables amenities, places, transport_points, admin, buildings, landusages, aeroways, waterways, minorroads, mainroads, motorways, railways, waterways,

   schema ???
     http://chrisnatali.github.io/osm_notes/osm_schema.html
     tables


Il existe aussi des formats pour visualiser des différences entre deux jeux de données
http://wiki.openstreetmap.org/wiki/OSM_file_formats#File_formats_for_diffs

Outils pour la conversion de format
http://wiki.openstreetmap.org/wiki/Converting_map_data_between_formats
http://wiki.openstreetmap.org/wiki/GML
http://wiki.openstreetmap.org/wiki/OGR
http://gis.stackexchange.com/questions/22788/how-do-you-convert-osm-xml-to-geojson/69622#69622



## La Digitalisation des données
### Liste des tags possibles en france
http://wiki.openstreetmap.org/wiki/FR:%C3%89l%C3%A9ments_cartographiques
http://wiki.openstreetmap.org/wiki/FR:Comment_cartographier_un...


### Liste des pense-betes pour la digit
http://wiki.openstreetmap.org/wiki/WikiProject_France/Osmecum

### Autre outil
http://geojson.io/#map=2/20.0/0.0


## geopandas et osmnx
http://www.portailsig.org/content/python-geopandas-ou-le-pandas-spatial

http://geoffboeing.com/2016/11/osmnx-python-street-networks/

https://github.com/gboeing/osmnx

https://github.com/gboeing/osmnx/blob/master/examples/05-example-save-load-networks-shapes.ipynb

https://osmnx.readthedocs.io/en/stable/




## Utilisation des données OSM avec Qgis

https://cloud.sagemath.com/projects/c9022f4a-0154-4034-bb05-bf3e56d3e3cd/files/osm/OpenStreetMap.md

### Fichier Qgis

Pour la récupération des données osm avec l'extension (le plugin) "QuickOSM"

### Les bases de données

recuperation à partir de osmosis

base : osm
schema : public
tables : actions, nodes, relation_members, relations, schema_info, users, way_nodes, ways

recuperation à partir du plugin qgis

base : graphe
schema : public
tables : admin_level, amenity, boundary, building, craft, cuisine, cycleway, emergency, evacuation_center, highway, historic, junction, landuse, leisure, man_made, natural, office, place, power, public_transport, railway, route, shop, sport, tourism, waterway


table ; attribut
cycleway ; name
highway ; name
junction ; name
man_made ; name


### Manipulation des données osm directement avec le plugin QuickOSM

### Manipulation de la base osm

-- Selection des rues et des places
select *
from ways
where ( "tags" -> 'name' is not null
    and "tags" -> 'amenity' = 'parking')
  or (  "tags" -> 'name' is not null
    and "tags" -> 'highway' is not null)
limit 100;



-- Creation de l'objet composé "commune de La Rochelle"

cf fichier sql
ManipulationBaseOsm_CreationObjetCommune.sql


Recherche des objets à l'interieur de cet objet commune
