
# Exploitation des données "ballades urbaines"

## Les données initiales

Les données sont initiales sont :

- les infos des responsables de secteur (fichiers xls)

- les infos qui viennent de l'appli (fichier ????)

```
/mnt/dsifichiers03/services2_all/DIRECTION_DES_SYSTEMES_D_INFORMATION/POLE_GEOMATIQUE_ET_DECISIONNEL/RESP\ POLE/0_gup/
```

Ces infos avaient déjà été recopiées et analysées ici

```
~/Documents/documentation/Gup/0_gup/photo
```

## Analyse des infos des responsables de secteurs

Ce sont des fichiers excel...
=> on peut en déduire certaines dates de ballades urbaines
```
balades_urbaines.ods
```


## Analyse des infos de l'appli

### Photos

data_5

cd /home/fred/Documents/technic/source/gup/data/0_gup/data_5/save5/photo
ls -1 | wc
125 photos

data_6

cd /home/fred/Documents/technic/source/gup/data/0_gup/data_6/photo
ls -1 | wc
176 photos

Les photos sont redimensionnées pour faciliter l'utilisation sous qgis

```
cd /home/fred/Documents/technic/source/gup/data/0_gup/data_6/
cp -r photo thumb
cd /home/fred/Documents/technic/source/gup/data/0_gup/data_6/thumb
mogrify -resize 640x480 *.jpg
```

### Données au format sqlite

data_5

/home/fred/Documents/technic/source/gup/data/0_gup/data_5/save5/databases/bdgup.sqlite

data_6

/home/fred/Documents/technic/source/gup/data/0_gup/data_6/databases/bdgup.sqlite

## Utilisation avec qgis

Le projet qgis est ici
```
/home/fred/Documents/technic/source/gup/data/demandes_interventions_reunions_publiques.qgs
```

A partir de la connexion à la base bdgup.sqlite :
1. On ajoute le table *categorie*
2. Puis on ajoute la table *ss_categorie* qu'on relie avec la table *categorie* avec une jointure
```
Couche jointe               : categorie
Champ dans la couche jointe : cat_id
Champ dans la couche cible  : scat_cat_id
```
3. Puis on ajoute la table *observation* qu'on relie avec la table *ss_categorie* avec une jointure
```
Couche jointe               : ss_categorie
Champ dans la couche jointe : scat_id
Champ dans la couche cible  : obs_cat_id
```

4. Après affichage de la couche observation, il est possible d'afficher une info-bulle

cf https://georezo.net/forum/viewtopic.php?pid=285800

```
<!-- comment -->
<h3> [%"obs_date"%] </h3>
[%concat(
  upper(left("obs_commentaire", 1)),
  substr("obs_commentaire", 2, length( "obs_commentaire"))
)%]<br>
<br>
[% concat('<img src="file://', @project_folder, '/0_gup/data_6/thumb/', "obs_id", '.jpg" width="320"  height="240"/>') %]<br>
[% "obs_id" || '.jpg'%]
```


| Header One     | Header Two     |
| :------------- | :------------- |
| Item One       | Item Two       | | Header Two     |
| :------------- | :------------- |
| Item One       | Item Two       |
