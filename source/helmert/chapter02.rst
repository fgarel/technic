***********
Les données
***********

Un exemple est utilisé pour tester le calage helmert.

il s'agit d'une liste de 8 points dont nous avons les coordonnees.

Ces informations sont stockées dans un premier fichier que l'on appele liste01.csv

Ces mêmes points ont des coordonnées différentes dans un second système de coordonnées ou bien dans un troisième système de coordonnees.

A chaque système de doordonnées, on associera donc un fichier csv. (liste02.csv, liste03.csv, liste04.csv)

Pour importer les fichiers csv sous postgresql, on peut utiliser ddlgenerator

.. code::

  ddlgenerator -d -i pgsql liste01.csv


