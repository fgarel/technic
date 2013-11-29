#!/bin/sh

HOST=10.2.10.36

#-- export des proprietaires à partir d'une vue vers un fichier csv
psql -d cadastre -U contrib -h $HOST -c "copy (select * from vue_001) to stdout delimiter ';';" \
    > ../data1/fin/vue_001.txt
