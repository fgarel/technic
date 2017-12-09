# Poster

L’idée est d'automatiser la création d'un fond de plan, qui :
- devra avoir une bonne résolution, (par exemple pour imprimer sur du A0)
- sera fabriqué à partir d'un flux.
  (nous partons de l’hypothèse que les données ne sont pas disponibles
   sous forme de fichier, mais qu'elles ne sont sous la forme de wms ou autre flux)
   (avec donc une possibilité de zoom pour avoir une meilleure résolution)


## Exemple 1 : GE

Par exemple, 1er cas d'utilisation, nous souhaitons "fabriquer"
une photo-aérienne ... à partir de GE.

Dans un premier temps, nous allons fabriquer un kml qui correspond à notre "plan de vol" sous GE.

Nous allons lancer GE et faire les X captures d'écran : chaque capture d'écran est enregistrer au format pdf.

Après conversion et crop de ces pdf en png grace à imagemagick,
nous allons ensuite lancer un script pour assembler ces captures d'écran grâce à un logiciel spécifique : hugin.

## Exemple 2 : qgis

Dans ce deuxième exemple d'utilisation, nous souhaitons imprimer un plan,
à partir de qgis, mais avec une une bonne résolution.

En effet, à partir du composeur d'impression de qgis, il semble (à vériver !)
qu'il n'est pas possible d'imprimer des grands posters avec des super résolutions....

L'idée est donc de faire un quadrillage, de faire des impressions de cases (via l'atlas),
et de réassembler ces cases avec image-magick ou hugin

## Exemple 3 : GE + qgis

Le troisième cas d'utilisation est une composistion des deux cas précédents :
L'idée est :
1. fabriquer une nouvelle photo-aerienne à partir de GE
2. reinjecter cette nouvelle photo dans un projet qgis,
ajouter d'autre objets : (contour de communes ou autres)
(faire une mise en page jolie dans un composeur d'impression ???)
puis imprimer de nouvelles tuiles à partir de qgis
3. réassembler ces nouvelles tuiles pour en faire le produit final...


## Détail pour GE

Une première partie consiste à créer un plan de vol pour GE
Un script actiona est ensuite utilisé pour piloter GE et prendre les clichés.
Les clichés sont assemblés avec hugin

1. Création d'une base de données postgresql appelée sandbox
cette base est nécessaire pour la conversion de données vers poi_polygon.shp ou poi_point.kml
2. Modifier le script 03_make_poi_polygon.py pour
spécifier l'emprise et le nombre de cases
3. lancer le script 02_before_ge.sh
ce script va generer un fichier shape appele
~/Documents/technic/source/poster/bin/05_mypoi.kml
4. Il faut lancer GE
5. Ouvrir le fichier
~/Documents/technic/source/poster/bin/05_mypoi.kml
6. Se mettre dans une configuration "pret à imprimer" :
préparation du format A0, suppression des titres, légendes, etc...

7. Toujours sous GE, replier les lieux dans le panneau de gauche

8. Lancer en parallèle l'utilitaire actiona
9. Sous actiona, ouvrir le script
~/Documents/technic/source/poster/bin/06_script_actiona.ascr
10. Modifier ce script pour que la boucle se fasse y fois avec y = nbCasesX * NbCasesX - 1
11. Lancer le script actiona
Les PDF sont générés dans le repertoire
~/PDF/
12. Lancer le script 07_imagemagick
Ce script transforme les pdf en png avec quelques ajustements (density, crop et luminosité)
13. Lancer les 3 scripts suivants
08_lance_hugin_01
09_lance_hugin_02
10_lance_hugin_03


## Détail pour qgis

1. Création d'une base de données postgresql appelée sandbox
cette base est nécessaire pour la conversion de données vers poi_polygon.shp ou poi_point.kml
2. Modifier le script 03_make_poi_polygon.py pour
spécifier l'emprise et le nombre de cases
3. Lancer le script 02_before_ge.sh
ce script va generer un fichier shape appele
~/Documents/technic/source/poster/bin/05_mypoi.shp
4. Lancer qgis, et le projet
~/Documents/technic/source/qgis/FondDePlan3.qgis
ce projet charge le fichier shape qui contient les polygones qui vont
nous servir à faire un atlas
5. Sous qgis, prendre, dans le composeur d'impression,
la composition
A0_paysage_LaRochelle.qpt
les caractéristiques de cette composition
taille de la page A0
Resolution export 75 dpi
propriété de l'objet
marge autour des entités 20%
Genération d'atlas
couche de couverture
05_mypoi
cacher la couche de couverture
nom de la page poi_idhg
trier par
poi_idhg
nom du fichier en sortie
poi_idhg
Exporter l'atlas en tant que images
vers ~/h/cartographie/pva_075/
(format png)
=> les png sont donc générés
6. Execution des trois scripts


### Cas d"utilisation 3 : Composition avec GE et qgis

Une première partie consiste à créer un plan de vol pour GE
Un script actiona est ensuite utilisé pour piloter GE et prendre les clichés.
Les clichés sont assemblés avec hugin : le fichier Assemblage.tif est notre nouveau fond de plan
Qgis est utilisé pour charger ce nouveau fond de Plan et generer
une deuxième série de tuiles, en utilisant la fonctionnalité atlas
cette deuxième série de tuiles est assemblée pour devenir notre assemblage final

1. Création d'une base de données postgresql appelée sandbox
cette base est nécessaire pour la conversion de données vers poi_polygon.shp ou poi_point.kml
2. Modifier le script 03_make_poi_polygon.py pour
spécifier l'emprise et le nombre de cases
3. lancer le script 02_before_ge.sh
ce script va generer un fichier shape appele
~/Documents/technic/source/poster/bin/05_mypoi.kml
4. Il faut lancer GE
5. Ouvrir le fichier
~/Documents/technic/source/poster/bin/05_mypoi.kml
6. Se mettre dans une configuration "pret à imprimer" :
préparation du format A0, suppression des titres, légendes, etc...

7. Toujours sous GE, replier les lieux dans le panneau de gauche

8. Lancer en parallèle l'utilitaire actiona
9. Sous actiona, ouvrir le script
~/Documents/technic/source/poster/bin/06_script_actiona.ascr
10. Modifier ce script pour que la boucle se fasse y fois avec y = nbCasesX * NbCasesX - 1
11. Lancer le script actiona
Les PDF sont générés dans le repertoire
~/PDF/
12. Lancer le script 07_imagemagick
Ce script transforme les pdf en png avec quelques ajustements (density, crop et luminosité)
13. Lancer les 3 scripts suivants
08_lance_hugin_01
09_lance_hugin_02
10_lance_hugin_03
14. lancer gdal2tiles.py pour faire des tuiles
si les tuiles ne sont pas corrects, il faut peut-etre, avant d'utiliser gdal2tiles.py,
convertir le fichier de depart du format tif au format png
si la conversion ne focntionne pas (pb de memoire avec image magick),
il faut augementer les limites de images magick grace au fichier
/etc/ImageMagick-6/policy.xml

identify -list resources
sudo vi /etc/ImageMagick-6/policy.xml
https://www.imagemagick.org/discourse-server/viewtopic.php?t=31438
