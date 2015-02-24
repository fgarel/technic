#!/bin/sh

# 3 Parties
# =========

# 1. Infos sur les fichiers dxf, fichiers d'origine
# 2. Transformation du dxf vers postgresql
# 3. Infos sur les tables postgresql

# Infos sur les fichiers dxf
# --------------------------
# Infos sur les fichiers dxf
./convertDaoSig.sh \
                   -A 'dxfinfo' \
                   ./VLR.dxf

./convertDaoSig.sh \
                   -A 'dxfinfo' \
                   ./"Plan_Topographique_rue_basse_de_st_eloi.dxf"


# Transformation des fichiers dxf vers posgresql
# ----------------------------------------------

# integration d'un leve topo effectué en lambert cc46
./convertDaoSig.sh -s 'EPSG:3946' \
                   -a 'EPSG:3946' \
                   -A 'dxftopsql' \
                   ./VLR.dxf

# integration d'un leve topo effectué en lambert cc46
./convertDaoSig.sh -s 'EPSG:3946' \
                   -a 'EPSG:3946' \
                   -A 'dxftopsql' \
                   ./"Plan_Topographique_rue_basse_de_st_eloi.dxf"

# Infos sur les tables de la base postgresql
# ------------------------------------------

# Infos sur les tables postgreql
./convertDaoSig.sh \
                   -A 'psqlinfo' \
                   'VLR'

./convertDaoSig.sh \
                   -A 'psqlinfo' \
                   'Plan_Topographique_rue_basse_de_st_eloi'


# une fois que les données ont été intégrées, il faut les visualiser avec qgis...

#psql -h debian.mairie.fr -d dbmapnik -U contrib -c '--select count(*) from releve_complementaire_rue_kaestler;   -- 55925'
psql -h debian.mairie.fr -d dbmapnik -U contrib -c 'select count(*) from "vlr";     -- 326'
psql -h debian.mairie.fr -d dbmapnik -U contrib -c 'select count(*) from "plan_topographique_rue_basse_de_st_eloi";     -- 326'
#psql -h debian.mairie.fr -d dbmapnik -U contrib -c '--select count(*) from "103046_6";                           -- 26994'
