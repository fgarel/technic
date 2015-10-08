#!/bin/sh

#HOST=10.2.10.56
HOST=debian.mairie.fr

# script pour effectuer les jointures entre les données littérals et le plan cadastral


psql -h $HOST -U contrib -d patrimoine -c "ALTER ROLE contrib SET search_path TO cadastre_travail, cadastre_majic, cadastre_public, public;"
psql -h $HOST -U contrib -d patrimoine -f ./sql/jointure_graphique_litteral.sql
