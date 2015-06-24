﻿-- ----------------
-- 
-- cases au 1/10000
--
-- ----------------

-- Suppression de la table des 00042x00030
drop table if exists cadastre_travail.00042x00030;

-- Creation de la table des 00042x00030
create table cadastre_travail.00042x00030
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT case4610000_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE case4610000
  OWNER TO contrib;

-- Index: case4610000_3857_idx
-- DROP INDEX case4610000_3857_idx;
CREATE INDEX case4610000_3857_idx
  ON case4610000
  USING gist
  (wkb_geometry_3857);

-- Index: case4610000_3946_idx
-- DROP INDEX case4610000_3946_idx;
CREATE INDEX case4610000_3946_idx
  ON case4610000
  USING gist
  (wkb_geometry_3946);


-- ---------------
-- 
-- cases au 1/5000
--
-- ---------------

-- Suppression de la table des cases4605000
drop table if exists cadastre_travail.case4605000;

-- Creation de la table des cases4605000
create table cadastre_travail.case4605000
(
  ogc_fid serial NOT NULL,
  id character varying(20),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT case4605000_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE case4605000
  OWNER TO contrib;

-- Index: case4605000_3857_idx
-- DROP INDEX case4605000_3857_idx;
CREATE INDEX case4605000_3857_idx
  ON case4605000
  USING gist
  (wkb_geometry_3857);

-- Index: case4605000_3946_idx
-- DROP INDEX case4605000_3946_idx;
CREATE INDEX case4605000_3946_idx
  ON case4605000
  USING gist
  (wkb_geometry_3946);


-- ---------------
-- 
-- cases au 1/2000
--
-- ---------------

-- Suppression de la table des cases4602000
drop table if exists cadastre_travail.case4602000;

-- Creation de la table des cases4602000
create table cadastre_travail.case4602000
(
  ogc_fid serial NOT NULL,
  id character varying(21),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT case4602000_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE case4602000
  OWNER TO contrib;

-- Index: case4602000_3857_idx
-- DROP INDEX case4602000_3857_idx;
CREATE INDEX case4602000_3857_idx
  ON case4602000
  USING gist
  (wkb_geometry_3857);

-- Index: case4602000_3946_idx
-- DROP INDEX case4602000_3946_idx;
CREATE INDEX case4602000_3946_idx
  ON case4602000
  USING gist
  (wkb_geometry_3946);


-- ---------------
-- 
-- cases au 1/1000
--
-- ---------------

-- Suppression de la table des cases4601000
drop table if exists cadastre_travail.case4601000;

-- Creation de la table des cases4601000
create table cadastre_travail.case4601000
(
  ogc_fid serial NOT NULL,
  id character varying(23),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT case4601000_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE case4601000
  OWNER TO contrib;

-- Index: case4601000_3857_idx
-- DROP INDEX case4601000_3857_idx;
CREATE INDEX case4601000_3857_idx
  ON case4601000
  USING gist
  (wkb_geometry_3857);

-- Index: case4601000_3946_idx
-- DROP INDEX case4601000_3946_idx;
CREATE INDEX case4601000_3946_idx
  ON case4601000
  USING gist
  (wkb_geometry_3946);


-- --------------
-- 
-- cases au 1/500
--
-- --------------

-- Suppression de la table des cases4600500
drop table if exists cadastre_travail.case4600500;

-- Creation de la table des cases4600500
create table cadastre_travail.case4600500
(
  ogc_fid serial NOT NULL,
  id character varying(25),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT case4600500_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE case4600500
  OWNER TO contrib;

-- Index: case4600500_3857_idx
-- DROP INDEX case4600500_3857_idx;
CREATE INDEX case4600500_3857_idx
  ON case4600500
  USING gist
  (wkb_geometry_3857);

-- Index: case4600500_3946_idx
-- DROP INDEX case4600500_3946_idx;
CREATE INDEX case4600500_3946_idx
  ON case4600500
  USING gist
  (wkb_geometry_3946);


-- --------------
-- 
-- cases au 1/200
--
-- --------------

-- Suppression de la table des cases4600200
drop table if exists cadastre_travail.case4600200;

-- Creation de la table des cases4600200
create table cadastre_travail.case4600200
(
  ogc_fid serial NOT NULL,
  id character varying(26),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT case4600200_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE case4600200
  OWNER TO contrib;

-- Index: case4600200_3857_idx
-- DROP INDEX case4600200_3857_idx;
CREATE INDEX case4600200_3857_idx
  ON case4600200
  USING gist
  (wkb_geometry_3857);

-- Index: case4600200_3946_idx
-- DROP INDEX case4600200_3946_idx;
CREATE INDEX case4600200_3946_idx
  ON case4600200
  USING gist
  (wkb_geometry_3946);



-- -------------------
-- 
-- cases au 1/200 (A3)
--
-- -------------------

-- Suppression de la table des cases4600200A3
drop table if exists cadastre_travail.case4600200A3;

-- Creation de la table des cases4600200A3
create table cadastre_travail.case4600200A3
(
  ogc_fid serial NOT NULL,
  id character varying(28),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT case4600200A3_pk PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE case4600200A3
  OWNER TO contrib;

-- Index: case4600200A3_3857_idx
-- DROP INDEX case4600200A3_3857_idx;
CREATE INDEX case4600200A3_3857_idx
  ON case4600200A3
  USING gist
  (wkb_geometry_3857);

-- Index: case4600200A3_3946_idx
-- DROP INDEX case4600200A3_3946_idx;
CREATE INDEX case4600200A3_3946_idx
  ON case4600200A3
  USING gist
  (wkb_geometry_3946);





