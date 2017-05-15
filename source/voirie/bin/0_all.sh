#!/bin/sh
#

#
# Enchainement des scripts pour comparer les données liées à la voirie
#

./AA_installPostgresqlEspu.sh
./BA_Initialisation_1.sh
./CA_Initialisation_2.sh
./DA_AutoFromManuel.sh
./EA_Comparaison.sh
./FA_Initialisation_3.sh
