#!/bin/sh

HOST=debian.mairie.fr
#HOST=192.168.0.21

# Import des objets dans les tables
#==================================

psql -h $HOST -U contrib -d patrimoine -f sql/caseFabricPgsql3_import.sql
