#!/usr/bin/awk -f

#
# doc
# 
# awk
# http://www.sqlpac.com/referentiel/docs/unix-awk-tutoriel.htm
# http://fr.wikipedia.org/wiki/Awk
# http://www.grymoire.com/Unix/Awk.html
# http://www.gnu.org/software/gawk/manual/html_node/index.html

# awk grep et sed
# http://www.corporesano.org/doc-site/grepawksed.html
# différence entre awk nawk et gawk
# http://www.thegeekstuff.com/2011/06/awk-nawk-gawk/
# sed
# http://sed.sourceforge.net/sed1line_fr.html



BEGIN {
# le separateur de champ est le caractere FS
FS=";"
}

{

cnt=0

for(i=1; i<=NF; i++) {
    if($i != "") {
        cnt++}
}

# normalement, la ligne devrait contenir 46 caracteres separateurs
# variable NBCHAMP passé en argument
nbcomplement=NBCHAMP-cnt

switch (nbcomplement) {
    case 0: complement="";break;
    case 1: complement=";"; break;
    case 2: complement=";;"; break;
    case 3: complement=";;;"; break;
    case 4: complement=";;;;"; break;
    case 5: complement=";;;;;"; break;
    case 6: complement=";;;;;;"; break;
}

if (cnt >= (NBCHAMP-6)) {
    #print NR " : " cnt " : " $0 complement
    print $0 complement
} else {
    print NR " : " cnt " : ALERTE : " $0
}


}

END {

}
