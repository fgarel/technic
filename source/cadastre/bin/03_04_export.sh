#!/bin/sh

HOST=10.2.10.56

#-- export des proprietaires à partir d'une vue vers un fichier csv
psql -d cadastre -U contrib -h $HOST -c "copy (select * from vue_001) to stdout delimiter ';';" \
    > ../data1/fin/vue_001.txt
#psql -h $HOST -U contrib -d cadastre -f ./sql/export.sql
psql -d cadastre -U contrib -h $HOST -c "copy (select * from vue_001) to stdout delimiter ';';" \
    > ../data1/fin/vue_001.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from vue_002) to stdout delimiter ';';" \
    > ../data1/fin/vue_002.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_00) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_00.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_10) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_10.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_21) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_21.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_30) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_30.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_36) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_36.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_40) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_40.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_50) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_50.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from ex_bati_article_60) to stdout delimiter ';';" \
    > ../data1/fin/ex_bati_article_60.txt

psql -d cadastre -U contrib -h $HOST -c "copy (select * from local) to stdout delimiter ';';" \
    > ../data1/fin/local.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from pev) to stdout delimiter ';';" \
    > ../data1/fin/pev.txt
