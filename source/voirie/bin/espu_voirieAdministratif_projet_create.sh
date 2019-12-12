#!/bin/sh
# script pour executer la mise à jour de la base de données à partir d'une feuille google sheet

echo "# Lancement de la requete SQL"
echo "psql -h localhost -U fred -d espu -f /home/fred/Documents/technic/source/voirie/bin/sql/espu_voirieAdministratif_projet_create.sql"
      psql -h localhost -U fred -d espu -f /home/fred/Documents/technic/source/voirie/bin/sql/espu_voirieAdministratif_projet_create.sql
