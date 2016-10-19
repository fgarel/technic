#!/bin/sh


# Fabrique les tables de départs, et les tables intermediaires (table_01 et table_02)
# Attention destruction de ces tables
psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '11_ManipulationBaseOsm_ComparaisonListeText.sql'
psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '12_ManipulationBaseOsm_ComparaisonListeGeometry.sql'
#psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '03_ManipulationBaseOsm_ComparaisonListe_initialisation.sql'
