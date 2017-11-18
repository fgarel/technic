#!/bin/sh
# à partir du fichier tables.txt (fabriqué avec l'aide de tables.sql, dans henplus), on va fabriqué un second fichier de commande henplus
# qui s'appelera table.sql (sans le s final)
# la commande totale sous henplus est donc
# @tables.sql ; !./create_table_sql.sh ; @table.sql ; !./create_desc.sh

rm -f table.sql
rm -f *_desc.dump
rm -f *_data.dump

# nota 1
# 3 fichiers seront générés :
# *_desc.dump pour la description de la table
# *_data.dump pour l'extractionn complete des données de la table
# *_first.dump pour selectionner un enregistrement au hasard dans la table


# nota 2
# pour une base de type postgresl, la selection d'un enregistrement au hasard est effectuée grace à la requete
# select * from table order by random() limit 1;
# pour une base de type sql server, l'instruction sql est
# select top 1 * from table order by newid();
tail -n+6 tables.txt \
  | head -n-3 \
  | cut -f2 -d'|' \
  | sed -e 's/ //g' \
  | xargs -i{} echo spool {}_desc.dump ";" describe {} ";" dump-out {}_data.dump {} ";" spool off ";" spool {}_first.dump ";" "select * from {} order by random() limit 1;" ";" spool off > table.sql


