#!/bin/sh

REPERTOIRE='/var/www/opendata/IMG/'

#find  $REPERTOIRE \
#      -type f | \
#  cut -d '/' \
#      -f 6,7,8,9,10 | \
#  sed -r -e 's/.*.ok//g' |
#  sed -r -e 's/^([a-zA-Z]*)\/(.*)/;\1;23\/05\/2012;\1\/\2;/g'
#     sed -r -e 's/(\/var\/www\/opendata\/IMG\/)([a-zA-Z]*)(\/)*(.*\")(.*)/\2\5\"/' | \


#
# spip_documents
#

find \
  $REPERTOIRE \
  -type f \
  -printf "0, \"%h\", '', '%AY-%Am-%Ad %AT', '', '%h/%f', %s, 0, 0, 'document', 'non', '%AY-%Am-%Ad %AT', 'publie', '%AY-%Am-%Ad %AT', 0, ''),\n" | \
  sed -r -e 's/\.0000000000//g' | \
  sed -r -e 's/(\/var\/www\/opendata\/IMG)//' | \
  sed -r -e 's/(\")(\/?)([a-zA-Z]*)(\/?)([a-zA-Z_\/]*)(\")/\1\3\6/' | \
  sed -r -e 's/(\/var\/www\/opendata\/IMG)/\./' | \
  sed = | \
  sed 'N;s/\n/, /' | \
  sed -r -e 's/^/(/' > \
  spip_documents.footer

cat spip_documents.header > spip_documents.sql
head -n -1 spip_documents.footer >> spip_documents.sql
tail -n 1 spip_documents.footer | sed -r -e 's/,$/;/' >> spip_documents.sql

#
# spip_documents_liens
#

find \
  $REPERTOIRE \
  -type f \
  -printf "4, 'rubrique', 'non'),\n" | \
  sed = | \
  sed 'N;s/\n/, /' | \
  sed -r -e 's/^/(/' > \
  spip_documents_liens.footer

cat spip_documents_liens.header > spip_documents_liens.sql
head -n -1 spip_documents_liens.footer >> spip_documents_liens.sql
tail -n 1 spip_documents_liens.footer | sed -r -e 's/,$/;/' >> spip_documents_liens.sql

#
# spip_opendata_ressource
#

find \
  $REPERTOIRE \
  -type f \
  -printf "),\n" | \
  sed = | \
  sed 'N;s/\n//' | \
  sed = | \
  sed 'N;s/\n/, /' | \
  sed = | \
  sed 'N;s/\n/, /' | \
  sed -r -e 's/^/(/' > \
  spip_opendata_ressource.footer

cat spip_opendata_ressource.header > spip_opendata_ressource.sql
head -n -1 spip_opendata_ressource.footer >> spip_opendata_ressource.sql
tail -n 1 spip_opendata_ressource.footer | sed -r -e 's/,$/;/' >> spip_opendata_ressource.sql
