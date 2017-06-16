#!/bin/sh
#

#
# Enchainement des scripts pour comparer les données liées à la voirie
#


## Recopie du script dans le repertoire python

cp manipuleSymbole.py ~fred/.qgis2/python/expressions/

./AA_installPostgresqlSymbologie.sh
./BA_Initialisation_1.sh
#./CA_Initialisation_2.sh
#./DA_AutoFromManuel.sh
#./EA_Comparaison.sh
#./FA_Initialisation_3.sh
