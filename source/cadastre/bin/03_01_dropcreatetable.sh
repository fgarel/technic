#!/bin/sh

HOST=10.2.10.36

# Suppression et creation des tables
#===================================
#psql -h 10.2.10.2 -U contrib -d cadastre -f droptable.sql
#psql -h 10.2.10.2 -U contrib -d cadastre -f createtable.sql
psql -h $HOST -U contrib -d cadastre -f sql/droptable.sql

psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_direction_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_00_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_10_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_21_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_30_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_36_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_40_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_50_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_60_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/bati_article_99_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/fanr_article_direction_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/fanr_article_commune_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/fanr_article_voie_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/nbat_article_direction_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/nbat_article_10_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/nbat_article_21_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/nbat_article_30_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/nbat_article_36_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/nbat_article_99_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/pdl_article_direction_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/pdl_article_10_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/pdl_article_20_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/pdl_article_30_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/prop_article_direction_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/prop_article_courant_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/revdi_article_direction_create.sql
psql -h $HOST -U contrib -d cadastre -f ../data1/head/sql/revdi_article_lotlocal_create.sql


#LISTE='ccoaff ccodem'

LIST='ccoaff ccodem ccodro ccoeva ccogrm ccolloc cconad cconlc cconlo ccoplc ccoqua cgrnum cgroup cnatsp ctpdl detent dmatgm dmatto dnatlc dnatpr dsgrpf dteloc gdesip gnexpl gnexps gnextl gnexts gparbat gparnf gpdl gtoper'

for NAME in $LIST
do

    TAB="liste_"$NAME
    SQL=$TAB"_create.sql"
    #SQL="liste_"$NAME"_create.sql"
    psql -h $HOST -U contrib -d cadastre -f ../data2/head/sql/$SQL
done
