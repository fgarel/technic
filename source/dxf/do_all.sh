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
                   ~/f/CARTOGRAPHIE/donnees/vecteur/comparaison_VLR_ERDF/ERDF/999-02-00047-00026-13-B-18-FP2.dxf

./convertDaoSig.sh \
                   -A 'dxfinfo' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/lamb2/Releve_complementaire_Rue_Kaestler.dxf

./convertDaoSig.sh \
                   -A 'dxfinfo' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/comparaison_VLR_ERDF/VLR/103046-6.dxf


# Transformation des fichiers dxf vers posgresql
# ----------------------------------------------

# integration d'un leve topo effectué en lambert 2
./convertDaoSig.sh -s 'EPSG:27562' \
                   -a 'EPSG:27562' \
                   -A 'dxftopsql' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/lamb2/Releve_complementaire_Rue_Kaestler.dxf

# integration d'un fichier edf v2 (en lambert 2)
./convertDaoSig.sh -s 'EPSG:27562' \
                   -a 'EPSG:27562' \
                   -A 'dxftopsql' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/comparaison_VLR_ERDF/ERDF/999-02-00047-00026-13-B-18-FP2.dxf

# integration d'un leve topo effectué en lambert cc46
./convertDaoSig.sh -s 'EPSG:3946' \
                   -a 'EPSG:3946' \
                   -A 'dxftopsql' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/comparaison_VLR_ERDF/VLR/103046-6.dxf

# Infos sur les tables de la base postgresql
# ------------------------------------------

# Infos sur les tables postgreql
./convertDaoSig.sh \
                   -A 'psqlinfo' \
                   '999-02-00047-00026-13-B-18-FP2'

./convertDaoSig.sh \
                   -A 'psqlinfo' \
                   'Releve_complementaire_Rue_Kaestler'

./convertDaoSig.sh \
                   -A 'psqlinfo' \
                   '103046-6'

# une fois que les données ont été intégrées, il faut les visualiser avec qgis...

psql -h 10.2.10.56 -d dbmapnik -U contrib -c '--select count(*) from releve_complementaire_rue_kaestler;   -- 55925'
psql -h 10.2.10.56 -d dbmapnik -U contrib -c 'select count(*) from "999_02_00047_00026_13_b_18_fp2";     -- 326'
psql -h 10.2.10.56 -d dbmapnik -U contrib -c '--select count(*) from "103046_6";                           -- 26994'
