#!/bin/sh


# script pour l'integration de données BAN dans postgresql



# il s'agit de filter les données csv et de les importer dans une base de données
# http://blog-postgresql.verite.pro/2018/12/21/import-openfoodfacts.html

# installation du paquet csvkit
#sudo apt install -y python3-csvkit
#sudo apt install -y csvkit

rm -f ./sql/create_tables_adresses.sql
touch ./sql/create_tables_adresses.sql


export LIST='adresses-cadastre-17.csv
             adresses-locales-17.csv
             adresses-lo-17.csv
             adresses-odbl-17.csv
             adresses-api-ban-17.csv
             adresses-api-groupign-17.csv
             adresses-api-housenumberign-17.csv'

# adresses-cadastre-17.csv

# analyse
#wc -l ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv
#ls -sh ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv
#head -n 1 ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv
#head -n 1 ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv \
#    | sed -e 's/;/\n/g'

for FILE in $LIST;
do
    echo ""
    echo "nom du fichier =" $FILE
    # pour le nom de la table, il faut regarder ici :
    # https://stackoverflow.com/questions/2664740/extract-file-basename-without-path-and-extension-in-bash
    #echo "basename =" $(basename $FILE .csv)
    head -n 1 ../data/ban_auto_adresse_data_gouv/$FILE
    echo "" >> ./sql/create_tables_adresses.sql
    echo "" >> ./sql/create_tables_adresses.sql
    echo "--" >> ./sql/create_tables_adresses.sql
    echo "-- "$FILE >> ./sql/create_tables_adresses.sql
    echo "--" >> ./sql/create_tables_adresses.sql
    echo "" >> ./sql/create_tables_adresses.sql
    # fabrique de create table
    #csvsql --dialect postgresql \
    #       --tabs \
    #       --no-constraints \
    #       --table adresses-cadastre-17 \
    #       ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv \
    #       >> ./sql/create_tables_adresses.sql

    head -n 20 ../data/ban_auto_adresse_data_gouv/$FILE \
         | csvsql \
                  --dialect postgresql \
                  --no-constraints \
                  --tables $(basename $FILE .csv)\
         >> ./sql/create_tables_adresses.sql
    # execution de create table

done
