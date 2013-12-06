#!/bin/sh

# integration d'un leve topo effectué en lambert 2
./convertDaoSig.sh -a 'EPSG:27562' \
                   -A 'dxftopsql' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/lamb2/Releve_complementaire_Rue_Kaestler.dxf

# integration d'un fichier edf v2 (en lambert 2)
./convertDaoSig.sh -a 'EPSG:27562' \
                   -A 'dxftopsql' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/comparaison_VLR_ERDF/ERDF/999-02-00047-00026-13-B-18-FP2.dxf

# integration d'un leve topo effectué en lambert cc46
./convertDaoSig.sh -a 'EPSG:3946' \
                   -A 'dxftopsql' \
                   ~/f/CARTOGRAPHIE/donnees/vecteur/comparaison_VLR_ERDF/VLR/103046-6.dxf

# une fois que les données ont été intégrées, il faut les visualiser avec qgis...

psql -h 10.2.10.56 -d dbmapnik -c"select count(*) from releve_complementaire_rue_kaestler;   -- 55925
--select count(*) from "999_02_00047_00026_13_b_18_fp2";     -- 326
--select count(*) from "103046_6";                           -- 26994"
