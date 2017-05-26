#!/bin/sh


echo "# Initialisation_1.sh"
echo "###############################################"
echo "#"
echo "#"
echo "# Initialisation de la base, creattion de la table SymboleTest"
echo "# Attention destruction de ces tables"
echo "#"
echo '# 1. Creation de la table'
echo "#"
echo "# 1.1. Faire en sorte de travailler dans le schema $dataschema"
datahost='localhost'
database='symbologie'
dataschema='stockage'
datauser='fred'
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
echo '# 1.2. Create'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/01_symboleTestUtilisation_Create.sql"'
#psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '../sql/01_ManipulationBaseOsm_ListeVoie_From_Osm.sql'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/01_symboleTestUtilisation_Create.sql'


echo "#"
echo '# 2. Insertion des données'
echo "# 2.1 Faire en sorte de travailler dans le schema $dataschema"
datahost='localhost'
database='symbologie'
dataschema='stockage'
datauser='fred'
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
echo '# 2.2. Insert'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/02_symboleTestUtilisation_Insert.sql"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/02_symboleTestUtilisation_Insert.sql'

echo "#"
echo '# 3. Mise à jour des données'
echo "# 3.1 Faire en sorte de travailler dans le schema $dataschema"
datahost='localhost'
database='symbologie'
dataschema='stockage'
datauser='fred'
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
echo '# 3.2. UPDATE'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/03_symboleTestUtilisation_Update.sql"'
#psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '03_ManipulationBaseOsm_InitialisationTablesIntermediaires.sql'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/03_symboleTestUtilisation_Update.sql'
