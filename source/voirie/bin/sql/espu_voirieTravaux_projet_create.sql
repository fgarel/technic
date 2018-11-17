
-- connexion a la base espu
-- identifiant : fred
-- password : fgpass


--DROP TABLE if exists voirie_travaux."projet";
--DROP TABLE if exists voirie_travaux."projetPoint";
--CREATE TABLE voirie_travaux."projetPoint"
--(
--  id serial NOT NULL, -- Identifiant
--  "NomProjet" character varying, -- nom du projet
--  "MontantTTC" numeric, -- montant TTC, cout du projet
--  "Categorie" character varying, -- Categorie (1 ou 2)
--  "Axe1" character varying, -- Axe1 (A, B ou C)
--  "Axe2" character varying, -- Axe2 (A1, A2, A3, ..., B1, B2, B3, ...., C1, C2, C3)
--  "GrandProjet" character varying, -- Categorie (1 ou 2)
--  "ActionTransitionEnergetique" character varying, -- x si le projet est
--  "Rappel" character varying, -- x si le projet est un duplicata
--  "NumeroPPI" numeric, -- numero de projet
--  "Localisable" character varying, -- Non si le projet n'est pas localisable
--  "Picto" character varying, -- nom du picto
--  "Couleur" character varying, -- code de la couleur
--  "DateDebut" timestamp, -- Date de début des travaux
--  "DateFin" timestamp, -- Date de fin des travaux
--  "DateTsrange" tsrange, --
--  shape geometry, -- Geometrie
--  CONSTRAINT projet_point_id_pk PRIMARY KEY (id),
--  CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL),
--  CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
--)
--WITH (
--  OIDS=FALSE
--);
--ALTER TABLE voirie_travaux."projetPoint"
--  OWNER TO fred;


-- ----------------- --
-- projetSimplePoint --
-- ----------------- --

-- Sequence: voirie_travaux."projetSimplePoint_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."projetSimplePoint_id_seq";
-- DROP SEQUENCE if exists voirie_travaux."projetSimplePoint_id_seq";
CREATE SEQUENCE voirie_travaux."projetSimplePoint_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."projetSimplePoint_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."projetSimplePoint"

-- DROP TABLE if exists voirie_travaux."projetSimplePoint";
-- DROP TABLE if exists voirie_travaux."projetSimplePoint";
CREATE TABLE voirie_travaux."projetSimplePoint"
(
  id serial NOT NULL, -- Identifiant
  "Libelle1" character varying, -- nom du projet
  "Libelle2" character varying, -- Libelle2
  "Libelle3" character varying, -- Libelle3
  "DateDebut" timestamp, -- Date de début des travaux
  "DateFin" timestamp, -- Date de fin des travaux
  "DateTsrange" tsrange, --
  shape geometry, -- Geometrie
  "ClasseObjet" character varying, -- classe de l'objet
  "CouleurSymbole" character varying, -- code de la couleur
  "Picto" character varying, -- nom du picto
  "Orientation" numeric, -- orientation du symbole
  "Taille" numeric, --taille du symbole
  "CouleurLigne" character varying, -- code de la couleur
  "Epaisseur"  character varying, -- epaisseur
  "TypDeLigne"  character varying, -- type de ligne
  "CouleurRemplissage" character varying--, -- code de la couleur
  --CONSTRAINT projet_simplepoint_id_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."projetSimplePoint"
  ADD constraint projet_simplepoint_id_pk PRIMARY KEY (id);
ALTER TABLE voirie_travaux."projetSimplePoint"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."projetSimplePoint"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."projetSimplePoint"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."projetSimplePoint"
  IS 'Projet Simple Point.';


-- ---------------------- --
-- projetSimpleLinestring --
-- ---------------------- --

-- Sequence: voirie_travaux."projetSimpleLinestring_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."projetSimpleLinestring_id_seq";
-- DROP SEQUENCE if exists voirie_travaux."projetSimpleLinestring_id_seq";
CREATE SEQUENCE voirie_travaux."projetSimpleLinestring_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."projetSimpleLinestring_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."projetSimpleLinestring"

-- DROP TABLE if exists voirie_travaux."projetSimpleLinestring";
-- DROP TABLE if exists voirie_travaux."projetSimpleLinestring";
CREATE TABLE voirie_travaux."projetSimpleLinestring"
(
  id serial NOT NULL, -- Identifiant
  "Libelle1" character varying, -- nom du projet
  "Libelle2" character varying, -- Libelle2
  "Libelle3" character varying, -- Libelle3
  "DateDebut" timestamp, -- Date de début des travaux
  "DateFin" timestamp, -- Date de fin des travaux
  "DateTsrange" tsrange, --
  shape geometry, -- Geometrie
  "ClasseObjet" character varying, -- classe de l'objet
  "CouleurSymbole" character varying, -- code de la couleur
  "Picto" character varying, -- nom du picto
  "Orientation" numeric, -- orientation du symbole
  "Taille" numeric, --taille du symbole
  "CouleurLigne" character varying, -- code de la couleur
  "Epaisseur"  character varying, -- epaisseur
  "TypeDeLigne"  character varying, -- type de ligne
  "CouleurRemplissage" character varying--, -- code de la couleur
  --CONSTRAINT projet_simplelinestring_id_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."projetSimpleLinestring"
  ADD constraint projet_simplelinestring_id_pk PRIMARY KEY (id);
ALTER TABLE voirie_travaux."projetSimpleLinestring"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."projetSimpleLinestring"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."projetSimpleLinestring"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."projetSimpleLinestring"
  IS 'Projet Simple LineString.';


-- ------------------- --
-- projetSimplePolygon --
-- ------------------- --

-- Sequence: voirie_travaux."projetSimplePolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."projetSimplePolygon_id_seq";
-- DROP SEQUENCE if exists voirie_travaux."projetSimplePolygon_id_seq";
CREATE SEQUENCE voirie_travaux."projetSimplePolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."projetSimplePolygon_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."projetSimplePolygon"

-- DROP TABLE if exists voirie_travaux."projetSimplePolygon";
-- DROP TABLE if exists voirie_travaux."projetSimplePolygon";
DROP TABLE if exists voirie_travaux."projetSimplePolygon";
CREATE TABLE voirie_travaux."projetSimplePolygon"
(
  id serial NOT NULL, -- Identifiant
  "Libelle1" character varying, -- nom du projet
  "Libelle2" character varying, -- Libelle2
  "Libelle3" character varying, -- Libelle3
  "DateDebut" timestamp, -- Date de début des travaux
  "DateFin" timestamp, -- Date de fin des travaux
  "DateTsrange" tsrange, --
  shape geometry, -- Geometrie
  "ClasseObjet" character varying, -- classe de l'objet
  "CouleurSymbole" character varying, -- code de la couleur
  "Picto" character varying, -- nom du picto
  "Orientation" numeric, -- orientation du symbole
  "Taille" numeric, --taille du symbole
  "CouleurLigne" character varying, -- code de la couleur
  "Epaisseur"  character varying, -- epaisseur
  "TypeDeLigne"  character varying, -- type de ligne
  "CouleurRemplissage" character varying--, -- code de la couleur
  --CONSTRAINT projet_simplepolygon_id_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."projetSimplePolygon"
  ADD constraint projet_simplepolygon_id_pk PRIMARY KEY (id);
ALTER TABLE voirie_travaux."projetSimplePolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."projetSimplePolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."projetSimplePolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."projetSimplePolygon"
  IS 'Projet Simple Polygon.';


-- ---------------- --
-- projetMultiPoint --
-- ---------------- --

-- Sequence: voirie_travaux."projetMultiPoint_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."projetMultiPoint_id_seq";
-- DROP SEQUENCE if exists voirie_travaux."projetMultiPoint_id_seq";
CREATE SEQUENCE voirie_travaux."projetMultiPoint_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."projetMultiPoint_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."projetMultiPoint"

-- DROP TABLE if exists voirie_travaux."projetMultiPoint";
-- DROP TABLE if exists voirie_travaux."projetMultiPoint";
CREATE TABLE voirie_travaux."projetMultiPoint"
(
  id serial NOT NULL, -- Identifiant
  "Libelle1" character varying, -- nom du projet
  "Libelle2" character varying, -- Libelle2
  "Libelle3" character varying, -- Libelle3
  "DateDebut" timestamp, -- Date de début des travaux
  "DateFin" timestamp, -- Date de fin des travaux
  "DateTsrange" tsrange, --
  shape geometry, -- Geometrie
  "ClasseObjet" character varying, -- classe de l'objet
  "CouleurSymbole" character varying, -- code de la couleur
  "Picto" character varying, -- nom du picto
  "Orientation" numeric, -- orientation du symbole
  "Taille" numeric, --taille du symbole
  "CouleurLigne" character varying, -- code de la couleur
  "Epaisseur"  character varying, -- epaisseur
  "TypeDeLigne"  character varying, -- type de ligne
  "CouleurRemplissage" character varying--, -- code de la couleur
  --CONSTRAINT projet_multipoint_id_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."projetMultiPoint"
  ADD constraint projet_multipoint_id_pk PRIMARY KEY (id);
ALTER TABLE voirie_travaux."projetMultiPoint"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."projetMultiPoint"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."projetMultiPoint"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."projetMultiPoint"
  IS 'Projet Multi Point.';



-- --------------------- --
-- projetMultiLinestring --
-- --------------------- --

-- Sequence: voirie_travaux."projetMultiLinestring_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."projetMultiLinestring_id_seq";
-- DROP SEQUENCE if exists voirie_travaux."projetMultiLinestring_id_seq";
CREATE SEQUENCE voirie_travaux."projetMultiLinestring_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."projetMultiLinestring_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."projetMultiLinestring"

-- DROP TABLE if exists voirie_travaux."projetMultiLinestring";
-- DROP TABLE if exists voirie_travaux."projetMultiLinestring";
CREATE TABLE voirie_travaux."projetMultiLinestring"
(
  id serial NOT NULL, -- Identifiant
  "Libelle1" character varying, -- nom du projet
  "Libelle2" character varying, -- Libelle2
  "Libelle3" character varying, -- Libelle3
  "DateDebut" timestamp, -- Date de début des travaux
  "DateFin" timestamp, -- Date de fin des travaux
  "DateTsrange" tsrange, --
  shape geometry, -- Geometrie
  "ClasseObjet" character varying, -- classe de l'objet
  "CouleurSymbole" character varying, -- code de la couleur
  "Picto" character varying, -- nom du picto
  "Orientation" numeric, -- orientation du symbole
  "Taille" numeric, --taille du symbole
  "CouleurLigne" character varying, -- code de la couleur
  "Epaisseur"  character varying, -- epaisseur
  "TypeDeLigne"  character varying, -- type de ligne
  "CouleurRemplissage" character varying--, -- code de la couleur
  --CONSTRAINT projet_multilinestring_id_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTILINESTRING'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."projetMultiLinestring"
  ADD constraint projet_multilinestring_id_pk PRIMARY KEY (id);
ALTER TABLE voirie_travaux."projetMultiLinestring"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTILINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."projetMultiLinestring"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."projetMultiLinestring"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."projetMultiLinestring"
  IS 'Projet Multi LineString.';


-- ------------------ --
-- projetMultiPolygon --
-- ------------------ --

-- Sequence: voirie_travaux."projetMultiPolygon_id_seq"

-- DROP SEQUENCE if exists voirie_travaux."projetMultiPolygon_id_seq";
-- DROP SEQUENCE if exists voirie_travaux."projetMultiPolygon_id_seq";
CREATE SEQUENCE voirie_travaux."projetMultiPolygon_id_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_travaux."projetMultiPolygon_id_seq"
  OWNER TO fred;

-- Table: voirie_travaux."projetMultiPolygon"

-- DROP TABLE if exists voirie_travaux."projetMultiPolygon";
-- DROP TABLE if exists voirie_travaux."projetMultiPolygon";
DROP TABLE if exists voirie_travaux."projetMultiPolygon";
CREATE TABLE voirie_travaux."projetMultiPolygon"
(
  id serial NOT NULL, -- Identifiant
  "Libelle1" character varying, -- nom du projet
  "Libelle2" character varying, -- Libelle2
  "Libelle3" character varying, -- Libelle3
  "DateDebut" timestamp, -- Date de début des travaux
  "DateFin" timestamp, -- Date de fin des travaux
  "DateTsrange" tsrange, --
  shape geometry, -- Geometrie
  "ClasseObjet" character varying, -- classe de l'objet
  "CouleurSymbole" character varying, -- code de la couleur
  "Picto" character varying, -- nom du picto
  "Orientation" numeric, -- orientation du symbole
  "Taille" numeric, --taille du symbole
  "CouleurLigne" character varying, -- code de la couleur
  "Epaisseur"  character varying, -- epaisseur
  "TypeDeLigne"  character varying, -- type de ligne
  "CouleurRemplissage" character varying--, -- code de la couleur
  --CONSTRAINT projet_multipolygon_id_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL),
  --CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE voirie_travaux."projetMultiPolygon"
  ADD constraint projet_multipolygon_id_pk PRIMARY KEY (id);
ALTER TABLE voirie_travaux."projetMultiPolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."projetMultiPolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."projetMultiPolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."projetMultiPolygon"
  IS 'Projet Multi Polygon.';
