#!/bin/sh


INI=$1
BASE=`basename $1`
F2=data/02/F2.dxf
F3=data/03/F3.dxf
FIN=data/04/

# ce scrit a pour but de tester les différentes possibiilités de conversion d'encodage
# en effet, le DXF initial, bien que propre sous TrueView et sous VI
# n'est pas traduit correctement à la suite de l'aller retour dans postgis
# il y a donc une étape préalable à insérer : iconv
# de meme, a la fin du traitmenet, il y a une opération, qui bizarement, n'est pas la transformation inverse

# du DXF windows à un fichier utilisable sous linux/postgresql/utf8
#iconv -f UTF8 -t UTF8 data/01/Plan_2_2011.dxf > data/02/UTF8_UTF8.dxf
iconv -f UTF8 -t LATIN1 data/01/Plan_2_2011.dxf > data/02/UTF8_LATIN1.dxf
#iconv -f UTF8 -t WINDOWS-1252 data/01/Plan_2_2011.dxf > data/02/UTF8_1252.dxf
#iconv -f LATIN1 -t UTF8 data/01/Plan_2_2011.dxf > data/02/LATIN1_UTF8.dxf
#iconv -f LATIN1 -t LATIN1 data/01/Plan_2_2011.dxf > data/02/LATIN1_LATIN1.dxf
#iconv -f LATIN1 -t WINDOWS-1252 data/01/Plan_2_2011.dxf > data/02/LATIN1_1252.dxf
#iconv -f WINDOWS-1252 -t UTF8 data/01/Plan_2_2011.dxf > data/02/1252_UTF8.dxf
#iconv -f WINDOWS-1252 -t LATIN1 data/01/Plan_2_2011.dxf > data/02/1252_LATIN1.dxf
#iconv -f WINDOWS-1252 -t WINDOWS-1252 data/01/Plan_2_2011.dxf > data/02/1252_1252.dxf


# import du dxf vers postgresql
export PGCLIENTENCODING=utf8
psql -h 10.2.10.58 -p 5432 -U contrib -d dbmapnik -c "DROP TABLE if exists utf8_latin1;"
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "PostgreSQL" \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        data/02/UTF8_LATIN1.dxf \
        -nln "utf8_latin1"

# export de postgresql vers dxf
rm -rf data/03/UTF8_LATIN1.dxf
export PGCLIENTENCODING=utf8
ogr2ogr -skipfailures \
        -progress \
        -overwrite \
        -f "DXF" \
        data/03/UTF8_LATIN1.dxf \
        PG:"host='10.2.10.58' port='5432' user='contrib' password='alambic' dbname='dbmapnik'" \
        -nln "utf8_latin1" \
        "utf8_latin1"

# du fichier utilisable sous linux/postgresql/utf8 vers un DXF windows
#iconv -f UTF8 -t UTF8 data/03/UTF8_1252.dxf > data/04/UTF8_UTF8.dxf
iconv -f UTF8 -t LATIN1 data/03/UTF8_LATIN1.dxf > data/04/UTF8_LATIN1.dxf
#iconv -f UTF8 -t WINDOWS-1252 data/03/UTF8_1252.dxf > data/04/UTF8_1252.dxf
#iconv -f LATIN1 -t UTF8 data/03/UTF8_1252.dxf > data/04/LATIN1_UTF8.dxf
#iconv -f LATIN1 -t LATIN1 data/03/UTF8_1252.dxf > data/04/LATIN1_LATIN1.dxf
#iconv -f LATIN1 -t WINDOWS-1252 data/03/UTF8_1252.dxf > data/04/LATIN1_1252.dxf
#iconv -f WINDOWS-1252 -t UTF8 data/03/UTF8_1252.dxf > data/04/1252_UTF8.dxf
#iconv -f WINDOWS-1252 -t LATIN1 data/03/UTF8_1252.dxf > data/04/1252_LATIN1.dxf
#iconv -f WINDOWS-1252 -t WINDOWS-1252 data/03/UTF8_1252.dxf > data/04/1252_1252.dxf
