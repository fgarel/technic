
************
Introduction
************


Nous avons des données tabulaire (fichier excel, ou fichier csv) et nous souhaitons :

 - les manipuler à l'aide de python
 - les importer sous postgresql
 - ...
  
Lire un fichier en entrée et ecrire un fichier en sortie
========================================================
Un petit script python qui fait ça, c'est lecture_csv.py

Utilisation de csv vers postgresql
==================================

Commençons par les genéralités :

 - il faut allumer le serveur hébergeant une base postgresql, et recupérer les identifiants de connexion ;
 - modifier le fichier connexion.py avec les nouveaux paramètres

Le cas des fichiers Excel
=========================

Les fichiers excel etant largement repandu, il s'agit de completer la manipulation précédente en ajoutant la possibilité de lire des fichiers excel

Cette possibilité est offerte, soit en utilisant :
 - la librairie pandas : http://pandas.pydata.org/
 - un outil comme openrefine : http://openrefine.org/


