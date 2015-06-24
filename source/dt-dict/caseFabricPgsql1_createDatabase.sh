#!/bin/sh

HOST=debian.mairie.fr
#HOST=192.168.0.21

# Suppression et creation d'une base de donnees
#==============================================
# methode shell
#--------------
#sudo -u postgres createuser -s contrib
#sudo -u postgres psql -d templatepostgis -c "ALTER ROLE contrib WITH PASSWORD 'alambic';"
#sudo -u postgres createdb -O contrib -T templatepostgis cadastre

# methode sql => methode à utiliser
#------------
##psql -h $HOST -U contrib -d template1 -f ./sql/dropdatabase.sql
##psql -h $HOST -U contrib -d template1 -f ./sql/createdatabase.sql
##psql -h $HOST -U contrib -d patrimoine -f ./sql/createschema.sql
