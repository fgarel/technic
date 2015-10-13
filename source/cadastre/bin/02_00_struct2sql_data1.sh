#!/bin/bash

# script qui a pour objectif de generer des creations de tables,
# à partir des fichiers de description de structure que l'on trouve sous
# ../data1/head/txt/

#============
# tables bati
#============
./02_01_bati.sh

#============
# tables fanr
#============
./02_02_fanr.sh

#============
# tables lloc
#============
./02_03_lloc.sh

#============
# tables nbat
#============
./02_04_nbat.sh

#============
# tables pdll
#============
./02_05_pdll.sh

#============
# tables prop
#============
./02_06_prop.sh


