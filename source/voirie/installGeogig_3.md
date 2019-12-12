# Gestion de la donnée Voirie a l'aide d'un gestionnaire de version

Prenons, en premier exemple concret, 
le cas des données liées aux adresses postales et des données liées au tracé des voies.

## Introduction

### Les données extérieurs originales
Nous avons plusieurs endroits (depots) qui contiennent de l'information
Dépot A : OSM
Dépot B : BAN
Dépot C : BAL
Dépot D : IGN
Dépot E : Cadastre
Dépot F : Sdis
Depot G : Arcep
Dépot H : CDA
Dépot I : VLR
Dépot J : VoirieTopoEspuVoirieAdministratif

### Organisation, selon le point de vue "source"

Chaque source a :
- ses données dans son format original, pas forcement postgis
  osm : pbf
  BAN : csv, repertoire ...
  BAL : csv, ..
  On doit trouver des scripts pour le telechargement et le transfert de données
  ~/Documents/technic/source/voirie/bin/wget_ban.sh
  ~/Documents/technic/source/voirie/bin/voirie.md

- ces mêmes données, dans le format correspondant à une intégration sous postgis.
  Ou sont donc stockées ces données originales au format postgresql ?
  si possible, sur le serveur dans la base "sig", chaque source dans son schema
  sinon, dans sa base de donnée actuelle
  osm : type postgresql, hote FZG1, base sig, schema osm
  BAN : postgresql, hote FZG1, base sig, schema ban
  BAL : postgresql, hote 
  CDA : postgresql, Brulhois_...
  VLR : postgresql, dsiappli39...
  Espu : postgresql, vlr6180y_espu
  On doit trouver des scripts pour l'import, export des données
  entre le format original et le stockage sous postgresql


- son depot distant ou central, c'est a dire, un depot geogig de type postgresql, 
  qui correspond à l'etat des données dans son format postgresql,
  dépot qui est dédié à faire l'interface entre les données exterieurs et notre travail.
  base geogig_central, schema osm  <=> depot central_osm, branche master
  base geogig_central, schema ban  <=> depot central_ban, branche master
  base geogig_central, schema espu <=> depot central_espu, brancher master
  On doit trouver des scripts correspondant a la mise en place du suivi geogig.
  Les données originales seront suivies dans la branche master

- le depot local, un depot geogig de type postgresql,
  qui correspond au depot de travail, en local,
  dépot qui est dédié à faire l'interface entre la branche master
  (proche de la structure originale)
  et la branche develop (proche de la structure "uniformisée")
  base geogig_local, schema osm  <=> depot local_osm, branche master
  base geogig_local, schema espu <=> depot local_osm, branche master, develop
  On doit trouver des scripts correspondant a la mise en place de l'uniformisation.
  Les donnes uniformisées seront suivies dans la branche develop

### Un depot supplementaire pour les comparaisons et autres traitments

une base de données supplementaire est ajoutée
cette base de données contiendra les tables permettant de gérer les comparaisons d'entités provenant de différentes sources.

chaque comparaison a ces attributs :
la base/schema/vue numero 1 : par exemple, osm/


Stratégie pour la manipulation de ces données

1. Un dépot central, avec une branche master, pour chaque source de donnée original
1.1. Création, initialisation
Il faut creer, initialiser un dépot avec la structure de données originale
 - télechargement initiale de la donnée
 - si elle n'est pas déja en postrgresql,
   charger le données dans une schema propre,
   reproductible et constant
 - creer un dépot geogig_distant avec cette donnée initiale
 - clonage de ce dépot geogig_distant dans un depot appelé geogig_local

ici, on va donc avoir :
le dépot geogig_central_osm
base geogig_central, schema osm
base geogig_central, schema ban
base geogig_central, schema EspuVoirieAdministratif

La Branche master du dépot sera la branche liée au dépot de l'auteur original de la donnée

1.2. mise à jour de la branche master
A chaque fois que l'on met à jour notre téléchargement, on doit mettre à jour notre branche master

On utilise la notion de depot distant.

la mise à jour de la donnée se fait dans un depot

2. Stratégie pour la comparaison, l'enrichissement des données
La Branche develop du depot contiendra des tables supplémentaires.
Ces tables supplémentaires serviront à faire des comparaisons avec les depots voisins.

par exemple, supposons que nous vouons comparer les points d'adresse postale.

Pour le dépot OSM, si dans la branche master, on a une table d'objets geographiques ponctuels, appelée waypoints,
alors, dans le branche develop, on doit creer
une table qui s'appelera adresse_postale, et qui sera une extraction de waypoints.

Pour le dépot espuVoirieAdministratif, si dans la branche master, on a une table d'objets geographiques ponctuels, appelée numvoie,
alors, dans la branche develop, on doit créer une table que s'appelera adresse_postale, et qui sera une extraction de numvoie.

scripts de gestion de depots (geogig)
 - de   geogig_distant
   vers geogig_local

scripts de passage de branches (geogig, stetl)
script pour passer
 - de   geogig_local_osm_master
   vers geogig_local_osm_develop
script pour reverser la donnée
 - de   geogig_local_osm_develop
 - vers geogig_local_osm_master

script de comparaison inter-depot
(pour comparer les tables adresse_postale que l'on trouve
dans les branches develop de chacun des dépots)
avec comparaison automatique et manuel
ces scripts devront aussi permettre de creer, mettre à jour et gérer des tables de correpondance

Si nous mettons ces tables de comparaison dans un depot specifique,
par exemple
geogig_local_comparaison

4 tables de comparaison, geométrie et libellé, auto et manuel
CompGeomAutoOsmDevelopEspuDevelop
CompGeomManuelOsmDevelopEspuDevelop
CompLibAutoOsmDevelopEspuDevelop
CompLibManuelOsmDevelopEspuDevelop

Ces tables de comparaisons doivent être historisées

  I la donnée originale est récupéré dans sa version actuelle
  II cette donnée est 
 On récupère la donnée qui vient du 
