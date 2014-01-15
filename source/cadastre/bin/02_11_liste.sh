#!/bin/bash

# script qui a pour objectif de generer des creations de tables,
# à partir des fichiers de description de structure que l'on trouve sous
# ../data1/head/txt/


function makesql {
# en premier argument on recupere le nom de la variable DGI
# la table correspond à ce nom sera $TAB
# le fichier sql sera $SQL
# la structure de la table est decrite dans le fichier $TXT
# les données seront importés par la suite
NAME=$1
#=============================
# table liste_ccoaff
#=============================
NAME=$1
TAB="liste_"$NAME
SQL=$TAB"_create.sql"
TXT=$NAME"_structure.txt"
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table $TAB"  \
    > ../data2/head/sql/$SQL
echo "DROP TABLE IF EXISTS $TAB;" \
    >> ../data2/head/sql/$SQL
echo "-- Creation de la table $TAB"  \
    >> ../data2/head/sql/$SQL
echo "CREATE TABLE $TAB (" \
    >> ../data2/head/sql/$SQL
tail -n +2 ../data2/head/txt/$TXT | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) NOT NULL,/g" \
    >> ../data2/head/sql/$SQL
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data2/head/sql/$SQL
# ajout de commentaires
echo "-- Ajout des commentaires pour la table $TAB"  \
    >> ../data2/head/sql/$SQL
tail -n +2 ../data2/head/txt/$TXT | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN $TAB.\"\1\" IS \'\2\';/" \
    >> ../data2/head/sql/$SQL
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

}


LIST='ccoaff ccodem ccodro ccoeva ccogrm ccolloc cconad cconlc cconlo ccoplc ccoqua cgrnum cgroup cnatsp ctpdl detent dformjur dmatgm dmatto dnatcg dnatlc dnatpr dsgrpf dteloc gdesip gnexpl gnexps gnextl gnexts gparbat gparnf gpdl gtoper'
for NAME in $LIST
do
    #echo $NAME
    makesql $NAME
done
