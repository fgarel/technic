
***************************************************************
Les différentes bases de données et leurs méthodes de connexion
***************************************************************

Liste des bases de données
==========================

Serveur | Instance | Type | Database | Schema | User | Password

Cette liste se trouve dans geodata\autres\Serveur_base_données.xls

Connexion Type
==============

SchemaSpy, par exemple, est un logiciel java qui a besoin de ce connecter à une base de données grace à un driver qu'il faudra installer sur la machine.

Postgresql
----------
Installation du driver postgresql
sudo aptitude install libpostgresql-jdbc-java

Cela permet de renseigner les infos suivantes dans le premier onglet de schema spy
DBtype : pgsql
DBport : 5432
Path to DB driver : /usr/share/java/postgresql-jdbc4-9.1.jar


Mssql
-----
Installation du driver mssql
sudo aptitude install libjtds-java


Cela permet de renseigner les infos suivantes dans le premier onglet de schema spy
DBtype : mssql05-jtds
DBport : 1433
Path to DB driver : /usr/share/java/jtds.jar

Une subtilité supplémentaire existe pour les bases de données de type MS SQL Server : les instances
Attention, ici, il faut se connecter à une instance.
cela se fait en utilisant un fichier de propriétés.
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

  instance=ATALCTM


