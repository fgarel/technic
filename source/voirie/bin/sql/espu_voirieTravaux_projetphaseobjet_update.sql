

-- les tables
-- - projet
-- - phase
-- - objetGeometrique
-- sont issues d'un fichier libreOffice, transformé en fichiers csv
-- ce sont donc des foreign table
--
-- les tables in* sont des tables pour la numérisation des objets
-- ces tables in* sont définies dans le fichier "create" espu_voirieTravaux_projetphaseobjet_create.sql

-- les tables out* sont des tables pour la visualisation des données
-- les tables out* sont définies dans le fichier "update"



-- ------------------ --
-- outObjetSimplePoint --
-- ------------------ --

-- Sequence: voirie_travaux."outObjetSimplePoint_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outObjetSimplePoint_id_seq";
DROP SEQUENCE if exists voirie_travaux."outObjetSimplePoint_id_seq";
CREATE SEQUENCE voirie_travaux."outObjetSimplePoint_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outObjetSimplePoint_id_seq"
  OWNER TO fred;

--drop view if exists voirie_travaux."outObjetSimplePoint";
truncate table voirie_travaux."outObjetSimplePoint";
drop table if exists voirie_travaux."outObjetSimplePoint";
--insert into voirie_travaux."outObjetSimplePoint"
create table voirie_travaux."outObjetSimplePoint" as
  select
    voirie_travaux."projet"."CodeProjet", -- CodeProjet
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    voirie_travaux."projet"."TagProjet3", -- Etiquette3
    voirie_travaux."natureTravaux"."CodeNature", -- Code
    voirie_travaux."natureTravaux"."NatureTravaux", -- Nature
    voirie_travaux."natureTravaux"."MaitreDOeuvre", -- MaitreDOeuvre
    voirie_travaux."natureTravaux"."Contact", -- Contact
    voirie_travaux."phase"."CodePhase", -- CodePhase
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateDebutS", -- Date de début des travaux
    voirie_travaux."phase"."DateFinS", -- Date de fin des travaux
    voirie_travaux."phase"."Avancement", -- Avancement
    voirie_travaux."objetGeometrique"."CodeObjet", -- CodeObjet
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    --voirie_travaux."inObjetSimplePoint".id,
    nextval('voirie_travaux."outObjetSimplePoint_id_seq"') as id, -- Identifiant
    --voirie_travaux."inObjetSimplePoint"."CodeSimplePoint",
    --voirie_travaux."inObjetSimplePoint"."CodeObjet",
    voirie_travaux."inObjetSimplePoint".shape
  from
    voirie_travaux."inObjetSimplePoint",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet",
    voirie_travaux."natureTravaux"
  where
    voirie_travaux."inObjetSimplePoint"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    and
    voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetSimplePoint"
  ADD constraint "outObjetSimplePoint_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetSimplePoint"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetSimplePoint"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetSimplePoint"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetSimplePoint"
  IS 'Objet Simple Point.';



-- ------------------ --
-- outObjetMultiPoint --
-- ------------------ --

-- Sequence: voirie_travaux."outObjetMultiPoint_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outObjetMultiPoint_id_seq";
DROP SEQUENCE if exists voirie_travaux."outObjetMultiPoint_id_seq";
CREATE SEQUENCE voirie_travaux."outObjetMultiPoint_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outObjetMultiPoint_id_seq"
  OWNER TO fred;


--drop view if exists voirie_travaux."outObjetMultiPoint";
drop table if exists voirie_travaux."outObjetMultiPoint";
create table voirie_travaux."outObjetMultiPoint" as
  select
    voirie_travaux."projet"."CodeProjet", -- CodeProjet
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    voirie_travaux."projet"."TagProjet3", -- Etiquette3
    voirie_travaux."natureTravaux"."CodeNature", -- Code
    voirie_travaux."natureTravaux"."NatureTravaux", -- Nature
    voirie_travaux."natureTravaux"."MaitreDOeuvre", -- MaitreDOeuvre
    voirie_travaux."natureTravaux"."Contact", -- Contact
    voirie_travaux."phase"."CodePhase", -- CodePhase
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateDebutS", -- Date de début des travaux
    voirie_travaux."phase"."DateFinS", -- Date de fin des travaux
    voirie_travaux."phase"."Avancement", -- Avancement
    voirie_travaux."objetGeometrique"."CodeObjet", -- CodeObjet
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    --voirie_travaux."inObjetMultiPoint".id,
    nextval('voirie_travaux."outObjetMultiPoint_id_seq"') as id, -- Identifiant
    --voirie_travaux."inObjetMultiPoint"."CodeMultiPoint",
    --voirie_travaux."inObjetMultiPoint"."CodeObjet",
    voirie_travaux."inObjetMultiPoint".shape
  from
    voirie_travaux."inObjetMultiPoint",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet",
    voirie_travaux."natureTravaux"
  where
    voirie_travaux."inObjetMultiPoint"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    and
    voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetMultiPoint"
  ADD constraint "outObjetMultiPoint_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiPoint"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiPoint"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiPoint"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiPoint"
  IS 'Objet Multi Point.';



-- ------------------ --
-- outObjetSimpleLinestring --
-- ------------------ --

-- Sequence: voirie_travaux."outObjetSimpleLinstring_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outObjetSimpleLinestring_id_seq";
DROP SEQUENCE if exists voirie_travaux."outObjetSimpleLinestring_id_seq";
CREATE SEQUENCE voirie_travaux."outObjetSimpleLinestring_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outObjetSimpleLinestring_id_seq"
  OWNER TO fred;

--drop view if exists voirie_travaux."outObjetSimpleLinestring";
drop table if exists voirie_travaux."outObjetSimpleLinestring";
create table voirie_travaux."outObjetSimpleLinestring" as
  select
    voirie_travaux."projet"."CodeProjet", -- CodeProjet
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    voirie_travaux."projet"."TagProjet3", -- Etiquette3
    voirie_travaux."natureTravaux"."CodeNature", -- Code
    voirie_travaux."natureTravaux"."NatureTravaux", -- Nature
    voirie_travaux."natureTravaux"."MaitreDOeuvre", -- MaitreDOeuvre
    voirie_travaux."natureTravaux"."Contact", -- Contact
    voirie_travaux."phase"."CodePhase", -- CodePhase
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateDebutS", -- Date de début des travaux
    voirie_travaux."phase"."DateFinS", -- Date de fin des travaux
    voirie_travaux."phase"."Avancement", -- Avancement
    voirie_travaux."objetGeometrique"."CodeObjet", -- CodeObjet
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    --voirie_travaux."inObjetSimpleLinestring".id,
    nextval('voirie_travaux."outObjetSimpleLinestring_id_seq"') as id, -- Identifiant
    --voirie_travaux."inObjetSimpleLinestring"."CodeSimpleLinestring",
    --voirie_travaux."inObjetSimpleLinestring"."CodeObjet",
    voirie_travaux."inObjetSimpleLinestring".shape
  from
    voirie_travaux."inObjetSimpleLinestring",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet",
    voirie_travaux."natureTravaux"
  where
    voirie_travaux."inObjetSimpleLinestring"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    and
    voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
  ADD constraint "outObjetSimpleLinestring_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetSimpleLinestring"
  IS 'Objet Simple Linestring.';



-- ------------------ --
-- outObjetMultiLinestring --
-- ------------------ --

-- Sequence: voirie_travaux."outObjetMultiLinestring_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outObjetMultiLinestring_id_seq";
DROP SEQUENCE if exists voirie_travaux."outObjetMultiLinestring_id_seq";
CREATE SEQUENCE voirie_travaux."outObjetMultiLinestring_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outObjetMultiLinestring_id_seq"
  OWNER TO fred;

--drop view if exists voirie_travaux."outObjetMultiLinestring";
drop table if exists voirie_travaux."outObjetMultiLinestring";
create table voirie_travaux."outObjetMultiLinestring" as
  select
    voirie_travaux."projet"."CodeProjet", -- CodeProjet
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    voirie_travaux."projet"."TagProjet3", -- Etiquette3
    voirie_travaux."natureTravaux"."CodeNature", -- Code
    voirie_travaux."natureTravaux"."NatureTravaux", -- Nature
    voirie_travaux."natureTravaux"."MaitreDOeuvre", -- MaitreDOeuvre
    voirie_travaux."natureTravaux"."Contact", -- Contact
    voirie_travaux."phase"."CodePhase", -- CodePhase
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateDebutS", -- Date de début des travaux
    voirie_travaux."phase"."DateFinS", -- Date de fin des travaux
    voirie_travaux."phase"."Avancement", -- Avancement
    voirie_travaux."objetGeometrique"."CodeObjet", -- CodeObjet
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    --voirie_travaux."inObjetMultiLinestring".id,
    nextval('voirie_travaux."outObjetMultiLinestring_id_seq"') as id, -- Identifiant
    --voirie_travaux."inObjetMultiLinestring"."CodeMultiLinestring",
    --voirie_travaux."inObjetMultiLinestring"."CodeObjet",
    voirie_travaux."inObjetMultiLinestring".shape
  from
    voirie_travaux."inObjetMultiLinestring",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet",
    voirie_travaux."natureTravaux"
  where
    voirie_travaux."inObjetMultiLinestring"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    and
    voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  ADD constraint "outObjetMultiLinestring_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTILINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiLinestring"
  IS 'Objet Multi Linestring.';




-- ------------------ --
-- outObjetSimplePolygon --
-- ------------------ --

-- Sequence: voirie_travaux."outObjetSimplePolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outObjetSimplePolygon_id_seq";
DROP SEQUENCE if exists voirie_travaux."outObjetSimplePolygon_id_seq";
CREATE SEQUENCE voirie_travaux."outObjetSimplePolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outObjetSimplePolygon_id_seq"
  OWNER TO fred;

--drop view if exists voirie_travaux."outObjetSimplePolygon";
drop table if exists voirie_travaux."outObjetSimplePolygon";
create table voirie_travaux."outObjetSimplePolygon" as
  select
    voirie_travaux."projet"."CodeProjet", -- CodeProjet
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    voirie_travaux."projet"."TagProjet3", -- Etiquette3
    --voirie_travaux."natureTravaux"."CodeNature", -- Code
    --voirie_travaux."natureTravaux"."NatureTravaux", -- Nature
    --voirie_travaux."natureTravaux"."MaitreDOeuvre", -- MaitreDOeuvre
    --voirie_travaux."natureTravaux"."Contact", -- Contact
    voirie_travaux."phase"."CodePhase", -- CodePhase
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateDebutS", -- Date de début des travaux
    voirie_travaux."phase"."DateFinS", -- Date de fin des travaux
    voirie_travaux."phase"."Avancement", -- Avancement
    voirie_travaux."objetGeometrique"."CodeObjet", -- CodeObjet
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    --voirie_travaux."inObjetSimplePolygon".id,
    nextval('voirie_travaux."outObjetSimplePolygon_id_seq"') as id, -- Identifiant
    --voirie_travaux."inObjetSimplePolygon"."CodeSimplePolygon",
    --voirie_travaux."inObjetSimplePolygon"."CodeObjet",
    voirie_travaux."inObjetSimplePolygon".shape
  from
    voirie_travaux."inObjetSimplePolygon",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet"--,
    --voirie_travaux."natureTravaux"
  where
    voirie_travaux."inObjetSimplePolygon"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    --and
    --voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    ;

ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  ADD constraint "outObjetSimplePolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetSimplePolygon"
  IS 'Objet Simple Polygon.';



-- ------------------ --
-- outObjetMultiPolygon --
-- ------------------ --

-- Sequence: voirie_travaux."outObjetMultiPolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outObjetMultiPolygon_id_seq";
DROP SEQUENCE if exists voirie_travaux."outObjetMultiPolygon_id_seq";
CREATE SEQUENCE voirie_travaux."outObjetMultiPolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outObjetMultiPolygon_id_seq"
  OWNER TO fred;

--drop view if exists voirie_travaux."outObjetMultiPolygon";
drop table if exists voirie_travaux."outObjetMultiPolygon";
create table voirie_travaux."outObjetMultiPolygon" as
  select
    voirie_travaux."projet"."CodeProjet", -- CodeProjet
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    voirie_travaux."projet"."TagProjet3", -- Etiquette3
    voirie_travaux."natureTravaux"."CodeNature", -- Code
    voirie_travaux."natureTravaux"."NatureTravaux", -- Nature
    voirie_travaux."natureTravaux"."MaitreDOeuvre", -- MaitreDOeuvre
    voirie_travaux."natureTravaux"."Contact", -- Contact
    voirie_travaux."phase"."CodePhase", -- CodePhase
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateDebutS", -- Date de début des travaux
    voirie_travaux."phase"."DateFinS", -- Date de fin des travaux
    voirie_travaux."phase"."Avancement", -- Avancement
    voirie_travaux."objetGeometrique"."CodeObjet", -- CodeObjet
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    --voirie_travaux."inObjetMultiPolygon".id,
    nextval('voirie_travaux."outObjetMultiPolygon_id_seq"') as id, -- Identifiant
    --voirie_travaux."inObjetMultiPolygon"."CodeMultiPolygon",
    --voirie_travaux."inObjetMultiPolygon"."CodeObjet",
    voirie_travaux."inObjetMultiPolygon".shape
  from
    voirie_travaux."inObjetMultiPolygon",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet",
    voirie_travaux."natureTravaux"
 where
   voirie_travaux."inObjetMultiPolygon"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
   and
   voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
   and
   voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
   and
   voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  ADD constraint "outObjetMultiPolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiPolygon"
  IS 'Objet Multi Polygon.';




--
--
-- Objets complémentaires
--
--

-- Projet Nature : detail des projets, avec la liste de ses natures de travaux
-- Regroupement : regroupement par quartier


-- ------------------ --
-- outProjetNatureSimplePolygon --
-- ------------------ --

-- Sequence: voirie_travaux."outProjetNatureSimplePolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outProjetNatureSimplePolygon_id_seq";
DROP SEQUENCE if exists voirie_travaux."outProjetNatureSimplePolygon_id_seq";
CREATE SEQUENCE voirie_travaux."outProjetNatureSimplePolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outProjetNatureSimplePolygon_id_seq"
  OWNER TO fred;

--drop view if exists voirie_travaux."outProjetNatureSimplePolygon";
drop table if exists voirie_travaux."outProjetNatureSimplePolygon";
create table voirie_travaux."outProjetNatureSimplePolygon" as
  select
    voirie_travaux."projet"."CodeProjet", -- CodeProjet
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    voirie_travaux."projet"."TagProjet3", -- Etiquette3
    voirie_travaux."natureTravaux"."CodeNature", -- Code
    voirie_travaux."natureTravaux"."NatureTravaux", -- Nature
    voirie_travaux."natureTravaux"."MaitreDOeuvre", -- MaitreDOeuvre
    voirie_travaux."natureTravaux"."Contact", -- Contact
    voirie_travaux."phase"."CodePhase", -- CodePhase
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateDebutS", -- Date de début des travaux
    voirie_travaux."phase"."DateFinS", -- Date de fin des travaux
    voirie_travaux."phase"."Avancement", -- Avancement
    voirie_travaux."objetGeometrique"."CodeObjet", -- CodeObjet
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    --voirie_travaux."inObjetSimplePolygon".id,
    nextval('voirie_travaux."outProjetNatureSimplePolygon_id_seq"') as id, -- Identifiant
    --voirie_travaux."inObjetSimplePolygon"."CodeSimplePolygon",
    --voirie_travaux."inObjetSimplePolygon"."CodeObjet",
    voirie_travaux."inObjetSimplePolygon".shape
  from
    voirie_travaux."inObjetSimplePolygon",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet",
    voirie_travaux."natureTravaux"
  where
    voirie_travaux."inObjetSimplePolygon"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    and
    voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    ;

ALTER TABLE voirie_travaux."outProjetNatureSimplePolygon"
  ADD constraint "outProjetNatureSimplePolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outProjetNatureSimplePolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outProjetNatureSimplePolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outProjetNatureSimplePolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outProjetNatureSimplePolygon"
  IS 'ProjetNature Simple Polygon.';



-- ------------------ --
-- outRegroupementSimplePolygon --
-- ------------------ --

-- Sequence: voirie_travaux."outRegroupementSimplePolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."outRegroupementSimplePolygon_id_seq";
DROP SEQUENCE if exists voirie_travaux."outRegroupementSimplePolygon_id_seq";
CREATE SEQUENCE voirie_travaux."outRegroupementSimplePolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."outRegroupementSimplePolygon_id_seq"
  OWNER TO fred;

--drop view if exists voirie_travaux."outRegroupementSimplePolygon";
drop table if exists voirie_travaux."outRegroupementSimplePolygon";
create table voirie_travaux."outRegroupementSimplePolygon" as
  select
    --voirie_travaux."projet"."CodeProjet", -- CodeProjet
    --voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    --voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    --voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette2
    --voirie_travaux."projet"."TagProjet3", -- Etiquette3
    nextval('voirie_travaux."outRegroupementSimplePolygon_id_seq"') as id, -- Identifiant
    st_Buffer(st_Union(voirie_travaux."inObjetSimplePolygon".shape), 100) as shape -- buffer de 100 m
  from
    voirie_travaux."inObjetSimplePolygon",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet"--,
    --voirie_travaux."natureTravaux"
  where
    voirie_travaux."inObjetSimplePolygon"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
    --and
    --voirie_travaux."natureTravaux"."CodeProjet" = voirie_travaux."projet"."CodeProjet"
  group by
    voirie_travaux."projet"."TagProjet1",
	voirie_travaux."projet"."TagProjet2"
	;

ALTER TABLE voirie_travaux."outRegroupementSimplePolygon"
  ADD constraint "outRegroupementSimplePolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outRegroupementSimplePolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text or geometrytype(shape) = 'POLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outRegroupementSimplePolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outRegroupementSimplePolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outRegroupementSimplePolygon"
  IS 'Regroupement Simple Polygon.';
