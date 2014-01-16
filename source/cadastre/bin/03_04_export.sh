#!/bin/sh

HOST=10.2.10.56

#-- export des proprietaires à partir d'une vue vers un fichier csv
#psql -d cadastre -U contrib -h $HOST -c "copy (select * from vue_001) to stdout delimiter ';';" \
#    > ../data1/fin/vue_001.txt
#psql -h $HOST -U contrib -d cadastre -f ./sql/export.sql

psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_parcelle WHERE prop_article_courant.ddenom like '%COMMUNE DE LA ROCHELLE%') to stdout delimiter ';';" \
    > ../data1/fin/larochelle_parcelles.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_local WHERE prop_article_courant.ddenom like '%COMMUNE DE LA ROCHELLE%') to stdout delimiter ';';" \
    > ../data1/fin/larochelle_locaux.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_pev WHERE prop_article_courant.ddenom like '%COMMUNE DE LA ROCHELLE%') to stdout delimiter ';';" \
    > ../data1/fin/larochelle_pev.txt

psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_parcelle WHERE prop_article_courant.ddenom like '%COPROP IMM 7B RUE DES FONDERIES%') to stdout delimiter ';';" \
    > ../data1/fin/coprop_parcelles.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_local WHERE prop_article_courant.ddenom like '%COPROP IMM 7B RUE DES FONDERIES%') to stdout delimiter ';';" \
    > ../data1/fin/coprop_locaux.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_pev WHERE prop_article_courant.ddenom like '%COPROP IMM 7B RUE DES FONDERIES%') to stdout delimiter ';';" \
    > ../data1/fin/coprop_pev.txt

psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_parcelle WHERE prop_article_courant.ddenom like '%GAREL/FREDERIC%') to stdout delimiter ';';" \
    > ../data1/fin/garel_parcelles.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_local WHERE prop_article_courant.ddenom like '%GAREL/FREDERIC%') to stdout delimiter ';';" \
    > ../data1/fin/garel_locaux.txt
psql -d cadastre -U contrib -h $HOST -c "copy (select * from dgfip_pev WHERE prop_article_courant.ddenom like '%GAREL/FREDERIC%') to stdout delimiter ';';" \
    > ../data1/fin/garel_pev.txt
