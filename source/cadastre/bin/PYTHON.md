Le script csv2db.sh a ete adapté en python
il permet de :
lire un fichier csv
ecrire dans une base de donnée et y faire des traitments
d'exporter les points dans un fichier de sortie


Environnement d'execution
=========================
Pour pouvoir être executé, il faut être dans un environnement particulier

    workon csv2db
    pip freeze

Les paquets a voir sont :

    psycopg2
    sqlalchemy
    geoalchemy

Les différents scripts
======================

Plusieurs scripts composent ce modules :

connection.py contient les informations pour la connection à la base de données
model.py contient le modele de la base de donnnées qui correspond au dictionnaire trimble
csv2db.py prend en entrée un ou plusiseurs fichiers csv et envoi les infos sous postgresql

Attention, par la suite, il faut executer csv2db_update.sh qui permet de transformer les
données non-géographiques en attribut 'the_geom'


Exploitation des données
========================
Les données peuvent ensuite etre exploitées dans différents logiciels


Postgis
-------

Qgis
----

Tilemill
--------

