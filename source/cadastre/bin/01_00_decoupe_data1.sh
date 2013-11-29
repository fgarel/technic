#!/bin/bash

# chargement des fichiers
cp ../data1/ini/BATI_300.sav ../data1/ini/BATI_300.txt
cp ../data1/ini/FANR_300.sav ../data1/ini/FANR_300.txt
cp ../data1/ini/NBAT_300.sav ../data1/ini/NBAT_300.txt
cp ../data1/ini/PDL_300.sav ../data1/ini/PDL_300.txt
cp ../data1/ini/PROP_300.sav ../data1/ini/PROP_300.txt
cp ../data1/ini/REVDI_300.sav ../data1/ini/REVDI_300.txt

# nettoyage des fichiers
# transformation des fichiers en unix
# dos2unix
# iconv
# recode
#iconv -f latin1 -t utf-8 ../data1/ini/BATI_300.sav | dos2unix > ../data1/ini/BATI_300.txt
dos2unix -n ../data1/ini/BATI_300.sav ../data1/ini/BATI_300.txt
dos2unix -n ../data1/ini/FANR_300.sav ../data1/ini/FANR_300.txt
dos2unix -n ../data1/ini/NBAT_300.sav ../data1/ini/NBAT_300.txt
dos2unix -f -n ../data1/ini/PDL_300.sav ../data1/ini/PDL_300.txt
dos2unix -n ../data1/ini/PROP_300.sav ../data1/ini/PROP_300.txt
dos2unix -n ../data1/ini/REVDI_300.sav ../data1/ini/REVDI_300.txt

# decoupage des 6 fichiers en plusieurs,
# chacun des fichiers resultats correspondant à un type d'enregistrement
./01_01_bati.sh
./01_02_fanr.sh
./01_03_nbat.sh
./01_04_pdl.sh
./01_05_prop.sh
./01_06_revdi.sh


# une fois que les fichiers sont decoupés, il faut eventuellement
# ajouter des champs supplémentaires pour les enregistrements incomplets
# par exemple, pour le fichier bati_article_10,
# des lignes contiennent 46 champs alors que d'autres n'en contiennent que 40 ou 41
# (des champs sont optionnels)
# pour ces lignes qui ne contiennent pas tous les champs,
# on va rajouter quelques séparateurs, afin de faire croire à la commande copy de sql que la ligne est complete
./01_08_bati.sh
./01_10_nbat.sh
./01_11_pdl.sh
