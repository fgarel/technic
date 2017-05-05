#!/bin/sh


echo "# Initialisation_2.sh"
echo "###############################################"
echo "#"
echo "#"
echo "# Nous allons injecter les données originales dans les colonnes \"manuel\" (table_01 et table_02)"
echo "# Attention : ecrasement des données des colonnes manuel"
echo "#"
echo "#"
echo '# 4. Injection des infos "original" vers les infos "manuel"'
echo "# 4.1 Faire en sorte de travailler dans le schema $dataschema"
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
echo '# 4.2. Injection des infos "original" vers les infos "manuel"'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/04_ManipulationBaseOsm_Initialisation_2.sql"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/04_ManipulationBaseOsm_Initialisation_2.sql'
