
***************************************************
Transfert des données littérales en base de données
***************************************************

Dans la documentation qgis, on aborde l'existence d'un plugin permettant la manipulation des fichiers littéraux

Cependant, ici, nous nous interesserons plus à l'import manuel

Ecrit en shell, ces petits utilitaires forment un ensemble dédié à la manipulation des données cadatsrales

Preparation de l'environnement
==============================

Les donnes initiales, c'est à dire les 6 fichiers MAJIC sont mis dans le repertoire data1/ini/ avec l'extension sav
Les noms des fichiers doivent aussi respectés la liste suivante :

.. code::
 
  technic/source/cadastre/data1/ini/BATI_300.sav
  technic/source/cadastre/data1/ini/FANR_300.sav
  technic/source/cadastre/data1/ini/LLOC_300.sav
  technic/source/cadastre/data1/ini/NBAT_300.sav
  technic/source/cadastre/data1/ini/PDLL_300.sav
  technic/source/cadastre/data1/ini/PROP_300.sav

Pour info PDL est devenu PDLL
et REVDI est devenu LLOC

 
(les scripts shell feront une copie de ces fichiers .sav vers des fichiers .txt)

.. code::

  vi technic/source/cadastre/bin/01_00_decoupe_data1.sh

Pour info, les paramètres, c'est à dire les petites tables qui correspondent aux listes prédéfinies que l'on retrouve dans la documentation sont mis dans le repertoire data2/foot/

Les utilitaires dos2unix et gawk doivent être installés sur la machine (avec gawk, cela fonctionne, avec mawk, cela ne fonctionne pas car il n'y a pas la commande switch)

Un serveur de base de données postgresql est démarré et attend les connexions. Nous notons son adresse IP.

Nous modifions le fichier 03_00_sql_data1.sh pour mettre à jour cette adresse IP.
Ainsi que les fichiers 03_01_... 03_02_... 03_03_... et 03_04_...

.. code::

  vi 03_00_sql_data1.sh

.. code::

  HOST=10.2.10.56
  echo "echo \"10.2.10.56:5432:_:contrib:pass\" >> ~/.pgpass"


Nous modifions le fichier .pgpass

.. code::

  echo \"10.2.10.56:5432:_:contrib:pass\" >> ~/.pgpass

Preparation du serveur postgresql
---------------------------------
Le serveur de base de données postgresql doit être configuré pour accepter les données.
Une partie de cette configuration, sur le tablespace et sur les schemas, est détaillée dans les commentaires des scripts sql (/bin/sql)

Explication de la procédure
===========================

Les fichiers Majic contiennent des données (data),
tandis que la documentation sur ces fichiers peut être considérée comme des méta-données.

Les données seront manipulées et les fichiers résultants sont placées dans un repertoire "foot",
et les meta-données seront placées dans un repertoire "head".

Le "head", c'est l'emplacement des en-têtes, tandis que le "foot", c'est celui des données.

Ensuite, ces différents fichiers sont importés dnas une base postgresql et des scripts sql sont executés.

Lancement automatisé de tous les scripts
----------------------------------------
Tout l'enchainement peut etre réalisé en une fois :
Il suffit de lancer 00_all.sh

Cependant, pour debugger il est possible de faire le
travail en plusieurs etapes


Découpage des fichiers data ...
-------------------------------
-> du repertoire data1/ini vers data1/foot
------------------------------------------
Les 6 fichiers initiaux, qui viennent de la dgfip, sont déposés dans un repertoire data1/ini.
Ces fichiers sont decoupés en plusieurs fichiers csv
En effet, un fichier contient plusieurs articles de type différents.
Par exemple, le fichier bati contient des articles 21, des articles 40, des articles 50,...
Ce fichier est alors eclaté et chacune de ses lignes est ventilée
en fonction du numero d'article.
Des scripts shell (dans le repertoire /bin) permettent donc de lire les fichiers majic pour les ventiler en fichier "foot"

.. code::

  technic/source/cadastre/bin/01_00_decoupe_data1.sh

Les fichiers qui sont fabriqués à l'issue de ce premier traitement se trouvent dans le répertoire data1/foot

Découpage des fichiers metadata ...
-----------------------------------
-> du repertoire data1/head/txt vers data1/head/sql
---------------------------------------------------
Des fichers de paramètrage (de configuration) permettent de définir la structure des tables, c'est a dire, le nom des colonnes, leurs longueurs.

Les fichiers de configuration, au format txt, sont initialiement définis dans le sous-repertoire data1/head/txt
Il faut définir les tables à l'aide de la doc qui se trouve dans le repertoire cadastre/etc

Ces fichiers sont actuellement lu par un script shell qui en fait des commandes sql.
On pourrait très bien imaginer dans un futur proche créer des scripts python qui liraient ces mêmes fichiers pour en faire des fichiers model.py que l'on pourait ensuite utiliser avec sqlalchemy.

.. code::

  technic/source/cadastre/bin/02_00_struct2sql_data1.sh

Les fichiers qui sont fabriqués à l'issue de ce second traitement se trouvent dans le répertoire data1/head/sql

Import des données sous postgis ...
-----------------------------------
-> des scripts sql et un orchestration shell
--------------------------------------------
-> vers la machine debian.mairie.fr, base patrimoine
----------------------------------------------------
Une machine, dont le nom est debian.mairie.fr, héberge un serveur postgresql

.. code::

  sudo vi /etc/hosts

Une base de données, "patrimoine", va recevoir toutes les données.

Une fois que le découpage est fichiers est effectué, on peut donc procéder à l'import et la manipulation des données.
Les scripts shell qui sont la aussi pour jouer des instructions sql (dans le repertoire /bin/sql)

.. code::

  technic/source/cadastre/bin/03_00_sql_data1.sh

L'execution de ce script shell dépend aussi des fichiers sql

.. code::

  technic/source/cadastre/bin/sql/*.sql

La base de données qui est fabriquée à l'issue de ce traitement se trouve sur la machine debian.mairie.fr
Cette base s'appelle patrimoine.
Les tables brutes, issues de l'import, se trouvent dans l'espace de nom qui s'appelle cadastre_majic
après, le travail est effectué dans l'espace de nom qui s'appelle cadastre_travail



Debug
=====

Entre 2013 et 2015

Pour info PDL est devenu PDLL
et REVDI est devenu LLOC

Le fichier 
data1/ini/FANR_300.sav
contient deux lignes d'entetes direction.
La première de ces deux lignes est supprimée

Les fichiers 
data1/head/txt/lloc_article_direction_structure.txt
ainsi que
bin/01_03_lloc.sh
ont eté modifiés pour prendre en compte les changements dans le fichier original
data1/ini/LLOC_300.txt

