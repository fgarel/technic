#!/bin/sh

# Script permettant d'importer des données dans postgresql
# à partir de differents formats
#
# Tips :
#   Tip 1 :
#     L'option nln, qui permet de spécifier le nom de la couche en sortie
#     doit etre placée avant l'option sql
#   Tip 2 :
#     Pour chacune des conversions ci dessous, il est possible de 
#     modifier la dernière ligne
#     En foncion des données à extraire, il faut modifier la dernière ligne
#        "ep_regard_pluvial"                    # si on veut exporter la table entiere
#        -sql "SELECT * FROM ep_regard_pluvial" # si on fait une extraction


#################################
# 1er essai
#################################
# essai avec quelques cas simples
#
#################################
# import à partir du format shape
#
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        shp/ep_regard_pluvial.shp \
        -nln "ep_regard_pluvial"

# import à partir du format mifmid
#
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        mifmid/ep_regard_pluvial.mid \
        -nln "ep_regard_pluvial"

# import à partir du format dxf
#
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ep_regard_pluvial.dxf \
        -nln "ep_regard_pluvial"

# import à partir du format dxf
#
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ep_ouvrage_engouffrement.dxf \
        -nln "ep_ouvage_engouffrement"

# import à partir du format dxf
#
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ep_ouvrage_collecte.dxf \
        -nln "ep_ouvage_collecte"

# import à partir du format dxf
#
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ep_branchement.dxf \
        -nln "ep_branchement"

#################################
# 2d essai
#################################
# essai avec de vrai fichiers DXF
#
#################################


# pb d'encodage....
# les fichiers de departs sont en utf-8
#export PGCLIENTENCODING=latin1
#export PGCLIENTENCODING=UTF8

# import à partir du format dxf
#
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ~/Travail/dxf/data/01/Plan_1_2007.dxf \
        -nln "plan_1_01"
#        ~/f/CARTOGRAPHIE/Fred/Parking\ souterrain\ Les\ Chalutiers\ \(LR\).dxf \

# import à partir du format dxf
#
#export PGCLIENTENCODING=utf8
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ~/Travail/dxf/data/02/Plan_1_2007.dxf \
        -nln "plan_1_02"
#        ~/f/CARTOGRAPHIE/Fred/Recolement\ Place\ de\ La\ Motte\ Rouge\ \(LR\)-04-03-2011.dxf \

# import à partir du format dxf
#
#export PGCLIENTENCODING=utf8
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ~/Travail/dxf/data/02/Plan_2_2011.dxf \
        -nln "plan_2"

# import à partir du format dxf
#
export PGCLIENTENCODING=utf8
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        ~/Travail/dxf/data/02/Plan_3_2011.dxf \
        ~/f/CARTOGRAPHIE/Fred/recolement\ réseaux.dxf \
        -nln "plan_3"
#        ~/f/CARTOGRAPHIE/Fred/recolement\ réseaux.dxf \


