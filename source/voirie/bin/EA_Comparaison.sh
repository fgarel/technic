#!/bin/sh


echo "# Comparaison.sh"
echo "###############################################"
echo "#"
echo "#"
echo "# Nous allons comparer les tables intermediaires (table_01 et table_02)"
echo "# selon le champ texte"
echo "# ou selon le champ geometry"
echo "#"
echo '# 5. Comparaison des tables selon le champ texte'
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
echo '# 5.2. Comparaison des tables selon le champ texte'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/11_ManipulationBaseOsm_ComparaisonListeText.sql"'
      psql \
           --host=$datahost \
           --dbname=$database \
           --username=$datauser \
           -q \
           -f '../sql/11_ManipulationBaseOsm_ComparaisonListeText.sql'
echo '# 6. Comparaison des tables selon le champ geometry'
echo "# 6.1 Faire en sorte de travailler dans le schema $dataschema"
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
echo '# 6.2. Comparaison des tables selon le champ geometry'
echo "#"
echo 'psql \'
echo '     --host=$datahost \'
echo '     --dbname=$database \'
echo '     --username=$datauser \'
echo '     -q \'
echo '     -f "../sql/12_ManipulationBaseOsm_ComparaisonListeGeometry.sql"'
     psql \
          --host=$datahost \
          --dbname=$database \
          --username=$datauser \
          -q \
          -f '../sql/12_ManipulationBaseOsm_ComparaisonListeGeometry.sql'
