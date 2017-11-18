
***************************************************************
Les différentes bases de données et leurs méthodes de connexion
***************************************************************

Liste des bases de données
==========================

Serveur | Instance | Type | Database | Schema | User | Password

Cette liste se trouve dans ~/f/CARTOGRAPHIE/Agents/Fred/geodata/autres/Serveur_base_données.xls

Comment mettre à jour cette lilste de serveur ?
exploration nmap ?
cf aussi /mnt/dsiappli41/logicielsMairie/Adreesage\ reseau/\@ip.xlsx
et ssh_scan


Base Mssql : ATAL
-----------------

DBType   : mssql05-jtds
DBHost   : DSIBDD01
DBPort   : 1433
DBName   : ATAL
DBUser   : sa
DBPass   : BDD,adm
Path to DB driver : /usr/share/java/jtds.jar
Path to SchemaSpy : /home/fred/Install/schemaspy/schemaSpy_6.0.0-rc2.jar
Output directory  : /home/fred/Documents/technic/source/schemaspy_mssql/data/dsidbb01_mssql_atal
Schema/s : superdvlp
Style CSS file    : /home/fred/Install/schemaspy/schemaSpyGUI20090302/schemaSpy2.css


Server   : DSIBDD01
Instance : DSIBDD01\MSSQLSERVER
Database : ATAL
Username : sa
Password : BDD,adm


Server   : DSIBDD01
Instance : DSIBDD01\MSSQLSERVER
Database : ATAL
Username : superdvlp
Password : axtsd


Server   : DSIBDD01
Instance : DSIBDD01\MSSQLSERVER
Database : ATALTEST
Username : superdvlp
Password : axtsd

Base mysql : e-atal
-------------------

DBtype   : mysql
DBHost   : dsiappli23.mairie.fr || dsibdd03.mairie.fr
DBport   :
DBName   : sig
DBUser   : root
DBPass   : s21
Path to DB driver : /usr/share/java/mysql.jar
Path to schemaspy : /home/fred/Install/schemaspy/schemaSpy_6.0.0-rc2.jar
Output directory  : /home/fred/Documents/technic/source/schemaspy_mssql/data/dsiappli23_mysql_eatal
Schema/s :
Style CSS file    : /home/fred/Install/schemaspy/schemaSpyGUI20090302/schemaSpy2.css



Base postgresql : cadastre
--------------------------

DBtype   : pgsql
DBHost   : 172.17.150.6
DBport   : 5432
DBName   : sig
DBUser   : frederic.garel
DBPass   :
Path to DB driver : /usr/share/java/postgresql-jdbc4-9.1.jar
Path to schemaspy : /home/fred/Install/schemaspy/schemaSpy_6.0.0-rc2.jar
Output directory  : /home/fred/Documents/technic/source/schemaspy_mssql/data/brulhois_postgresql_c_cadastre
Schema/s : c_cadastre
Style CSS file    : /home/fred/Install/schemaspy/schemaSpyGUI20090302/schemaSpy2.css

DBtype   : pgsql
DBHost   : 172.17.150.6
DBport   : 5432
DBName   : sig
DBUser   : postgres
DBPass   : P0stres$
Output directory  : /home/fred/Documents/technic/source/schemaspy_mssql/data/brulhois_postgresql_c_imacad
Schema/s : c_imacad
Style CSS file    : /home/fred/Install/schemaspy/schemaSpyGUI20090302/schemaSpy2.css


Connexion Type
==============

Il y a plusieurs types de bases de données, et il faut donc installer plusieurs
drivers en fonction de ces types de bases.

SchemaSpy, par exemple, est un logiciel java qui a besoin de ce connecter à une
base de données grace à un driver qu'il faudra installer sur la machine.

Postgresql
----------

Installation du driver postgresql
```
sudo aptitude install libpostgresql-jdbc-java
```

Cela permet de renseigner les infos suivantes dans le premier onglet de schema spy
DBtype : pgsql
DBport : 5432
Path to DB driver : /usr/share/java/postgresql-jdbc4.jar


Mssql
-----
Installation du driver mssql
```
sudo aptitude install libjtds-java
```

Cela permet de renseigner les infos suivantes dans le premier onglet de schema spy
DBtype : mssql05-jtds
DBport : 1433
Path to DB driver : /usr/share/java/jtds-1.2.5.jar


Configuration obsolete (?)
--------------------------

Auparavant, en plus de l'installation du driver pour mssql, il fallait aussi
ajouter un fichier de propriété.

Pour info, nous avons laisser ce fichier de configuration ci-dessous, mais aujourd'hui,
l'utilisation de SchemaSpy ne fonctionne pas avec ce fichier de configuration (properties)
Au contraire, il ne faut pas utiliser de fichier de properties !

---
---

Une subtilité supplémentaire existe pour les bases de données de type MS SQL Server : les instances
Attention, ici, il faut se connecter à une instance.
Cela se fait en utilisant un fichier de propriétés.
Il faut :
  - renseigner ce fichier de propriétés
  - dans le premier onglet, pointer ce fichier de propriété.

Path to Propertie File : /home/fred/Install/schemaspy/schemaSpyGUI20090302/properties/jtds.properties

Extrait de /home/fred/Install/schemaspy/schemaSpyGUI20090302/properties/jtds.properties

.. code::

  #
  # see http://schemaspy.sourceforge.net/dbtypes.html
  # for configuration / customization details
  #

  description=Microsoft SQL Server JTDS

  # use majority of settings in mssql.properties:
  extends=mssql

  # JTDS-specific differences from settings in mssql.properties:
  connectionSpec=jdbc:jtds:sqlserver://<host>:<port>;databaseName=<db>;progName=schemaSpy
  driver=net.sourceforge.jtds.jdbc.Driver

  # Sample path to the jtds drivers.
  # Use -dp to override.
  #driverPath=./jtds-1.2.jar
  driverPath=/usr/share/java/jtds-1.2.5.jar

  #instance=ATALCTM
  instance=MSSQLSERVER
