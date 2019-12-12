#!/bin/sh



# script pour la récupération de données BAN
# ce script a beson de l'utilitaire p7zip-full
# sudo apt-get install p7zip-full

# 1. BAN = Diffusion principale sans licence
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.geojson.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.geojson
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.ndjson.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.ndjson
rm ../data/ban_auto_adresse_data_gouv/adresses-ftth-17.geojson.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-ftth-17.geojson
rm ../data/ban_auto_adresse_data_gouv/adresses-locales-17.csv.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-locales-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-bal-17.csv.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-bal-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-ban-v0-17.csv.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-ban-v0-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-17.geojson.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-17.geojson
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-bal-17.csv.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-bal-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-ban-v0-17.csv.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-ban-v0-17.csv
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-17.geojson.gz
rm ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-17.geojson


wget https://adresse.data.gouv.fr/data/adresses-cadastre/latest/csv/adresses-cadastre-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv.gz
wget https://adresse.data.gouv.fr/data/adresses-cadastre/latest/geojson/adresses-cadastre-17.geojson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.geojson.gz
wget https://adresse.data.gouv.fr/data/adresses-cadastre/latest/ndjson-full/adresses-cadastre-17.ndjson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.ndjson.gz
wget https://adresse.data.gouv.fr/data/adresses-ftth/latest/geojson/adresses-ftth-17.geojson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-ftth-17.geojson.gz
wget https://adresse.data.gouv.fr/data/adresses-locales/latest/csv/adresses-locales-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-locales-17.csv.gz
wget https://adresse.data.gouv.fr/data/adresses-merge/ban-bal/bal/adresses-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-bal-17.csv.gz
wget https://adresse.data.gouv.fr/data/adresses-merge/ban-bal/ban-v0/adresses-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-ban-v0-17.csv.gz
wget https://adresse.data.gouv.fr/data/adresses-merge/ban-bal/geojson/adresses-17.geojson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-17.geojson.gz
wget https://adresse.data.gouv.fr/data/adresses-merge/cadastre-ftth-bal/bal/adresses-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-bal-17.csv.gz
wget https://adresse.data.gouv.fr/data/adresses-merge/cadastre-ftth-bal/ban-v0/adresses-17.csv.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-ban-v0-17.csv.gz
wget https://adresse.data.gouv.fr/data/adresses-merge/cadastre-ftth-bal/geojson/adresses-17.geojson.gz \
     -O ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-17.geojson.gz

gunzip ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.geojson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-cadastre-17.ndjson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-ftth-17.geojson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-locales-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-bal-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-ban-v0-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-merge-ban-bal-17.geojson.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-bal-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-ban-v0-17.csv.gz
gunzip ../data/ban_auto_adresse_data_gouv/adresses-merge-cadastre-ftth-bal-17.geojson.gz

# 2. BANO = Diffusion alternative sous licence ODbL (assuré par OpenStreetMap France)
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-csv.bz2
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-csv
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-json.bz2
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-json
rm ../data/bano_auto_openstreetmap/BAN_odbl_17-shp.zip
rm -f ../data/bano_auto_openstreetmap/BAN_odbl_17.*
rm ../data/bano_auto_openstreetmap/LICENCE.txt
rm ../data/bano_auto_openstreetmap/LISEZ-MOI.txt

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
echo "#"
rm ../data/openaddresses_semiauto_openaddresses/nouvelle_aquitaine.zip
wget https://s3.amazonaws.com/data.openaddresses.io/runs/608595/fr/charente_maritime.zip \
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



