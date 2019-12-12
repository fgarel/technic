# Gestion des plans Travaux

## Introduction

Le but est de manipuler les données liées aux travaux dans qgis2


## Saisie des informations
Les données initiales sont :

  - Des données qui sont saisies en interne :
    - un fichier excel
      ~/Douements/technic/source/qgis/data/ptojetsTravaux/projetsTravaux.ods
      ce classeur est composée de plusierus feuilles.
    - un fichier shape, ou une base postgis,
      qui correspond à la géométrie des objets
      (l'objet n'a qu'un seul attribut, CodeObjet)
      "voirie_travaux"."inObjetSimplePolygon"

  - Des données qui sont récupérées d'une autre source
    - par exemple, les lignes de bus sont récupérées à partir d'OpenStreetMap

## Traitement
Le traitement consite à prendre les données initiales et à les mettre en forme pour les afficher de manière pertinente sous qgis.

Le script est
```
~/Docuements/technic/source/voirie/bin/espu_voirieTravaux_projetphaseobjet_update.sh
```

## Manipulation sous Qgis

### Recupération des informations osm

Les données d'OSM sont récupérés en utilisant overpass-turbo.eu

Les script est ici :
```
~/Documents/install/source/osm/requete_overpass-turbo_TransportsCommuns.oql
```

Les données résultats sont mises là :
```
~Documents\osmosis\bbbike\Voirie_TransportCommun.geoson
```

### Le Projet Qgis

le projet est ici :
```
/home/fred/f/CARTOGRAPHIE/Plans/Qgis/Cartographie/projetsTravaux/projets_travaux_20190528.qgz
```


Les Atlas qui sont faits sont :
A3_Atlas_parProjet
A3_Atlas_parQuartier

### TimeManager

Les paramètres à utiliser sont :
```
LayerName : outObjetSimplePolygon
Start : DateDebutS
End : DateFinS

Montrer une carte toute les 500ms
Time display options
Font Arial 13

Date Time : %d-%m-%Y

Time Frame Size : 1 semaine
(donc a l'ecran, 1 semaine = 500 ms, 1 an = 26 secondes, 3 ans = 78 secondes)

export :
type = video
select output folder : h:/cartographie/travaux/

Animantion frame delai : 1000 ms
(donc dans la video, 1 semaine = 1 frame = 1 seconde ; 1an = 52 secondes)
```

les eventuelles corrrections de la vidéo (acceleration, ou ralentissement) sont à faire à l'aide de sripts, inspiré de
```
~/Documents/perso2/Argentine/
```


### la mise au propre des données initiales

Les données initiales sont :
/home/fred/f/CARTOGRAPHIE/Plans/Qgis/Cartographie/projetsTravaux/projets_travaux.gpkg
