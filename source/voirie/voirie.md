# Voirie


## Plusieurs points de vue et utilisation de l'extension topologie de postgis

Il existe plusieurs points de vue quand on aborde la thématique de la
gestion des données voirie dans un SIG.

### Point de vue Gestion Administrative
Le but est de créer une base "tableau de classement de voirie"
L'idée est de faire du reporting (tableau, atlas) avec
Le nom de la voie, sa longueur, son classement, la date de la délibération, ...
Simple géométrie filaire, topologie non nécessaire ?

### Point de vue Travaux
Le but est de créer une base d'objet surfacique
revêtement, état du revêtement, présence d'amiante
Base pouvant être topologie de surface et qui peut s'appuyer sur les arcs
limiteVoiriePCRS

### Point de vue Déplacement / Circulation
Le but est de créer une base de type graphe connecté
 - un graphe pour les transports en commun / taxi
 - un graphe pour les véhicules 4 roues électriques
 - un graphe pour les véhicules 4 roues ou 2 roues thermiques
 - un graphe pour les vélos
 - un graphe pour les piétons
Possibilité de connecté ce point de vue avec
pgrouting, chouette, osmnx, geopandas, networkx
https://www.graphhopper.com/
https://github.com/graphhopper/jsprit
https://github.com/Mapkin/osmgraph
https://gist.github.com/aflaxman/287370/

Base de type topologie de réseau qui doit s'appuyer sur des "lanes" (file de vehicules)

### Point de vue TopoPCRS
Création des objets linéaire LimiteVoiriePCRS
(éventuellement complétés par les objets signalisation horizontale)


## Détail du point de vue Gestion Administrative de la Voirie

Attribut Type de Voie :

Les différentes "natureAdministrative" sont ici

```
Serveur vlr6180y, base espu, schema stockage, table typeVoie
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



## Détail du point de vue Travaux

Attribut etat de chaussée
Les informations de départ ont été fournies dans un message du
11/07/2017
Diagnostic des chaussées.xslm

Le fichier excel permet d'associer un nom de voirie avec un etat
