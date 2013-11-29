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
# tables nbat
#============
./02_03_nbat.sh

#============
# tables pdl
#============
./02_04_pdl.sh

#============
# tables prop
#============
./02_05_prop.sh

#============
# tables revdi
#============
./02_06_revdi.sh
