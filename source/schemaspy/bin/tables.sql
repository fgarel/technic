-- dans le fichier tables.txt, on va recuperer la liste des tables

-- @tables.sql ; !./create_table_sql.sh ; @table.sql ; @./create_desc.sh
spool tables.txt
tables
spool off
