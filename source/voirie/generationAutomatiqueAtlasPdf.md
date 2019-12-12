# Génération automatique de pdf à partir d'une feuille google spreadsheet

## 1. Introduction

Nous souhaitons saisir des infos dans une feuille google spreadsheet

Ces infos seront ensuite récupérées dans notre base de données postgresql.

Enfin, un script, associé à un projet qgis et à une mise en page de type atlas,
cet ensemble va nous permettre de créer des pdf



## 2. Connecter google spreadsheet à postgresql

Il s'agit de transférer l'information de google spreadsheet vers postgresql.

Un connecteur, que l'on utilise depuis postgresql, est donc utilisé pour permettre
ce transfert d'informations.

Les connecteurs (Foreign Data Wrappers) (FDW) sont listés ici :
https://wiki.postgresql.org/wiki/Foreign_data_wrappers

A priori, cela se fait de plusieurs facons :
  1. avec le connecteur vu ici : https://github.com/lincolnturner/gspreadsheet_fdw
  2. avec le connecteur vu ici : https://github.com/ahungry/postgres-multicorn-restful-api
  3. avec le connecteur vu ici : https://github.com/Kozea/Multicorn
  4. avec le connecteur vu ici : https://github.com/nkhorman/json_fdw

Dans les faits, seule la première solution fonctionne

### 2.1. Installation du connecteur gspreadsheet

#### 2.1.1. Creation du wrapper sur la machine hote
~/Documents/install/source/environnementTravail/installPythonGoogleSpreadsheet.sh

#### 2.1.2. Installation de ce wrapper dans la base PostgreSQL
```
CREATE EXTENSION IF NOT EXISTS multicorn;

DROP SERVER IF EXISTS multicorn_gspreadsheet CASCADE;
CREATE SERVER IF NOT EXISTS multicorn_gspreadsheet FOREIGN DATA WRAPPER multicorn
options (
  wrapper 'gspreadsheet_fdw.GspreadsheetFdw' );
```

#### 2.1.3. Utilisation de ce connecteur

Pour pouvoir utiliser ce connecteur, nous avons besoin de lui fournir des renseignements,
et en particulier, comment se connecter à notre google spreadsheet.

Au préalable, il faut donc que nous partagions cette feuille avec un utilisateur
qui aura le droit de s'y connecter.

D'après les infos suivi sur cette page
https://github.com/lincolnturner/gspreadsheet_fdw/blob/master/gspreadsheet_fdw/__init__.py

Les options du connecteur sont :
```
The following options are required:
gskey     -- the key from the gsheet URL
headrow   -- which row of the spreadsheet to take column names from. Defaults to 1.
keyfile   -- the path (on the postgresql-server!) to the .json file containing the appropriate credentials
             see https://github.com/burnash/gspread and http://gspread.readthedocs.org/en/latest/oauth2.html ,
             basically, go to https://console.developers.google.com/
               make (or choose) a project, choose "Enable or manage APIs", enable "Drive API",
               choose Credentials, then "New credentials", then "server account key".
               This will make a new email address ending in gserviceaccount.com
               Yes, it's roundabout, I can't help it...
             Then just share your gsheetd with the @...gserviceaccount.com email address.
```

Les étapes sont donc :
1. Il faut obtenir le "credential" OAuth2 (https://gspread.readthedocs.io/en/latest/oauth2.html)

   Pour cela, concrètement, on va ici
   https://console.developers.google.com/

   on clique sur "Activer les API et Services"

   on recherche la "Google Drive API"

   Il faut ensuite Créer des identifiants pour utiliser cet API : "Créer des identifiants"
   dans le panneau de gauche, il faut cliquer sur le menu "identifiants"
   dans le panneau de droite, il faut cliquer sur Créer des identifiants, puis
   choisir, "Clé de compte de service"

     Ajouter des identifiants au project
     Quelle API utilisez vous

     Google Drive API

     Quelle plate-forme utilisez vous pour appeler l'APIs
     Autre plateforme sans interface utilisateur (exemple : tache cron, demon, ...)

     A quelle données allez-vous accédez
     Données de l'Application

     Comptez vous utiliser cette API conjointement à App Engine ou Compute Engine
     Non, je ne les utilise pas


     Nom du compte de service (Attention : mettre des - et pas des \_)
     "vlr-voirie-admin"

     Adresse e-mail (car le mail est automatiquement converti sans le \_)
     "vlr-voirie-admin@debianpaquetmapnik.iam.gserviceaccount.com"

     Rôle
     Project / Editeur

     ID de compte de services

     Type de Clé
     JSON

   on enregistre la clef sous
   /home/fred/.local/share/debianpaquetmapnik-e8255c38290e.json
   /home/fred/.local/share/debianpaquetmapnik-e8255c38290e.json

   Il faut rendre ce fichier json utilisable par l'utilisateur postgres sur le serveur de base de Données
   ```
   sudo cp /home/fred/.local/share/debianpaquetmapnik-e8255c38290e.json /var/lib/postgresql/11/main/
   sudo chown postgres:postgres /var/lib/postgresql/11/main/debianpaquetmapnik-e8255c38290e.json
   ```

2. On ouvre le fichier spreadsheet dans notre drive, et on le partage
   avec l'utilisateur dont le mail est "client_email"
   paramètre de partage
   inviter des utilisateurs :
   vlr-voirie-admin@debianpaquetmapnik.iam.gserviceaccount.com

   on obtient un identifiant "gskey" pour le partage de ce google Spreadsheet
   https://docs.google.com/spreadsheets/d/1tqbwCCnLioPfEe1xNq00vKlF7H-fZ6cJdHJxFsYWAJQ/edit?usp=sharing
   gskey = 1tqbwCCnLioPfEe1xNq00vKlF7H-fZ6cJdHJxFsYWAJQ

3. Donc les infos qui nous intéressent sont :

     gskey     1tqbwCCnLioPfEe1xNq00vKlF7H-fZ6cJdHJxFsYWAJQ
     headrow   1
     keyfile   /home/fred/.local/share/debianpaquetmapnik-e8255c38290e.json
     keyfile   /var/lib/postgresql/11/main/debianpaquetmapnik-e8255c38290e.json



Voici un extrait (pas à jour) du fichier
```
~/Documents/technic/source/voirie/bin/sql/create_vlr_voirie_numvoie.sql
```

```

-- pour se connecter, on utilise multicorn
CREATE EXTENSION IF NOT EXISTS multicorn;

-- Pour faire le rafraîchissement des données, on pensait pouvoir utiliser pg_cron
-- (l'installation de pg_cron necessite de modifier postgresql.conf)
CREATE EXTENSION IF NOT EXISTS pg_cron;

DROP SERVER IF EXISTS multicorn_gspreadsheet CASCADE;
CREATE SERVER IF NOT EXISTS multicorn_gspreadsheet FOREIGN DATA WRAPPER multicorn
options (
  wrapper 'gspreadsheet_fdw.GspreadsheetFdw' );

DROP FOREIGN TABLE IF EXISTS "voirie_administratif"."numvoie_gspreadsheet" CASCADE;
CREATE FOREIGN TABLE IF NOT EXISTS "voirie_administratif"."numvoie_gspreadsheet" (
  "code_demande" character varying,
  "ccosec"       character varying,
  "parcelle"     character varying,
  "ident"        character varying,
  "codeident"    character varying
) server multicorn_gspreadsheet options(
  gskey   '1tqbwCCnLioPfEe1xNq00vKlF7H-fZ6cJdHJxFsYWAJQ',
  headrow '1',
  keyfile '/var/lib/postgresql/11/main/debianpaquetmapnik-e8255c38290e.json'
);

SELECT * from "voirie_administratif"."numvoie_gspreadsheet" ;

-- Oh, you want it faster?  use a materialized view to cache it:
DROP MATERIALIZED VIEW IF EXISTS "voirie_administratif"."mv_numvoie_gspreadsheet";
CREATE MATERIALIZED VIEW IF NOT EXISTS "voirie_administratif"."mv_numvoie_gspreadsheet" AS SELECT * FROM "voirie_administratif"."numvoie_gspreadsheet";

SELECT * from "voirie_administratif"."mv_numvoie_gspreadsheet";

-- Periodically refresh (use a trigger or something)
--REFRESH MATERIALIZED VIEW "voirie_administratif"."mv_numvoie_gspreadsheet";

-- Pour faire ce rafraîchissement on pensait pouvoir utiliser pg_cron
-- (l'installation de pg_cron necessite de modifier postgresql.conf)
CREATE EXTENSION IF NOT EXISTS pg_cron;

--select cron.unschedule(1);
--select cron.unschedule(2);
--select cron.unschedule(3);
SELECT cron.schedule('*/5 * * * *', $$SELECT * FROM "voirie_administratif"."numvoie_gspreadsheet";$$);
SELECT cron.schedule('*/5 * * * *', $$REFRESH MATERIALIZED VIEW "voirie_administratif"."mv_numvoie_gspreadsheet";$$);
SELECT cron.schedule('*/5 * * * *', $$SELECT * FROM "voirie_administratif"."mv_numvoie_gspreadsheet";$$);

SELECT * from "voirie_administratif"."mv_numvoie_gspreadsheet";

```

#### 2.1.4. Mise à jour automatique des informations

Nous souhaitons que les modifications effectuées dans le ficher google sheet
soient automatiquement reversées dans postgresql.

Google sheet ne pousse pas les modifications (trop compliqué...)

Il faut donc, aller chercher ces modifications depuis notre poste.

L'idée de départ était d'utiliser pg_cron, c'est à dire un cron à l'intérieur de postgresql.

La consultation des logs nous montre que cette solution envisagée ne fonctionne pas
tail -f /var/log/postgresql/postgresql-11-main.logs

Nous allons dons utiliser le cron du système.

Un fichier .sql qui contient la requête de mise à jour
```
sql/espu_voirieAdministratif_projet_update_avantImpression.sql
```

```
REFRESH MATERIALIZED VIEW "voirie_administratif"."mv_demande_gspreadsheet";
```

Un fichier .sh qui lance cette requête
```
espu_voirieAdministratif_projet_update_avantImpression.sh
```

```
psql -h localhost -U fred -d espu -f /home/fred/Documents/technic/source/voirie/bin/sql/espu_voirieAdministratif_projet_update_avantImpression.sql
```

Puis un cron

echo '#---------------------------------------'
echo '# Ajout d une tache cron'
echo '# https://doc.ubuntu-fr.org/cron'
echo '#'
echo '# crontab -l'
echo '#'
echo '# crontab -e'
echo '#'
echo 'MAILTO=""'
echo ''
echo '# https://askubuntu.com/questions/611336/why-putting-a-script-in-etc-cron-hourly-is-not-working'
echo 'DISPLAY=":0"'
echo 'XAUTHORITY="/home/fred/.Xauthority"'
echo 'XDG_RUNTIME_DIR="/run/user/1000"'
echo '#'
echo '# toutes les 5 minutes, tous les jours ouvrés, entre 7h et 21h'
echo '# */5 7-21 * * mon,tue,wed,thu,fri,sat /home/fred/Documents/technic/source/voirie/bin/espu_voirieAdminitratif_qgis_python_printing.sh >> ~/cron.log 2>&1'
echo '*/5 7-21 * * mon,tue,wed,thu,fri,sat /home/fred/Documents/technic/source/voirie/bin/espu_voirieAdminitratif_qgis_python_printing.sh > /dev/null 2>&1'
echo '#'
echo '#---------------------------------------'


## 3. Les manipulations sous postgresql
table


ij_demande_numvoie :
rapprochement inner join entre les demandes et les numvoie

ij_demande_parcelle :
rapprochement inner join entre les demandes et les parcelle_tab_id_seq

ij_demande_etatAvancement :
rapprochement inner join entre les demandes et l'etat d'avancement de ces demandes

lj_demand_numvoie : demande qui n'ont pas de correpondance avec un numéro (tableau du certificat vide)
lj_demande_parcelle : demande qui n'ont pas de correpondance avec une parcelle (pas de localisation à la parcelle possible)

"demande_avancement"
  on fabrique, on met à jour cette table
  - au moment de la lecture de demande_gspreadsheet
  - avant et après la fabrication d'un pdf


  on met l'avancement à
  - en_attente :
    quand la demande est nouvelle dans gspreadsheet
mais que

- pret : la demande
- on met l'avancement à à_vérifier quand la demande est générée et à vérifier
- on met l'avancement à à_revérifier
- on met l'avancement à

atlas_aFaire_numerotage
- les demandes avec n dans gspreadsheet et qui n'ont pas déjà eté faites

atlas_aReFaire_numerotage
- les demandes avec f dans gspreadsheet et qui n'ont pas été été refaites


## 4. sous qgis, la preparation de l'atlasFilter

## 5. le script qui lance la generation des plans
