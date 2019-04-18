# Voirie


## Introduction

Il existe plusieurs "aspects" ou points de vue quand on aborde la thématique de la
gestion des données voirie dans un SIG.

 - Point de vue Gestion Administrative
 - Point de vue Travaux
 - Point de vue Déplacement /Circulation
 - Point de vue TopoPCRS


A chacun de ces points de vue, nous allons faire correspondre un schéma
dans la base de données espu.

Dans un premier chapitre, nous allons présenter ces points de vue

Dans un second chapitre, nous allons détailler le point de vue "Gestion Administrative"

Dans un troisième chapitre, nous allons étudier les bases qui existantes et leur récupération

Dans un quatrième chapitre, nous allons voir la manipulation de ces différentes sources de données


## 1. Les différents points de vue

### Point de vue Gestion Administrative
Le but est de créer une base "tableau de classement de voirie"
L’idée est de faire du reporting (tableau, atlas) avec
le nom de la voie, sa longueur, son classement, la date de la délibération, ...
Simple géométrie filaire, topologie non nécessaire ?

### Point de vue Travaux
Le but est de créer une base d'objet surfacique
revêtement, état du revêtement
Base pouvant être topologie de surface et qui peut s'appuyer sur les arcs
limiteVoiriePCRS

#### Détail du point de vue Travaux

Attribut état de chaussée
Les informations de départ ont été fournies dans un message du
11/07/2017
Diagnostic des chaussées.xslm

Le fichier excel permet d'associer un nom de voirie avec un etat

### Point de vue Déplacement / Circulation
Le but est de créer une base de type graphe connecté
 - un graphe pour les transports en commun / taxi
 - un graphe pour les véhicules 4 roues électriques
 - un graphe pour les véhicules 4 roues ou 2 roues thermiques
 - un graphe pour les vélos
 - un graphe pour les piétons
Possibilité de connecté ce point de vue avec
pgrouting, chouette, osmnx, geopandas, networkx, pysal
https://www.graphhopper.com/
https://github.com/graphhopper/jsprit
https://github.com/Mapkin/osmgraph
https://gist.github.com/aflaxman/287370/
https://gis.stackexchange.com/questions/244576/using-geopandas-to-create-a-graph
http://geoffboeing.com/
http://i11www.iti.kit.edu/projects/route_planning/index
http://i11www.iti.kit.edu/projects/route_planning/publications


#### Utilisation de l'extension topologie de postgis
Base de type topologie de réseau qui doit s'appuyer sur des "lanes" (file de vehicules)

#### Utilisation de josm

Pour avoir la derniere version de josm, il est perferable d'utilier la technologie
jnlp et java web start.
kesako ?

La réponse théorique est ici :
https://josm.openstreetmap.de/wiki/Fr:WikiStart
https://www.java.com/fr/download/faq/java_webstart.xml

En pratique :
L'utilitaire javaws se trouve dans le paquet iceadtea-netx
```
apt-get install iceadtea-netx
```

Le lancement de josm
```
javaws josm.jnlp
```

### Point de vue TopoPCRS
Création des objets linéaire LimiteVoiriePCRS
(éventuellement complétés par les objets signalisation horizontale)



## 2. Détail du point de vue Gestion Administrative de la Voirie

En ce qui concerne la voirie administrative, plusieurs aspects sont à creuser :

Il y a les voies, et il y a les numéros


Attribut Type de Voie :

Les différentes "natureAdministrative" sont ici

```
serveur vlr6180y, base espu, schema stockage, table typeVoie
```

L'initialisation de cette table est ici
21_ManipulationBaseOsm_Initialisation_3.sql


Attribut Voie Privée ("natureAdministrative" = "") :

parcelles / voies privées


Attribut Date Delibération Classement

Classement / Déclassement des voies

Les données de départs sont fournis par le service archive
noms de rues.xls
ce fichier est retravaillé puis enregistrés sous ClassementDeclassement.ods

### Et encore plus détaillé ?
ouverture du fichier qgis
/home/fred/Documents/technic/source/voirie/voirieadresse.qgs



### 2.1. Structuration de la données adresse

Notre base, sera une Base Adresse Locale (BAL)

#### Modèle de données

La doc de la BAL est sur cette page :
https://scdl.opendatafrance.net/docs/schemas/scdl-adresses.html
ou ici
Numerotation_VilleLaRochelle_toKML

voir aussi
BaseVoirie_BAL_BAN.ods


### 2.2. Les Bases existantes

#### Infos concernant les différentes bases
BANO : Base Adresse Nationale Ouverte
https://github.com/osm-fr/bano

BAN : Base Adresse Nationale
https://guichet-adressev2.ign.fr/
https://github.com/etalab/adresse.data.gouv.fr
https://adresse.data.gouv.fr/

BAL : Base Adresse Locale
https://scdl.opendatafrance.net/docs/schemas/scdl-adresses.html
https://git.opendatafrance.net/scdl/adresses
https://cms.geobretagne.fr/sites/default/files/documents/aitf-sig-topo-adresse-fichier-echange-simplifie-v_1.1_0.pdf

## 3. Récupération des bases existantes

### 3.1. La Base Adresse Nationale

#### Récupération automatisable = ban_auto_adresse_data_gouv
un script
```
wget_ban.sh
```
permet de recuperer les données par wget quand cela est possible

Sans l'utilisation de ce script, la démarche était :
Se rendre sur la page
https://adresse.data.gouv.fr/donnees-nationales

Diffusion principale sans licence
https://adresse.data.gouv.fr/data/adresses-cadastre/latest/csv/adresses-cadastre-17.csv.gz
https://adresse.data.gouv.fr/data/adresses-cadastre/latest/geojson/adresses-cadastre-17.geojson.gz
https://adresse.data.gouv.fr/data/adresses-cadastre/latest/ndjson-full/adresses-cadastre-17.ndjson.gz
https://adresse.data.gouv.fr/data/adresses-ftth/latest/geojson/adresses-ftth-17.geojson.gz
https://adresse.data.gouv.fr/data/adresses-locales/latest/csv/adresses-locales-17.csv.gz
https://adresse.data.gouv.fr/data/adresses-merge/ban-bal/bal/adresses-17.csv.gz
https://adresse.data.gouv.fr/data/adresses-merge/ban-bal/ban-v0/adresses-17.csv.gz
https://adresse.data.gouv.fr/data/adresses-merge/ban-bal/geojson/adresses-17.geojson.gz
https://adresse.data.gouv.fr/data/adresses-merge/cadastre-ftth-bal/bal/adresses-17.csv.gz
https://adresse.data.gouv.fr/data/adresses-merge/cadastre-ftth-bal/ban-v0/adresses-17.csv.gz
https://adresse.data.gouv.fr/data/adresses-merge/cadastre-ftth-bal/geojson/adresses-17.geojson.gz


Diffusion alternative sous licence ODbL (assuré par OpenStreetMap France)
http://bano.openstreetmap.fr/BAN_odbl/BAN_odbl_17-csv.bz2
http://bano.openstreetmap.fr/BAN_odbl/BAN_odbl_17-json.bz2
http://bano.openstreetmap.fr/BAN_odbl/BAN_odbl_17-shp.bz2

#### Récupération manuelle 1 = ban_manuelle_adresse_data_gouv

Se rendre sur cette page :
https://adresse.data.gouv.fr/bases-locales/editeur
```
A. Créer une Base Adresse Locale à partir de la BAN
Créer la Base Adresse Locale
Génération en cours
Enregistrer les changements
Télécharger
```

On obtient un fichier
~/Documents/technic/source/voirie/data/ban_manuelle_adresse_data_gouv/filename   (3.3 Mo)

Pour info, un validateur de fichier est aussi disponible ici :
https://adresse.data.gouv.fr/bases-locales/validateur


#### Récupération manuelle 2 = ban_manuelle_guichet_adressev2_ign

Se rendre sur la page :
https://guichet-adressev2.ign.fr/
connexion

nom d'utilisateur ou email : fgarel
mot de passe : Cartographie1+

Choisir dans le menu :
```
Autres Outils / Export de données
```
Choix de la commune : 17300 : LA ROCHELLE

On obtient un fichier
~/Documents/technic/source/voirie/data/ban_manuelle_guichet_adressev2_ign/export_17300.csv   (5.5 Mo)

### 3.2. Autres sources que la BAN


#### recuperation auto = cadastre, fantoir
https://www.economie.gouv.fr/cedef/cadastre-repertoire-des-voies-et-lieux-dits-fantoir
https://www.collectivites-locales.gouv.fr/mise-a-disposition-gratuite-fichier-des-voies-et-des-lieux-dits-fantoir


#### openaddresses.io = recuperation semi automatique
Récuperation de données de openaddresses.io
http://results.openaddresses.io/?runs=all#runs
http://results.openaddresses.io/sources/fr/charente_maritime

on obtient un fichier
~/Documents/technic/source/voirie/data/openaddresses_manuelle_openaddresses/charente_maritime.zip

#### OSM / BANO = Récupération automatique = bano_auto_openstreetmap

#### OSM : bbbike = recuperation semi automatique
https://extract.bbbike.org/

https://extract.bbbike.org/?lang=fr&sw_lng=-1.2591&sw_lat=46.125&ne_lng=-1.0939&ne_lat=46.199&format=osm.pbf&email=frederic.garel%40gmail.com&as=0.7668056640625&pg=1&coords=&oi=1&layers=B000T&city=La+Rochelle%2C+Charente-Maritime%2C+Nouvelle-Aquitaine%2C+France+m%C3%A9tropolitaine%2C+17000%2C+France&submit=extract&expire=1554915801

```
wget https://download.bbbike.org/osm/extract/planet_-1.2591,46.125_-1.0939,46.199.osm.pbf \
     -O ../data/osm_semiauto_bbbike/planet_-1.2591,46.125_-1.0939,46.199.osm.pbf
```

#### OSM : overpass-turbo.eu

la requête est ici:

```


/*
Extraction des numeros
*/
[out:json];

(
area[name="La Rochelle"][admin_level="8"]["ref:INSEE"="17300"];
// les adresses postales
node
  (area)
  ["addr:housenumber"];

// les voies qui ont un nom
area[name="La Rochelle"][admin_level="8"]["ref:INSEE"="17300"];
way
  (area)
  [highway][name];
// les batiments avec une adresse postale
area[name="La Rochelle"][admin_level="8"]["ref:INSEE"="17300"];
way
  (area)
  ["addr:housenumber"];

// pas de relation
/*
  rel
  (area)
  ["type"="associatedStreet"];
*/
);
out body;
>;
out skel qt;
```

le résultat est ici :
```
~/Documents/technic/source/voirie/data/osm_manuelle_overpass-turbo/export_json
```


## 4. Manipulation des fichiers textes
Largement inspiré de
```
http://blog-postgresql.verite.pro/2018/12/21/import-openfoodfacts.html
```
