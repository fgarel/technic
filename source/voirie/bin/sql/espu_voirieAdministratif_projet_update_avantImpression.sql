--
-- Création / mise à jour de la table parcelle_tab
-- cette table ne sera bienoto plus utilisée
-- et sera completement remplacé par lj_avancement_demande_parcelle
--


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


--
-- Création / mise à jour des tables liées à demande_gspreadsheet
--

-- 1ere etape : on va chercher les infos du google spreadsheet


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

--SELECT * from "voirie_administratif"."demande_gspreadsheet";
REFRESH MATERIALIZED VIEW "voirie_administratif"."mv_demande_gspreadsheet";

-- ----------------------- --
-- avancement_gspreadsheet -- table locale qui contient l'avancement des demandes
-- ----------------------- --

-- Ici, si besoin, il faut creer et initialiser la table avancement_gspreadshhet
-- avec des valeurs issues de demande_gspreadsheet


-- 2ème etape : on fait le rapprochement entre :
--   - les demandes deja archivées  (avancement_gspreadsheet),
--   - la table issu de google drive (mv_demande_gspreadsheet),
--   - les numeros de voirie (numvoie)
--   - les parcelles (parcelle_vue)

-- pour info :
-- A-B : recherche des demandes (archivées) qui ne sont plus dans google drive
--select voirie_administratif.avancement_gspreadsheet.*
--from voirie_administratif.avancement_gspreadsheet
--left join voirie_administratif.mv_demande_gspreadsheet
--on voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.mv_demande_gspreadsheet.code_demande
--where voirie_administratif.mv_demande_gspreadsheet.code_demande is null;


-- ------------------- --
-- ------------------- --
-- ------------------- --


-- Début de la liste des demandes que l'on ne peut pas faire :
-- En effet, on ne peut pas faire :
--  - quand la parcelle n'est pas trouvée (demande sans parcelle)

-- ------------------- --
-- lj_demande_parcelle --
-- ------------------- --

-- Sequence: voirie_administratif.lj_demande_parcelle_id_seq

-- DROP SEQUENCE if exists voirie_administratif.lj_demande_parcelle_id_seq;
DROP SEQUENCE if exists voirie_administratif.lj_demande_parcelle_id_seq;
CREATE SEQUENCE voirie_administratif.lj_demande_parcelle_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.lj_demande_parcelle_id_seq
  OWNER TO fred;

-- Table: voirie_administratif.lj_demande_parcelle

-- DROP TABLE if exists voirie_administratif.lj_demande_parcelle;
DROP TABLE if exists voirie_administratif.lj_demande_parcelle;
CREATE TABLE voirie_administratif.lj_demande_parcelle
AS
  select
    nextval('voirie_administratif.lj_demande_parcelle_id_seq'::regclass) as id, -- Identifiant
    voirie_administratif.mv_demande_gspreadsheet.code_demande,
    --voirie_administratif.parcelle_vue.codcomm,
    --voirie_administratif.parcelle_vue.ccosec,
    --voirie_administratif.parcelle_vue.ident,
    --voirie_administratif.parcelle_vue.parcelle,
    --voirie_administratif.parcelle_vue.codeident,
    --voirie_administratif.parcelle_vue.shape,
    voirie_administratif.mv_demande_gspreadsheet.demande_date,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_numerotage,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_telephone,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_courriel,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne1_raison_sociale_ou_identite,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne2_identite_ou_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne3_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne4_numvoie_nomvoie,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne5_boite_postal_ou_lieu_dit,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne6_code_postal_ville_cedex,
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne1",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne2",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_proprietaire",
    voirie_administratif.mv_demande_gspreadsheet.numero,
    voirie_administratif.mv_demande_gspreadsheet.suffixe,
    voirie_administratif.mv_demande_gspreadsheet.voie_nom,
    voirie_administratif.mv_demande_gspreadsheet.observation,
    voirie_administratif.mv_demande_gspreadsheet.ccosec,
    voirie_administratif.mv_demande_gspreadsheet.parcelle,
    voirie_administratif.mv_demande_gspreadsheet.ident,
    voirie_administratif.mv_demande_gspreadsheet.codeident,
    voirie_administratif.mv_demande_gspreadsheet.code_fantoir,
    voirie_administratif.mv_demande_gspreadsheet.fin_cle_interop,
    voirie_administratif.mv_demande_gspreadsheet.cle_interop
  from
    voirie_administratif.mv_demande_gspreadsheet
    left join voirie_administratif.parcelle_vue
    on voirie_administratif.mv_demande_gspreadsheet.codeident = voirie_administratif.parcelle_vue.codeident
  where voirie_administratif.parcelle_vue.id is null;
ALTER TABLE voirie_administratif.lj_demande_parcelle
  ADD constraint id_lj_demande_parcelle_pk PRIMARY KEY (id);
--ALTER TABLE voirie_administratif.lj_demande_parcelle
--  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
--ALTER TABLE voirie_administratif.lj_demande_parcelle
--  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_administratif.lj_demande_parcelle
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif.lj_demande_parcelle
  IS 'Table des demandes sans parcelle';


-- --------------------------- --
-- lj_demande_parcelle_numvoie --
-- --------------------------- --
-- rapprochement entre lj_demande_parcelle et numvoie
-- on ajoute la geometrie du numvoie


-- Sequence: voirie_administratif.lj_demande_parcelle_numvoie_id_seq

-- DROP SEQUENCE if exists voirie_administratif.lj_demande_parcelle_numvoie_id_seq;
DROP SEQUENCE if exists voirie_administratif.lj_demande_parcelle_numvoie_id_seq;
CREATE SEQUENCE voirie_administratif.lj_demande_parcelle_numvoie_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.lj_demande_parcelle_numvoie_id_seq
  OWNER TO fred;

-- on ne peut pas faire ces demandes :
--  - quand la parcelle n'est pas trouvée (demande sans parcelle)

DROP TABLE if exists voirie_administratif.lj_demande_parcelle_numvoie;
CREATE TABLE voirie_administratif.lj_demande_parcelle_numvoie
AS
  select distinct on (voirie_administratif.lj_demande_parcelle.id)
          voirie_administratif.lj_demande_parcelle.*,
          voirie_administratif.numvoie.shape
  from voirie_administratif.lj_demande_parcelle
    left join voirie_administratif.numvoie
    on (
      voirie_administratif.lj_demande_parcelle.numero = voirie_administratif.numvoie.numvoie_num::varchar
    and
      voirie_administratif.lj_demande_parcelle.suffixe = coalesce(voirie_administratif.numvoie.numvoie_complement, '')
    and
      voirie_administratif.lj_demande_parcelle.voie_nom = voirie_administratif.numvoie.nomvoie
    )
  where voirie_administratif.lj_demande_parcelle.demande_type_numerotage <> ''
    or voirie_administratif.lj_demande_parcelle.demande_type_alignement <> ''
  order by
    voirie_administratif.lj_demande_parcelle.id;

ALTER TABLE voirie_administratif.lj_demande_parcelle_numvoie
  ADD constraint id_lj_demande_parcelle_numvoie_pk PRIMARY KEY (id);
ALTER TABLE voirie_administratif.lj_demande_parcelle_numvoie
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL);
ALTER TABLE voirie_administratif.lj_demande_parcelle_numvoie
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_administratif.lj_demande_parcelle_numvoie
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif.lj_demande_parcelle_numvoie
  IS 'Table des demandes sans parcelle (avec geometrie des numvoie)';


-- ----------------- --
-- ----------------- --
-- ----------------- --

-- Fin de la liste des demandes que l'on ne peut pas faire :
-- De même que l'on ne peut pas faire les demandes sans parcelle,
-- On ne peut pas faire :
--  - quand le numero de voirie n'est pas trouvé (demande sans numvoie)

-- ------------------ --
-- lj_demande_numvoie --
-- ------------------ --

-- Sequence: voirie_administratif.lj_demande_numvoie_id_seq

-- DROP SEQUENCE if exists voirie_administratif.lj_demande_numvoie_id_seq;
DROP SEQUENCE if exists voirie_administratif.lj_demande_numvoie_id_seq;
CREATE SEQUENCE voirie_administratif.lj_demande_numvoie_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.lj_demande_numvoie_id_seq
  OWNER TO fred;

-- Table: voirie_administratif.lj_demande_numvoie

-- DROP TABLE if exists voirie_administratif.lj_demande_numvoie;
DROP TABLE if exists voirie_administratif.lj_demande_numvoie;
CREATE TABLE voirie_administratif.lj_demande_numvoie
AS
  select
    nextval('voirie_administratif.lj_demande_numvoie_id_seq'::regclass) as id, -- Identifiant
    voirie_administratif.mv_demande_gspreadsheet.code_demande,
    --voirie_administratif.numvoie.id_vo_adresse,
    --voirie_administratif.numvoie.id_cleabs,
    --voirie_administratif.numvoie.numvoie,
    --voirie_administratif.numvoie.batiment,
    --voirie_administratif.numvoie.position,
    --voirie_administratif.numvoie.angle,
    --voirie_administratif.numvoie.shape,
    voirie_administratif.mv_demande_gspreadsheet.demande_date,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_numerotage,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_telephone,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_courriel,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne1_raison_sociale_ou_identite,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne2_identite_ou_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne3_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne4_numvoie_nomvoie,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne5_boite_postal_ou_lieu_dit,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne6_code_postal_ville_cedex,
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne1",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne2",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_proprietaire",
    voirie_administratif.mv_demande_gspreadsheet.numero,
    voirie_administratif.mv_demande_gspreadsheet.suffixe,
    voirie_administratif.mv_demande_gspreadsheet.voie_nom,
    voirie_administratif.mv_demande_gspreadsheet.observation,
    voirie_administratif.mv_demande_gspreadsheet.ccosec,
    voirie_administratif.mv_demande_gspreadsheet.parcelle,
    voirie_administratif.mv_demande_gspreadsheet.ident,
    voirie_administratif.mv_demande_gspreadsheet.codeident,
    voirie_administratif.mv_demande_gspreadsheet.code_fantoir,
    voirie_administratif.mv_demande_gspreadsheet.fin_cle_interop,
    voirie_administratif.mv_demande_gspreadsheet.cle_interop
  from
    voirie_administratif.mv_demande_gspreadsheet
    left join voirie_administratif.numvoie
    on (
		voirie_administratif.mv_demande_gspreadsheet.numero = voirie_administratif.numvoie.numvoie_num::varchar
	  and
		voirie_administratif.mv_demande_gspreadsheet.suffixe = coalesce(voirie_administratif.numvoie.numvoie_complement, '')
	  and
	    voirie_administratif.mv_demande_gspreadsheet.voie_nom = voirie_administratif.numvoie.nomvoie
		)
    where voirie_administratif.numvoie.id is null
      and (voirie_administratif.mv_demande_gspreadsheet.demande_type_numerotage <> ''
        or voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement <> '');

ALTER TABLE voirie_administratif.lj_demande_numvoie
  ADD constraint id_lj_demande_numvoie_pk PRIMARY KEY (id);
--ALTER TABLE voirie_administratif.lj_demande_numvoie
--  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL);
--ALTER TABLE voirie_administratif.lj_demande_numvoie
--  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_administratif.lj_demande_numvoie
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif.lj_demande_numvoie
  IS 'Table des demandes sans numvoie';


-- --------------------------- --
-- lj_demande_numvoie_parcelle --
-- --------------------------- --
-- rapprochement entre lj_demande_numvoie et parcelle_vue
-- on ajoute la geometrie de la parcelle


-- Sequence: voirie_administratif.lj_demande_numvoie_parcelle_id_seq

-- DROP SEQUENCE if exists voirie_administratif.lj_demande_numvoie_parcelle_id_seq;
DROP SEQUENCE if exists voirie_administratif.lj_demande_numvoie_parcelle_id_seq;
CREATE SEQUENCE voirie_administratif.lj_demande_numvoie_parcelle_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.lj_demande_numvoie_parcelle_id_seq
  OWNER TO fred;

-- on ne peut pas faire ces demandes :
--  - quand le numero de voirie n'est pas trouvé (demande sans numvoie)

DROP TABLE if exists voirie_administratif.lj_demande_numvoie_parcelle;
CREATE TABLE voirie_administratif.lj_demande_numvoie_parcelle
AS
  select
    --nextval('voirie_administratif.lj_demande_numvoie_parcelle_id_seq'::regclass) as id, -- Identifiant
    voirie_administratif.lj_demande_numvoie.*,
    voirie_administratif.parcelle_vue.shape
  from voirie_administratif.lj_demande_numvoie
    left join voirie_administratif.parcelle_vue
    on voirie_administratif.lj_demande_numvoie.codeident = voirie_administratif.parcelle_vue.codeident;

ALTER TABLE voirie_administratif.lj_demande_numvoie_parcelle
  ADD constraint id_lj_demande_numvoie_parcelle_pk PRIMARY KEY (id);
ALTER TABLE voirie_administratif.lj_demande_numvoie_parcelle
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_administratif.lj_demande_numvoie_parcelle
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_administratif.lj_demande_numvoie_parcelle
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif.lj_demande_numvoie_parcelle
  IS 'Table des demandes sans numvoie (avec geometrie de la parcelle)';




-- ------------------------ --
-- ------------------------ --
-- ------------------------ --

-- On fabrique maintenant la liste des demandes que l'on doit faire.

-- on doit faire :
--  - quand la demande est à "forcé" (dans le spreadsheet)

-- --------------------- --
-- lj_avancement_demande --
-- --------------------- --

-- Sequence: voirie_administratif.lj_avancement_demande_id_seq

-- DROP SEQUENCE if exists voirie_administratif.lj_avancement_demande_id_seq;
DROP SEQUENCE if exists voirie_administratif.lj_avancement_demande_id_seq;
CREATE SEQUENCE voirie_administratif.lj_avancement_demande_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.lj_avancement_demande_id_seq
  OWNER TO fred;


-- ----------- --
-- Initialisation de la liste des demandes à faire :
-- Il faut regarder à la fois dans la :
--  - table distante demande_gspreadsheet
--  - table locale avancement_gspreadsheet
--
-- Requete du type (A Inter B)
-- c'est à dire, recherche des demandes qui sont à la fois dans les archives et dans google drive
--
-- Au départ, on prend toutes les demandes (pas de clause where)
-- En fait, on fait une simple initialisation de la table
-- car, après, on effacera tout...

DROP TABLE if exists voirie_administratif.lj_avancement_demande;
CREATE TABLE voirie_administratif.lj_avancement_demande
AS
  select
    nextval('voirie_administratif.lj_avancement_demande_id_seq'::regclass) as id, -- Identifiant
    voirie_administratif.mv_demande_gspreadsheet.code_demande,
    --voirie_administratif.numvoie.id_vo_adresse,
    --voirie_administratif.numvoie.id_cleabs,
    --voirie_administratif.numvoie.numvoie,
    --voirie_administratif.numvoie.batiment,
    --voirie_administratif.numvoie.position,
    --voirie_administratif.numvoie.angle,
    --voirie_administratif.numvoie.shape,
    voirie_administratif.mv_demande_gspreadsheet.demande_date,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_numerotage,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_telephone,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_courriel,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne1_raison_sociale_ou_identite,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne2_identite_ou_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne3_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne4_numvoie_nomvoie,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne5_boite_postal_ou_lieu_dit,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne6_code_postal_ville_cedex,
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne1",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne2",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_proprietaire",
    voirie_administratif.mv_demande_gspreadsheet.numero,
    voirie_administratif.mv_demande_gspreadsheet.suffixe,
    voirie_administratif.mv_demande_gspreadsheet.voie_nom,
    voirie_administratif.mv_demande_gspreadsheet.observation,
    voirie_administratif.mv_demande_gspreadsheet.ccosec,
    voirie_administratif.mv_demande_gspreadsheet.parcelle,
    voirie_administratif.mv_demande_gspreadsheet.ident,
    voirie_administratif.mv_demande_gspreadsheet.codeident,
    voirie_administratif.mv_demande_gspreadsheet.code_fantoir,
    voirie_administratif.mv_demande_gspreadsheet.fin_cle_interop,
    voirie_administratif.mv_demande_gspreadsheet.cle_interop
  from voirie_administratif.avancement_gspreadsheet
    inner join voirie_administratif.mv_demande_gspreadsheet
    on voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.mv_demande_gspreadsheet.code_demande;

--select * from voirie_administratif.lj_avancement_demande;
TRUNCATE TABLE voirie_administratif.lj_avancement_demande;


-- ----------- --
-- Début de la liste des demandes à faire :
-- A Inter B : recherche des demandes qui sont à la fois dans les archives et dans google drive
-- et uniquement ceux dont les demandes sont à "forcé"
-- (en effet, on considère que les autres demandes ont été executées lors du traitement précédent)
TRUNCATE TABLE  voirie_administratif.lj_avancement_demande;
INSERT INTO voirie_administratif.lj_avancement_demande
  select
    nextval('voirie_administratif.lj_avancement_demande_id_seq'::regclass) as id, -- Identifiant
    voirie_administratif.mv_demande_gspreadsheet.code_demande,
    --voirie_administratif.numvoie.id_vo_adresse,
    --voirie_administratif.numvoie.id_cleabs,
    --voirie_administratif.numvoie.numvoie,
    --voirie_administratif.numvoie.batiment,
    --voirie_administratif.numvoie.position,
    --voirie_administratif.numvoie.angle,
    --voirie_administratif.numvoie.shape,
    voirie_administratif.mv_demande_gspreadsheet.demande_date,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_numerotage,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_telephone,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_courriel,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne1_raison_sociale_ou_identite,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne2_identite_ou_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne3_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne4_numvoie_nomvoie,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne5_boite_postal_ou_lieu_dit,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne6_code_postal_ville_cedex,
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne1",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne2",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_proprietaire",
    voirie_administratif.mv_demande_gspreadsheet.numero,
    voirie_administratif.mv_demande_gspreadsheet.suffixe,
    voirie_administratif.mv_demande_gspreadsheet.voie_nom,
    voirie_administratif.mv_demande_gspreadsheet.observation,
    voirie_administratif.mv_demande_gspreadsheet.ccosec,
    voirie_administratif.mv_demande_gspreadsheet.parcelle,
    voirie_administratif.mv_demande_gspreadsheet.ident,
    voirie_administratif.mv_demande_gspreadsheet.codeident,
    voirie_administratif.mv_demande_gspreadsheet.code_fantoir,
    voirie_administratif.mv_demande_gspreadsheet.fin_cle_interop,
    voirie_administratif.mv_demande_gspreadsheet.cle_interop
  from voirie_administratif.avancement_gspreadsheet
    inner join voirie_administratif.mv_demande_gspreadsheet
    on voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.mv_demande_gspreadsheet.code_demande
  where voirie_administratif.mv_demande_gspreadsheet.demande_type_numerotage = 'f'
    or voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement = 'f'
    or voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement = 'p'
    or voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement = 'c';


-- Fin de la liste des demandes que l'on doit faire :
-- on doit faire :
--  - quand la demande est nouvelle (dans le spreadsheet)

-- fin de la liste des demandes à faire :
-- -A+B :recherche des demandes qui ne sont pas dans les archives (avancement) et qui sont des nouvelles demandes (google drive)

INSERT INTO voirie_administratif.lj_avancement_demande
  select
    nextval('voirie_administratif.lj_avancement_demande_id_seq'::regclass) as id, -- Identifiant
    voirie_administratif.mv_demande_gspreadsheet.code_demande,
    --voirie_administratif.numvoie.id_vo_adresse,
    --voirie_administratif.numvoie.id_cleabs,
    --voirie_administratif.numvoie.numvoie,
    --voirie_administratif.numvoie.batiment,
    --voirie_administratif.numvoie.position,
    --voirie_administratif.numvoie.angle,
    --voirie_administratif.numvoie.shape,
    voirie_administratif.mv_demande_gspreadsheet.demande_date,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_numerotage,
    voirie_administratif.mv_demande_gspreadsheet.demande_type_alignement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_telephone,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_courriel,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne1_raison_sociale_ou_identite,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne2_identite_ou_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne3_complement,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne4_numvoie_nomvoie,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne5_boite_postal_ou_lieu_dit,
    voirie_administratif.mv_demande_gspreadsheet.demandeur_ligne6_code_postal_ville_cedex,
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne1",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_vosrefs_ligne2",
    voirie_administratif.mv_demande_gspreadsheet."bienImmo_proprietaire",
    voirie_administratif.mv_demande_gspreadsheet.numero,
    voirie_administratif.mv_demande_gspreadsheet.suffixe,
    voirie_administratif.mv_demande_gspreadsheet.voie_nom,
    voirie_administratif.mv_demande_gspreadsheet.observation,
    voirie_administratif.mv_demande_gspreadsheet.ccosec,
    voirie_administratif.mv_demande_gspreadsheet.parcelle,
    voirie_administratif.mv_demande_gspreadsheet.ident,
    voirie_administratif.mv_demande_gspreadsheet.codeident,
    voirie_administratif.mv_demande_gspreadsheet.code_fantoir,
    voirie_administratif.mv_demande_gspreadsheet.fin_cle_interop,
    voirie_administratif.mv_demande_gspreadsheet.cle_interop
  from voirie_administratif.avancement_gspreadsheet
    right join voirie_administratif.mv_demande_gspreadsheet
    on voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.mv_demande_gspreadsheet.code_demande
  where voirie_administratif.avancement_gspreadsheet.code_demande is null;




-- Recherche des demandes à faire, et possible à faire
-- on ajoute la geometrie de la parcelle
-- ------------------------------ --
-- lj_avancement_demande_parcelle --
-- ------------------------------ --

-- Sequence: voirie_administratif.lj_avancement_demande_parcelle_id_seq

-- DROP SEQUENCE if exists voirie_administratif.lj_avancement_demande_parcelle_id_seq;
DROP SEQUENCE if exists voirie_administratif.lj_avancement_demande_parcelle_id_seq;
CREATE SEQUENCE voirie_administratif.lj_avancement_demande_parcelle_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.lj_avancement_demande_parcelle_id_seq
  OWNER TO fred;

-- ----------- --
--

DROP TABLE if exists voirie_administratif.lj_avancement_demande_parcelle;
CREATE TABLE voirie_administratif.lj_avancement_demande_parcelle
AS
  select
    nextval('voirie_administratif.lj_avancement_demande_parcelle_id_seq'::regclass) as id, -- Identifiant
    voirie_administratif.lj_avancement_demande.code_demande,
    --voirie_administratif.numvoie.id_vo_adresse,
    --voirie_administratif.numvoie.id_cleabs,
    --voirie_administratif.numvoie.numvoie,
    --voirie_administratif.numvoie.batiment,
    --voirie_administratif.numvoie.position,
    --voirie_administratif.numvoie.angle,
    --voirie_administratif.numvoie.shape,
    voirie_administratif.lj_avancement_demande.demande_date,
    voirie_administratif.lj_avancement_demande.demande_type_numerotage,
    voirie_administratif.lj_avancement_demande.demande_type_alignement,
    voirie_administratif.lj_avancement_demande.demandeur_telephone,
    voirie_administratif.lj_avancement_demande.demandeur_courriel,
    voirie_administratif.lj_avancement_demande.demandeur_ligne1_raison_sociale_ou_identite,
    voirie_administratif.lj_avancement_demande.demandeur_ligne2_identite_ou_complement,
    voirie_administratif.lj_avancement_demande.demandeur_ligne3_complement,
    voirie_administratif.lj_avancement_demande.demandeur_ligne4_numvoie_nomvoie,
    voirie_administratif.lj_avancement_demande.demandeur_ligne5_boite_postal_ou_lieu_dit,
    voirie_administratif.lj_avancement_demande.demandeur_ligne6_code_postal_ville_cedex,
    voirie_administratif.lj_avancement_demande."bienImmo_vosrefs_ligne1",
    voirie_administratif.lj_avancement_demande."bienImmo_vosrefs_ligne2",
    voirie_administratif.lj_avancement_demande."bienImmo_proprietaire",
    voirie_administratif.lj_avancement_demande.numero,
    voirie_administratif.lj_avancement_demande.suffixe,
    voirie_administratif.lj_avancement_demande.voie_nom,
    voirie_administratif.lj_avancement_demande.observation,
    voirie_administratif.lj_avancement_demande.ccosec,
    voirie_administratif.lj_avancement_demande.parcelle,
    voirie_administratif.lj_avancement_demande.ident,
    voirie_administratif.lj_avancement_demande.codeident,
    voirie_administratif.lj_avancement_demande.code_fantoir,
    voirie_administratif.lj_avancement_demande.fin_cle_interop,
    voirie_administratif.lj_avancement_demande.cle_interop,
    voirie_administratif.parcelle_vue.shape
  from voirie_administratif.lj_avancement_demande
    inner join voirie_administratif.numvoie
    on (
		voirie_administratif.lj_avancement_demande.numero = voirie_administratif.numvoie.numvoie_num::varchar
	  and
		voirie_administratif.lj_avancement_demande.suffixe = coalesce(voirie_administratif.numvoie.numvoie_complement, '')
	  and
	    voirie_administratif.lj_avancement_demande.voie_nom = voirie_administratif.numvoie.nomvoie
		)
	inner join voirie_administratif.parcelle_vue
	on voirie_administratif.lj_avancement_demande.codeident = voirie_administratif.parcelle_vue.codeident;

ALTER TABLE voirie_administratif.lj_avancement_demande_parcelle
  ADD constraint id_lj_avancement_demande_parcelle_pk PRIMARY KEY (id);
ALTER TABLE voirie_administratif.lj_avancement_demande_parcelle
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_administratif.lj_avancement_demande_parcelle
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_administratif.lj_avancement_demande_parcelle
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif.lj_avancement_demande_parcelle
  IS 'Table des demandes possible à faire (avec geometrie de la parcelle)';


-- mise a jour des tables :
--   - numvoie
--   - et avancement_gspreadsheet


-- En fait, la table numvoie est mise à jour dès maintenant,
-- tandis que la table avancement_gspreadsheet
-- sera mise à jour uniquement après impression
--

-- mise à jour de numvoie pour les demandes déjà existantes demandes (forcées)
update  voirie_administratif.numvoie
set code_demande = req01.code_demande
from
  (select
     voirie_administratif.lj_avancement_demande_parcelle.code_demande,
     voirie_administratif.lj_avancement_demande_parcelle.numero,
     voirie_administratif.lj_avancement_demande_parcelle.suffixe,
     voirie_administratif.lj_avancement_demande_parcelle.voie_nom
  from voirie_administratif.avancement_gspreadsheet
  right join voirie_administratif.lj_avancement_demande_parcelle
    on voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.lj_avancement_demande_parcelle.code_demande
  group by
     voirie_administratif.lj_avancement_demande_parcelle.code_demande,
     voirie_administratif.lj_avancement_demande_parcelle.numero,
     voirie_administratif.lj_avancement_demande_parcelle.suffixe,
     voirie_administratif.lj_avancement_demande_parcelle.voie_nom
  ) as req01
  where
        voirie_administratif.numvoie.numvoie_num::varchar = req01.numero
	  and
		voirie_administratif.numvoie.numvoie_complement = req01.suffixe
	  and
	    voirie_administratif.numvoie.nomvoie = req01.voie_nom;

--select * from voirie_administratif.mv_demande_gspreadsheet order by code_demande;
--select * from voirie_administratif.avancement_gspreadsheet order by code_demande;
--select * from voirie_administratif.lj_demande_parcelle order by code_demande;
--select * from voirie_administratif.lj_demande_parcelle_numvoie order by code_demande;
--select * from voirie_administratif.lj_demande_numvoie order by code_demande;
--select * from voirie_administratif.lj_demande_numvoie_parcelle order by code_demande;
--select * from voirie_administratif.lj_avancement_demande order by code_demande;
--select * from voirie_administratif.lj_avancement_demande_parcelle order by code_demande;
