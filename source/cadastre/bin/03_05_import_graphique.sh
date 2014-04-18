#!/bin/sh

HOST=10.2.10.56
#HOST=192.168.0.21

# script pour le transfert des fichiers cadastraux 
# de dsibdd09
# vers un autre serveur postgresql debian

# le premier PG est la destination
# le second est la source

psql -h $HOST -U contrib -d patrimoine -c "ALTER ROLE contrib SET seach_path TO cadastre_travail, cadastre_majic, cadastre_public, public;"

# transfert de la couche parcelle
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='$HOST' port='5432' user='contrib' password='alambic' dbname='patrimoine'" \
        PG:"host='dsibdd09.mairie.fr' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "cad_parcelle" \
        'cad_parcelle'

# transfert de la couche cad_bati_dur
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='$HOST' port='5432' user='contrib' password='alambic' dbname='patrimoine'" \
        PG:"host='dsibdd09.mairie.fr' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "cad_bati_dur" \
        'cad_bati_dur'

# transfert de la couche cad_bati_leger
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='$HOST' port='5432' user='contrib' password='alambic' dbname='patrimoine'" \
        PG:"host='dsibdd09.mairie.fr' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "cad_bati_leger" \
        'cad_bati_leger'

