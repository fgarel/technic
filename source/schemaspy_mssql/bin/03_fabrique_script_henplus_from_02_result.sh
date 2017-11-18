#!/bin/sh
#

# A partir du fichier 02_tables_result.data (fabriqué avec l'aide de 01_liste_tables.henplus, dans henplus),
# on va fabriquer un second fichier de commande henplus
# qui s'appelera 04_table.henplus
# la commande totale sous henplus est donc
# @tables.sql ; !./create_table_sql.sh ; @table.sql ; !./create_desc.sh

rm -f ../data/04_table_desc.henplus
rm -f ../data/05_table_first.henplus
rm -f ../data/06_table_data.henplus
rm -f ../data/*.desc.dump
rm -f ../data/*.data.dump
rm -f ../data/*.first.dump

# Nota 1
# 3 fichiers seront générés :
# *_desc.dump pour la description de la table
# *_data.dump pour l'extraction complete des données de la table
# *_first.dump pour selectionner un enregistrement au hasard dans la table


# desc
tail -n+6 ../data/02_tables_result.data \
  | head -n-3 \
  | cut -f1,2 -d'|' \
  | sed -e 's/ //g' -e 's/|/\./g' \
  | xargs -i{} echo spool {}.desc.dump ";" describe {} ";" spool off ";" > ../data/04_table_desc.henplus

# first
# pour une base de type postgresl, la selection d'un enregistrement au hasard est effectuée grace à la requete
#   select * from table order by random() limit 1;
# pour une base de type mssqlserver, l'instruction sql est
#   select top 1 * from table order by newid();
tail -n+6 ../data/02_tables_result.data \
  | head -n-3 \
  | cut -f1,2 -d'|' \
  | sed -e 's/ //g' -e 's/|/\./g' \
  | xargs -i{} echo spool {}.first.dump ";" select top 1 \* from {} order by newid\(\)\; spool off ";" > ../data/05_table_first.henplus

# data
tail -n+6 ../data/02_tables_result.data \
  | head -n-3 \
  | cut -f1,2 -d'|' \
  | sed -e 's/ //g' -e 's/|/\./g' \
  | xargs -i{} echo spool {}.data.dump ";" select \* from {}\; spool off ";" > ../data/06_table_data.henplus


