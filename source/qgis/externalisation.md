
## Transformation d'un fichier qgis
Le but de cette transformation est de rendre le fichier utilisable à l'exterieur

### 1er essai, non utile : remplacer 172.17.150.6 par localhost

Dans le fichier qgis,

Remplacement de :
```
dbname='sig' host=172.17.150.6 port=5432 user='frederic.garel' password='Mie2Bhoutan'
```
Par :
```
dbname='sig' host=localhost port=62391 user='postgres' password='P0stgre$'
```

### 2d essai, plus utile :remplacer 172.17.150.6 par cdalr.fr

