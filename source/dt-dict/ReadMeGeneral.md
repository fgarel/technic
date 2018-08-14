# Point de vue général pour l'automatisation des taches liées au DICT

## Réception de la demande par mail

Nous recevons la demande par mail.
Automatiquement, la demande doit être traduite en instruction pour :
 - construire les plans réponses
 - construire les récépissés

pieces jointes récupérées, extraites analysées et ventilées vers d'autres processus

procmail ou python avec librairie imap, pop

cf install/source/environnementTravail/watchdtdict_emission

On souhaite enregistrer aussi les infos pour le message réponse (fabrication du récépissé)

### Filtrage des mails, redirection
La doc sur le filtrage des mails avec python et procmail peut être trouvée ici :

https://www.bggofurther.com/fr/2018/04/using-procmail-with-custom-python-script/

https://stackoverflow.com/questions/14676375/pipe-email-from-procmail-to-python-script-that-parses-body-and-saves-as-text-fil

https://gist.github.com/leifdenby/a85a487bf537ac6ae045

### Surveillance d'un repertoire
install/source/environnementTravail/watchdtdict_emission


## Lecture du XML et Intégration de la géométrie de l'empriseTravaux
Le fichier XML qui est fourni avec la demande contient toute les informations.
Il faut donc lire ce fichier xml. Nous utiliserons la librairie python lxml.etree
Une fois que le Xml a été lu, alors nous aurons un objet surfacique empriseTravaux qui sera stocké dans la base postgresql

cd ReadMeXml2Psql.md

Le but est d'arriver à fabriquer un fichier EmpriseTravaux.gml intégrable dans la base postgresql dbworkspace
table EmpriseTravaux

## Fabrication de la géométrie des cases (ou folios)
A partir de cet objet surfacique EmpriseTravaux, nous allons fabriquer des cases
(folios) dont la géométrie sera calculée au mieux pour englober l'emprise travaux

Pourquoi avons nous besoin de cases ?
 - empriseEchangePCRS, pour l'échange de fichier gml ou geogig
 - pour l'impression au format A0, A1, A2, A3 ou A4

Nous allons donc présenter les différentes dimensions possibles que nous avons retenues pour ces cases, avec un système de nommage pour ces cases. (A1 et A2)

Puis nous allons regarder nos premières ébauches, c'est à dire ce qui a déjà été automatisé pour cette génération de cases (B1)

Nous envisagerons l'utilisation de la topologie pour ce type de géométrie (C1)

Nous parlerons d'algorithme de placement (D1 et D2)

Et enfin, nous aborderons l'utilisation de geopandas (python et dataframe) pour le codage de cette fonctionnalité sous python

### A1. Les différents types de cases
cf ReadMeFolio.md

le but est de fabriquer plusieurs types de cases

Il y a les cases type Enedis qui sont fixes :
un seul format (), point d'insertion par pas, pas de rotation
Paysage = 140 x 100
L'usage est = A1 ; 00200

il y a des cases type Extended Enedis qui sont fixes
Plusieurs formats (facteur d'echelle), point d'insertion par pas (translation), pas de rotation

Il y a des cases type flottantes
Plusieurs formats, point d'insertion libre, pas de rotation

Il y a des cases libres
plusieurs formats, point d'insertion libre, rotation libres

### A2. Des fichiers excel pour lister des dimensions de Cases
technic/source/dt-dict/mise_en_page.ods
technic/source/dt-dict/mise_en_page_v2.ods
install/source/pcrs/bin/format_et_notation.ods

### B1. Les scripts caseFabric.py et 02_casePrepare.py
technic/source/dt-dict/caseFabric.py
install/source/pcrs/bin/02_casePrepare.py

### C1. Utilisation de la topologie
install/source/pcrs/bin/sql/99_topologycase.sql

## Intersection entre géométrie des cases de et géométrie de l'EmpriseTravaux

### D1. Des algorithmes de placement
https://tel.archives-ouvertes.fr/tel-00468463/document
https://tel.archives-ouvertes.fr/tel-00468463/file/PhD_Jacquenot_2010_01_18_Layout_optimization_Presentation_HO.pdf
https://github.com/Gjacquenot
https://tel.archives-ouvertes.fr/tel-00006893/file/tel-00006904.pdf

### D2. Un algorithme simplifié

Calcul de la surface de l'emprise EmpriseTravaux
calcul du nombre minimum de cases pour couvrir cette surface
 - on prend le format d'impression maximum (par exemple A2)
   pour du A2, pour du 200, pour du A2, on peut avoir du 525x375, c'est à dire 105mx75, c'est à dire x m2

calcul



- 001 : on initialise une première case, au centre de l'empriseTravaux, orientation 0 (plein nord)
        => X0 et Y0
- 0011 : à partir de cette première case, on étend de façon à couvrir l'emprise :
         - à l'ouest, à l'est,
           On compte le nombre de cases pour la rangée, on mesure les distances
             - (xmax des cases - xmax bb empriseTravaux)
             - (xmin des cases - xmin bb emprise Travaux)
              pour X0, (rangée 0) => deltaXmin et deltaXmax
         - au nord, au sud (pas de décalage en x, c'est à dire pas de décalage entre les cases de la rangé n et de la rangé n+1),
           On élimine les cases vides, on compte le nombre de cases, on mesure les distances
             - (ymax des cases - ymax bb empriseTravaux)
             - (ymin des cases - ymin bb emprise Travaux)
              pour Y0, (rangée 0) => deltaYmin et deltaYmax
- 0012 : à partir de cette première case, on étend de façon à couvrir l'emprise :
         - à l'ouest, à l'est
           On compte le nombre de cases pour la rangée, on mesure les distances
             - (xmax des cases - xmax bb empriseTravaux)
             - (xmin des cases - xmin bb emprise Travaux)
             pour X0, (rangée 0) => deltaXmin et deltaXmax
             pour une rangée donnée, on fait en sorte que deltaXmin se rapproche de deltaYmin
        - au nord, au sud (décalage de chaque rangé en x, c'est à dire décalage entre les cases de la rangé n et de la rangé n+1),
          pour Xn, (rangée n) => deltaXmin et deltaXmax
          pour une rangée donnée, on fait en sorte que deltaXmin se rapproche de deltaYmin
          On élimine les cases vides, on compte le nombre de cases, on mesure les distances
            - (ymax des cases - ymax bb empriseTravaux)
            - (ymin des cases - ymin bb emprise Travaux)

1. avec une rotation des cases à 0
1.1. - tâtonnement en X du point central de la case central
 1.1.1. - sans décalage des colonnes et des rangées, ni en x, ni en y
 1.1.2. - avec un décalage des rangées de façon à ce que, pour une rangée donnée, il y ait autant de perte
        à gauche qu'a droite
 1.1.3. - avec un décalage des colonnes de façon à ce que, pour une colonne donnée, il y ait autant de perte
        en haut qu'en bas
1.2. - tâtonnement en Y du point central de la case central
 1.2.1. - sans décalage des colonnes et des rangées, ni en x, ni en y
 1.2.2. - avec un décalage des rangées de façon à ce que, pour une rangée donnée, il y ait autant de perte
        à gauche qu'a droite
 1.2.3. - avec un décalage des colonnes de façon à ce que, pour une colonne donnée, il y ait autant de perte
       en haut qu'en bas

Pour une dimension de case donnée : par exemple 350x250 on a besoin, pour couvrir l'emprise travaux, au maximum m cases en y et n cases en x
m = fonction(hauteur case (250), hauteur de la BB d'EmpriseTravaux)
n = fonction(largeur case (350), largeur de la BB d'empriseTravaux)



### E1. geopandas ou shapely pour la manipulation en python
http://geopandas.readthedocs.io/en/latest/index.html#
http://geopandas.readthedocs.io/en/latest/set_operations.html#

cf aussi
TestAlgo_EmpriseTravauxEtEnveloppe.py

## Fabrication du dossier geogig adequat
Dans le processus, nous avons donc maintenant deux types d'objets surfacique qui sont stockées dans notre base postgresql : empriseTravaux et empriseEchangePCRS.

A partir de cette liste de cases (folios), nous allons maintenant générer les dépots geogig pour echanger les données PCRS et reseaux avec nos "partenaires"

Le principe :
on initiale le dossier du client
on prend la première case pcrs, on l'ajoute au dossier client
pour chaque case restante, intersectant le dosssier, on l'ajoute au client

Le processus pour préparer une case geogig est
install/source/geogig/bin
il faut donc l'adapter pour travailler avec plusieurs cases

## Fabrication du Récépissé (on remplit un formulaire)
Le récépissé est un document cerfa qui doit être remplit avec les informations :
- issues de la demande initiales
- fournies par les exploitants

les tests de remplissage de pdf sont ici :
```
TestRecepisse_FillPdf.py
```
Les tests de signature sont ici

```
TestSignatureRecepisse.py
```

## on expedie le dossier au client par mail sécurisé

un lien geogig

un lien geoserver

un lien pour télécharger le pdf

une doc adéquat, avec procédure pour contribuer
