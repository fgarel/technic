#!/bin/sh

#HOST=10.2.10.56
HOST=debian.mairie.fr
#echo "HOST = "$HOST
#HOST=192.168.0.21

# Suppression et creation des tables
#===================================
#psql -h 10.2.10.2 -U contrib -d patrimoine -f droptable.sql
#psql -h 10.2.10.2 -U contrib -d patrimoine -f createtable.sql
#psql -h $HOST -U contrib -d patrimoine -f sql/droptable.sql

psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_direction_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_00_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_10_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_21_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_30_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_36_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_40_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_50_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_60_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/bati_article_99_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/fanr_article_direction_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/fanr_article_commune_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/fanr_article_voie_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/lloc_article_direction_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/lloc_article_lotlocal_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/nbat_article_direction_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/nbat_article_10_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/nbat_article_21_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/nbat_article_30_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/nbat_article_36_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/nbat_article_99_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/pdll_article_direction_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/pdll_article_10_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/pdll_article_20_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/pdll_article_30_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/prop_article_direction_create.sql
psql -h $HOST -U contrib -d patrimoine -f ../data1/head/sql/prop_article_courant_create.sql



#LISTE='ccoaff ccodem'

LIST='ccoaff ccodem ccodro ccoeva ccogrm ccolloc cconad cconlc cconlo ccoplc ccoqua cgrnum cgroup cnatsp ctpdl detent dformjur dmatgm dmatto dnatlc dnatpr dsgrpf dteloc gdesip gnexpl gnexps gnextl gnexts gparbat gparnf gpdl gtoper'

for NAME in $LIST
do

    TAB="liste_"$NAME
    SQL=$TAB"_create.sql"
    #SQL="liste_"$NAME"_create.sql"
    psql -h $HOST -U contrib -d patrimoine -f ../data2/head/sql/$SQL
done
