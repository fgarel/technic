#!/bin/sh

HOST=10.2.10.56
HOST=192.168.0.21

# affichage d'une info : ajout d'une ligne à .pgpass
echo "echo \"10.2.10.56:5432:*:contrib:alambic\" >> ~/.pgpass"


# Suppression et creation d'une base de donnees
#==============================================
# methode shell
#--------------
#sudo -u postgres createuser -s contrib
#sudo -u postgres psql -d templatepostgis -c "ALTER ROLE contrib WITH PASSWORD 'alambic';"
#sudo -u postgres createdb -O contrib -T templatepostgis cadastre

# methode sql
#------------
psql -h $HOST -U contrib -d template1 -f ./sql/dropdatabase.sql
psql -h $HOST -U contrib -d template1 -f ./sql/createdatabase.sql
psql -h $HOST -U contrib -d patrimoine -f ./sql/createschema.sql

# Suppression et creation des tables
#===================================
./03_01_dropcreatetable.sh

# Remplissage des tables
#=======================
# methode shell
#--------------
./03_02_import.sh

# methode sql
#------------
#psql -h 10.2.10.2 -U contrib -d cadastre -f import.sql

# optionnel : ajout de geometrycolumn et mise à jour des colonnes
# ===============================================================
#psql -h 10.2.10.2 -U contrib -d cadastre -f addgeometrycolumn.sql
#psql -h 10.2.10.2 -U contrib -d cadastre -f update.sql

# Selection de certains enregistrements
# =====================================
./03_03_select.sh
#psql -h 10.2.10.2 -U contrib -d cadastre -f select.sql

# Export des resultats
# ====================
# methode shell
#--------------
./03_04_export.sh

# methode sql
#------------
#psql -h 10.2.10.2 -U contrib -d cadastre -f export.sql


# import des données graphiques
# =============================
# methode shell
#--------------
./03_05_import_graphique.sh

# jointure entre les données littérales du cadastre et le plan
# ============================================================
# methode shell
#--------------
./03_06_jointure_graphique_litteral.sh
