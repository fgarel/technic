#!/bin/bash

#---------------------------------------------------------------------------
#  lsPic 0.0.1
#  --  list pictures into a postrgresql database
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


nom="lsPic"
lsPicVERSION="0.0.1"
lsPicRELEASE="2007/07/13"

# initialisation des variables d'option
optaide=0
optversion=0


while getopts ":hv" option
do
  case $option in
      h) optaide=1 ;;
      v) optversion=1 ;;
      *) echo "lsPic option -$OPTARG inconnue"
         optaide =1 ;;
  esac
done
shift $((OPTIND -1))


# version info
if [ $optversion = 1 ]; then
   echo "$nom versions $lsPicVERSION ($lsPicRELEASE)."
   echo "Relased under the GPL."
   exit 0
fi

# help
if [ $optaide = 1 ]; then
  echo "Syntax: $nom -options repertoire motif"
  echo "les options sont -hv pour afficher l'aide ou la version"
  echo "repertoire est le repertoire depart a partir duquel la commande find va operer"
  echo "motif est la pour filtrer un type de fichier. par exemple les fichiers *.png"
  exit 0
fi

repertoirePic=$1

# un nom de repertoire est nécessaire
if [ "x$repertoirePic" == "x" ]; then
  echo "$0: erreur, vous devez donner un nom de repertoire."
  optaide=1
  exit 1
fi

# test pour vérifier que c'est bien un repertoire et pas un fichier
if [ ! -d $repertoirePic ]; then
  echo "$0: erreur, le premier argument n'est pas un repertoire."
  optaide=1
  exit 1
fi



# ecriture du debut du fichier sql
  echo "--DROP TABLE IF EXIST dirname_basename_fullname;" > test.sql
  echo "--DROP TABLE dirname_basename_fullname;" >> test.sql
  echo "CREATE TABLE dirname_basename_fullname(" >> test.sql
  echo "  dirname varchar(256)," >> test.sql
  echo "  basename varchar(256)," >> test.sql
  echo "  fullname varchar(256)" >> test.sql
  echo ")" >> test.sql
  echo "WITH OIDS;" >> test.sql

# fabrication d'un fichier SQL listant les fichiers png
#./ls2db.sh $repertoirePic "*.tex" >> test.sql
./ls2db.sh $repertoirePic "*.eps" >> test.sql
./ls2db.sh $repertoirePic "*.png" >> test.sql

# ecriture de la fin du fichier sql
  echo "VACUUM ANALYSE;" >> test.sql


# execution du fichier sql
psql topographie -c "DROP TABLE dirname_basename_fullname;"
psql topographie -f test.sql

# bonus
# on execute aussi d'autres fichiers sql
psql topographie -f ../data_sql/rapprochement_representation_chagneau.sql
