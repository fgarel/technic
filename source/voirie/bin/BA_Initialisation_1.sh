#!/bin/sh


echo "# Initialisation_1.sh"
echo "###############################################"
echo "#"
echo "#"
echo "# Fabrique les tables de départs, et les tables intermediaires (table_01 et table_02)"
echo "# Attention destruction de ces tables"
echo "#"
echo '# 1. Extraction des données osm'
echo "#"
echo "# 1.1. Faire en sorte de travailler dans le schema $dataschema"
datahost='localhost'
database='osm'
dataschema='apidb'
datauser='osmuser'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -c "ALTER DATABASE $database SET search_path TO $dataschema, public;"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -c "ALTER DATABASE $database SET search_path TO $dataschema, public;"
echo "#"
echo '# 1.2. Extraction des données osm'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/01_ManipulationBaseOsm_ListeVoie_From_Osm.sql"'
#psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '../sql/01_ManipulationBaseOsm_ListeVoie_From_Osm.sql'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/01_ManipulationBaseOsm_ListeVoie_From_Osm.sql'


echo "#"
echo '# 2. Extraction des données voieadresse'
echo "# 2.1 Faire en sorte de travailler dans le schema $dataschema"
datahost='localhost'
database='espu'
dataschema='travail'
datauser='osmuser'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -c "ALTER DATABASE $database SET search_path TO $dataschema, public;"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -c "ALTER DATABASE $database SET search_path TO $dataschema, public;"
echo "#"
echo '# 2.2. Extraction des données voieadresse'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/02_ManipulationBaseOsm_ListeVoie_From_VoieAdresse.sql"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/02_ManipulationBaseOsm_ListeVoie_From_VoieAdresse.sql'

echo "#"
echo '# 3. Initialisation des tables intermediaires'
echo "# 3.1 Faire en sorte de travailler dans le schema $dataschema"
datahost='localhost'
database='espu'
dataschema='travail'
datauser='osmuser'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -c "ALTER DATABASE $database SET search_path TO $dataschema, public;"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -c "ALTER DATABASE $database SET search_path TO $dataschema, public;"
echo "#"
echo '# 3.2. Initialisation des tables intermediaires'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/03_ManipulationBaseOsm_Initialisation_1.sql"'
#psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '03_ManipulationBaseOsm_InitialisationTablesIntermediaires.sql'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/03_ManipulationBaseOsm_Initialisation_1.sql'
