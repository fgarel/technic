
# Les graphes

la documentation sur les graphes se trouve dispersée en plusieurs endroits

- ~/Documents/perso/source/pl/graphe/
- ~/Documents/install/source/networkx
- ~/Documnets/technic/source/triangulation
- ~/Documents/technic/source/voirie

## Theorie

La théorie des graphes ainsi que les algorithmes liés au parcours des graphes sont deux domaines qui sont largements documentés sur le web.
les exercices du concours prologin sont l'occasion de se plonger dans cet univers

Par exemple, le concours prologin aborde
 - les problème de transport,
 - de parcours de graphe,
 - de chemin le plus court
 - ...

D'autre part, dans le livre graphe et algorithme, que l'on peut utiliser pour
résoudre le 5ème exercie de prologin de decembre 2016, il est aussi mentionné
la notion de diametre d'un graphe dans un plan

Les informations plus détaillées sur cettre notion de diamètre d'un graphe dans un plan sont ici
http://repository.cmu.edu/isr/113/
http://euro.ecom.cmu.edu/shamos.html
http://euro.ecom.cmu.edu/people/faculty/mshamos/1975GeometricComplexity.pdf
http://euro.ecom.cmu.edu/people/faculty/mshamos/1975ClosestPoint.pdf

Les notions plus générales sur les algorithmes liés à un parcours de graphe sont ici

https://books.google.fr/books?id=_p3eBwAAQBAJ&pg=PA383&lpg=PA383&dq=shamos+p+m+geometric+complexity+acm+symposium+on+theory+of+computing&source=bl&ots=BaZsxZ18hY&sig=ZgtokgbNaghk7G-vvTQ3LdhDSnc&hl=fr&sa=X&ved=0ahUKEwj9irywn5bRAhXDOxoKHcX7AjQQ6AEIKDAC#v=onepage&q=shamos%20p%20m%20geometric%20complexity%20acm%20symposium%20on%20theory%20of%20computing&f=false

https://books.google.fr/books?id=YfdgAQAAQBAJ&pg=PA103&lpg=PA103&dq=shamos+p+m+geometric+complexity+acm+symposium+on+theory+of+computing&source=bl&ots=T2kck5y16H&sig=rhgl09qI8WcPi83JPYtVyr3FSEo&hl=fr&sa=X&ved=0ahUKEwj9irywn5bRAhXDOxoKHcX7AjQQ6AEIHDAA#v=onepage&q=shamos%20p%20m%20geometric%20complexity%20acm%20symposium%20on%20theory%20of%20computing&f=false

Autres infos sur le parcours d'un graphe

http://math.univ-lyon1.fr/irem/IMG/pdf/parcours.pdf
http://p-fb.net/fileadmin/_migrated/content_uploads/algo_python_graphe_arbre.pdf
https://www.irif.fr/~francoisl/IREM/graphe.pdf

http://www.python-course.eu/graphs_python.php

https://zestedesavoir.com/tutoriels/681/a-la-decouverte-des-algorithmes-de-graphe/
https://zestedesavoir.com/tutoriels/681/a-la-decouverte-des-algorithmes-de-graphe/727_bases-de-la-theorie-des-graphes/3353_parcourir-un-graphe/

https://tfeysal.wordpress.com/2010/11/21/algorithmes-pour-les-graphes-1/

http://dept-info.labri.fr/~baudon/Master/ENSM/AlgoEtGraphes.html
http://www.maths-algo.fr/index.php/informatique/cours-d-informatique/python/graphes

http://informathix.tuxfamily.org/?q=node/119

et ici

http://acm-stoc.org/

## De la théorie à la pratique
Nous allons partir d'un exemple concret, la résolution d'un exercice prologin,
pour mettre en place un environnement de travail, et les premiers scripts python
qui feront appel à networkx pour resoudre ce type de problème.

### Présentation de l'exercice de prologin
Nous allons décomposer le problème en une serie de sous-problème

On a en entree une liste de bipoints
x_ini y_ini x_fin y_fin

On veut en faire une liste d'arcs qui vont former un graphe orienté

En entrée, nous avons aussi une liste de points
x y

De cette liste de points, nous allons en faire un second graphe (sans arc)

Nous allons faire une fusion de ces deux graphes

A partir de ce graphe orienté,
nous allons effectuer les calculs ou manipulations suivantes :
 - le diametre de ce graphe (shamos 1975)
 - division du graphe en trois ensemble de points :
   - la liste des point_ini
   - la liste des point_fin
   - la liste des point_seul (station)
 - le complement de ce graphe (ajout d'arcs orientés)
   - travail a l'interieur de chaque sous-ensemble
     - chaque point_ini vers les autres point_ini
     - chaque point_seul vers les autres point_seul
     - chaque point_fin vers les autres point_fin (est-ce utile ?)
   - entre deux sous-ensembles
     - chaque point_ini vers les point_seul
     - chaque point_seul vers les point ini (inverse de la ligne precedente)
     - chache point_seul vers les point_fin
     - chaque point_fin vers les point_seul (inverse de la ligne precedente)
     - chaque point_ini vers les point_fin (attention il ne faut pas
       dupliquer les bipoints déja existants)
     - chaque point_fin vers les point_fin

## Les outils informatiques et/ou en langage python

Pour manipuler les graphes, on peut recenser plusieurs outils qui ont chacun
leur système de stockage (fichier, base de données), leur mécanisme d'import export,
leurs algoithmes pour résoudre des problèmes, etc, etc...

Ces systèmes sont :

Grapher (application android) ???

### networkx

nom: networkx
liste_outils:
documentation: https://networkx.github.io/
stockage: GML, json, shape, graphml
import_export: http://networkx.readthedocs.io/en/networkx-1.11/reference/readwrite.html

http://networkx.readthedocs.io/en/networkx-1.11/tutorial/tutorial.html
https://networkx.github.io/documentation/development/reference/generators.html
https://networkx.github.io/documentation/development/reference/generators.html
http://networkx.readthedocs.io/en/networkx-1.11/reference/drawing.html
http://networkx.readthedocs.io/en/networkx-1.11/reference/drawing.html
http://networkx.readthedocs.io/en/networkx-1.11/reference/drawing.html
http://networkx.readthedocs.io/en/latest/examples/graph/atlas2.html


networkx s'accompagne d'outils complementaire pour importer, exporter les données

lecture, parsing d'un fichier graphml
nom: pygraphml
documentation: https://pypi.python.org/pypi/pygraphml  http://hadim.fr/pygraphml/


### yEd
dessin d'un graphe
nom: yEd
documentation: http://www.yworks.com/products/yed https://www.yworks.com/yed-live/
stockage: graphml
import_export: http://alternativeto.net/software/yed/


### Graphviz
nom: Graphviz
liste_outils: dot, neato,
documentation: http://graphviz.org/ https://en.wikipedia.org/wiki/DOT_(graph_description_language)
stockage: dot
import_export:

L'outil graphviz arrive lui aussi avec des utilitaires pour effectuer des conversions
gml2gml gml2gv graphml2gv
graphml2gv http://manpages.ubuntu.com/manpages/wily/man1/graphml2gv.1.html gv2gml gml2gv http://graphviz.org/pdf/gml2gv.1.pdf

### Autres outils et format de stockage

nom: plantuml
documentation:

grapheekdb
neo4j
postgresql
inkscape (svg)
grapheekdb
Fichier texte (csv)

### Outils connexes
triangle

dans le repertoire
- ~/Documents/technic/source/triangulation/

```
aptitude install triangle-bin
triangle -engB test.node

```

## La pratique

### Installation de networkx

```
installation d'un environnement python avec
  - networkx
  - pygraphml  (manipulation fichier graphml)
  - pygraphviz (manipulation fichier dot)
  - PyYAML     (manipulation fichier yaml)
(inspire de ~/Documents/install/source/environnementTravail/install_python.sh)

pew list_pythons
pew list_pythons -a
pew install 3.5.1
pew new -p $(pythonz locate 3.5.1) graphe

pip install networkx
pip install pygraphml

aptitude install libgraphviz-dev
(cette bibliotheque est necessaire pour pygraphviz)
pip install pygraphviz
pip install PyYAML

```



### Les premiers scripts
- ~/Documents/perso/source/pl/graphe/

#### Import / Export entre plusieurs systèmes de manipulation de graphe

#### Algorithmes
