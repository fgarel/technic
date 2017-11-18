#!/bin/sh

# suppression et creation d'un fichier pgpass 
# permettant une connexion non-interactive
rm -f ~/.pgpass
echo "127.0.0.1:5432:*:pg-job:MAIRIELR" > ~/.pgpass
echo "127.0.0.1:5432:*:contrib:alambic" >> ~/.pgpass
echo "127.0.0.1:5432:*:pg-prod:MAIRIELR" >> ~/.pgpass
echo "127.0.0.1:5432:*:contrib:alambic" >> ~/.pgpass
chmod 0600 ~/.pgpass

# creation du role contrib
#psql -h 127.0.0.1 -p 5432 -U pg-prod -d postgres -c "create role contrib with createdb login password 'alambic';"
sudo -u postgres psql -c "create role contrib with createdb login password 'alambic';"

# creation des bases de données
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database association;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database cimetiere;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database electeur;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database ecdeces;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database ecmariage;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database ecnaissance;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database ecreconnaissance;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database ecextrait;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database eclivfamille;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database fast;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database fcni;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database fdebit;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database fpasseport;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database fsdf;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database insee;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database transportcyclable;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database stationnement;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database accessibilite;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database occupationdp;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database dict;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database eclairagepublic;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database erp;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database moblierurbain;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database patrimoine;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database eaupotable;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database eaupluviale;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database sante;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database structuresociale;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database budget;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database factureeau;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database marcheconclu;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database taxesejour;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database fileattenteetatcivil;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database archive;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database passeportjeune;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database scolaire;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database cadastre;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database decoupadmin;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database decoupelectoral;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database decouppopulation;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database orthophoto;'
psql -h 127.0.0.1 -p 5432 -U contrib -d postgres -c 'create database voieadresse;'
