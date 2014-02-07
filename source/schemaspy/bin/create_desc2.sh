#!/bin/bash
# attention, il faut avoir installer csvkit
# et il faut etre dans l'environnement python csvkit
# workon csvkit
# chmod +x create_desc2.sh

rm -f *_second.dump
rm -f metadata3.csv


# on va essayer de faire un csvjoin entre metadata2.csv et metadata3.csv
# cela se fera avec la jointure sur la première colonne de chacun de ces deux fichiers
# cette premiere colonne est table%champ

csvjoin -d "|" -c 1 metadata2.csv metadata3.csv > metadata4.csv

# avant la commande sed, la ligne est 1%2,3,4,5%6,7
#  1 = table
#  2 = champ
#  3 = type
#  4 = desc
#  5 = table = 1
#  6 = champ = 6
#  7 = valeur
# apres la commande sed, la ligne est 1|2|3|4|7
sed -i -e 's/^\(.*\)%\(.*\),\(.*\),\(.*\),\(.*\)%/\1%\2|\3|\4|\5%/' -e 's/,/|/' -e 's/^\(.*\)%\(.*\)|\(.*\)|\(.*\)|\(.*\)%\(.*\)|/\1|\2|\3|\4|/' metadata4.csv


# creation du fichier metadata5.csv

( echo "table|champ|type|desc|valeur" ; cat metadata4.csv ) | csvlook -d "|" > metadata5.csv
