#!/bin/sh


echo "# AutoFromManuel.sh"
echo "###############################################"
echo "#"
echo "#"
echo "# Nous allons injecter les données \"manuel\" dans les colonnes \"auto\" (table_01 et table_02)"
echo "# Attention : ecrasement des données des colonnes auto"
echo "#"
echo "#"
echo '# 5. Injection des infos "manuel" vers les infos "auto"'
echo "# 5.1 Faire en sorte de travailler dans le schema $dataschema"
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
echo '# 5.2. Injection des infos "manuel" vers les infos "auto"'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/05_ManipulationBaseOsm_AutoFromManuel.sql"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/05_ManipulationBaseOsm_AutoFromManuel.sql'
