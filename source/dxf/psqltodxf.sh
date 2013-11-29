#!/bin/sh

# Script permettant d'exporter des données de postgresql dans differents formats
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
# essai avec des jeux de donnees
# simples
#
#################################
# export au format shape
#
rm -rf shp
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "ESRI Shapefile" \
        shp \
        PG:"host='dsibdd09' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "ep_regard_pluvial" \
        -sql "SELECT * FROM ep_regard_pluvial WHERE re_id < 100"       

# export au format mifmid
#
rm -rf mifmid
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "MapInfo File" \
        -dsco "FORMAT=MIF" \
        mifmid \
        PG:"host='dsibdd09' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "ep_regard_pluvial" \
        -sql "SELECT * FROM ep_regard_pluvial WHERE re_id < 100"       
        #-sql "SELECT * FROM ep_regard_pluvial"      

# export au format dxf
#
rm -rf ep_regard_pluvial.dxf
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        ep_regard_pluvial.dxf \
        PG:"host='dsibdd09' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "ep_regard_pluvial" \
        -sql "SELECT * FROM ep_regard_pluvial LIMIT 1000"       
        #"ep_regard_pluvial"

rm -rf ep_ouvrage_engouffrement.dxf
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        ep_ouvrage_engouffrement.dxf \
        PG:"host='dsibdd09' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "ep_ouvage_engouffrement" \
        -sql "SELECT * FROM ep_ouvrage_engouffrement LIMIT 1000"       
        #"ep_ouvrage_engouffrement"

rm -rf ep_ouvrage_collecte.dxf
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        ep_ouvrage_collecte.dxf \
        PG:"host='dsibdd09' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "ep_ouvage_collecte" \
        -sql "SELECT * FROM ep_ouvrage_collecte LIMIT 650"       
        #"ep_ouvrage_collecte"

rm -rf ep_branchement.dxf
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        ep_branchement.dxf \
        PG:"host='dsibdd09' port='5435' user='contrib' password='alambic' dbname='base_l93'" \
        -nln "ep_branchement" \
        -sql "SELECT * FROM ep_branchement LIMIT 700"       
        #"ep_branchement"


#################################
# 2d essai
#################################
# essai avec des données plus
# complexes :
# les tables postgresql correspondent
# à un import de DXF vers postgresql
# mainteant, on fait la manip inverse
# cad on exporte de postgresql vers dxf
#################################

rm -rf plan_1.dxf
export PGCLIENTENCODING=latin1
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        plan_1.dxf \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        -nln "plan_1" \
        -sql "SELECT * FROM plan_1"       


rm -rf plan_2.dxf
export PGCLIENTENCODING=latin1
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        plan_2.dxf \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        -nln "plan_2" \
        -sql "SELECT * FROM plan_2"       


rm -rf plan_3.dxf
export PGCLIENTENCODING=utf8
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        plan_3.dxf \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        -nln "plan_3" \
        -sql "SELECT * FROM plan_3"       


