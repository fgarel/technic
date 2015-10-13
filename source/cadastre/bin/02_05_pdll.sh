#!/bin/bash

# script qui a pour objectif de generer des creations de tables,
# à partir des fichiers de description de structure que l'on trouve sous
# ../data1/head/txt/

#=============================
# table pdll_article_direction
#=============================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table pdll_article_direction"  \
    > ../data1/head/sql/pdll_article_direction_create.sql
echo "DROP TABLE IF EXISTS pdll_article_direction;" \
    >> ../data1/head/sql/pdll_article_direction_create.sql
echo "-- Creation de la table pdll_article_direction"  \
    >> ../data1/head/sql/pdll_article_direction_create.sql
echo "CREATE TABLE pdll_article_direction (" \
    >> ../data1/head/sql/pdll_article_direction_create.sql
tail -n +2 ../data1/head/txt/pdll_article_direction_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) NOT NULL,/g" \
    >> ../data1/head/sql/pdll_article_direction_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/pdll_article_direction_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table pdll_article_direction"  \
    >> ../data1/head/sql/pdll_article_direction_create.sql
tail -n +2 ../data1/head/txt/pdll_article_direction_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN pdll_article_direction.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/pdll_article_direction_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table pdll_article_10
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table pdll_article_10"  \
    > ../data1/head/sql/pdll_article_10_create.sql
echo "DROP TABLE IF EXISTS pdll_article_10;" \
    >> ../data1/head/sql/pdll_article_10_create.sql
echo "-- Creation de la table pdll_article_10"  \
    >> ../data1/head/sql/pdll_article_10_create.sql
echo "CREATE TABLE pdll_article_10 (" \
    >> ../data1/head/sql/pdll_article_10_create.sql
tail -n +2 ../data1/head/txt/pdll_article_10_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) NOT NULL,/g" \
    >> ../data1/head/sql/pdll_article_10_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/pdll_article_10_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table pdll_article_10"  \
    >> ../data1/head/sql/pdll_article_10_create.sql
tail -n +2 ../data1/head/txt/pdll_article_10_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN pdll_article_10.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/pdll_article_10_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table pdll_article_20
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table pdll_article_20"  \
    > ../data1/head/sql/pdll_article_20_create.sql
echo "DROP TABLE IF EXISTS pdll_article_20;" \
    >> ../data1/head/sql/pdll_article_20_create.sql
echo "-- Creation de la table pdll_article_20"  \
    >> ../data1/head/sql/pdll_article_20_create.sql
echo "CREATE TABLE pdll_article_20 (" \
    >> ../data1/head/sql/pdll_article_20_create.sql
tail -n +2 ../data1/head/txt/pdll_article_20_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) NOT NULL,/g" \
    >> ../data1/head/sql/pdll_article_20_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/pdll_article_20_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table pdll_article_20"  \
    >> ../data1/head/sql/pdll_article_20_create.sql
tail -n +2 ../data1/head/txt/pdll_article_20_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN pdll_article_20.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/pdll_article_20_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table pdll_article_30
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table pdll_article_30"  \
    > ../data1/head/sql/pdll_article_30_create.sql
echo "DROP TABLE IF EXISTS pdll_article_30;" \
    >> ../data1/head/sql/pdll_article_30_create.sql
echo "-- Creation de la table pdll_article_30"  \
    >> ../data1/head/sql/pdll_article_30_create.sql
echo "CREATE TABLE pdll_article_30 (" \
    >> ../data1/head/sql/pdll_article_30_create.sql
tail -n +2 ../data1/head/txt/pdll_article_30_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) NOT NULL,/g" \
    >> ../data1/head/sql/pdll_article_30_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/pdll_article_30_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table pdll_article_30"  \
    >> ../data1/head/sql/pdll_article_30_create.sql
tail -n +2 ../data1/head/txt/pdll_article_30_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN pdll_article_30.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/pdll_article_30_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

