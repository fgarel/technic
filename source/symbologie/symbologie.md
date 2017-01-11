# Symbologie et cahier des charges topo


Actuellement les infos relatives aux symboles topo sont disséminés un peu partout :

 - ~/Documents/technic/source/Symbologie
 - ~/Documents/documentation/GTReseaux/DXFVersRTGEVersPCRS
 - ~/f/CARTOGRAPHIE/Administratif/marche_prestations_topo_2015/CCTP
 - ~/f/CARTOGRAPHIE/Agents/Fred/geodata/autres
 - ~/f/CARTOGRAPHIE/Agents/Fred/geodata/DCE/levetopo



## Symbole redimensionnable sous QGis

Etude de faisabilité pour utiliser des symboles svg sous qgis

En topographie, le problème est de pouvoir redimensionner un symbole (en x et en y)
de facon a ce que ses dimensions "plan" correpondent aux dimmensions "terrain"

Les premiers echanges de mails sont ci dessous

le travail continue avec les scripts strech_symbol.py



### 1er mail de sebastien



La solution réside dans ces chiffres :
1.0
1.2
1.5
1.7
1.9
2.1
2.3
2.4
2.6
13.9
32.4
Dont je propose d'éliminer les 2 derniers après étude de leur provenance.

Ils sont issus de la requête :
SELECT distinct abs(round(x_scale_factor/y_scale_factor,1)) ...
Autrement dit :
On créé un symbole .SVG que l'on nomme representation_1.0.svg
On le déforme d'un facteur X/Y = 1.2 et on le nomme toto_1.2.svg En plus je ne serai pas surpris que l'on puisse automatiser ces transformations soit via imagemagick soit via Inkscape.
... jusqu'à 2.6 qui me parait déjà trop important.
Bref dans le pire des cas, on aura une trentaine de .svg basés sur une représentation.
On pourra même passer régulièrement la requête compléter de la représentation pour ne générer que les svg nécessaires.

Nous n'aurons plus qu'à associer le symbole  representation_Abs(round(X_scale_factor/Y_scale_factor)).svg dans QGis et le tour est  joué.

Je tenais à te faire partager cette solution simple et élégante (et surtout me la noter pour ne pas l'oublier).

Cordialement,



### Reponse

Bonjour,

Oui, très bonne idée de générer à l'avance les symboles avec les déformations.

la translation, la rotation, la couleur peuvent être des paramètres transmis entre qgis et svg mais pas la déformation

on garde ainsi toutes les fonctionnalités du symbole svg ! : solution qui me satisfait beaucoup

En ce qui concerne les symboles très déformés, je pense qu'il s'agit d'une "grille caniveau", du style 10cm de large pour ~3,20m de long
il faudra peut être que l'on ajoute un symbole initial grille caniveau "10cm par 1m" et non pas "1m par 1m"


### 2d mail de sebastien

Bonjour Frédéric,

Je te livre l’état de mes réflexions sur le principe de générer des SVG pour les ratios utilisés.
Dans l’archive tu trouveras :
ModeleQGis.svg : le « gabarit » SVG qui va bien (580X580 + un chemin avec les bonnes options fill, fill-opacity…) à utiliser pour les nouveaux SVG.
Test.svg et Arbre.svg 2 fichiers de tests.

Test.py, le script python qui va bien :
Il prend 3 paramètres, dans l’ordre le nom du fichier SVG que l’on souhaite transformer, x ou y selon que l’on va agrandir selon l’axe des x ou des y (x si facteur x >= facteur y, y sinon) et le ratio abs(round(max(s,y)/min(x/y),1)) (Après réflexion, il est plus judicieux de prendre le max/min préfixé par x si x est le max et y si y est le max car dans le cas d’un rapport round(1/1.2,1)=0.8=round(1/1.3 ?1) tandis que round(1.2/1,1)=1.2<round(1.3/1 ?1)=1.3. Bref pour y=1 et x allant de 1 à 2 nous avions 11 ratio alors que pour x=1 et y variant de 1 à 2 nous n’en n’avions que 5. Avec le nouveau chois nous en aurons 11)
Il génère des fichier SVG dans le répertoire ratios qui reprennent le nom de base+_+x/y+ratio.
Exemples :
Test.py Test.svg x 1 va générer ratios/Test_x1.svg
Test.py Arbre.svg x 1.5 va générer ratios/Arbre_x1.5.svg
Test.py Test.svg y 1.2 va générer ratios/Test_y1.2.svg

Test.sqlite : petite BD contenant une couche de point pour tester.
Test.qgs : projet QGis pour démontrer la faisabilité. Les points sont représenté par un premier carré de taille 1m terrain puis d’un second symbole qui reprend la représentation souhaité avec le ratio le plus proche.

Le répertoire ratios contient des symboles générés par le script python (dont un avec un texte, et les LXT des chambres de tirages sans « fill »…)

Les types d’objets SVG pris en compte sont les path, rect, polygon et flowRoot (texte encadré => le rect de l’encadrement est modififié 2 fois).
Nous trouverons forcément des cas à problème (exemple : un SVG dont les objets sont définis avec une transformation => risque fort de perte de la dite transformation) mais dans 99% des cas ça devrait fonctionner (c’est Noël, je suis optimiste).

Tu remarqueras que pour qu’un objet ai sa bonne taille il faut que cette dernière soit définie dans les champs x_scale_factor. Le Y_scale_factor ne prenant une autre valeur qu’en cas de déformation de l’objet initial.
Autrement dit, si un bloc Autocad représentant une chambre L2T a été dessiné avec ses dimensions (1,40mx0,635m), il y a de forte chance que l’insert qui y fait référence ai ses x et y_scale_factor=1.
Il faudra donc, lors de notre import, multiplier les x et y_scale_factor par 1,40 (QGis ne prenant qu’une valeur de taille, ce sera la taille selon x, la taille selon y sera recalculé par le ratio au travers du fichier SVG (L2T_x1.svg en l’occurrence))

Dans notre prochain cahier des charges, le mieux sera d’imposer des blocs de 1m de large dont le x_scale_factor représentera bien la largeur terrain de l’insert.

Je te souhaite une excellente reprise, d’avoir le temps de tester tout ça.
Au plaisir de te retrouver l’année prochaine pour de nouvelles aventures.

Cordialement,


### Explication

le ratio (min/max) est toujours inférieur à 1
pour deux valeurs x et y allant chacune de 1 à 2, alors, min/max va de 0.5 à 1

la ratio (max/min) est toujours supérieur à 1
pour deux valeurs x et y allant chacune de 1 à 2, alors, min/max va de 1 à 2 :  la plage est doublée
