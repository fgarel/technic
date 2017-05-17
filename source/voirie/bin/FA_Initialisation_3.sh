#!/bin/sh


echo "# Initialisation_2.sh"
echo "###############################################"
echo "#"
echo "#"
echo "# Nous allons injecter les données originales dans les colonnes \"manuel\" (table_01 et table_02)"
echo "# Attention : ecrasement des données des colonnes manuel"
echo "#"
echo "#"
echo '# 7. Initialisation des tables'
echo "# 7.1 Faire en sorte de travailler dans le schema $dataschema"
datahost='localhost'
database='espu'
dataschema='stockage'
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
echo '# 7.2. Initialisation des tables'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/21_ManipulationBaseOsm_Initialisation_3.sql"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/21_ManipulationBaseOsm_Initialisation_3.sql'
 echo "#"
 echo '# 7.3. Initialisation des tables'
 echo "#"
 echo 'psql \'
 echo '     --host=$datahost \'
 echo '     --dbname=$database \'
 echo '     --username=$datauser \'
 echo '     -q \'
 echo '     -f "../sql/22_ManipulationBaseOsm_TypeVoie_1_Privee.sql"'
       psql \
            --host=$datahost \
            --dbname=$database \
            --username=$datauser \
            -q \
            -f '../sql/22_ManipulationBaseOsm_TypeVoie_1_Privee.sql'
echo "#"
echo '# 7.4. Initialisation des tables'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/23_ManipulationBaseOsm_TypeVoie_2.sql"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/23_ManipulationBaseOsm_TypeVoie_2.sql'
 echo "#"
 echo '# 7.5. Initialisation des tables'
 echo "#"
 echo 'psql \'
 echo '     --host=$datahost \'
 echo '     --dbname=$database \'
 echo '     --username=$datauser \'
 echo '     -q \'
 echo '     -f "../sql/24_ManipulationBaseOsm_Classement.sql"'
       psql \
            --host=$datahost \
            --dbname=$database \
            --username=$datauser \
            -q \
            -f '../sql/24_ManipulationBaseOsm_Classement.sql'
