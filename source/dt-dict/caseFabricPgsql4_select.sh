#!/bin/sh

HOST=debian.mairie.fr
#HOST=192.168.0.21

# Selection de certains enregistrements
# =====================================

psql -h $HOST -U contrib -d patrimoine -f ./sql/caseFabricPgsql4_select.sql

