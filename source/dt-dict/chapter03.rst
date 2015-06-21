********************************************************
Chapitre 3 : L'automatisation de la génération des plans
********************************************************

Chaque DICT contient un polygone d'emprise au format gml.

Ce polygone d'emprise va nous servir pour l'automatisation de la réponse.

Ce polygone d'emprise est à imprimer en entier,
si besoin en utilisant des folios (cases) qui forment un quadrillage prédéfini.

Dans la suite de ce document, nous allons étudier,
dans une première partie,
commment fabriquer un quadrillage prédéfini.
(les folios d'erdf serviront de base)

Dans une seconde partie, nous détaillerons la manipulation pour l'utilisateur

Dans une troisième partie, nous etudierons la procédure permettant l'extraction du
polygone d'emprise à partir du fichier dt-dict.pdf

Enfin, dans une quatrième partie, nous verrons comment automatiser la génération
des plans pour la zone de la dt-dict selon les formats folio prédéfinis.


Les folios, les cases d'Erdf
============================
les fichiers sont dans le repertoire ~/geodata/DCE/Levetopo/dce_edf/


Description de la procédure pour l'utilisateur
==============================================
La dict est au format pdf et se nomme document.pdf
Elle est sauvegardée dans le réperoire courant.

l'execution du script do_all.sh va réaliser deux opérations.

La première opération, c'est d'extraire la géométrie de l'amprise et de la stocker dans un format lisible par qgis.
le fichier en sortie s'appelle empriseDeclarationQgis3946.shp

La seconde opération, c'est de générer les différentes cartes en utilisant un script python
capable d'interagir avec qgis, et plus particulierement avec les concepts de composition (mise en page) et d'atlas (folios)

Extraction de l'emprise géographique à partir du pdf
====================================================

La première partie du script do_all.sh, c'est de la manipulation de fichier pdf.

Ce traitement est confié au script pdf2txt.sh.

Il faut noter que pour fonctionner, il faut installer l'utilitaire qpdf qui permet de rendre le fichier pdf intelligible
Ensuite, un simple parsing du fichier pdf permet d'extraire des coordonnées,
mais qui ne sont pas lisibles directement par ogr ou qgis.
Aussi, il faut faire un peu de nettoyage sur ces coordonnées, ajouter un en-tete et une fin de fichier,
alors on obtient un fichier appelé empriseDeclarationQgis4326.gml qui sera cette fois ci lisible par ogr2ogr.

l'ancienne procédure ci-dessous n'est plus valable :

  #. Copier/coller ce code xml dans un fichier que l'on appelle sample.gml
  #. Modifier ce fichier sample.gml de façon a ce qu'il fonctionne avec ogr
  #. Utiliser cette emprise pour la génération d'un plan

  Le fichier qui contient le presse-papier a ete enregistré sous sample.gml

  Sa syntaxe brute est la suivante :
  Il contient des "scories" (retour chariot) et sa syntaxe n'est pas reconnu par ogr2ogr

  Les fichiers qui sont reconnu par ogr sont :
  sampleqgis.gml
  sampleqgis.xsd

  le  afichier xsd définit une featurecollection, une entité "emprise" et une geometryProperty

  Il faut donc passer du fichier sample.gml au fichier sampleqgis.gml

  .. code::
    
    ogrinfo sampleqgis.gml emprise

Génération automatique de plans avec QGIS et Atlas
==================================================
Nous avons les différentes informations géographiques.
Nous pouvons étudier la génération automatique des plans avec Qgis,
le composeur d'impression, l'atlas et les scripts python.

Cette partie est détaillée sur cloud.sagemath.com
dans le fichier Qgis_et_Atlas.md
