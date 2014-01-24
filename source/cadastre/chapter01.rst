
***************************************************
Transfert des données littérales en base de données
***************************************************

Dans la documentation qgis, on aborde l'existence d'un plugin permettant la manipulation des fichiers littéraux

Cependant, ici, nous nous interesserons plus à l'import manuel

Ecrit en shell, ces petits utilitaires forment un ensemble dédié à la manipulation des données cadatsrales

Preparation de l'environnement
==============================

Les donnes initiales, c'est à dire les 6 fichiers MAJIC sont mis dans le repertoire data1/ini/ avec l'extension sav
(les fichiers .txt sont recopiés en .sav)

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

Les fichiers de la dgfip sont decoupés en plusieurs fichiers csv
En effet, un fichier contient plusieurs articles de type différents.
Le fichier bati contient des articles 21, des articles 40, des articles 50,...
Il est eclaté et chacune de ses lignes est ventilée
en fonction du numero d'article


Du repertoire data/ini vers data/head
-------------------------------------
Des fichers de paramètrage (de configuration) permettent de définir la structure des tables, c'est a dire, le nom des colonnes, leurs longueurs.

Ces fichiers sont actuellement lu par un script shell qui en fait des commandes sql.
On pourrait très bien imaginé dans un futur proche créer des scripts python qui liraient ces mêmes fichiers pour en faire des fichiers model.py que l'on pourait ensuite utiliser avec sqlalchemy.

Du repertoire data/ini vers data/foot
-------------------------------------
Les fichiers de configuration sont mis dans le sous-repertoire head.
Le "head", c'est l'emplacement des en-têtes, tandis que le "foot", c'est celui des données.

Des scripts shell (dans le repertoire /bin) permettent donc de lire les fichiers majic pour les ventiler en fichier "foot"

Des scripts sql et un orchestration shell
-----------------------------------------
Les scripts shell qui sont la aussi pour jouer des instructions sql (dans le repertoire /bin/sql)

Lancement du l'import
=====================
Il suffit de lancer 00_all.sh
