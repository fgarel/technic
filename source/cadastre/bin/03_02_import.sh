#!/bin/sh

#HOST=10.2.10.56
HOST=debian.mairie.fr
#HOST=192.168.0.21

#-- import des bati à partir d'un fichier csv
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_direction from stdin delimiter ';';" \
    < ../data1/foot/bati_article_direction.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_00 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_00.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_10 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_10.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_21 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_21.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_30 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_30.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_36 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_36.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_40 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_40.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_50 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_50.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_60 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_60.txt
psql -d patrimoine -U contrib -h $HOST -c "copy bati_article_99 from stdin delimiter ';';" \
    < ../data1/foot/bati_article_99.txt
#-- import des fanr à partir d'un fichier csv
psql -d patrimoine -U contrib -h $HOST -c "copy fanr_article_commune from stdin delimiter ';';" \
    < ../data1/foot/fanr_article_commune.txt
psql -d patrimoine -U contrib -h $HOST -c "copy fanr_article_direction from stdin delimiter ';';" \
    < ../data1/foot/fanr_article_direction.txt
psql -d patrimoine -U contrib -h $HOST -c "copy fanr_article_voie from stdin delimiter ';';" \
    < ../data1/foot/fanr_article_voie.txt
#-- import des lloc à partir d'un fichier csv
psql -d patrimoine -U contrib -h $HOST -c "copy lloc_article_direction from stdin delimiter ';';" \
    < ../data1/foot/lloc_article_direction.txt
psql -d patrimoine -U contrib -h $HOST -c "copy lloc_article_lotlocal from stdin delimiter ';';" \
    < ../data1/foot/lloc_article_lotlocal.txt
#-- import des nbat à partir d'un fichier csv
psql -d patrimoine -U contrib -h $HOST -c "copy nbat_article_direction from stdin delimiter ';';" \
    < ../data1/foot/nbat_article_direction.txt
psql -d patrimoine -U contrib -h $HOST -c "copy nbat_article_10 from stdin delimiter ';';" \
    < ../data1/foot/nbat_article_10.txt
psql -d patrimoine -U contrib -h $HOST -c "copy nbat_article_21 from stdin delimiter ';';" \
    < ../data1/foot/nbat_article_21.txt
psql -d patrimoine -U contrib -h $HOST -c "copy nbat_article_30 from stdin delimiter ';';" \
    < ../data1/foot/nbat_article_30.txt
psql -d patrimoine -U contrib -h $HOST -c "copy nbat_article_36 from stdin delimiter ';';" \
    < ../data1/foot/nbat_article_36.txt
psql -d patrimoine -U contrib -h $HOST -c "copy nbat_article_99 from stdin delimiter ';';" \
    < ../data1/foot/nbat_article_99.txt
#-- import des pdl à partir d'un fichier csv
psql -d patrimoine -U contrib -h $HOST -c "copy pdll_article_direction from stdin delimiter ';';" \
    < ../data1/foot/pdll_article_direction.txt
psql -d patrimoine -U contrib -h $HOST -c "copy pdll_article_10 from stdin delimiter ';';" \
    < ../data1/foot/pdll_article_10.txt
psql -d patrimoine -U contrib -h $HOST -c "copy pdll_article_20 from stdin delimiter ';';" \
    < ../data1/foot/pdll_article_20.txt
psql -d patrimoine -U contrib -h $HOST -c "copy pdll_article_30 from stdin delimiter ';';" \
    < ../data1/foot/pdll_article_30.txt
#-- import des proprietaires à partir d'un fichier csv
psql -d patrimoine -U contrib -h $HOST -c "copy prop_article_direction from stdin delimiter ';';" \
    < ../data1/foot/prop_article_direction.txt
psql -d patrimoine -U contrib -h $HOST -c "copy prop_article_courant from stdin delimiter ';';" \
    < ../data1/foot/prop_article_courant.txt






#-- import des listes à partir d'un fichier csv
#LISTE='ccoaff ccodem'
LIST='ccoaff ccodem ccodro ccoeva ccogrm ccolloc cconad cconlc cconlo ccoplc ccoqua cgrnum cgroup cnatsp ctpdl detent dformjur dmatgm dmatto dnatlc dnatpr dsgrpf dteloc gdesip gnexpl gnexps gnextl gnexts gparbat gparnf gpdl gtoper'

for NAME in $LIST
do
    TAB="liste_"$NAME
    DATA=$NAME"_data.txt"
    tail -n+2 ../data2/foot/$DATA | psql -d patrimoine -U contrib -h $HOST -c "copy $TAB from stdin delimiter ';'"
done
