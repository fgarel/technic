-- Ce script n'est pas dangereux mais il est incomplet
-- il manque les tables :
-- numvoie
-- et alignement_croquis

-- Après effacement, il est possible de remplir les infos à partir de
-- - a_voirie.vo_adresse
-- - et a_voirie.vo_voie,
-- mais les modifs récentes seront définitivement perdues

-- connexion a la base espu
-- identifiant : fred
-- password : fgpass


-- Il y a deux parties dans ce traitement
-- Partie 1 :
--     il s'agit d'initier la base de données avec une struture adéquate :
--     une table numvoie
--     une table alignement_croquis
-- Partie 2 :
--     cette seconde partie concerne la mise à jour de la table tarcelle_tab

ALTER ROLE fred
  SET search_path = "$user", voirie_administratif, public;


-- ----------- --
-- 1ere partie --
-- ----------- --

-- Attention, dans cette premiere partie, il y a des choses à faire une et une seule fois,
-- et il y a aussi des choses à faire quand il faut changer de mot de passe windows

-- Creation de :
-- - table ""alignement_croquis""
-- - table ""numvoie""
-- - la table distante ""demande"" est une table etrangere : fichier num_align-demande.csv
-- - la table distante ""parcelle"" est une table etrangère : fichier num_align-parcelle.csv
-- - la table distante ""demande_gspreadsheet"" est une table etrangere : google drive gspreadsheet
-- - la table distante ""numvoie_ban"" est une table etrangere : fichier adresse_opendata.csv
-- - la vue numvoie_vue est lien vers la base sig du server 172.17.150.6
-- - la vue parcelle_vue est lien vers la base sig du server 172.17.150.6



-- ------------------ --
-- alignement_croquis --
-- ------------------ --

-- Sequence: voirie_administratif.alignement_croquis_id_seq

-- DROP SEQUENCE if exists voirie_administratif.alignement_croquis_id_seq;
--DROP SEQUENCE if exists voirie_administratif.alignement_croquis_id_seq;
--CREATE SEQUENCE voirie_administratif.alignement_croquis_id_seq
--  INCREMENT 1
--  MINVALUE 1
--  MAXVALUE 9223372036854775807
--  START 1
--  CACHE 1;
--ALTER SEQUENCE voirie_administratif.alignement_croquis_id_seq
--  OWNER TO fred;

-- Table: voirie_administratif.alignement_croquis

-- DROP TABLE if exists voirie_administratif.alignement_croquis;
--DROP TABLE if exists voirie_administratif.alignement_croquis;
--CREATE TABLE voirie_administratif.alignement_croquis
--(
--  --id integer NOT NULL DEFAULT nextval('voirie_administratif.alignement_croquis_id_seq'::regclass), -- Identifiant
--  id integer NOT NULL, -- Identifiant
--  shape geometry, -- Geometrie
--  CONSTRAINT id_alignement_croquis_pk PRIMARY KEY (id),
--  CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL),
--  CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
--)
--WITH (
--  OIDS=FALSE
--);
--ALTER TABLE voirie_administratif.alignement_croquis
--  ADD constraint id_alignement_croquis_pk PRIMARY KEY (id);
--ALTER TABLE voirie_administratif.alignement_croquis
--  OWNER TO fred;
--COMMENT ON TABLE voirie_administratif.alignement_croquis
--  IS 'Alignement de fait.';
--COMMENT ON COLUMN voirie_administratif.alignement_croquis.id IS 'Identifiant';
--COMMENT ON COLUMN voirie_administratif.alignement_croquis.shape IS 'Geometrie';


-- ------- --
-- numvoie --
-- ------- --

-- Sequence: voirie_administratif.numvoie_id_seq

-- DROP SEQUENCE if exists voirie_administratif.numvoie_id_seq;
--DROP SEQUENCE if exists voirie_administratif.numvoie_id_seq;
--CREATE SEQUENCE voirie_administratif.numvoie_id_seq
--  INCREMENT 1
--  MINVALUE 1
--  MAXVALUE 9223372036854775807
--  START 1
--  CACHE 1;
--ALTER SEQUENCE voirie_administratif.numvoie_id_seq
--  OWNER TO fred;

-- DROP TABLE if exists voirie_administratif.numvoie;
--DROP TABLE if exists voirie_administratif."numvoie";
--CREATE TABLE voirie_administratif."numvoie"
--(
  --id serial NOT NULL DEFAULT nextval('voirie_administratif.numvoie_id_seq'::regclass), -- Identifiant
--  id serial NOT NULL, -- Identifiant
--  id_vo_adresse character varying, -- identifiant a_voirie.vo_adresse
--  id_cleabs character varying, -- identifiant numvoie_ban
--  code_demande character varying, -- code_demande
--  numvoie character varying, -- Numéro + complément
--  numvoie_num numeric, -- Numéro
--  numvoie_complement character varying, -- Complément
--  nomvoie character varying, -- Nom de la voie
--  batiment character varying, -- Nom du batiment eventuel
--  angle numeric, -- Angle utilisé uniquement pour l'orientation
--  shape geometry,
--  CONSTRAINT id_numvoie_pk PRIMARY KEY (id),
--  --CONSTRAINT enforce_dims_geom CHECK (st_ndims(shape) = 2),
--  CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL),
--  CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
--)
--WITH (
--  OIDS=FALSE
--);
--ALTER TABLE voirie_administratif.numvoie
--  ADD constraint id_numvoie_pk PRIMARY KEY (id);
--ALTER TABLE voirie_administratif."numvoie"
--  OWNER TO fred;
--COMMENT ON TABLE voirie_administratif."numvoie"
--  IS 'Numéro correspondant à l''adresse postale de la parcelle.';
--COMMENT ON COLUMN voirie_administratif.numvoie.id IS 'Identifiant';
--COMMENT ON COLUMN voirie_administratif.numvoie.code_demande IS 'code_demande';
--COMMENT ON COLUMN voirie_administratif.numvoie.angle IS 'Angle Orientation du texte';
--COMMENT ON COLUMN voirie_administratif.numvoie.shape IS 'Geometrie';



-- ------- --
-- demande -- table distante csv
-- ------- --

-- Creation d'une connexion entre postgresql et fichier libre office (num_align.ods)
-- onglet demande

--DROP SERVER if exists myserver_demande cascade;

--CREATE SERVER myserver_demande
--  FOREIGN DATA WRAPPER ogr_fdw
--  OPTIONS (
--    datasource '/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/num_align.ods',
--    format 'ODS',
--    config_options 'OGR_ODS_HEADERS=FORCE ');


DROP SERVER if exists myserver_demande cascade;

CREATE SERVER myserver_demande
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource '/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/num_align-demande.csv',
    format 'CSV',
    config_options 'OGR_ODS_HEADERS=FORCE ');

DROP TABLE if exists voirie_administratif.demande;
CREATE FOREIGN TABLE voirie_administratif.demande (
  fid bigint,
  code_demande varchar,
  Numero_attribue varchar,
  Alignement_concerne varchar,
  demande_date varchar,
  demande_type_numerotage varchar,
  demande_type_alignement varchar,
  demandeur_telephone varchar,
  demandeur_courriel varchar,
  demandeur_ligne1_raison_sociale_ou_identite varchar,
  demandeur_ligne2_identite_ou_complement varchar,
  demandeur_ligne3_complement varchar,
  demandeur_ligne4_numvoie_nomvoie varchar,
  demandeur_ligne5_boite_postal_ou_lieu_dit varchar,
  demandeur_ligne6_code_postal_ville_cedex varchar,
  bienImmo_vosrefs_ligne1 varchar,
  bienImmo_vosrefs_ligne2 varchar,
  bienImmo_commune varchar,
  bienImmo_anciennumero varchar,
  bienImmo_adresse varchar,
  bienImmo_cadastre_parcelle varchar,
  bienImmo_proprietaire varchar
) SERVER myserver_demande
OPTIONS (layer 'num_align-demande');
--OPTIONS (layer 'demande');


-- -------- --
-- parcelle -- table distante csv
-- -------- --

-- Creation d'une connexion entre postgresql et fichier libre office (num_align.ods)
-- onglet parcelle

--DROP SERVER if exists myserver_parcelle cascade;

--CREATE SERVER myserver_parcelle
--  FOREIGN DATA WRAPPER ogr_fdw
--  OPTIONS (
--    datasource '/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/num_align.ods',
--    format 'ODS' );


DROP SERVER if exists myserver_parcelle cascade;

CREATE SERVER myserver_parcelle
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource '/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/num_align-parcelle.csv',
    format 'CSV',
    config_options 'OGR_ODS_HEADERS=FORCE ');


CREATE FOREIGN TABLE voirie_administratif.parcelle (
  fid bigint,
  code_demande varchar,
  ccosec varchar,
  parcelle varchar,
  ident varchar,
  codeident varchar
) SERVER myserver_parcelle
OPTIONS (layer 'num_align-parcelle');
--OPTIONS (layer 'parcelle');


-- -------------------- --
-- demande_gspreadsheet -- table distante google drive spreadsheet
-- -------------------- --

-- Pour se connecter, on utilise multicorn
CREATE EXTENSION IF NOT EXISTS multicorn;

-- L'installation de ce connecteur multicorn (gspreadsheet_fdw) est détaillé
-- dans le Document
-- ~/Documents/install/source/environnementTravail/installPythonGoogleSpreadsheet.sh
DROP SERVER IF EXISTS multicorn_gspreadsheet CASCADE;
CREATE SERVER IF NOT EXISTS multicorn_gspreadsheet FOREIGN DATA WRAPPER multicorn
options (
  wrapper 'gspreadsheet_fdw.GspreadsheetFdw' );


-- la table est "DRIVE/Documents/technic/source/qgis/Numerotation_VilleLaRochelle"
DROP FOREIGN TABLE IF EXISTS "voirie_administratif"."demande_gspreadsheet" CASCADE;
CREATE FOREIGN TABLE IF NOT EXISTS "voirie_administratif"."demande_gspreadsheet" (
  "code_demande"                                character varying,
  "demande_date"                                character varying,
  "demande_type_numerotage"                     character varying,
  "demande_type_alignement"                     character varying,
  "demandeur_telephone"                         character varying,
  "demandeur_courriel"                          character varying,
  "demandeur_ligne1_raison_sociale_ou_identite" character varying,
  "demandeur_ligne2_identite_ou_complement"     character varying,
  "demandeur_ligne3_complement"                 character varying,
  "demandeur_ligne4_numvoie_nomvoie"            character varying,
  "demandeur_ligne5_boite_postal_ou_lieu_dit"   character varying,
  "demandeur_ligne6_code_postal_ville_cedex"    character varying,
  "bienImmo_vosrefs_ligne1"                     character varying,
  "bienImmo_vosrefs_ligne2"                     character varying,
  "bienImmo_proprietaire"                       character varying,
  "numero"                                      character varying,
  "suffixe"                                     character varying,
  "voie_nom"                                    character varying,
  "observation"                                 character varying,
  "ccosec"                                      character varying,
  "parcelle"                                    character varying,
  "ident"                                       character varying,
  "codeident"                                   character varying,
  "code_fantoir"                                character varying,
  "fin_cle_interop"                             character varying,
  "cle_interop"                                 character varying
) server multicorn_gspreadsheet options(
  gskey   '1tqbwCCnLioPfEe1xNq00vKlF7H-fZ6cJdHJxFsYWAJQ',
  headrow '1',
  keyfile '/var/lib/postgresql/11/main/debianpaquetmapnik-e8255c38290e.json'
);

--SELECT * from "voirie_administratif"."demande_gspreadsheet" ;

-- Oh, you want it faster?  use a materialized view to cache it:
DROP MATERIALIZED VIEW IF EXISTS "voirie_administratif"."mv_demande_gspreadsheet";
CREATE MATERIALIZED VIEW IF NOT EXISTS "voirie_administratif"."mv_demande_gspreadsheet" AS SELECT * FROM "voirie_administratif"."demande_gspreadsheet";


-- ----------- --
-- numvoie_ban -- table distante csv
-- ----------- --

-- Creation d'une connexion entre postgresql et fichier csv (ban_manuelle_guichet_adressev2_ign/adresse_opendata.csv)

DROP SERVER if exists myserver_numvoie_ban cascade;

CREATE SERVER myserver_numvoie_ban
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource '/home/fred/Documents/technic/source/voirie/data/ban_manuelle_guichet_adressev2_ign/adresse_opendata.csv',
    format 'CSV',
    config_options 'OGR_ODS_HEADERS=FORCE ');

DROP TABLE if exists voirie_administratif.numvoie_ban;
CREATE FOREIGN TABLE voirie_administratif.numvoie_ban (
  cleabs varchar,
  numero varchar,
  indice_de_repetition varchar,
  nom_voie varchar,
  nom_lieu_dit varchar,
  alias varchar,
  insee_commune varchar,
  code_postal varchar
) SERVER myserver_numvoie_ban
OPTIONS (layer 'adresse_opendata');


-- ----------- --
-- numvoie_vue -- vue dblink vers 172.17.150.6
-- ----------- --

-- Creation d'une connexion entre postgresql et base sig, schema a_voirie (a_voirie/vo_adresse)


drop view if exists voirie_administratif.numvoie_vue cascade;
create view voirie_administratif.numvoie_vue as

SELECT *
FROM dblink(
   'dbname=sig port=5432
   host=172.17.150.6 user=''frederic.garel'' password=Mie4Asie',

   '-- selection des voies de la base interne
   select
     0::integer as id,
     id_adresse as id_vo_adresse,
     ''''::varchar as id_cleabs,
     ''''::varchar as code_demande,
     adresse::varchar as numvoie,
     regexp_replace(adresse,''[^0-9].*$'','''')::numeric as numvoie_num,
     regexp_replace(adresse,''[0-9-]+'','''')::varchar  as numvoie_complement,
     libelle_complet::varchar as nomvoie,
     ''''::varchar as batiment,
     360::numeric as angle,
     st_transform(ST_SetSRID(st_point(x_adresse, y_adresse), 27562), 3946) as shape
   from a_voirie.vo_adresse,
     a_voirie.vo_voie
   where a_voirie.vo_adresse.id_voie = a_voirie.vo_voie.id_voie
     order by id;
    '
    )
    AS "voirie_filaire_numero"(
      id integer,
      id_vo_adresse character varying, -- identifiant a_voirie.vo_adresse
      id_cleabs character varying, -- identifiant numvoie_ban
      code_demande varchar,
      numvoie varchar,
      numvoie_num numeric,
      numvoie_complement varchar,
      nomvoie varchar,
      batiment varchar,
      angle numeric,
      shape geometry
      );


-- ------------ --
-- parcelle_vue -- vue dblink vers 172.17.150.6
-- ------------ --

-- Recuperation des parcelle dans la base cda

drop view if exists voirie_administratif."parcelle_vue" cascade;
create view voirie_administratif."parcelle_vue" as

SELECT *
FROM dblink(
   'dbname=sig port=5432
   host=172.17.150.6 user=''frederic.garel'' password=Mie4Asie',

   '-- selection des voies de la base cda
    select
      gid as id,
      ''''::varchar as code_demande,
      codcomm::varchar as codcomm,
      ccosec::varchar as ccosec,
      regexp_replace("ident", '' +'', '''')::varchar as ident,
      parcelle::numeric as parcelle,
      regexp_replace("codeident", '' +'', '''')::varchar as codeident,
      st_setsrid(shape, 3946) as shape
    from c_cadastre.parcelle
    where c_cadastre.parcelle.codcomm = ''170300''
    order by id;
    '
    )
    AS "parcelle_vue"(
      id integer,
      code_demande varchar,
      codcomm varchar,
      ccosec varchar,
      ident varchar,
      parcelle numeric,
      codeident varchar,
      shape geometry
      );


-- ----------------------- --
-- avancement_gspreadsheet --
-- ----------------------- --

-- cette table permet d'archiver et de suivre l'avancement des traitements

DROP TABLE if exists voirie_administratif.avancement_gspreadsheet;
CREATE TABLE voirie_administratif.avancement_gspreadsheet
as
  select * from mv_demande_gspreadsheet;

-- cf espu_voirieAdminitratif_projet_jeutest

-- ----------- --
-- 2de partie --
-- ----------- --

-- Creation de :
-- - table parcelle_tab
--   qui est une selection des parcelles concernées par une demande

-- ------------ --
-- parcelle_tab --
-- ------------ --

-- Sequence: voirie_administratif.parcelle_tab_id_seq

-- DROP SEQUENCE if exists voirie_administratif.parcelle_tab_id_seq;
DROP SEQUENCE if exists voirie_administratif.parcelle_tab_id_seq;
CREATE SEQUENCE voirie_administratif.parcelle_tab_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.parcelle_tab_id_seq
  OWNER TO fred;

-- Table: voirie_administratif.parcelle_tab

-- DROP TABLE if exists voirie_administratif.parcelle_tab;
DROP TABLE if exists voirie_administratif.parcelle_tab;
CREATE TABLE voirie_administratif.parcelle_tab
AS
  select
    nextval('voirie_administratif.parcelle_tab_id_seq'::regclass) as id, -- Identifiant
    demande.code_demande,
    voirie_administratif.parcelle_vue.codcomm,
    voirie_administratif.parcelle_vue.ccosec,
    voirie_administratif.parcelle_vue.ident,
    voirie_administratif.parcelle_vue.parcelle,
    voirie_administratif.parcelle_vue.codeident,
    voirie_administratif.parcelle_vue.shape,
    demande.Numero_attribue,
    demande.Alignement_concerne,
    demande.demande_date,
    demande.demande_type_numerotage,
    demande.demande_type_alignement,
    demande.demandeur_telephone,
    demande.demandeur_courriel,
    demande.demandeur_ligne1_raison_sociale_ou_identite,
    demande.demandeur_ligne2_identite_ou_complement,
    demande.demandeur_ligne3_complement,
    demande.demandeur_ligne4_numvoie_nomvoie,
    demande.demandeur_ligne5_boite_postal_ou_lieu_dit,
    demande.demandeur_ligne6_code_postal_ville_cedex,
    demande.bienImmo_vosrefs_ligne1,
    demande.bienImmo_vosrefs_ligne2,
    demande.bienImmo_commune,
    demande.bienImmo_anciennumero,
    demande.bienImmo_adresse,
    demande.bienImmo_cadastre_parcelle,
    demande.bienImmo_proprietaire
  from
    voirie_administratif.parcelle_vue,
    voirie_administratif.parcelle,
    voirie_administratif.demande
  where
    voirie_administratif.parcelle_vue.codeident = parcelle.codeident
    and parcelle.code_demande::varchar = demande.code_demande;
ALTER TABLE voirie_administratif.parcelle_tab
  ADD constraint id_parcelle_tab_pk PRIMARY KEY (id);
ALTER TABLE voirie_administratif.parcelle_tab
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_administratif.parcelle_tab
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_administratif.parcelle_tab
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif.parcelle_tab
  IS 'Parcelle.';
