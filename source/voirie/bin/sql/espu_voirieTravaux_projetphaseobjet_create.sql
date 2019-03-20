
-- les tables
-- - projet
-- - phase
-- - objetGeometrique
-- sont issues d'un fichier libreOffice, transformé en fichiers csv
-- ce sont donc des foreign table
--
-- les tables in* sont des tables pour la numérisation des objets
-- les tables out* sont des tables pour la visualisation des données

--drop sequence if exists voirie_travaux."inObjetSimplePoint_id_seq" cascade;
--drop sequence if exists voirie_travaux."inObjetSimplePoint_id_seq1" cascade;
--drop sequence if exists voirie_travaux."inObjetSimpleLinestring_id_seq" cascade;
--drop sequence if exists voirie_travaux."inObjetSimpleLinestring_id_seq1" cascade;
--drop sequence if exists voirie_travaux."inObjetSimplePolygon_id_seq" cascade;
--drop sequence if exists voirie_travaux."inObjetSimplePolygon_id_seq1" cascade;
--drop sequence if exists voirie_travaux."inObjetMultiPoint_id_seq" cascade;
--drop sequence if exists voirie_travaux."inObjetMultiPoint_id_seq1" cascade;
--drop sequence if exists voirie_travaux."inObjetMultiLinestring_id_seq" cascade;
--drop sequence if exists voirie_travaux."inObjetMultiLinestring_id_seq1" cascade;
--drop sequence if exists voirie_travaux."inObjetMultiPolygon_id_seq" cascade;
--drop sequence if exists voirie_travaux."inObjetMultiPolygon_id_seq1" cascade;
--drop sequence if exists voirie_travaux."outObjetSimplePoint_id_seq" cascade;
--drop sequence if exists voirie_travaux."outObjetSimplePoint_id_seq1" cascade;
--drop sequence if exists voirie_travaux."outObjetSimpleLinestring_id_seq" cascade;
--drop sequence if exists voirie_travaux."outObjetSimpleLinestring_id_seq1" cascade;
--drop sequence if exists voirie_travaux."outObjetSimplePolygon_id_seq" cascade;
--drop sequence if exists voirie_travaux."outObjetSimplePolygon_id_seq1" cascade;
--drop sequence if exists voirie_travaux."outObjetMultiPoint_id_seq" cascade;
--drop sequence if exists voirie_travaux."outObjetMultiPoint_id_seq1" cascade;
--drop sequence if exists voirie_travaux."outObjetMultiLinestring_id_seq" cascade;
--drop sequence if exists voirie_travaux."outObjetMultiLinestring_id_seq1" cascade;
--drop sequence if exists voirie_travaux."outObjetMultiPolygon_id_seq" cascade;
--drop sequence if exists voirie_travaux."outObjetMultiPolygon_id_seq1" cascade;

--drop sequence if exists voirie_travaux."projet_id_seq" cascade;
--drop sequence if exists voirie_travaux."projet_id_seq1" cascade;
--drop sequence if exists voirie_travaux."phase_id_seq" cascade;
--drop sequence if exists voirie_travaux."phase_id_seq1" cascade;
--drop sequence if exists voirie_travaux."objetGeometrique_id_seq" cascade;
--drop sequence if exists voirie_travaux."objetGeometrique_id_seq1" cascade;

--drop sequence if exists voirie_travaux."projetSimplePoint_id_seq" cascade;
--drop sequence if exists voirie_travaux."projetSimplePoint_id_seq1" cascade;
--drop sequence if exists voirie_travaux."projetSimpleLinestring_id_seq" cascade;
--drop sequence if exists voirie_travaux."projetSimpleLinestring_id_seq1" cascade;
--drop sequence if exists voirie_travaux."projetSimplePolygon_id_seq" cascade;
--drop sequence if exists voirie_travaux."projetSimplePolygon_id_seq1" cascade;
--drop sequence if exists voirie_travaux."projetMultiPoint_id_seq" cascade;
--drop sequence if exists voirie_travaux."projetMultiPoint_id_seq1" cascade;
--drop sequence if exists voirie_travaux."projetMultiLinestring_id_seq" cascade;
--drop sequence if exists voirie_travaux."projetMultiLinestring_id_seq1" cascade;
--drop sequence if exists voirie_travaux."projetMultiPolygon_id_seq" cascade;
--drop sequence if exists voirie_travaux."projetMultiPolygon_id_seq1" cascade;

-- ------------------ --
-- Projet --
-- ------------------ --

-- projet_fdw
DROP SERVER if exists myserver_projet cascade;
CREATE SERVER myserver_projet
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource '/home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-projet.csv',
    format 'CSV',
    config_options 'HEADERS=FORCE');

DROP FOREIGN TABLE if exists voirie_travaux.projet_fdw;
CREATE FOREIGN TABLE voirie_travaux.projet_fdw (
    "CodeProjet" character varying, -- Code
    "LibelleProjet1" character varying, -- Libelle1
    "LibelleProjet2" character varying, -- Libelle2
    "LibelleProjet3" character varying, -- Libelle3
    "TagProjet1" character varying, -- Etiquette1
    "TagProjet2" character varying, -- Etiquette2
    "TagProjet3" character varying--, -- Etiquette3
) SERVER myserver_projet
OPTIONS (layer 'projetsTravaux-projet');

-- DROP SEQUENCE if exists voirie_travaux."projet_id_seq";
DROP SEQUENCE if exists voirie_travaux."projet_id_seq";
CREATE SEQUENCE voirie_travaux."projet_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."projet_id_seq"
  OWNER TO fred;

-- Vue: voirie_travaux."projet"

-- DROP VIEW if exists voirie_travaux."projet" CASCADE;
DROP VIEW if exists voirie_travaux."projet" CASCADE;
CREATE VIEW voirie_travaux."projet" as
select
  nextval('voirie_travaux."projet_id_seq"') as id, -- Identifiant
  "CodeProjet", -- Code
  "LibelleProjet1", -- Libelle1
  "LibelleProjet2", -- Libelle2
  "LibelleProjet3", -- Libelle3
  "TagProjet1", -- Etiquette1
  "TagProjet2", -- Etiquette2
  "TagProjet3"--, -- Etiquette3
  --CONSTRAINT projet_id_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
FROM
  voirie_travaux.projet_fdw;

--ALTER VIEW voirie_travaux."projet"
--  ADD constraint projet_id_pk PRIMARY KEY (id);
ALTER VIEW voirie_travaux."projet"
  OWNER TO fred;
COMMENT ON VIEW voirie_travaux."projet"
  IS 'Projet';

-- ------------------ --
-- Phase --
-- ------------------ --

-- phase_fdw
DROP SERVER if exists myserver_phase cascade;
CREATE SERVER myserver_phase
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource '/home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-phase.csv',
    format 'CSV',
    config_options 'HEADERS=FORCE');

DROP FOREIGN TABLE if exists voirie_travaux.phase_fdw;
CREATE FOREIGN TABLE voirie_travaux.phase_fdw (
    "CodeProjet" character varying, -- Code
    "CodePhase" character varying, -- Code
    "LibellePhase1" character varying, -- Libelle1
    "LibellePhase2" character varying, -- Libelle2
    "LibellePhase3" character varying, -- Libelle3
    "TagPhase1" character varying, -- Etiquette1
    "TagPhase2" character varying, -- Etiquette1
    "TagPhase3" character varying, -- Etiquette1
    "DateDebut" character varying, -- Date de début des travaux
    "DateFin" character varying, -- Date de fin des travaux
    "DateTsrange" character varying--, -- plage
) SERVER myserver_phase
OPTIONS (layer 'projetsTravaux-phase');

-- DROP SEQUENCE if exists voirie_travaux."phase_id_seq";
DROP SEQUENCE if exists voirie_travaux."phase_id_seq";
CREATE SEQUENCE voirie_travaux."phase_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."phase_id_seq"
  OWNER TO fred;

-- Vue: voirie_travaux."phase"

-- DROP VIEW if exists voirie_travaux."phase" CASCADE;
DROP VIEW if exists voirie_travaux."phase" CASCADE;
CREATE VIEW voirie_travaux."phase" as
select
  nextval('voirie_travaux."phase_id_seq"') as id, -- Identifiant
  "CodeProjet", -- Code
  "CodePhase", -- Code
  "LibellePhase1", -- Libelle1
  "LibellePhase2", -- Libelle2
  "LibellePhase3", -- Libelle3
  "TagPhase1", -- Etiquette1
  "TagPhase2", -- Etiquette1
  "TagPhase3", -- Etiquette1
  "DateDebut"::date, -- Date de début des travaux
  "DateFin"::date, -- Date de fin des travaux
  "DateTsrange"::tsrange
FROM
  voirie_travaux.phase_fdw;
--ALTER VIEW voirie_travaux."phase"
--    ADD constraint phase_id_pk PRIMARY KEY (id);
ALTER VIEW voirie_travaux."phase"
    OWNER TO fred;
COMMENT ON VIEW voirie_travaux."phase"
    IS 'Phase';

-- ------------------ --
-- objetGeometrique --
-- ------------------ --

-- objetGeometrique_fdw
DROP SERVER if exists "myserver_objetGeometrique" cascade;
CREATE SERVER "myserver_objetGeometrique"
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource '/home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-objetGeometrique.csv',
    format 'CSV',
    config_options 'HEADERS=FORCE');

DROP FOREIGN TABLE if exists voirie_travaux."objetGeometrique_fdw";
CREATE FOREIGN TABLE voirie_travaux."objetGeometrique_fdw" (
    "CodePhase" character varying, -- Code
    "ClasseObjet" character varying, -- classe de l'objet
    "CodeObjet" character varying, -- Code
    "LibelleObjet1" character varying, -- Libelle1
    "LibelleObjet2" character varying, -- Libelle2
    "LibelleObjet3" character varying, -- Libelle3
    "TagObjet1" character varying, -- Etiquette1
    "TagObjet2" character varying, -- Etiquette1
    "TagObjet3" character varying, -- Etiquette1
    "CouleurSymbole" character varying, -- code de la couleur
    "Picto" character varying, -- nom du picto
    "Orientation" character varying, -- orientation du symbole
    "Taille" character varying, --taille du symbole
    "CouleurLigne" character varying, -- code de la couleur
    "Epaisseur"  character varying, -- epaisseur
    "TypeDeLigne"  character varying, -- type de ligne
    "CouleurRemplissage" character varying, -- code de la couleur
    "CouleurTexte" character varying--, -- code de la couleur
) SERVER "myserver_objetGeometrique"
OPTIONS (layer 'projetsTravaux-objetGeometrique');

-- Sequence: voirie_travaux."objetGeometrique_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."objetGeometrique_id_seq";
DROP SEQUENCE if exists voirie_travaux."objetGeometrique_id_seq";
CREATE SEQUENCE voirie_travaux."objetGeometrique_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."objetGeometrique_id_seq"
  OWNER TO fred;

-- Vue: voirie_travaux."objetGeometrique"

-- DROP VIEW if exists voirie_travaux."objetGeometrique";
DROP VIEW if exists voirie_travaux."objetGeometrique";
CREATE VIEW voirie_travaux."objetGeometrique" as
select
  nextval('voirie_travaux."objetGeometrique_id_seq"') as id, -- Identifiant
    "CodeObjet", -- Code
    "CodePhase", -- Code
    "LibelleObjet1", -- Libelle1
    "LibelleObjet2", -- Libelle2
    "LibelleObjet3", -- Libelle3
    "TagObjet1", -- Etiquette1
    "TagObjet2", -- Etiquette1
    "TagObjet3", -- Etiquette1
    "ClasseObjet", -- classe de l'objet
    "CouleurSymbole", -- code de la couleur
    "Picto", -- nom du picto
    "Orientation"::numeric, -- orientation du symbole
    "Taille"::numeric, --taille du symbole
    "CouleurLigne", -- code de la couleur
    "Epaisseur"::numeric, -- epaisseur
    "TypeDeLigne", -- type de ligne
    "CouleurRemplissage", -- code de la couleur
    "CouleurTexte"--, -- code de la couleur
FROM
  voirie_travaux."objetGeometrique_fdw";

--ALTER VIEW voirie_travaux."objetGeometrique"
--  ADD constraint "objetGeometrique_id_pk" PRIMARY KEY (id);
ALTER VIEW voirie_travaux."objetGeometrique"
  OWNER TO fred;
COMMENT ON VIEW voirie_travaux."objetGeometrique"
  IS 'Objet Géométrique';




-- ------------------ --
-- ppi --
-- ------------------ --

-- ppi_fdw
DROP SERVER if exists "myserver_ppi" cascade;
CREATE SERVER "myserver_ppi"
  FOREIGN DATA WRAPPER ogr_fdw
  OPTIONS (
    datasource '/home/fred/Documents/technic/source/qgis/data/projetsTravaux/projetsTravaux-ppi.csv',
    format 'CSV',
    config_options 'HEADERS=FORCE');

DROP FOREIGN TABLE if exists voirie_travaux."ppi_fdw";
CREATE FOREIGN TABLE voirie_travaux."ppi_fdw" (
    "ordre" character varying, -- Ordre
    "Code1" character varying, -- Code Axe1
    "Libelle1" character varying, -- Libelle Axe1
    "Code2" character varying, -- Code Axe2
    "Libelle2" character varying, -- Libelle Axe2
    "Code3" character varying, -- Code
    "Libelle3" character varying, -- Libelle
    "Code4" character varying, -- Code
    "Libelle4" character varying, -- Libelle
    "2016D" character varying, -- Année, dépense
    "2016R" character varying, -- Année, Recette
    "2017D" character varying, -- Année, dépense
    "2017R" character varying, -- Année, Recette
    "2018D" character varying, -- Année, dépense
    "2018R" character varying, -- Année, Recette
    "2019D" character varying, -- Année, dépense
    "2019R" character varying, -- Année, Recette
    "2020D" character varying, -- Année, dépense
    "2020R" character varying, -- Année, Recette
    "2021D" character varying, -- Année, dépense
    "2021R" character varying, -- Année, Recette
    "2022D" character varying, -- Année, dépense
    "2022R" character varying, -- Année, Recette
    "2023D" character varying, -- Année, dépense
    "2023R" character varying, -- Année, Recette
    "TotalD" character varying, -- Total dépense
    "TotalR" character varying, -- Total Recette
    "Old_NumeroPPI" character varying, -- Ancien identifiant PPI
    "StartTimeD" character varying, -- Debut, Dépense
    "EndTimeD" character varying, -- Fin, Dépense
    "StartTimeR" character varying, -- Début, Recette
    "EndTimeR" character varying, -- Fin, Recette
    "TotalDA" character varying, -- Total dépense Arrondi
    "TotalRA" character varying, -- Total Recette Arrondi
    "CouleurSymbole" character varying, -- code de la couleur
    "Picto" character varying, -- nom du picto
    "Orientation" character varying, -- orientation du symbole
    "Taille" character varying, --taille du symbole
    "CouleurLigne" character varying, -- code de la couleur
    "Epaisseur"  character varying, -- epaisseur
    "TypeDeLigne"  character varying, -- type de ligne
    "CouleurRemplissage" character varying, -- code de la couleur
    "CouleurTexte" character varying, -- code de la couleur
    "Avancement" character varying--, -- Etat d'avancement du projet
) SERVER "myserver_ppi"
OPTIONS (layer 'projetsTravaux-ppi');

-- Sequence: voirie_travaux."ppi_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."ppi_id_seq";
DROP SEQUENCE if exists voirie_travaux."ppi_id_seq";
CREATE SEQUENCE voirie_travaux."ppi_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."ppi_id_seq"
  OWNER TO fred;

-- Vue: voirie_travaux."ppi"

-- DROP VIEW if exists voirie_travaux."ppi";
DROP VIEW if exists voirie_travaux."ppi";
CREATE VIEW voirie_travaux."ppi" as
select
  nextval('voirie_travaux."ppi_id_seq"') as id, -- Identifiant
    "ordre"::numeric, -- ordre
    "Code1"::numeric, -- Code 1
    "Libelle1", -- Libelle1
    "Code2"::numeric, -- Code 2
    "Libelle2", -- Libelle2
    "Code3"::numeric, -- Code 3
    "Libelle3", -- Libelle3
    "Code4"::numeric, -- Code 4
    "Libelle4", -- Libelle4
    "2016D"::numeric, -- Année, dépense
    "2016R"::numeric, -- Année, Recette
    "2017D"::numeric, -- Année, dépense
    "2017R"::numeric, -- Année, Recette
    "2018D"::numeric, -- Année, dépense
    "2018R"::numeric, -- Année, Recette
    "2019D"::numeric, -- Année, dépense
    "2019R"::numeric, -- Année, Recette
    "2020D"::numeric, -- Année, dépense
    "2020R"::numeric, -- Année, Recette
    "2021D"::numeric, -- Année, dépense
    "2021R"::numeric, -- Année, Recette
    "2022D"::numeric, -- Année, dépense
    "2022R"::numeric, -- Année, Recette
    "2023D"::numeric, -- Année, dépense
    "2023R"::numeric, -- Année, Recette
    "TotalD"::numeric, -- Total dépense
    "TotalR"::numeric, -- Total Recette
    "Old_NumeroPPI"::numeric, -- Ancien identifiant PPI
    "StartTimeD"::date, -- Debut, Dépense
    "EndTimeD"::date, -- Fin, Dépense
    "StartTimeR"::date, -- Début, Recette
    "EndTimeR"::date, -- Fin, Recette
    "TotalDA", -- Total dépense Arrondi
    "TotalRA", -- Total Recette Arrondi
    "CouleurSymbole", -- code de la couleur
    "Picto", -- nom du picto
    "Orientation"::numeric, -- orientation du symbole
    "Taille"::numeric, --taille du symbole
    "CouleurLigne", -- code de la couleur
    "Epaisseur"::numeric, -- epaisseur
    "TypeDeLigne", -- type de ligne
    "CouleurRemplissage", -- code de la couleur
    "CouleurTexte", -- code de la couleur
    "Avancement"--, -- Etat d'avancement du projet
FROM
  voirie_travaux."ppi_fdw";

--ALTER VIEW voirie_travaux."ppi"
--  ADD constraint "ppi_id_pk" PRIMARY KEY (id);
ALTER VIEW voirie_travaux."ppi"
  OWNER TO fred;
COMMENT ON VIEW voirie_travaux."ppi"
  IS 'Plan Pluriannuel d Investissement';




-- ------------------ --
-- inObjetSimplePoint --
-- ------------------ --

-- Sequence: voirie_travaux."inObjetSimplePoint_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."inObjetSimplePoint_id_seq";
DROP SEQUENCE if exists voirie_travaux."inObjetSimplePoint_id_seq";
CREATE SEQUENCE voirie_travaux."inObjetSimplePoint_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."inObjetSimplePoint_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."inObjetSimplePoint"

-- DROP TABLE if exists voirie_travaux."inObjetSimplePoint";
DROP TABLE if exists voirie_travaux."inObjetSimplePoint";
CREATE TABLE voirie_travaux."inObjetSimplePoint"
(
  id serial NOT NULL, -- Identifiant
  --"CodeSimplePoint" character varying, -- Code
  "CodeObjet" character varying, -- Code
  shape geometry--, -- Geometrie
  --CONSTRAINT "inObjetSimplePoint_id_pk" PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."inObjetSimplePoint"
  ADD constraint "inObjetSimplePoint_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."inObjetSimplePoint"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."inObjetSimplePoint"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."inObjetSimplePoint"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."inObjetSimplePoint"
  IS 'Objet Simple Point';



-- ------------------ --
-- inObjetMultiPoint --
-- ------------------ --

-- Sequence: voirie_travaux."inObjetMultiPoint_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."inObjetMultiPoint_id_seq";
DROP SEQUENCE if exists voirie_travaux."inObjetMultiPoint_id_seq";
CREATE SEQUENCE voirie_travaux."inObjetMultiPoint_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."inObjetMultiPoint_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."inObjetMultiPoint"

-- DROP TABLE if exists voirie_travaux."inObjetMultiPoint";
DROP TABLE if exists voirie_travaux."inObjetMultiPoint";
CREATE TABLE voirie_travaux."inObjetMultiPoint"
(
  id serial NOT NULL, -- Identifiant
  --"CodeMultiPoint" character varying, -- Code
  "CodeObjet" character varying, -- Code
  shape geometry--, -- Geometrie
  --CONSTRAINT "inObjetMultiPoint_id_pk" PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."inObjetMultiPoint"
  ADD constraint "inObjetMultiPoint_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."inObjetMultiPoint"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."inObjetMultiPoint"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."inObjetMultiPoint"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."inObjetMultiPoint"
  IS 'Objet Multi Point.';



-- ------------------ --
-- inObjetSimpleLinestring --
-- ------------------ --

-- Sequence: voirie_travaux."inObjetSimpleLinestring_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."inObjetSimpleLinestring_id_seq";
DROP SEQUENCE if exists voirie_travaux."inObjetSimpleLinestring_id_seq";
CREATE SEQUENCE voirie_travaux."inObjetSimpleLinestring_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."inObjetSimpleLinestring_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."inObjetSimpleLinestring"

-- DROP TABLE if exists voirie_travaux."inObjetSimpleLinestring";
DROP TABLE if exists voirie_travaux."inObjetSimpleLinestring";
CREATE TABLE voirie_travaux."inObjetSimpleLinestring"
(
  id serial NOT NULL, -- Identifiant
  --"CodeSimpleLinestring" character varying, -- Code
  "CodeObjet" character varying, -- Code
  shape geometry--, -- Geometrie
  --CONSTRAINT "inObjetSimpleLinestring_id_pk" PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."inObjetSimpleLinestring"
  ADD constraint "inObjetSimpleLinestring_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."inObjetSimpleLinestring"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."inObjetSimpleLinestring"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."inObjetSimpleLinestring"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."inObjetSimpleLinestring"
  IS 'Objet Simple Linestring.';



-- ------------------ --
-- inObjetMultiLinestring--
-- ------------------ --

-- Sequence: voirie_travaux."inObjetMultiLinestring_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."inObjetMultiLinestring_id_seq";
DROP SEQUENCE if exists voirie_travaux."inObjetMultiLinestring_id_seq";
CREATE SEQUENCE voirie_travaux."inObjetMultiLinestring_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."inObjetMultiLinestring_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."inObjetMultiLinestring"

-- DROP TABLE if exists voirie_travaux."inObjetMultiLinestring";
DROP TABLE if exists voirie_travaux."inObjetMultiLinestring";
CREATE TABLE voirie_travaux."inObjetMultiLinestring"
(
  id serial NOT NULL, -- Identifiant
  --"CodeMultiLinestring" character varying, -- Code
  "CodeObjet" character varying, -- Code
  shape geometry--, -- Geometrie
  --CONSTRAINT "inObjetMultiLinestring_id_pk" PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTILINESTRING'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."inObjetMultiLinestring"
  ADD constraint "inObjetMultiLinestring_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."inObjetMultiLinestring"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTILINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."inObjetMultiLinestring"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."inObjetMultiLinestring"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."inObjetMultiLinestring"
  IS 'Objet Multi Linestring.';



-- ------------------ --
-- inObjetSimplePolygon --
-- ------------------ --

-- Sequence: voirie_travaux."inObjetSimplePolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."inObjetSimplePolygon_id_seq";
DROP SEQUENCE if exists voirie_travaux."inObjetSimplePolygon_id_seq";
CREATE SEQUENCE voirie_travaux."inObjetSimplePolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."inObjetSimplePolygon_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."inObjetSimplePolygon"

-- DROP TABLE if exists voirie_travaux."inObjetSimplePolygon";
DROP TABLE if exists voirie_travaux."inObjetSimplePolygon";
CREATE TABLE voirie_travaux."inObjetSimplePolygon"
(
  id serial NOT NULL, -- Identifiant
  --"CodeSimplePolygon" character varying, -- Code
  "CodeObjet" character varying, -- Code
  shape geometry--, -- Geometrie
  --CONSTRAINT "inObjetSimplePolygon_id_pk" PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."inObjetSimplePolygon"
  ADD constraint "inObjetSimplePolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."inObjetSimplePolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."inObjetSimplePolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."inObjetSimplePolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."inObjetSimplePolygon"
  IS 'Objet Simple Polygon.';



-- ------------------ --
-- inObjetMultiPolygon --
-- ------------------ --

-- Sequence: voirie_travaux."inObjetMultiPolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."inObjetMultiPolygon_id_seq";
DROP SEQUENCE if exists voirie_travaux."inObjetMultiPolygon_id_seq";
CREATE SEQUENCE voirie_travaux."inObjetMultiPolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."inObjetMultiPolygon_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."inObjetMultiPolygon"

-- DROP TABLE if exists voirie_travaux."inObjetMultiPolygon";
DROP TABLE if exists voirie_travaux."inObjetMultiPolygon";
CREATE TABLE voirie_travaux."inObjetMultiPolygon"
(
  id serial NOT NULL, -- Identifiant
  --"CodeMultiPolygon" character varying, -- Code
  "CodeObjet" character varying, -- Code
  shape geometry--, -- Geometrie
  --CONSTRAINT "inObjetMultiPolygon_id_pk" PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."inObjetMultiPolygon"
  ADD constraint "inObjetMultiPolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."inObjetMultiPolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."inObjetMultiPolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."inObjetMultiPolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."inObjetMultiPolygon"
  IS 'Objet Multi Polygon.';
