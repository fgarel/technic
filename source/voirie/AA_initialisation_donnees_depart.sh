#!/bin/sh

psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '01_ManipulationBaseOsm_ListeVoie_From_Osm.sql'
psql -h localhost -p 5432 -d osm -U 'Fred' -q -f '02_ManipulationBaseOsm_ListeVoie_From_VoieAdresse.sql'
