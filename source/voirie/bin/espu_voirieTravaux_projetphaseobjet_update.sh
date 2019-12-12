#!/bin/sh


# Le but de ce script est :
# - transferer les données des fichier projetsTravaux.ods et PPI.ods sous la forme de deux tables dans une base de données
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
## echo "1.1. projetsTravaux.ods"
#rm /home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/projetsTravaux.xlsx
libreoffice \
            --view \
            --convert-to xlsx \
            /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux.ods \
            --outdir /home/fred/Documents/technic/source/qgis/data/projetsTravaux

## echo "1.2. ppi/PPI.ods"
#rm /home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/ppi/PPI.xlsx
#libreoffice \
#            --view \
#            --convert-to xlsx \
#            /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi/PPI.ods \
#            --outdir /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi

# 2. Conversion de l'xlsx en csv
# Attention, il faut avoir l'utilitaire xlsx2csv d'installé
echo "2. Conversion de l'xlsx en csv"
## echo "1.1. projetsTravaux.xlsx"
xlsx2csv -a \
         /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux.xlsx \
         /home/fred/Documents/technic/source/qgis/data/projetsTravaux

rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-Projet.csv
mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/Projet.csv \
   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-Projet.csv

rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-NatureTravaux.csv
mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/NatureTravaux.csv \
   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-NatureTravaux.csv

rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-Phase.csv
mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/Phase.csv \
   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-Phase.csv

rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-ObjetGeometrique.csv
mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ObjetGeometrique.csv \
   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-ObjetGeometrique.csv

rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux.xlsx

## echo "1.1. PPI.xlsx"
#xlsx2csv -a \
#         /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi/PPI.xlsx \
#         /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi

#rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi/PPI-ppi_finances_2018_02.csv
#mv /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi/ppi_finances_2018_02.csv \
#   /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi/PPI-ppi_finances_2018_02.csv

#rm /home/fred/Documents/technic/source/qgis/data/projetsTravaux/ppi/PPI.xlsx



# 3. Lancement de la requete SQL pour mettre à jour les données
# suite à la mise à jour du fichier libre office
#
echo "3. Lancement de la requete SQL"
psql -h localhost -U fred -d espu -f /home/fred/Documents/technic/source/voirie/bin/sql/espu_voirieTravaux_projetphaseobjet_update.sql
