#!/bin/bash
 

function init1(){
    # Premières variables
    # par defaut
    HOST='10.2.10.58'
    PORT='5432'
    DBNAME='dbmapnik'
    USER='contrib'
    PASSWORD='alambic'
}


function init2(){
    # Secondes variables
    # en fonction du nom du fichier DXF
    INI=$1
    # dirname ; everything before last '/'
    DIR=${INI%/*}
    # basename ; everything after last '/'
    #BASE=`basename $1`
    BASE=${INI##*/}
    # fichier sans extension
    FILE=${BASE%.*}
    # extension ; everything after last '.'
    EXT=${BASE##*.}
    # conversion en minuscule
    TABLE=${FILE,,}
    F2=$DIR/$FILE"_02".$EXT
    F3=$DIR/$FILE"_03".$EXT
    FIN=$DIR/$FILE"_04".$EXT
    echo "DIR   = $DIR" 
    echo "INI   = $INI" 
    echo "FILE  = $FILE" 
    echo "EXT   = $EXT"
    echo "FIN   = $FIN"
    echo "TABLE = $TABLE"
}

function usage(){
    printf "Utilisation du script :\n"
    printf "\t-h | --host         : hote postgresql ;\n"
    printf "\t-p | --port         : port postgresql ;\n"
    printf "\t-d | --dbname       : base postgresql ;\n"
    printf "\t-U | --user         : user postgresql ;\n"
    printf "\t-P | --password     : password postgresql ;\n"
    printf "\t--dxftopsql fichier : importe un fichier DXF vers postgis ;\n"
    printf "\t--psqltodxf fichier : exporte une table postgis vers un fichier DXF ;\n"
    printf "\t--help              : affiche ce message.\n"
}
 
if [ $# -eq 0 ]
then
    usage
fi


function dxf2psql(){
    # import du dxf vers postgresql
    export PGCLIENTENCODING=utf8
    psql -h $HOST -p $PORT -d $DBNAME -U $USER -c "DROP TABLE if exists '$TABLE';"
    ogr2ogr -skipfailures \
            -progress \
            -overwrite \
            -f "PostgreSQL" \
            PG:"host=$HOST port=$PORT dbname=$DBNAME user=$USER password=$PASSWORD" \
            $F2 \
            -nln "$TABLE"
}


function psql2dxf(){
    # export de postgresql vers dxf
    rm -rf $F3
    export PGCLIENTENCODING=utf8
    ogr2ogr -skipfailures \
            -progress \
            -overwrite \
            -f "DXF" \
            $F3 \
            PG:"host=$HOST port=$PORT dbname=$DBNAME user=$USER password=$PASSWORD" \
            -nln "$TABLE" \
            "$TABLE"
}


function dxftodxf(){
    if [ -f $1 ]
    then
        dxftopsql
        psqltodxf
    else
        echo "Ce n'est pas un fichier !"
        usage
        exit 0
    fi
}


function dxftopsql(){
    if [ -f $1 ]
    then
        # du DXF windows à un fichier utilisable sous linux/postgresql/utf8
        iconv -f UTF8 -t LATIN1 $INI > $F2
        # import du dxf vers postgresql
        dxf2psql
        # suppression du fichier $F2
        rm -f $F2
    else
        echo "Ce n'est pas un fichier !"
        usage
        exit 0
    fi
}
 
function psqltodxf(){
    if [ -f $1 ]
    then
        # export de postgresql vers dxf
        psql2dxf
        # du fichier utilisable sous linux/postgresql/utf8 vers un DXF windows
        iconv -f UTF8 -t LATIN1 $F3 > $FIN
        # suppression du fichier $F3
        rm -f $F3
    else
        echo "Ce n'est pas un fichier !"
        usage
        exit 0
    fi
}


OPTS=$( getopt -o h,p,d,U,P \
               -l help,host:,port:,dbname:,user:,password:,dxftodxf:,dxftopsql:,psqltodxf: \
               -- "$@" )

# mauvais arguments
if [ $? != 0 ]
then
    echo "HOST = $HOST"
    exit 1
fi

# initialisation des premières variables
init1

eval set -- "$OPTS"
 
while true ; do
    case "$1" in
        --help)  usage;
            exit 0;;
        -h | --host) 
            HOST=$2;
            shift 2;;
        -p | --port) 
            PORT=$2;
            shift 2;;
        -d | --dbname) 
            DBNAME=$2;
            shift 2;;
        -U | --user) 
            USER=$2;
            shift 2;;
        -P | --password) 
            PASSWORD=$2;
            shift 2;;
        --dxftodxf) echo "Conversion du DXF $2 en DXF";
            init2 $2;
            dxftodxf;
            shift 2;;
        --dxftopsql) echo "Conversion du DXF $2 en table";
            init2 $2;
            dxftopsql;
            shift 2;;
        --psqltodxf) echo "Conversion de la table $2 en DXF";
            init2 $2;
            psqltodxf;
            shift 2;;
        --) shift;
            break;;
    esac
done
 
exit 0

