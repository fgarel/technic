
***************************************************************
Installation des outils, et premieres connexions
***************************************************************


Dans ce chapitre, nous allons voir comment installer differents utilitaires,
et comment établir nos premières connexions.

Freetds
=======

Freetds et ses utilitiares annexes ont pour but de fournir des clients pour se connecter à une base mssql.

```
sudo apt-get install freetds-common freetds-dev freetds-bin
```

Après cette installation, nous disposons maintenant d'un utiliaire pour se connecter à la base.

Paramétrage de la connesion = > /etc/freetds/freetds.Consulter-les-informations-de-schema
```
vi /etc/freetds/freetds.conf
```

```
[dsibdd01]
  host = dsibdd01.mairie.fr
  port = 1433
  tds version = 7.4
```

Premiers Tests de connexion

```
fisql -S "dsibdd01" -U sa -P BDD,adm
```

Foreign Data Wrapper (entre postresql vers mssql) : extension tds_fdw
=====================================================================

https://github.com/tds-fdw/tds_fdw

Installation
https://github.com/tds-fdw/tds_fdw/blob/master/InstallUbuntu.md

Utilisation
https://www.openscg.com/bigsql/docs/tds_fdw.jsp/
```
-- Creating a Foreign Server
-- https://github.com/tds-fdw/tds_fdw/blob/master/ForeignServerCreation.md

DROP SERVER if exists dsibdd01 cascade;
CREATE SERVER dsibdd01
	FOREIGN DATA WRAPPER tds_fdw
	OPTIONS (servername 'dsibdd01', port '1433', database 'ATAL', tds_version '7.1');


DROP SERVER if exists localhost cascade;
CREATE SERVER localhost
	FOREIGN DATA WRAPPER tds_fdw
	OPTIONS (servername 'localhost', port '1433', tds_version '7.1');


-- Creating a User Mapping
-- https://github.com/tds-fdw/tds_fdw/blob/master/UserMappingCreation.md

CREATE USER MAPPING FOR fred
	SERVER dsibdd01
	OPTIONS (username 'sa', password 'BDD,adm');


CREATE USER MAPPING FOR fred
	SERVER localhost
	OPTIONS (username 'sa', password 'Mie3Asie');

-- Creating a Foreign Table
-- https://github.com/tds-fdw/tds_fdw/blob/master/ForeignTableCreation.md

CREATE FOREIGN TABLE "Article_Equivalent" (
	code_ar integer,
	code_article integer,
	code_article_equivalent integer,
	upsize_ts date)
	SERVER dsibdd01
	OPTIONS (schema_name 'dbo', table_name 'Article_Equivalent', row_estimate_method 'showplan_all');

select * from "Article_Equivalent";
```


La connexion via python et le module pymssql
============================================

cf ./bin/database/


L'outil officiel de microsoft (pour memoire)
============================================

La doc est ici

https://docs.microsoft.com/fr-fr/sql/linux/quickstart-install-connect-ubuntu

Après installation, la connexion se fait comme ceci
```
/opt/mssql-tools/bin/sqlcmd -S "dsibdd01" -U sa -P BDD,adm
```

```
/opt/mssql-tools/bin/sqlcmd -S "dsibdd01" -U sa -P Mi...ie
```


henplus
=======

henplus, est vieux (!?), mais il peut encore nous rendre des services
doc :
http://henplus.sourceforge.net/
https://github.com/neurolabs/henplus

Nous allons l'installer dans le repertoire
~/Install/henplus

```
cd ~/Install
```

```
git clone https://github.com/neurolabs/henplus
cd henplus
./debian-install.sh
```

Apres le clonage du depot, il faut aller modifier le fichier debian-install.sh

```
vi ~/Install/henplus/debian-install.sh
```

Il faut ajouter *" | head -1"* dans 2 endroits,
c'est à dire, remplacer la commande suivante

```
cd $(find ${WORKDIR} -mindepth 1 -type d)
```
par

```
cd $(find ${WORKDIR} -mindepth 1 -type d | head -1)
```

Il faut installer
 gcj-jdk
 libreadline-java
 ant
 libcommons-cli-java
 javahelper
 openjdk-8-jdk

```
sudo apt-get install gcj-jdk libreadline-java ant libcommons-cli-java javahelper openjdk-8-jdk
```

Il faut aussi declarer la variable d'environnement JAVA_HOME

```
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
```

On peut alors lancer la creation du paquet et son installation avec la commande

```
./debian-install.sh
```

Attention, il faut recopier les drivers dans le repertoire :
(pour l'installation en elle-même des divers, cf paragraphe schemaspy ci-dessous)
```
~/.henplus/lib
```

```
cp /usr/share/java/jtds* ~/.henplus/lib/
```

Il faut aussi enregister ce driver :

```
henplus
register MSSQL net.sourceforge.jtds.jdbc.Driver jdbc:jtds:sqlserver://server:port/database
```

On peut enfin se connecter :

```
connect jdbc:jtds:sqlserver://dsibdd01:1433/ATAL
sa BDD,adm
```

On detaille l'utilisation de henplus au chapitre 5.

SchemaSpy et SchemaSpyGui
=========================

SchemaSpy est un outil permettant,

 - à partir des paramètres de connexion à une base de données
 - de produire une documentation de cette base au format html

SchemaSpy tourne en java
http://schemaspy.sourceforge.net/

SchemaSpy utilise graphviz pour la representation graphique des tables et des relations
http://www.graphviz.org/Resources.php

SchemaSpyGUI est une interface graphique
http://www.joachim-uhl.de/projekte/schemaspygui/

Les connexions aux bases de données de font via jdbc (marche pas) ou, mieux, via jtds
cf : http://randomactsofcoding.blogspot.com/2009/01/database-documentation-using-schemaspy.html


Téléchargement et Installation de SchemaSpy dans ~/Install/schemaspy
http://schemaspy.org/

Installation de SchemaSpyGui dans ~/Install/schemaSpy/schemaSpyGui
Décompression du zip
Rendre le shell executable
chmod +x schemaSpyGUI.sh

Installation de graphviz

Installation du driver postgresql
---------------------------------

Installation du driver postgresql
```
sudo aptitude install libpostgresql-jdbc-java
```

Cela permet de renseigner les infos suivantes dans le premier onglet de schemaspyGUI
DBtype : pgsql
DBport : 5432
Path to DB driver : /usr/share/java/postgresql-jdbc4.jar


Installation du driver mssql
----------------------------

Installation du driver mssql
```
sudo aptitude install libjtds-java
```

Cela permet de renseigner les infos suivantes dans le premier onglet de schemaspyGUI
DBtype : mssql05-jtds
DBport : 1433
Path to DB driver : /usr/share/java/jtds-1.2.5.jar



Installation de unixodbc (toujours utile ??)
--------------------------------------------
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


Mise à jour du fichier schemaSpy.css
------------------------------------

Attention, sans cette mise à jour, nous avons une erreur lorsque l'on execute
SchemaSpy.
Cette erreur (que l'on pouvait croire liée à graphviz ?), est simplement due au fichier css.

```
background non defini pour .diagram
```

Il faut donc recuperer le fichier qui est ici :

```
https://github.com/schemaspy/schemaspy/blob/master/src/main/resources/layout/schemaSpy.css
```

Et le mettre là :

```
/home/fred/Install/schemaspy/schemaSpyGUI20090302/schemaSpy2.css
```


Connexion a la base Atal avec SchemaSpyGUI
==========================================

Auparavant, SchemaSpy devait completer sa configuration avec un fichier de properties.
(cf chapitre 1).
Aujourd'hui, il semble que ce fichier est optionnel.

Les lignes ci-dessous sont donc pour memoire...

-- Attention, ici, il faut se connecter à une instance.
-- Cela se fait en utilisant un fichier de propriétés.
--  Il faut :
--  - renseigner ce fichier de propriétés
--  - dans le premier onglet, pointer ce fichier de propriété.

-- Le fichier de proprieté est décrit au chapitre 1

On peut maintenant lancer l'interface graphique SchemaSpyGUI

```
cd ~/Install/schemaspy/schemaSpyGUI20090302/
./schemaSpyGUI.sh
```

Voici les paramètres à renseigner

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


Weka (waikato environment for knowledge analysis)
=================================================
https://fr.wikipedia.org/wiki/Weka_(informatique)
https://www.cs.waikato.ac.nz/ml/weka/index.html
https://www.cs.waikato.ac.nz/ml/weka/documentation.html
http://weka.wikispaces.com/Databases
