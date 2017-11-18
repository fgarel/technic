
**************************************
Exploration, Interrogation des données
**************************************


Nous souhaitons avoir un dump de la base au format csv

Utilisation de henplus
======================

Nous considérons que henplus est installé, et que le driver mssql est enregistré.

Pour verifier cela :
```
henplus
list-drivers
```
si ce n'est pas le cas, cf chapitre 2


Connexion et interrogation des tables
-------------------------------------

Nous allons travailler dans le repertoire

```
/home/fred/Documents/technic/source/schemaspy_mssql/data/dsibdd01_mssql_atal_henplus
```

```
henplus
connect jdbc:jtds:sqlserver://dsibdd01:1433/ATAL
sa
BDD,adm
```

Les commandes tables, views servent à lister toutes les tables, les vues

```
tables
views
```

Pour avoir les infos sur une table
idescribe, c'est avec les index, describe, c'est sans les index
Attention, ici il ne faut pas mettre le schema
```
idescribe Actions
```

Pour executer une commande sql
Attention, ici il faut mettre le schema
```
select * from superdvlp."Actions";
```

NE FONCTIONNE PAS : Pour faire un dump d'une table

```
dump-out Actions_data.dump Actions;
```


Export des infos
----------------
Sous henplus, on peut aussi executer des commandes dont le resultat est exporté
dans un fichier texte
cf doc sur la commande (spool)

Nous allons encadrer notre commande *tables* quie nous avons vu dans le paragraphe ci dessus, par deux instructions spool
 - la première instruction spool suivie du nom de fichier sortie
 - la dernière instruction spool suivie de la sous-commande off

Par exemple, si nous voulons exporter notre liste de tables

```
spool 02_tables_result.data
tables
spool off
```

2d exemple, nous voulons exporterla description d'une table

```
spool Actions_desc.dump
describe Actions
spool off
```


Script pour enchainer des commandes
-----------------------------------
Sous henplus, on peut automatiser des taches, en créant un fichier script qui va etre une
suite d'instructions henplus.

Par exemple, voici le contenu du fichier bin/01_tables.henplus

```
vi ./bin/01_tables.henplus
```


```
-- commentaires
spool tables.txt
tables
spool off
```

Utilisation de ce fichiers script
On utilise la commande @ de henplus

```
cd ./data/dsibdd01_mssql_atal_henplus/
henplus
connect ....
...
...
@../../bin/01_tables.henplus
```

En resultat, on a bien joué les instructions contenues dans le script

Depuis henplus, execution d'un script externe
---------------------------------------------

Autre piste aussi pour automatiser : depuis henplus, il est possible de lancer un script shell ou python
On utilise la commande ! de henplus

```

```
!ls
```

On enchaine le tout :

```
cd ./data/dsibdd01_mssql_atal_henplus/
henplus
connect
...
...
@../../bin/00_all.henplus
```


Utilisation de pymssql
======================
