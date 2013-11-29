#!/bin/bash

# script qui a pour objectif de generer des creations de tables,
# à partir des fichiers de description de structure que l'on trouve sous
# ../data1/head/txt/

#=============================
# table bati_article_direction
#=============================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_direction"  \
    > ../data1/head/sql/bati_article_direction_create.sql
echo "DROP TABLE IF EXISTS bati_article_direction;" \
    >> ../data1/head/sql/bati_article_direction_create.sql
echo "-- Creation de la table bati_article_direction"  \
    >> ../data1/head/sql/bati_article_direction_create.sql
echo "CREATE TABLE bati_article_direction (" \
    >> ../data1/head/sql/bati_article_direction_create.sql
tail -n +2 ../data1/head/txt/bati_article_direction_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) NOT NULL,/g" \
    >> ../data1/head/sql/bati_article_direction_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_direction_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_direction"  \
    >> ../data1/head/sql/bati_article_direction_create.sql
tail -n +2 ../data1/head/txt/bati_article_direction_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_direction.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_direction_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_00
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_00"  \
    > ../data1/head/sql/bati_article_00_create.sql
echo "DROP TABLE IF EXISTS bati_article_00;" \
    >> ../data1/head/sql/bati_article_00_create.sql
echo "-- Creation de la table bati_article_00"  \
    >> ../data1/head/sql/bati_article_00_create.sql
echo "CREATE TABLE bati_article_00 (" \
    >> ../data1/head/sql/bati_article_00_create.sql
#tail -n +2 ../data1/head/txt/bati_article_00_structure.txt | \
#    cut -d";" -f 3,5 | \
#    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) NOT NULL,/g" \
#    >> ../data1/head/sql/bati_article_00_create.sql
tail -n +2 ../data1/head/txt/bati_article_00_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_00_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_00_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_00"  \
    >> ../data1/head/sql/bati_article_00_create.sql
tail -n +2 ../data1/head/txt/bati_article_00_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_00.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_00_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_10
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_10"  \
    > ../data1/head/sql/bati_article_10_create.sql
echo "DROP TABLE IF EXISTS bati_article_10;" \
    >> ../data1/head/sql/bati_article_10_create.sql
echo "-- Creation de la table bati_article_10"  \
    >> ../data1/head/sql/bati_article_10_create.sql
echo "CREATE TABLE bati_article_10 (" \
    >> ../data1/head/sql/bati_article_10_create.sql
tail -n +2 ../data1/head/txt/bati_article_10_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_10_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_10_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_10"  \
    >> ../data1/head/sql/bati_article_10_create.sql
tail -n +2 ../data1/head/txt/bati_article_10_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_10.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_10_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_21
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_21"  \
    > ../data1/head/sql/bati_article_21_create.sql
echo "DROP TABLE IF EXISTS bati_article_21;" \
    >> ../data1/head/sql/bati_article_21_create.sql
echo "-- Creation de la table bati_article_21"  \
    >> ../data1/head/sql/bati_article_21_create.sql
echo "CREATE TABLE bati_article_21 (" \
    >> ../data1/head/sql/bati_article_21_create.sql
tail -n +2 ../data1/head/txt/bati_article_21_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_21_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_21_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_21"  \
    >> ../data1/head/sql/bati_article_21_create.sql
tail -n +2 ../data1/head/txt/bati_article_21_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_21.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_21_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_30
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_30"  \
    > ../data1/head/sql/bati_article_30_create.sql
echo "DROP TABLE IF EXISTS bati_article_30;" \
    >> ../data1/head/sql/bati_article_30_create.sql
echo "-- Creation de la table bati_article_30"  \
    >> ../data1/head/sql/bati_article_30_create.sql
echo "CREATE TABLE bati_article_30 (" \
    >> ../data1/head/sql/bati_article_30_create.sql
tail -n +2 ../data1/head/txt/bati_article_30_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_30_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_30_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_30"  \
    >> ../data1/head/sql/bati_article_30_create.sql
tail -n +2 ../data1/head/txt/bati_article_30_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_30.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_30_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_36
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_36"  \
    > ../data1/head/sql/bati_article_36_create.sql
echo "DROP TABLE IF EXISTS bati_article_36;" \
    >> ../data1/head/sql/bati_article_36_create.sql
echo "-- Creation de la table bati_article_36"  \
    >> ../data1/head/sql/bati_article_36_create.sql
echo "CREATE TABLE bati_article_36 (" \
    >> ../data1/head/sql/bati_article_36_create.sql
tail -n +2 ../data1/head/txt/bati_article_36_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_36_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_36_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_36"  \
    >> ../data1/head/sql/bati_article_36_create.sql
tail -n +2 ../data1/head/txt/bati_article_36_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_36.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_36_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_40
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_40"  \
    > ../data1/head/sql/bati_article_40_create.sql
echo "DROP TABLE IF EXISTS bati_article_40;" \
    >> ../data1/head/sql/bati_article_40_create.sql
echo "-- Creation de la table bati_article_40"  \
    >> ../data1/head/sql/bati_article_40_create.sql
echo "CREATE TABLE bati_article_40 (" \
    >> ../data1/head/sql/bati_article_40_create.sql
tail -n +2 ../data1/head/txt/bati_article_40_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_40_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_40_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_40"  \
    >> ../data1/head/sql/bati_article_40_create.sql
tail -n +2 ../data1/head/txt/bati_article_40_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_40.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_40_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_50
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_50"  \
    > ../data1/head/sql/bati_article_50_create.sql
echo "DROP TABLE IF EXISTS bati_article_50;" \
    >> ../data1/head/sql/bati_article_50_create.sql
echo "-- Creation de la table bati_article_50"  \
    >> ../data1/head/sql/bati_article_50_create.sql
echo "CREATE TABLE bati_article_50 (" \
    >> ../data1/head/sql/bati_article_50_create.sql
tail -n +2 ../data1/head/txt/bati_article_50_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_50_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_50_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_50"  \
    >> ../data1/head/sql/bati_article_50_create.sql
tail -n +2 ../data1/head/txt/bati_article_50_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_50.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_50_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_60
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_60"  \
    > ../data1/head/sql/bati_article_60_create.sql
echo "DROP TABLE IF EXISTS bati_article_60;" \
    >> ../data1/head/sql/bati_article_60_create.sql
echo "-- Creation de la table bati_article_60"  \
    >> ../data1/head/sql/bati_article_60_create.sql
echo "CREATE TABLE bati_article_60 (" \
    >> ../data1/head/sql/bati_article_60_create.sql
tail -n +2 ../data1/head/txt/bati_article_60_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_60_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_60_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_60"  \
    >> ../data1/head/sql/bati_article_60_create.sql
tail -n +2 ../data1/head/txt/bati_article_60_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_60.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_60_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db

#===========================
# table bati_article_99
#===========================
#---------------
# 1 txt vers sql
#---------------
echo "-- Suppression de la table bati_article_99"  \
    > ../data1/head/sql/bati_article_99_create.sql
echo "DROP TABLE IF EXISTS bati_article_99;" \
    >> ../data1/head/sql/bati_article_99_create.sql
echo "-- Creation de la table bati_article_99"  \
    >> ../data1/head/sql/bati_article_99_create.sql
echo "CREATE TABLE bati_article_99 (" \
    >> ../data1/head/sql/bati_article_99_create.sql
tail -n +2 ../data1/head/txt/bati_article_99_structure.txt | \
    cut -d";" -f 3,5 | \
    sed -E -e "s/^(.*);(.*)$/\"\2\" CHARACTER VARYING(\1) DEFAULT NULL,/g" \
    >> ../data1/head/sql/bati_article_99_create.sql
# modification de la derniere ligne
# $ pour matcher uniquement la derniere ligne
sed -i -E -e "$ s/,/);/" ../data1/head/sql/bati_article_99_create.sql
# ajout de commentaires
echo "-- Ajout des commentaires pour la table bati_article_99"  \
    >> ../data1/head/sql/bati_article_99_create.sql
tail -n +2 ../data1/head/txt/bati_article_99_structure.txt | \
    cut -d";" -f 5,6 | \
    sed -E -e "s/^(.*);(.*)$/COMMENT ON COLUMN bati_article_99.\"\1\" IS \'\2\';/" \
    >> ../data1/head/sql/bati_article_99_create.sql
#--------------------
# 2 txt vers model.py
#--------------------
# on a aussi la possibilité de créer nos tables, non pas avec des scripts sql,
# mais en passant par sqlalchemy.
# dans ce cas, la doc se trouve sur debian64
# /home/garel/travail/csv2db
