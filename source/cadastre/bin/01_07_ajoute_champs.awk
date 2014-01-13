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
    case 7: complement=";;;;;;;"; break;
    case 8: complement=";;;;;;;;"; break;
    case 9: complement=";;;;;;;;;"; break;
    case 10: complement=";;;;;;;;;;"; break;
    case 11: complement=";;;;;;;;;;;"; break;
    case 12: complement=";;;;;;;;;;;;"; break;
    case 13: complement=";;;;;;;;;;;;;"; break;
    case 14: complement=";;;;;;;;;;;;;;"; break;
    case 15: complement=";;;;;;;;;;;;;;;"; break;
    case 16: complement=";;;;;;;;;;;;;;;;"; break;
    case 17: complement=";;;;;;;;;;;;;;;;;"; break;
    case 18: complement=";;;;;;;;;;;;;;;;;;"; break;
    case 19: complement=";;;;;;;;;;;;;;;;;;;"; break;
    case 20: complement=";;;;;;;;;;;;;;;;;;;;"; break;
    case 21: complement=";;;;;;;;;;;;;;;;;;;;;"; break;
    case 22: complement=";;;;;;;;;;;;;;;;;;;;;;"; break;
    case 23: complement=";;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 24: complement=";;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 25: complement=";;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 26: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 27: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 28: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 29: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 30: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 31: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 32: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 33: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 34: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 35: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 36: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 37: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 38: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 39: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 40: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 41: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 42: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 43: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 44: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 45: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 46: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 47: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 48: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 49: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 50: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 51: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 52: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 53: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 54: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 55: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 56: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 57: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 58: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 59: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
    case 60: complement=";;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;"; break;
}


if (cnt >= (NBCHAMP-60)) {
    #print NR " : " cnt " : " $0 complement
    print $0 complement
} else {
    print NR " : " cnt " : ALERTE : " $0
}


}

END {

}
