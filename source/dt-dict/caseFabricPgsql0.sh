#!/bin/sh

HOST=10.2.10.50
#HOST=192.168.0.21

# affichage d'une info : ajout d'une ligne à .pgpass
echo "echo \"10.2.10.50:5432:*:contrib:alambic\" >> ~/.pgpass"


# Suppression et creation d'une base de donnees
#==============================================
# methode shell
#--------------
#./caseFabricPgsql1_createDatabase.sh


# Suppression et creation des tables
#===================================
./caseFabricPgsql2_createTable.sh

# Remplissage des tables
#=======================
# methode shell
#--------------
./caseFabricPgsql3_import.sh

# methode sql
#------------
#psql -h 10.2.10.2 -U contrib -d cadastre -f import.sql

# optionnel : ajout de geometrycolumn et mise à jour des colonnes
# ===============================================================
#psql -h 10.2.10.2 -U contrib -d cadastre -f addgeometrycolumn.sql
#psql -h 10.2.10.2 -U contrib -d cadastre -f update.sql

# Selection de certains enregistrements
# =====================================
./caseFabricPgsql4_select.sh
#psql -h 10.2.10.2 -U contrib -d cadastre -f select.sql

# Export des resultats
# ====================
# methode shell
#--------------
./caseFabricPgsql5_export.sh

# methode sql
#------------
#psql -h 10.2.10.2 -U contrib -d cadastre -f export.sql


# import des données graphiques
# =============================
# methode shell
#--------------
#./03_05_import_graphique.sh

# jointure entre les données littérales du cadastre et le plan
# ============================================================
# methode shell
#--------------
#./03_06_jointure_graphique_litteral.sh
