#!/bin/sh

HOST=debian.mairie.fr
#HOST=192.168.0.21

# Export de certains enregistrements
# ==================================

psql -h $HOST -U contrib -d patrimoine -f ./sql/caseFabricPgsql5_export.sql
