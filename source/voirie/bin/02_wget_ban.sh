#!/bin/sh


# Script fonctionnant le 13/12/2019
#
# BAN =

# script pour la récupération de données BAN
# ce script a beson de l'utilitaire p7zip-full
# sudo apt-get install p7zip-full

# 1. BAN = Diffusion principale sans licence
# on nettoie
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.geojson
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.ndjson
rm ../data/ban_auto_adresse_data_gouv/adresses-ftth-17.geojson
rm ../data/ban_auto_adresse_data_gouv/adresses-locales-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-lo-17.ndjson
rm ../data/ban_auto_adresse_data_gouv/adresses-lo-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-odbl-17.ndjson
rm ../data/ban_auto_adresse_data_gouv/adresses-odbl-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-api-ban-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-api-groupign-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-api-housenumberign-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-compare-17.geojson


# on telecharge
# adresses-cadastre
wget https://adresse.data.gouv.fr/data/adresses-cadastre/latest/csv/adresses-cadastre-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv.gz
wget https://adresse.data.gouv.fr/data/adresses-cadastre/latest/geojson/adresses-cadastre-17.geojson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.geojson.gz
wget https://adresse.data.gouv.fr/data/adresses-cadastre/latest/ndjson-full/adresses-cadastre-17.ndjson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.ndjson.gz
# adresses-ftth
wget https://adresse.data.gouv.fr/data/adresses-ftth/latest/geojson/adresses-ftth-17.geojson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-ftth-17.geojson.gz
# adresses-locales
wget https://adresse.data.gouv.fr/data/adresses-locales/latest/csv/adresses-locales-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-locales-17.csv.gz
# ban/adresses-lo
wget https://adresse.data.gouv.fr/data/ban/adresses-lo/latest/addok/adresses-addok-17.ndjson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-lo-17.ndjson.gz
wget https://adresse.data.gouv.fr/data/ban/adresses-lo/latest/csv/adresses-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-lo-17.csv.gz
# ban/adresses-odbl
wget https://adresse.data.gouv.fr/data/ban/adresses-odbl/latest/addok/adresses-addok-17.ndjson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-odbl-17.ndjson.gz
wget https://adresse.data.gouv.fr/data/ban/adresses-odbl/latest/csv/adresses-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-odbl-17.csv.gz
# ban/export-api-gestion/ban
wget https://adresse.data.gouv.fr/data/ban/export-api-gestion/latest/ban/ban-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-api-ban-17.csv.gz
wget https://adresse.data.gouv.fr/data/ban/export-api-gestion/latest/group-id-ign/group-id-ign-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-api-groupign-17.csv.gz
wget https://adresse.data.gouv.fr/data/ban/export-api-gestion/latest/housenumber-id-ign/housenumber-id-ign-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-api-housenumberign-17.csv.gz
# compare
wget https://adresse.data.gouv.fr/data/compare/compare-17.geojson \
     -O ../data/ban_auto_adresse_data_gouv/adresses-compare-17.geojson

# On décompresse
gunzip ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.geojson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.ndjson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-ftth-17.geojson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-locales-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-lo-17.ndjson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-lo-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-odbl-17.ndjson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-odbl-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-api-ban-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-api-groupign-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-api-housenumberign-17.csv.gz

# 2. BANO = Diffusion alternative sous licence ODbL (assuré par OpenStreetMap France)
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-csv
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-json
rm -f ../data/bano_auto_openstreetmap/BAN_odbl_17.*
#rm ../data/bano_auto_openstreetmap/LICENCE.txt
#rm ../data/bano_auto_openstreetmap/LISEZ-MOI.txt

wget http://bano.openstreetmap.fr/BAN_odbl/BAN_odbl_17-csv.bz2 \
     -O ../data/bano_auto_openstreetmap/BAN_odbl_17-csv.bz2
wget http://bano.openstreetmap.fr/BAN_odbl/BAN_odbl_17-json.bz2 \
     -O ../data/bano_auto_openstreetmap/BAN_odbl_17-json.bz2
wget http://bano.openstreetmap.fr/BAN_odbl/BAN_odbl_17-shp.zip \
     -O ../data/bano_auto_openstreetmap/BAN_odbl_17-shp.zip

bunzip2 ../data/bano_auto_openstreetmap/BAN_odbl_17-csv.bz2
bunzip2 ../data/bano_auto_openstreetmap/BAN_odbl_17-json.bz2
7z x \
   -o../data/bano_auto_openstreetmap/ \
   ../data/bano_auto_openstreetmap/BAN_odbl_17-shp.zip
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-shp.zip
#rm -f ../data/bano_auto_openstreetmap/BAN_odbl_17.*
rm ../data/bano_auto_openstreetmap/LICENCE.txt
rm ../data/bano_auto_openstreetmap/LISEZ-MOI.txt


# 3. cadastre, fantoir
rm ../data/cadastre_auto_fantoir/nouvelle_aquitaine.zip
wget https://www.collectivites-locales.gouv.fr/files/files/cadastre/FANTOIR/Fantoir_2018/nouvelle_aquitaine.zip \
     -O ../data/cadastre_auto_fantoir/nouvelle_aquitaine.zip
rm -f ../data/cadastre_auto_fantoir/*.txt
7z x \
   -o../data/cadastre_auto_fantoir/ \
   ../data/cadastre_auto_fantoir/nouvelle_aquitaine.zip
rm ../data/cadastre_auto_fantoir/nouvelle_aquitaine.zip


# 4. openaddresses
# L'adresse url est à prendre sur cette page
# http://results.openaddresses.io/sources/fr/charente_maritime
echo "#"
echo "# L'adresse url est à prendre sur cette page"
echo "# http://results.openaddresses.io/sources/fr/charente_maritime"
echo "# le numero du sous-repertoire est ensuite à changer dans l'adresse ci-dessous"
export SOUSREP=723398
rm ../data/openaddresses_semiauto_openaddresses/nouvelle_aquitaine.zip
#wget https://s3.amazonaws.com/data.openaddresses.io/runs/$SOUSREP/fr/charente_maritime.zip \
#     -O ../data/openaddresses_semiauto_openaddresses/charente_maritime.zip
wget https://data.openaddresses.io/runs/$SOUSREP/fr/charente_maritime.zip \
     -O ../data/openaddresses_semiauto_openaddresses/charente_maritime.zip
rm -f ../data/openaddresses_semiauto_openaddresses/README.txt
rm -f ../data/openaddresses_semiauto_openaddresses/fr/charente_maritime.csv
rm -f ../data/openaddresses_semiauto_openaddresses/fr/charente_maritime.vrt
7z x \
   -o../data/openaddresses_semiauto_openaddresses/ \
   ../data/openaddresses_semiauto_openaddresses/charente_maritime.zip
rm ../data/openaddresses_semiauto_openaddresses/charente_maritime.zip

# 5. bbbike
echo "#"
echo "# Aller d'abord sur cet url :"
echo "# https://extract.bbbike.org/?lang=fr&sw_lng=-1.2591&sw_lat=46.125&ne_lng=-1.0939&ne_lat=46.199&format=osm.pbf&email=frederic.garel%40gmail.com&as=0.7668056640625&pg=1&coords=&oi=1&layers=B000T&city=La+Rochelle%2C+Charente-Maritime%2C+Nouvelle-Aquitaine%2C+France+m%C3%A9tropolitaine%2C+17000%2C+France&submit=extract&expire=1554915801"
echo "#"
rm ../data/osm_semiauto_bbbike/planet_-1.2591,46.125_-1.0939,46.199.osm.pbf
wget https://download.bbbike.org/osm/extract/planet_-1.2591,46.125_-1.0939,46.199.osm.pbf \
     -O ../data/osm_semiauto_bbbike/planet_-1.2591,46.125_-1.0939,46.199.osm.pbf
