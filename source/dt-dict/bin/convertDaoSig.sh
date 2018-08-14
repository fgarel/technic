#!/bin/bash


function init1(){
    # Premières variables
    # par defaut
    DBHOST='pg.cdalr.fr'
    DBPORT='5432'
    DBNAME='dbworkspace'
    DBSCHE='pcrs'
    DBUSER='fred'
    DBPASS='fgpass'
    #HOST='pg.cdalr.fr'
    #PORT='5432'
    #DBNAME='dbworkspace'
    #USER='fred'
    #PASSWORD='fgpass'
    #ACTION="dxftopsql"
    #ACTION="psqltogml"
    ACTION="gmltopsql"
    ACTION="usage"
    # les systèmes de projection
    # 2154=L93, 3946=CC46, 4326=WGS84, 27562=Lamb2C
    #S_SRS='EPSG:3946'    # Override source SRS
    S_SRS='EPSG:4171'    # Override source SRS
    T_SRS='EPSG:3946'    # Reproject/transform to this SRS on output
    A_SRS='EPSG:3946'    # Assign an output SRS
    ENCODAGE_INI="LATIN1"
    ENCODAGE_FIN="LATIN1"
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
    # conversion en minuscule => c'est l'operateur ",,"
    #TABLE=${FILE,,}
    TABLE=${FILE}
    TABLE=${TABLE//\-/\_}      # recherche remplace pour une variable bash
                               # Which follows this syntax: ${variable//pattern/replacement}
    F2=$DIR/$FILE"_02".$EXT
    F3=$DIR/$FILE"_03".$EXT
    FIN=$DIR/$FILE"_04".$EXT
    echo "DIR   = $DIR"
    echo "INI   = $INI"
    echo "FILE  = $FILE"
    echo "EXT   = $EXT"
    echo "FIN   = $FIN"
    echo "TABLE = $TABLE"
    echo "S_SRS = $S_SRS"
    echo "T_SRS = $T_SRS"
    echo "A_SRS = $A_SRS"
    echo "ENCODAGE_INI = $ENCODAGE_INI"
    echo "ENCODAGE_FIN = $ENCODAGE_FIN"
    echo "ACTION= $ACTION"
}

function usage(){
    printf "Utilisation du script :\n"
    printf "\n"
    printf "Usage: $0 --help\n"
    printf "Usage: $0 [--option option_value] --action action_value file_or_table\n"
    printf "\n"
    printf "\n"
    printf "\n"
    printf "\t--help         : affiche ce message.\n"
    printf "\n"
    printf "\tles options pour la connexion à la base postgresql\n"
    printf "\n"
    printf "\t-h | --dbhost       : host postgresql      ; $DBHOST\n"
    printf "\t-p | --dbport       : port postgresql      ; $DBPORT\n"
    printf "\t-d | --dbname       : base postgresql      ; $DBNAME\n"
    printf "\t-S | --dbsche       : sche postgresql      ; $DBSCHE\n"
    printf "\t-U | --dbuser       : user postgresql      ; $DBUSER\n"
    printf "\t-P | --dbpass       : pass postgresql      ; $DBPASS\n"
    printf "\n"
    printf "\tles options pour le système de projection\n"
    printf "\n"
    printf "\t-s | --s_srs        : Override source SRS  ; $S_SRS\n"
    printf "\t-t | --t_srs        : Reproject/transform to this SRS on output ; $T_SRS\n"
    printf "\t-a | --a_srs        : Assign an output SRS ; $A_SRS\n"
    printf "\n"
    printf "\tles options pour l'encodage des caractères\n"
    printf "\n"
    printf "\t-i | --encodage_ini : Encodage du fichier initial ; $ENCODAGE_INI\n"
    printf "\t-f | --encodage_fin : Encodage du fichier final ; $ENCODAGE_FIN\n"
    printf "\n"
    printf "\tles actions sont :\n"
    printf "\n"
    printf "\t-A | --action       : au choix parmi :\n"
    printf "\t\tAffichage d'info    :\n"
    printf "\t                      - dxfinfo   : Infos sur un fichier DXF\n"
    printf "\t                      - gmlinfo   : Infos sur un fichier GML\n"
    printf "\t                      - psqlinfo  : Infos sur une table psql\n"
    printf "\t\tConversion avec GML :\n"
    printf "\t                      - gmltopsql : importe un fichier GML vers postgis (c'est l'action par defaut);\n"
    printf "\t                      - psqltogml : exporte une table postgis vers un fichier GML ;\n"
    printf "\t\tConversion avec DXF :\n"
    printf "\t                      - dxftopsql : importe un fichier DXF vers postgis (c'est l'action par defaut);\n"
    printf "\t                      - psqltodxf : exporte une table postgis vers un fichier DXF ;\n"
    printf "\n"
    printf "\t                      - dxftodxf  : convertit un fichier DXF vers un autre fichier DXF ;\n"
    printf "\t                                    inutile ? non, car cela permet de changer le système de projection ;\n"
    printf "\n"
    printf "\tfichier_ou_table : nom du fichier ou de la table à traiter"
    printf "\n"
    printf "Exemple :\n"
    printf "\n"
    printf "\tConversion d'un fichier GML vers une table postgresql\n"
    printf "\t ./convertDaoSig.sh \ \n"
    printf "\t                  --action gmltopsql \ \n"
    printf "\t                 \"./data/_sample/EmpriseDeclaration.gml\"\n"
    printf "\n"
    printf "\tConversion d'une table postgresql cc46 vers un fichier GML\n"
    printf "\t ./convertDaoSig.sh \ \n"
    printf "\t                  --action psqltogml \ \n"
    printf "\t                 \"./EmpriseEchangePCRS.gml\"\n"
    printf "\n"
    printf "\tConversion d'un DXF lambert 2 (ville) vers postgresql lamb2\n"
    printf "\t ~/Travail/ecriture_sphinx/technic/source/dxf/convertDaoSig.sh \ \n"
    printf "\t                 -a 'EPSG:27562' \ \n"
    printf "\t                  --action dxftopsql \ \n"
    printf "\t                 ~/f/CARTOGRAPHIE/donnees/vecteur/lamb2/Releve_complementaire_Rue_Kaestler.dxf\n"
    printf "\n"
    printf "\tConversion d'un DXF lambert 2 (edf) vers postgresql CC46\n"
    printf "\t ~/Travail/ecriture_sphinx/technic/source/dxf/convertDaoSig.sh \ \n"
    printf "\t                 -s 'EPSG:27562' \ \n"
    printf "\t                 -t 'EPSG:3946' \ \n"
    printf "\t                 -a 'EPSG:3946' \ \n"
    printf "\t                  --action dxftopsql \ \n"
    printf "\t                 ~/f/CARTOGRAPHIE/donnees/vecteur/comparaison_VLR_ERDF/ERDF/999-02-00047-00026-13-B-18-FP2.dxf\n"
    printf "\n"
    printf "\tConversion d'un DXF lambert 2 (edf) vers dxf CC46\n"
    printf "\t ~/Travail/ecriture_sphinx/technic/source/dxf/convertDaoSig.sh \ \n"
    printf "\t                 -s 'EPSG:27562' \ \n"
    printf "\t                 -t 'EPSG:3946' \ \n"
    printf "\t                 -a 'EPSG:3946' \ \n"
    printf "\t                 --action dxftodxf \ \n"
    printf "\t                 ~/f/CARTOGRAPHIE/donnees/vecteur/dxf_lamb2/Releve_complementaire_Rue_Kaestler.dxf\n"
}

#if [ $# -eq 0 ]
#then
#    usage
#    exit
#fi


function dxf2psql(){
    # import du dxf vers postgresql
    export PGCLIENTENCODING=utf8
    #psql -h $HOST -p $PORT -d $DBNAME -U $USER -c "DROP TABLE if exists '$TABLE';"
    psql -h $HOST -p $PORT -d $DBNAME -U $USER -c "DROP TABLE if exists \"$TABLE\";"
    ogr2ogr -skipfailures \
            -progress \
            -overwrite \
            -s_srs $S_SRS \
            -t_srs $T_SRS \
            -a_srs $A_SRS \
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
            -s_srs $S_SRS \
            -t_srs $T_SRS \
            -a_srs $A_SRS \
            -f "DXF" \
            $F3 \
            PG:"host=$HOST port=$PORT dbname=$DBNAME user=$USER password=$PASSWORD" \
            -nln "$TABLE" \
            "$TABLE"
}


function gml2psql(){
    # import du dxf vers postgresql
    export PGCLIENTENCODING=utf8
    #psql -h $HOST -p $PORT -d $DBNAME -U $USER -c "DROP TABLE if exists '$TABLE';"
    psql -h $DBHOST -p $DBPORT -d $DBNAME -U $DBUSER -c "DROP TABLE if exists \"$TABLE\" CASCADE;"
    ogr2ogr -skipfailures \
            -progress \
            -overwrite \
            -s_srs $S_SRS \
            -t_srs $T_SRS \
            -a_srs $A_SRS \
            -f "PostgreSQL" \
            PG:"host=$DBHOST port=$DBPORT dbname=$DBNAME user=$DBUSER password=$DBPASS" \
            "$F2" \
            -nln "$DBSCHE"."$TABLE"
}


function psql2gml(){
    # export de postgresql vers dxf
    rm -rf $F3
    export PGCLIENTENCODING=utf8
    #
    ogr2ogr -skipfailures \
            -progress \
            -overwrite \
            -s_srs $S_SRS \
            -t_srs $T_SRS \
            -a_srs $A_SRS \
            -f "GML" \
            $F3 \
            PG:"host=$DBHOST port=$DBPORT dbname=$DBNAME user=$DBUSER password=$DBPASS" \
            -nln "$DBSCHE"."$TABLE" \
            "$DBSCHE"."$TABLE"
}




function psqlinfo(){
    ogrinfo \
            PG:"host=$DBHOST port=$DBPORT dbname=$DBNAME user=$DBUSER password=$DBPASS" \
            "$DBSCHE"."$TABLE" \
            -so
}

function dxfinfo(){
    ogrinfo \
            $1 \
            entities \
            -so
}

function gmlinfo(){
    ogrinfo \
            $1 \
            EmpriseDeclaration \
            -so
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
        #ENCODAGE_INI="LATIN1"
        #ENCODAGE_FIN="LATIN1"
        # du DXF windows à un fichier utilisable sous linux/postgresql/utf8
        #iconv -f UTF8 -t LATIN1 $INI > $F2
        #cp $INI $F2
        iconv -f $ENCODAGE_INI -t $ENCODAGE_FIN $INI > $F2
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


function gmltopsql(){
    if [ -f $1 ]
    then
        #ENCODAGE_INI="LATIN1"
        #ENCODAGE_FIN="LATIN1"
        # du DXF windows à un fichier utilisable sous linux/postgresql/utf8
        #iconv -f UTF8 -t LATIN1 $INI > $F2
        #cp $INI $F2
        iconv -f $ENCODAGE_INI -t $ENCODAGE_FIN $INI > $F2
        # import du dxf vers postgresql
        gml2psql
        # suppression du fichier $F2
        rm -f $F2
    else
        echo "Ce n'est pas un fichier !"
        usage
        exit 0
    fi
}

function psqltogml(){
    if [ -f $1 ]
    then
        # export de postgresql vers dxf
        psql2gml
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


#echo "BEFORE GETOPT: $@";

OPTS=$( getopt -o "h:p:d:S:U:P:s:t:a:i:f:A:" \
               -l "help,dbhost:,dbport:,dbname:,dbsche:,dbuser:,dbpass:,s_srs:,t_srs:,a_srs:,encodage_ini:,encodage_fin:,action:,dxftodxf,dxftopsql,psqltodxf,gmltopsql,psqltogml,psqlinfo,dxfinfo,gmlinfo" \
               -- "$@" )

#echo "AFTER  GETOPT: $@";

# mauvais arguments
if [ $? != 0 ]
then
    echo "Terminating"
    exit 1
fi

# initialisation des premières variables
init1

eval set -- "$OPTS"

#echo "AFTER SET -- \$OPTS: $@";

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
        -s | --s_srs)
            S_SRS=$2;
            shift 2;;
        -t | --t_srs)
            T_SRS=$2;
            shift 2;;
        -a | --a_srs)
            A_SRS=$2;
            shift 2;;
        -i | --encodage_ini)
            ENCADAGE_INI=$2;
            shift 2;;
        -f | --encodage_fin)
            ENCADAGE_FIN=$2;
            shift 2;;
        -A | --action)
            ACTION=$2;
            shift 2;;
        --dxftodxf) echo "Conversion du DXF en DXF";
            ACTION="dxftodxf"
            #init2 $2;
            #dxftodxf;
            shift ;;
        --dxftopsql) echo "Conversion du DXF en table";
            ACTION="dxftopsql"
            #init2 $2;
            #dxftopsql;
            shift ;;
        --psqltodxf) echo "Conversion de la table en DXF";
            ACTION="psqltodxf"
            #init2 $2;
            #psqltodxf;
            shift ;;
        --gmltopsql) echo "Conversion du GML en table";
            ACTION="gmltopsql"
            #init2 $2;
            #dxftopsql;
            shift ;;
        --psqltogml) echo "Conversion de la table en GML";
            ACTION="psqltogml"
            #init2 $2;
            #psqltodxf;
            shift ;;
        --psqlinfo) echo "Info sur une table d'une base PostgreSQL";
            ACTION="psqlinfo"
            shift ;;
        --dxfinfo) echo "Info sur un fichier DXF";
            ACTION="dxfinfo"
            shift ;;
        --gmlinfo) echo "Info sur un fichier GML";
            ACTION="gmlinfo"
            shift ;;
        --) #echo "Veuillez choisir entre dxftopsql et psqltodxf"
            shift ;
            break;;
        #*)  echo "Erreur interne" ;
        #    exit 1 ;;
    esac
done
#echo "AFTER OPTION PROCESSING: $@";

# après avoir analysé les options,
# on peut lancer la suite de commande
init2 $@
case "$ACTION" in
    dxftodxf)
           dxftodxf $@
           ;;
    dxftopsql)
           dxftopsql $@
           ;;
    psqltodxf)
           psqltodxf $@
           ;;
    gmltopsql)
           gmltopsql $@
           ;;
    psqltogml)
           psqltogml $@
           ;;
    psqlinfo)
           psqlinfo $@
           ;;
    dxfinfo)
           dxfinfo $@
           ;;
    gmlinfo)
           gmlinfo $@
           ;;
    usage)
           usage $@
           ;;
esac

exit 0
