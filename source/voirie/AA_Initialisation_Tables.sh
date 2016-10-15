#!/bin/sh


# Fabrique les tables de départs, et les tables intermediaires (table_01 et table_02)
# Attention destruction de ces tables
psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '01_ManipulationBaseOsm_ListeVoie_From_Osm.sql'
psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '02_ManipulationBaseOsm_ListeVoie_From_VoieAdresse.sql'
psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '03_ManipulationBaseOsm_InitialisationTablesIntermediaires.sql'
