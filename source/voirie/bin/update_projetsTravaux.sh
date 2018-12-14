#!/bin/sh


# Le but de ce script est :
# - transferer les données du fichiers num_align.ods sous la forme de deux tables dans une base de données
#   base de données espu, schéma voirie_travaux, tables projet, phase et objetGeometrique
# - a partir de ces trois tables, et à partir des tables "in" (pour la saisie), il s'agit de mettre à jour
#   un lot de tables "out" (pour l'affichage)
#
# Pour arriver à ce résultat, la réponse est ici :
# https://askubuntu.com/questions/1042624/how-to-split-an-ods-spreadsheet-file-into-csv-files-per-sheet-on-the-terminal
# il faut :
# - convertir le fichier ods en un fichier xlsx
# - convertir le fichier xlsx en un fichier csv
# - lancer une requete sql pour mettre à jour la quatrième table dans la base espu

# 1. Conversion de l'ods en xlsx
echo "1. Conversion de l'ods en xlsx"
#rm /home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/num_align.xlsx
libreoffice \
            --view \
            --convert-to xlsx \
            /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux.ods \
            --outdir /home/fred/Documents/technic/source/qgis/data/projetsTravaux

# 2. Conversion de l'xlsx en csv
# Attention, il faut avoir l'utilitaire xlsx2csv d'installé
echo "2. Conversion de l'xlsx en csv"
xlsx2csv -a \
         /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux.xlsx \
         /home/fred/Documents/technic/source/qgis/data/projetsTravaux
         
rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-projet.csv
mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projet.csv \
   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-projet.csv

rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-phase.csv
mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/phase.csv \
   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-phase.csv
   
rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-objetGeometrique.csv
mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/objetGeometrique.csv \
   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-objetGeometrique.csv
   
rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux.xlsx

# 3. Lancement de la requete SQL pour mettre à jour les données
# suite à la mise à jour du fichier libre office
#
echo "3. Lancement de la requete SQL"
psql -h localhost -U fred -d espu -f /home/fred/Documents/technic/source/voirie/bin/sql/update_projetsTravaux.sql

