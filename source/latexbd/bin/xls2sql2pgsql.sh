#!/bin/bash

#---------------------------------------------------------------------------
#  xls2sql2pgsql 0.0.1
#  --  tool to transfert excel files into a Postgresql database
#  (C) 2007 Frederic Garel <fgarel@free.fr>

#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#---------------------------------------------------------------------------


nom="xls2sql2pgsql"
xls2sql2pgsqlVERSION="0.0.1"
xls2sql2pgsqlRELEASE="2007/07/13"

# initialisation des variables d'option
optaide=0
optversion=0


while getopts ":hv" option
do
  case $option in
      h) optaide=1 ;;
      v) optversion=1 ;;
      *) echo "xls2sql2pgsql option -$OPTARG inconnue"
         optaide =1 ;;
  esac
done
shift $((OPTIND -1))

# version info
if [ $optversion = 1 ]; then
   echo "$nom versions $xls2sql2pgsqlVERSION ($xls2sql2pgsqlRELEASE)."
   echo "Relased under the GPL."
   exit 0
fi

# help
if [ $optaide = 1 ]; then
  echo "Syntax: $nom -options repertoire"
  echo "les options sont -hv pour afficher l'aide ou la version"
  echo "repertoire est le repertoire de depart où sont stockés les fichiers xls et a partir duquel l'utilitaire va operer"
  exit 0
fi

repertoire=$1

# un nom de repertoire est nécessaire
if [ "x$repertoire" == "x" ]; then
  echo "$0: erreur, vous devez donner un nom de repertoire."
  optaide=1
  repertoire=../data_sql/excel2sql/
  #exit 1
fi

# test pour vérifier que c'est bien un repertoire et pas un fichier
if [ ! -d $repertoire ]; then
  echo "$0: erreur, le premier argument n'est pas un repertoire."
  optaide=1
  exit 1
fi


# 1ere partie on recupere les fichiers sql
# on nettoye les repertoires de travail
rm -rf ../data_sql/avant_recode/*
rm -rf ../data_sql/apres_recode/*
# on recopie les fichiers sql
cp ../data_sql/excel2sql/*.sql ../data_sql/avant_recode/
cp ../data_sql/avant_recode/* ../data_sql/apres_recode/

# on les recode en utf8
recode l1..utf8 ../data_sql/apres_recode/*

# 2eme partie on execute les commandes sql

#psql template1 -c 'drop database "topographie8";'
psql template1 -c 'drop database "topographie";'
psql template1 -c 'create DATABASE "topographie" with encoding='\'UTF8\'';'

for a in `find ../data_sql/apres_recode/ -type f -print`
  do
    psql topographie -f $a
  done
