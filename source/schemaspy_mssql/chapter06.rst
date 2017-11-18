
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
 - csvkit est un ensemble de petits utilitaires permettant de manipuler aisement des fichiers au format csv

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
   mettre les drivers dans le repertoire ~/.henplus/lib
   par exemple :

.. code::

  cd ~/.henplus/lib
  cp /usr/share/java/jtds* ~/.henplus/lib/
  wget http://jdbc.postgresql.org/download/postgresql-8.4-703.jdbc4.jar

2. optionnel : enregistrement du driver
  cf : http://jtds.sourceforge.net/faq.html

.. code::

  henplus
  register MSSQL net.sourceforge.jtds.jdbc.Driver jdbc:jtds:sqlserver://server:port/database



3. utilisation du driver

.. code::
  connect jdbc:jtds:sqlserver://dsibdd01:1433/ATAL
  connect jdbc:jtds:sqlserver://VLR:1433/reseau_eau
  connect jdbc:oracle:thin:@dsioracle4:1521:GESCIMEP
  connect jdbc:oracle:thin:@dsioracle3:1523:thotp     (Thot/Thot)
  connect jdbc:postgresql://dsiappli14/ds_siecle/public ds_siecle

4. utilisation avancee de henplus
   cf travail/opendata/export/LisezMoi.txt




2.4. Utilisation de henplus
---------------------------

Se mettre dans le bon repertoire : il faut en effet executer henplus à partir du repertoire

.. code::

  ~/travail/openData/export/bin/
  cd ~/Documents/technic/source/schemaspy_mssql/bin/

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
