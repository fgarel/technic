################################################
Automatisation de l'impression des réponses DICT
################################################

******
Intro
******

Chaque DICT contient un polygone d'emprise au format gml.

Ce polygone d'emprise va nous servir pour l'automatisation de la réponse.

#. Copier/coller ce code xml dans un fichier que l'on appelle sample.gml
#. Modifier ce fichier sample.gml de façon a ce qu'il fonctionne avec ogr
#. Utiliser cette emprise pour la génération d'un plan

Modification du fichier gml
===========================

Le fichier qui contient le presse-papier a ete enregistré sous sample.gml

Sa syntaxe brute est la suivante :
Il contient des "scories" (retour chariot) et sa syntaxe n'est pas reconnu par ogr2ogr

Les fichiers qui sont reconnu par ogr sont :
sampleqgis.gml
sampleqgis.xsd

le fichier xsd définit une featurecollection, une entité "emprise" et une geometryProperty

Il faut donc passer du fichier sample.gml au fichier sampleqgis.gml

.. code::
  
  ogrinfo sampleqgis.gml emprise
