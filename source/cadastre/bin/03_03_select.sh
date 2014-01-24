#!/bin/sh

HOST=10.2.10.56

# Selection de certains enregistrements
# =====================================
psql -h $HOST -U contrib -d patrimoine -c "ALTER ROLE contrib SET search_path TO cadastre_travail, cadastre_majic, cadastre_public, public;"
psql -h $HOST -U contrib -d patrimoine -f ./sql/select.sql

