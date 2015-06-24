#!/bin/sh

HOST=debian.mairie.fr
#HOST=192.168.0.21

# Suppression et creation des tables
#===================================

psql -h $HOST -U contrib -d patrimoine -f sql/caseFabricPgsql2_createTable.sql




