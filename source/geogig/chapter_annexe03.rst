==================================================
Les données initiales et l'installation des outils
==================================================

Les données sont sous forme de fichiers ou stockées dans des bases de données.
Qgis va nous servir à visualiser ces données.

Qgis
====

Actuellement, il y a plusieurs exemples :
Emplacement du fichier qgis                Base de données  Commentaires
/technic/source/geogig/pcrs/PCRS-GML.qgs                    fichiers gml de Strasbourg
/technic/source/qgis/pcrs.qgs              origine          fichiers dxf de la rochelle
/technic/source/geogig/sample.qgs          rtge_VLR         les données sont fabriquées à partir du fihcier calc
/technic/source/geogig/pcrs.qgs            sandbox          Structuration Stricte


Les données fichiers
====================

En ce qui concerne les fichiers, nous avons un lot de données pcrs
sous la forme de plusieurs fichiers gml

Le pcrs au format gml est ici :

.. code::

  ~/Documents/technic/source/geogig/....

Les donnéees topographiques completes, c'est à dire les données RTGE au
format Dxf sont ici :

.. code::

  ~/Documents/technic/source/geogig/....



Postgresql / Postgis
====================

Le serveur est VLR6180Y

Pour chacun des acteurs, nous allons attribuer deux bases de données.

La base origine contient les données tests qui ne sont pas partagées
c'est un peu la base privée de chacun des utilisateurs.

La base sandbox est utilisée lors de la manipulation de geogig.

L'installation de Postgresql et le paramétrage des bases de données
sont réalisés via les scripts :

.. code::

  ~/Documents/install/source/environnementTravail/installPostgresql.sh

  ~/Documents/install/source/environnementTravail/installPostgresqlGeogigGTReseaux.sh


Geogig
======

En ce qui concerne l'outil geogig, il faut distinguer deux choses :

 - l'installation du logiciel
 - la création des commits initiaux


Installation de geogig
----------------------

L'installation est automatisée et détaillée
via l'execution du script

.. code::

  ~/Documents/install/source/geogig/installGeogig.sh




Package GeoSHAPE
================

GeoSHAPE is the integration of a geospatial portal (GeoNode), a web mapping client (MapLoom), and a mobile application (Arbiter), that leverages the infrastructure provided by a geospatial server and database components (The OpenGeo Suite)

http://geoshape.org/

https://docs.google.com/document/d/1KMpk6dXuqvwfEi0pfRpaGY62j6ikoYtpYUPU0sJQAmk/edit

https://github.com/ROGUE-JCTD/rogue_geonode

https://speakerdeck.com/scottevil/distributed-versioned-editing-in-action

http://boundlessgeo.com/2014/03/geogit-and-openstreetmap-for-yolanda/

gestion des conflits
http://garnertb.io/geonode-summit-2014/template#11


Coté serveur
============

Geogig et geoserver
-------------------

A GeoServer extension is available to allow GeoServer to interact with a GeoGig repository and use it as data store. It enables a GeoGig repository to be exposed as a remote for cloning, pushing and pulling as well as via OGC services (WMS/WFS/WMTS etc). Each top level tree in a GeoGig repository corresponds to a GeoServer layer. GeoServer treats a GeoGig repository as a store in much the same way as it does a database.

http://dev.boundlessgeo.com/~groldan/geogig-user-manual/interaction/geoserver_ui.html


Geonode
-------

GeoNode is an open source platform that facilitates the creation, sharing, and collaborative use of geospatial data. http://geonode.org/

http://geonode.org/

https://github.com/GeoNode/geonode

Mais poour le moment, on est en version 2.4....

la version 2.5 promet l'intégration de geogig


Geogig et geonode 2.5
.....................

On y parle aussi d'OSM...

https://github.com/GeoNode/geonode/issues/1931


Coté client
===========

MapLoom
-------

MapLoom is a web mapping client based on OpenLayers 3. It provides full-featured editing capabilities for data stores in GeoServer - including PostGIS and GeoGig. For GeoGig layers, it lets you view history, and sync with other GeoGig repositories

https://github.com/ROGUE-JCTD/MapLoom

https://vimeo.com/106852747
