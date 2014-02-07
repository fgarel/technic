
****************************************************
Utilisation Avancée et combinée avec d'autres outils
****************************************************

Objectif
========

L'objectif est de créer des métadonnées à partir de l'analyse des bases de données.
Creation semi-automatique de métadonnées à partir d'une base postgresql

trois outils sont utilisés :
 - schemaSpy permet d'extraire des informations concernant le schema de la base de données
 - henplus permet d'extraire aussi des informations sur le schema, mais aussi d'interroger la base (données)
 - csvkit est un ensemble de petits utilitaires  permettant de manipuler aisement des fichiers au format csv

Des scripts ont aussi été développés pour ces utilitaires :
 - tables.sql
 - create_table_sql.sh
 - create_desc.sh
 - create_desc2.sh




1. Recapitulatif des commandes à executer
-----------------------------------------

.. code::

  # on se place dans le bon repertoire
  cd ~/travail/opendata/export

  # lancement de l'environement python csvkit
  workon csvkit
  # modification du path pour prendre en compte les outils (csvjoin,...)
  export PATH=$PATH:~/install/csvkit/csvkit/:.

  # lancement de henplus et connection à la base postgresql 
  henplus
  connect jdbc:postgresql://dsiappli14/ds_siecle/public ds_siecle
  contrib
  alambic

  # lancement de la serie de scripts henplus et bash
  @tables.sql ; !./create_table_sql.sh ; @table.sql ; !./create_desc.sh ; !./create_desc2.sh

  # deconnection et sortie de henplus
  disconnect
  exit

  # deconnection de l'environnement python
  deactivate

2. Henplus
----------


2.1. installation de henplus
----------------------------
henplus est un outil qui va nous permettre de vérifier la bonne installation des drivers jdbc

.. code::

  cd ~/install
  git clone git://github.com/neurolabs/henplus.git henplus

  cd henplus
  aptitude install ant
  ant jar
  sudo ant install

2.2. installation des drivers
-----------------------------
1. mise en place du driver
   mettre les drivers dans le repertoire ./henplus/lib
   par exemple :

.. code::

  cd ./henplus/lib
  wget http://jdbc.postgresql.org/download/postgresql-8.4-703.jdbc4.jar

2. optionnel : enregistrement du driver
  cf : http://jtds.sourceforge.net/faq.html

.. code::

  henplus
  register MSSQL net.sourceforge.jtds.jdbc.Driver jdbc:jtds:sqlserver://server:port/database



3. utilisation du driver

.. code::
  connect jdbc:jtds:sqlserver://VLR:1433/reseau_eau
  connect jdbc:oracle:thin:@dsioracle4:1521:GESCIMEP
  connect jdbc:oracle:thin:@dsioracle3:1523:thotp     (Thot/Thot)
  connect jdbc:postgresql://dsiappli14/ds_siecle/public ds_siecle

4. utilisation avancee de henplus
   cf travail/opendata/export/LisezMoi.txt

2.3. installation de unixodbc
-----------------------------
cf : http://www.easysoft.com/products/data_access/odbc-access-driver/index.html

.. code::

  cd /usr/local
  mkdir easysoft

  cd ~/doc/install/schemaSpy/
  cd odbc-access-1.0.0-linux-x86-glibc
  sudo ./install

  vi /etc/odbcinst.ini
  vi /etc/odbc.ini

  odbcinst -q -s
  odbcinst -q -d


  aptitude install mdbtools

  isql


2.4. Utilisation de henplus
---------------------------

Se mettre dans le bon repertoire : il faut en effet executer henplus à partir du repertoire

.. code::

  ~/travail/openData/export/bin/

qui contient aussi les fichiers 

.. code::

       tables.sql
       create_table_sql.sh
       create_desc.sh
       create_desc2.sh

### connexion à la base de données sql server siecle
       connect jdbc:jtds:sqlserver://DSIBDD02:1433/SIECLEV4 siecle
       sa
       BDD,adm

### connexion à la base de données postgresql ds_siecle
       connect jdbc:postgresql://dsiappli14/ds_siecle/public ds_siecle
       contrib
       alambic

### lister les tables de la base de données
       tables

### sous henplus, on peut aussi executer des requetes dont le resultat est inclus dans un fichier texte
       cf doc sur la commande (spool)

### autres commandes interessantes
       tree-view TABLE
       idescribe TABLE


### execution d'une serie de commandes henplus : "tables.sql"
### dont le but est :
###  - de lister les tables de la base
###  - à partir de cette liste, fabriquer
###   (à l'aide d'un scrip bash "create_table_sql.sh")
###   un nouveau script de commande henplus : "table.sql"
###     - description de chacune de ces tables
###     - dump de chacune de ces tables
###  - execution de ce second script de commande henplus
###  - execution d'un second script bash "create_desc.sh"
###  - et execution d'un troisième script bash "create_desc2.sh"
###    (attention : pour pouvoir etre executé correctement, ce dernier
###    script bash doit etre execute dans un environnement python csvkit)
       @tables.sql ; !./create_table_sql.sh ; @table.sql ; !./create_desc.sh ; !./create_desc2.sh

### à l'issue de cette série de commande,
### on obtient donc, des fichiers dump au sein de laquelle on pourra effectuer des recherches
### cf fichier recherche.sh

### on obtient aussi les fichiers metadata4.csv et metadata5.csv



3. SchemaSpy
------------
Documentation relative à la mise en oeuvre de l'outil SchemaSpy

SchemaSpy est un outil permettant,

 - à partir des paramètres de connexion à une base de données
 - de produire une documentation de cette base au format html

schemaSpy tourne en java
http://schemaspy.sourceforge.net/

schemaSpy utilise graphviz pour la representation graphique des tables et des relations
http://www.graphviz.org/Resources.php

schemaSpyGui est une interface graphique
http://www.joachim-uhl.de/projekte/schemaspygui/

les connexions aux bases de données de font via jdbc (marche pas) ou, mieux, via jtds
cf : http://randomactsofcoding.blogspot.com/2009/01/database-documentation-using-schemaspy.html

Installation de l'outil
-----------------------
Il faut installer schemaSpy dans /home/garel/install/schemaSpy
schemaSpyGui dans le meme repertoire
graphviz (donc ses outils dot, ...) sont dans le path
le driver jtds dans le repertoire /home/garel/install/schemaSpy/jdts-1.2.5-dist/jtds-1.2.5.jar

Utilisation de l'outil en mode graphique
----------------------------------------
exemple : recuperer le schema de la base de données compta
qui est une base de type ms sql server 2005

BD Type = mssql5-jtds
DB Host = VLR
DB name = Compta
BD User = sa
DB Port = 1433
Password = 
Path do DB Driver = /home/garel/install/schemaSpy/jdts-1.2.5-dist/jtds-1.2.5.jar
Path de SchemaSpy = /home/garel/install/schemaSpy/schemaSpy.jar
output directory = /home/garel/public_html/openData/Compta


