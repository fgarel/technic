#!/bin/sh

# Cet utilitaire doit permettre de creer un fichier csv contenant une liste de fichier

# Sous Qgis, nous allons ajouter une couche de données de type CSV

# Ce fichier csv contiendra le nom des images qui sont dans le repertoire t/GESTION DU PATRIMOINE/photo/*
find "t/GESTION_DU_PATRIMOINE/photo" -type f | grep -v Thumbs.db | grep -v ZbThumbnail.info | grep -v pspbrwse.jbf | grep -v desktop.ini \
    | grep -v .ini | grep -v .lnk | grep -v .bak \
    > listOfPictures.txt

# parcours du repertoire ~/f/CARTOGRAPHIE/Fred/atlas/
find "f/CARTOGRAPHIE/Fred/atlas/" -type f | grep -v Thumbs.db | grep -v ZbThumbnail.info | grep -v pspbrwse.jbf | grep -v desktop.ini \
    | grep -v .ini | grep -v .lnk | grep -v .bak \
    | grep -v .pdf | grep -v .PDF \
    | grep -v .kml | grep -v .kmz \
    | grep -v .txt \
    | grep -v .doc | grep -v .docx \
    | grep -v .xls | grep -v .xlsx \
    > listOfPictures.txt

# Une fois que la liste des photos a été créée, nous allons maintenant faire une première transformation
sed -r 's|[^/]*/[^/]*/[^/]*/[^/]*/([^/]*)/([^/]*)/(.*)|\0;0;\2;\1;\2;\3;;;0;0|' listOfPictures.txt > listOfPictures2.txt

# liste des groupes d'atlas
find "f/CARTOGRAPHIE/Fred/atlas" -mindepth 1 -maxdepth 1 -type d | cat -n > listOfGrpAtl.txt

# liste des atlas
find "f/CARTOGRAPHIE/Fred/atlas" -mindepth 2 -maxdepth 2 -type d | cat -n > listOfAtl.txt

# liste des photos
# parcours du repertoire ~/f/CARTOGRAPHIE/Fred/atlas/
find "f/CARTOGRAPHIE/Fred/atlas/" -type f | grep -v Thumbs.db | grep -v ZbThumbnail.info | grep -v pspbrwse.jbf | grep -v desktop.ini \
    | grep -v .ini | grep -v .lnk | grep -v .bak \
    | grep -v .pdf | grep -v .PDF \
    | grep -v .kml | grep -v .kmz \
    | grep -v .txt \
    | grep -v .doc | grep -v .docx \
    | grep -v .xls | grep -v .xlsx \
    | cat -n \
    > listOfPictures.txt

# Une fois que les 3 listes ont été créés, nous allons travailler ces trois listes
# et fairie quelques modifications avant de les fusionner
# sur les GrpAtl, nous allons faire une correpondance TitGrpAtl;CodGrpAtl
sed -r 's|[  ]+([0-9]+).+f/CARTOGRAPHIE/Fred/atlas/(.*)|\2;\1|' listOfGrpAtl.txt > listOfGrpAtl2.txt
# sur les Atl, nous allons faire une correpondance TitAtl;CodAtl On ajoute le TitGrpAtl
sed -r 's|[  ]+([0-9]+).+f/CARTOGRAPHIE/Fred/atlas/([^/]+)/(.*)|\3;\1;\2|' listOfAtl.txt > listOfAtl2.txt
# sur les Pictures, nous allons faire une correspondance TitPic;CodPic On ajoute TitAtl et TitGrpAtl
sed -r 's|[  ]+([0-9]+).+f/CARTOGRAPHIE/Fred/atlas/([^/]+)/([^/]+)/(.*)|f/CARTOGRAPHIE/Fred/atlas/\2/\3/\4;\4;\1;\3;\2|' listOfPictures.txt > listOfPictures2.txt

# Maintenant que nos trois listes ont été retravaillées, nous allons procéder a des join
# la documentation de join est ici
# 
# http://code.snipcademy.com/tutorials/linux-command-line/text-processing/cut-paste-join
# 
# join entre GrpAtl et Atl
join -a 2 -t ';' -1 1 -2 3 listOfGrpAtl2.txt listOfAtl2.txt > listOfAtl3.txt
sort -t ';' -k 3 listOfAtl3.txt > listOfAtl3s.txt
sort -t ';' -k 4 listOfPictures2.txt > listOfPictures2s.txt

# join entre GrpAtl, Atl et Pic
#join -a 2 -t ';' -1 1 -2 4 listOfAtl2.txt listOfPictures2.txt > listOFPictures3.txt
join -a 2 -t ';' -1 3 -2 4 listOfAtl3s.txt listOfPictures2s.txt > listOfPictures3.txt

# on remet les colonnes dans le bon ordre
sed -r 's|([^;]+);([^;]+);([^;]+);([^;]+);([^;]+);([^;]+);([^;]+);.+|\3;\2;\4;\1;\7;\6;\5|' listOfPictures3.txt > listOfPictures4.txt


