************
Introduction
************

Le but est de generer un catalogue du patrimoine

Pour chaque patrimoine, nous allons essayer de générer des images.

Ces images seront ensuite insérés dans le catalogue (l'atlas)

Deux techniques :

 - utilisation de mapquest
 - utilisation de mapnik

nous utiliserons mapnik.

Presentation générale
=====================

Pour ce catalogue, cet atlas, nous souhaitons générer de manière industrielle des extraits de plan.

Ainsi, pour chacun des sites, nous voulons générer un plan de situation (base osm), 
un extrait de la photo aérienne, un extrait de plan cadastral, etc..

Pour générer ces différents plans nous allons :

  - mettre en place les différentes briques logicielles nécessaires
  - récuperer les données et les arranger pour les utiliser
  - réaliser un script qui va générer ces différents plans

Une fois que ces plans seront générés, nous utiliserons latexbd pour formater le document final : un atlas correctement mis en page.

Nous pourrons aussi utiliser un site web pour consulter les infos.

Découpage de la documentation
=============================

Nous allons essayer de donner un plan. et pour donner ce plan, nous proposons de dérouler les traitements :
Pour générer les plans, nous avons besoin de données qui doivent donc être stockées dans des bases de données.
Ces données sont utilisés par un moteur, mapnik,
selon des styles de représentation,
grace à un script maison que nous commenterons à la fin.

Au premier chapitre, nous allons commencer par installer les outils permettant de manipuler
les données d'OpenStreetMap afin de les injecter dans une base de données postgresql

Au second chapitre, nous nous focaliserons sur la préparation de ces données initiales.

Au troisième chapitre, nous étudierons l'installation de mapnik et de quelques outils complémentaires.

Au quatrième chapitre, nous détaillerons le script python que nous utilisons pour la génération automatique des plans.


Nous allons avoir besoin d'un serveur de base de données local (pg_host_carto) qui va stocker les données osm.

Nous allons aussi puiser les infos dans un autre serveur de base de données (pg_host_vlr) pour les données du cadastre/

Nous utiliserons la photo aérienne pour 

