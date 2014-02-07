#!/bin/sh

HOST=10.2.10.56
HOST=192.168.0.21

#-- export des proprietaires à partir d'une vue vers un fichier csv
#psql -d patrimoine -U contrib -h $HOST -c "copy (select * from vue_001) to stdout delimiter ';';" \
#    > ../data1/fin/vue_001.txt
#psql -h $HOST -U contrib -d patrimoine -f ./sql/export.sql

psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_parcelle WHERE prop_nom like '%COMMUNE DE LA ROCHELLE%') to stdout delimiter ';';" \
    > ../data1/fin/larochelle_parcelles.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_batiment WHERE prop_nom like '%COMMUNE DE LA ROCHELLE%') to stdout delimiter ';';" \
    > ../data1/fin/larochelle_batiments.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_local WHERE prop_nom like '%COMMUNE DE LA ROCHELLE%') to stdout delimiter ';';" \
    > ../data1/fin/larochelle_locaux.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_pev WHERE prop_nom like '%COMMUNE DE LA ROCHELLE%') to stdout delimiter ';';" \
    > ../data1/fin/larochelle_pev.txt

psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_parcelle WHERE prop_nom like '%COPROP IMM 7B RUE DES FONDERIES%') to stdout delimiter ';';" \
    > ../data1/fin/coprop_parcelles.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_batiment WHERE prop_nom like '%COPROP IMM 7B RUE DES FONDERIES%') to stdout delimiter ';';" \
    > ../data1/fin/coprop_batiments.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_local WHERE prop_nom like '%COPROP IMM 7B RUE DES FONDERIES%') to stdout delimiter ';';" \
    > ../data1/fin/coprop_locaux.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_pev WHERE prop_nom like '%COPROP IMM 7B RUE DES FONDERIES%') to stdout delimiter ';';" \
    > ../data1/fin/coprop_pev.txt

psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_parcelle WHERE prop_nom like '%GAREL/FREDERIC%') to stdout delimiter ';';" \
    > ../data1/fin/garel_parcelles.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_batiment WHERE prop_nom like '%GAREL/FREDERIC%') to stdout delimiter ';';" \
    > ../data1/fin/garel_batiments.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_local WHERE prop_nom like '%GAREL/FREDERIC%') to stdout delimiter ';';" \
    > ../data1/fin/garel_locaux.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_pev WHERE prop_nom like '%GAREL/FREDERIC%') to stdout delimiter ';';" \
    > ../data1/fin/garel_pev.txt


psql -d patrimoine -U contrib -h $HOST -c "copy (select * from vlr_dgfip_compte_communal) to stdout delimiter ';';" \
    > ../data1/fin/vlr_compte_communal_v1.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from vlr_dgfip_compte_communal_x_membres) to stdout delimiter ';';" \
    > ../data1/fin/vlr_compte_communal_v2.txt


psql -d patrimoine -U contrib -h $HOST -c "copy (select * from vlr_dgfip_parcelle) to stdout delimiter ';';" \
    > ../data1/fin/vlr_parcelles.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from vlr_dgfip_batiment) to stdout delimiter ';';" \
    > ../data1/fin/vlr_batiments.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from vlr_dgfip_local) to stdout delimiter ';';" \
    > ../data1/fin/vlr_locaux.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from vlr_dgfip_pev_view) to stdout delimiter ';';" \
    > ../data1/fin/vlr_pev.txt



psql -d patrimoine -U contrib -h $HOST -c "copy (select * from dgfip_parcelle_prop) to stdout delimiter ';';" \
    > ../data1/fin/dgfip_parcelle_prop.txt



psql -d patrimoine -U contrib -h $HOST -c "copy (select * from parcelle_larochelle) to stdout delimiter ';';" \
    > ../data1/fin/parcelle_larochelle.txt
psql -d patrimoine -U contrib -h $HOST -c "copy (select * from parcelle_desc_larochelle) to stdout delimiter ';';" \
    > ../data1/fin/parcelle_desc_larochelle.txt


# recopie des fichiers dans le repertoire reseau, accessible pour qgis
cp ../data1/fin/vlr_compte_communal_v1.txt ~fred/f/CARTOGRAPHIE/donnees/Patrimoine/
cp ../data1/fin/vlr_compte_communal_v2.txt ~fred/f/CARTOGRAPHIE/donnees/Patrimoine/

cp ../data1/fin/vlr_parcelles.txt ~fred/f/CARTOGRAPHIE/donnees/Patrimoine/
cp ../data1/fin/vlr_batiments.txt ~fred/f/CARTOGRAPHIE/donnees/Patrimoine/
cp ../data1/fin/vlr_locaux.txt ~fred/f/CARTOGRAPHIE/donnees/Patrimoine/
cp ../data1/fin/vlr_pev.txt ~fred/f/CARTOGRAPHIE/donnees/Patrimoine/

cp ../data1/fin/dgfip_parcelle_prop.txt ~fred/f/CARTOGRAPHIE/donnees/Patrimoine/
