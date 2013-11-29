#!/bin/bash

#---------------------------------------------------------------------------
#  ls2db 0.0.1
#  --  list files in directory to sql insert command
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


nom="ls2db"
ls2dbVERSION="0.0.1"
ls2dbRELEASE="2007/07/13"

# initialisation des variables d'option
optaide=0
optversion=0


while getopts ":hv" option
do
  case $option in
      h) optaide=1 ;;
      v) optversion=1 ;;
      *) echo "ls2bd option -$OPTARG inconnue"
         optaide =1 ;;
  esac
done
shift $((OPTIND -1))

# version info
if [ $optversion = 1 ]; then
   echo "$nom versions $ls2dbVERSION ($ls2dbRELEASE)."
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

repertoire=$1

# un nom de repertoire est nécessaire
if [ "x$repertoire" == "x" ]; then
  echo "$0: erreur, vous devez donner un nom de repertoire."
  optaide=1
  exit 1
fi

# test pour vérifier que c'est bien un repertoire et pas un fichier
if [ ! -d $repertoire ]; then
  echo "$0: erreur, le premier argument n'est pas un repertoire."
  optaide=1
  exit 1
fi



# la commande find $repertoire -type f -print permet de lister les fichiers
# (et non les dossiers (-type f)) et ce, à partir du repertoire designé,
# ainsi que dans ses sous-repertoire de manière récursive

# si il n'y a pas de motif alors $2 est vide
if [ -z $2 ]; then
  #echo "pas de motif"
  echo "--DROP TABLE IF EXIST dirname_basename_fullname;"
  echo "--DROP TABLE dirname_basename_fullname;"
  echo "--CREATE TABLE dirname_basename_fullname("
  echo "--  dirname varchar(256),"
  echo "--  basename varchar(256),"
  echo "--  fullname varchar(256)"
  echo "--)"
  echo "--WITH OIDS;"
  for a in `find $repertoire -type f -print`
    do
      basename_with_extension=`basename $a`
      basename_without_extension=`basename $a`
      dirname=`dirname $a`
      fullname_with_extension=$a
      fullname_without_extension=$a
      # supprime une éventuelle extension .___ 
      # \w = lettre ou chiffre
      # (\w{3})$ = les 3 derniers caractères  
      basename_without_extension=`echo $basename_without_extension | sed -e "s/\(.*\).\(\w\{3\}\)$/\1/"`
      fullname_without_extension=`echo $fullname_without_extension | sed -e "s/\(.*\).\(\w\{3\}\)$/\1/"`
      fullname_without_extension_2=$dirname/$basename_without_extension
      echo "INSERT INTO dirname_basename_fullname(dirname, basename, fullname) VALUES('$dirname', '$basename_without_extension', '$fullname_without_extension');"
    done
  echo "VACUUM ANALYSE;"
  exit 0
else
  # si il y a un motif, alors $2 est non vide
  #echo "selection selon un motif"
  echo "--DROP TABLE IF EXIST dirname_basename_fullname;"
  echo "--DROP TABLE dirname_basename_fullname;"
  echo "--CREATE TABLE dirname_basename_fullname("
  echo "--  dirname varchar(256),"
  echo "--  basename varchar(256),"
  echo "--  fullname varchar(256)"
  echo "--)"
  echo "--WITH OIDS;"
  for a in `find $repertoire -name $2 -type f -print`
    do
      basename_with_extension=`basename $a`
      basename_without_extension=`basename $a`
      dirname=`dirname $a`
      fullname_with_extension=$a
      fullname_without_extension=$a
      # supprime une éventuelle extension .___ 
      # \w = lettre ou chiffre
      # (\w{3})$ = les 3 derniers caractères  
      basename_without_extension=`echo $basename_without_extension | sed -e "s/\(.*\).\(\w\{3\}\)$/\1/"`
      fullname_without_extension=`echo $fullname_without_extension | sed -e "s/\(.*\).\(\w\{3\}\)$/\1/"`
      fullname_without_extension_2=$dirname/$basename_without_extension
      echo "INSERT INTO dirname_basename_fullname(dirname, basename, fullname) VALUES('$dirname', '$basename_without_extension', '$fullname_without_extension');"
    done
  echo "VACUUM ANALYSE;"
  exit 0
fi

#si on arrive ici, alors il y a une erreur
exit 1

