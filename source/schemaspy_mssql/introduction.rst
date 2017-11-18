
************
Introduction
************

Un certain nombre de serveurs de bases de données existent.
Les moteurs sont de plusieurs types (oracle, ms sql server, postgresql, ....)
Les bases de données sont découpés en schémas, et bien souvent la structuration de ces données n'est pas connu....
Le but est de trouver les utilitaires qui vont nous permettre d'analyser ces bases de données

L'analyse se fera grace à quelques utilitaires, dont schemaspy et freetds, pymssql et henplus.

Après avoir listé les différentes bases, Nous verrons donc, l'installation et l'utilisation de ces utilitaires.

Nous allons prendre un cas concret : l'analyse de la base ATAL qui se trouve sur le serveur DSIBDD01.

freetds, pymssql et henplus va nous permettre d'interroger la base et de consulter les données à partir de linux.
schemaspy (et schemaspygui) va nous permettre de decouvrir la structuration de la base de données.


Dans la chapitre 1, nous allons présenter nos bases de données et la facon de s'y connecter

Au chapitre 2, nous allons détailler l'installation des outils et décrire les premières connexions

Au chapitre 3, nous allons détailler l'usage de freetds, un petit utilitaire capable de se connecter a une base de données mssql
Nous allons nous en servir pour explorer le serveur DSIBDD01

Au chapitre 4, nous allons présenter schemaspy, et son utilisation.
Nous allons nous servir de cet outil pour documenter la base ATAL

Au chapitre 5, nous allons completer l'exploration, avec l'interrogation des données

Au chapitre 6, nous allons voir l'automatisation (henplus, programmantion python, stetl, ...)
