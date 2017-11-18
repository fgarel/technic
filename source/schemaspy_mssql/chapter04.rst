
*****************************************************
Utilisation de SchemaSpy pour documenter la base ATAL
*****************************************************

Un outil pour analyser une base
===============================

Le souhait de départ est d'anlyser la base de données ATAL

L'analyse de la base de données peut se faire à partir de deux utilitaires :
 - sous windows, Microsoft SQL Server Management Studio
 - sous linux, SchemaSpy



Premieres utilisations de SchemaSpyGui
======================================

Essai avec une base de données de type postgresql
-------------------------------------------------

Serveur brulhois
++++++++++++++++

Paramètrage du premier onglet
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

Serveur dsibdd01, Instance dsibdd01\MSSQLSERVER, base ATAL
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

Attention, ici, il faut se connecter à une instance.
cela se fait en utilisant un fichier de propriétés.
Il faut :
  - renseigner ce fichier de propriétés
  - dans le premier onglet, pointer ce fichier de propriété.

```
Paramètrage du premier onglet
DBtype : mssql05-jtds
DBhost : dsibdd01
DBport : 1433
DBName : ATAL
DBUser : sa
DBPass : BDD,adm
Path to DB driver : /usr/share/java/jtds-1.2.5.jar
Path to schemaspy : /home/fred/Install/schemaspy/schemaspy-6.0.0-rc2.jar
-- Path to Propertie File : /home/fred/Install/schemaspy/schemaSpyGUI20090302/properties/jtds.properties
Flags : No Logo
Quality Image Diagrams : High Quality
Quality Image Diagrams : Low Quality

Paramètrage du deuxième onglet
Output directory : /home/fred/Documents/technic/source/schemaspy_mssql/data/dsibdd01_mssql_atal3
Schema to Explore : superdvlp
charset : utf-8
Style css file : /home/fred/Install/schemaspy/schemaSpyGUI20090302/schemaSpy2.css
```


Le resultat est ici

```
file:///home/fred/Documents/technic/source/schemaspy_mssql/data/dsibdd01_mssql_atal3/index.html
```
