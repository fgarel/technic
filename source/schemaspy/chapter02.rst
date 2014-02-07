
****************************************
Installation et Utilisation de SchemaSpy
****************************************

Un outil pour analyser une base
===============================

Le souhait de départ est d'anlyser la base de données ATAL

L'analyse de la base de données peut se faire à partir de deux utilitaires : 
 - sous windows, Microsoft SQL Server Management Studio
 - sous linux, SchemaSpy


Les paramètres de connexions à ATAL
-----------------------------------
Server   : DSIBDD03
Instance : DSIBDD03\ATALCTM
Username : superdvlp
Password : axtsd
Database : atalv5_production

Server   : DSIBDD03
Instance : DSIBDD03\ATALCTM
Username : sa
Password : BDD,adm
Database : atalv5_production

Server   : DSIBDD03
Instance : DSIBDD03\ATALCTM
Username : superdvlp
Password : axtsd
Database : ATALV5_TEST


Installation de SchemaSpy et d'une interface graphique
======================================================
Téléchargement de SchemaSpy

Téléchargement de SchemaSpyGui
Décompression du zip
Rendre le shell executable
chmod +x schemaSpyGUI.sh

Installation de graphviz


Installation des drivers de connexion
-------------------------------------

Installation du driver postgresql
sudo aptitude install libpostgresql-jdbc-java

Installation du driver mssql
sudo aptitude install libjtds-java


Premieres utilisations de schema Spy
====================================

Essai avec une base de données de type postgresql
-------------------------------------------------

Serveur debian
++++++++++++++

Paramètrage du premier onglet
DBtype : pgsql
DBhost : 10.2.10.56
DBport : 5432
DBName : patrimoine
DBUser : contrib
DBPass :
Path to DB driver : /usr/share/java/postgresql-jdbc4-9.1.jar
Path to schemaspy : /home/fred/Install/schemaspy/schemaSpy_5.0.0.jar

Serveur dynmap
++++++++++++++

Paramètrage du premier onglet
DBtype : pgsql
DBhost : 10.254.140.139 = dsibdd09
DBport : 5432
DBName : eclairagepublic
DBUser : sig
DBPass : Mie3Bhoutan
Path to DB driver : /usr/share/java/postgresql-jdbc4-9.1.jar
Path to schemaspy : /home/fred/Install/schemaspy/schemaSpy_5.0.0.jar


Essai avec une base de données de type MSSQL
--------------------------------------------

Serveur VLR, base Associations
++++++++++++++++++++++++++++++

Paramètrage du premier onglet
DBtype : mssql05-jtds
DBhost : 10.254.140.125 = vlr
DBport : 1433
DBName : Associations
DBUser : sa
DBPass : ""
Path to DB driver : /usr/share/java/jtds.jar
Path to schemaspy : /home/fred/Install/schemaspy/schemaSpy_5.0.0.jar

Paramètrage du deuxième onglet
Schema to Explore : dbo

Serveur dsibdd03, Instance dsibdd03\ATALCTM, base atalv5_production
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Attention, ici, il faut se connecter à une instance.
cela se fait en utilisant un fichier de propriétés.
Il faut :
  - renseigner ce fichier de propriétés
  - dans le premier onglet, pointer ce fichier de propriété.

Paramètrage du premier onglet
DBtype : mssql05-jtds
DBhost : 10.254.140.116 = dsibdd03
DBport : 1433
DBName : atalv5_production
DBUser : superdvlp
DBPass : 
Path to DB driver : /usr/share/java/jtds.jar
Path to schemaspy : /home/fred/Install/schemaspy/schemaSpy_5.0.0.jar
Path to Propertie File : /home/fred/Install/schemaspy/schemaSpyGUI20090302/properties/jtds.properties

Paramètrage du deuxième onglet
Schema to Explore : superdvlp

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

  instance=ATALCTM
