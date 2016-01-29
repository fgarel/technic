**********************************
Création du jeu de données exemple
**********************************

Dans l'annexe 1 nous avons détaillé l'installation de postgresql et geogig.

Nous allons maintenant utiliser ces outils.

Dans une première partie, nous allons faire des manipulations afin de créer un jeu de données exemples.

Dans une seconde partie, nous allons manipuler ces données à l'aide de l'outil geogig.

Une base de données "origine"
=============================

Une première base de données, que l'on va appeler "origine", va nous servir pour faire nos traitements qui ne sont pas liés à geogig.

Dans cette base de données, nous allons créer des tables qui vont accueillir des données brutes :

 - le jeu exemple qui est fabriqué au départ sous libre office "calc" (!!) est transformé en sql, puis est injecté dans cette base origine
 - le pcrs exemple, récupéré sur le site du cnig, est lui aussi injecté dans cette base.

Injecter des données dans cette base
------------------------------------

Le transfert des données du jeu exemple, de libre office "calc" vers la base origine est détaillé dans le fichier :

.. code::

  ~/Documents/install/source/geogig/installGeogigSample.sh
  
La conversion des fichiers pcrs, récupérés sur le site du cnig, au format gml, vers la base postgreSQL est réalisé via le script :

.. code::

  ~/Documents/install/source/geogig/gmlToPostgis.sh


Manipuler les données, les extraire
-----------------------------------

Un certain nombres de scripts sql vont ensuite être joué afin de sélectionner, en sortie, des données qui seront utilisées dans la deuxième partie de notre procédure de test.

La manipulation des données et l'extraction se fait grace au script :

.. code::

  TODO


Utilisation de geogig
=====================

La création des des dépots initiaux se fait grace au script :

.. code::

  ~/Documents/install/source/geogig/installGeogig2.sh


