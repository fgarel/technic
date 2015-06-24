-- ----------------
--
-- 00042x00030
--
-- ----------------

-- Suppression de la table 00042x00030
drop table if exists "00042x00030";

-- Creation de la table 00042x00030
create table "00042x00030"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00042x00030_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00042x00030"
  OWNER TO contrib;

-- Index: 00042x00030_3857_idx
-- DROP INDEX "00042x00030_3857_idx";
CREATE INDEX "00042x00030_3857_idx"
  ON "00042x00030"
  USING gist
  (wkb_geometry_3857);

-- Index: 00042x00030_3946_idx
-- DROP INDEX "00042x00030_3946_idx";
CREATE INDEX "00042x00030_3946_idx"
  ON "00042x00030"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00070x00050
--
-- ----------------

-- Suppression de la table 00070x00050
drop table if exists "00070x00050";

-- Creation de la table 00070x00050
create table "00070x00050"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00070x00050_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00070x00050"
  OWNER TO contrib;

-- Index: 00070x00050_3857_idx
-- DROP INDEX "00070x00050_3857_idx";
CREATE INDEX "00070x00050_3857_idx"
  ON "00070x00050"
  USING gist
  (wkb_geometry_3857);

-- Index: 00070x00050_3946_idx
-- DROP INDEX "00070x00050_3946_idx";
CREATE INDEX "00070x00050_3946_idx"
  ON "00070x00050"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00098x00070
--
-- ----------------

-- Suppression de la table 00098x00070
drop table if exists "00098x00070";

-- Creation de la table 00098x00070
create table "00098x00070"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00098x00070_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00098x00070"
  OWNER TO contrib;

-- Index: 00098x00070_3857_idx
-- DROP INDEX "00098x00070_3857_idx";
CREATE INDEX "00098x00070_3857_idx"
  ON "00098x00070"
  USING gist
  (wkb_geometry_3857);

-- Index: 00098x00070_3946_idx
-- DROP INDEX "00098x00070_3946_idx";
CREATE INDEX "00098x00070_3946_idx"
  ON "00098x00070"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00112x00080
--
-- ----------------

-- Suppression de la table 00112x00080
drop table if exists "00112x00080";

-- Creation de la table 00112x00080
create table "00112x00080"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00112x00080_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00112x00080"
  OWNER TO contrib;

-- Index: 00112x00080_3857_idx
-- DROP INDEX "00112x00080_3857_idx";
CREATE INDEX "00112x00080_3857_idx"
  ON "00112x00080"
  USING gist
  (wkb_geometry_3857);

-- Index: 00112x00080_3946_idx
-- DROP INDEX "00112x00080_3946_idx";
CREATE INDEX "00112x00080_3946_idx"
  ON "00112x00080"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00140x00100
--
-- ----------------

-- Suppression de la table 00140x00100
drop table if exists "00140x00100";

-- Creation de la table 00140x00100
create table "00140x00100"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00140x00100_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00140x00100"
  OWNER TO contrib;

-- Index: 00140x00100_3857_idx
-- DROP INDEX "00140x00100_3857_idx";
CREATE INDEX "00140x00100_3857_idx"
  ON "00140x00100"
  USING gist
  (wkb_geometry_3857);

-- Index: 00140x00100_3946_idx
-- DROP INDEX "00140x00100_3946_idx";
CREATE INDEX "00140x00100_3946_idx"
  ON "00140x00100"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00168x00120
--
-- ----------------

-- Suppression de la table 00168x00120
drop table if exists "00168x00120";

-- Creation de la table 00168x00120
create table "00168x00120"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00168x00120_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00168x00120"
  OWNER TO contrib;

-- Index: 00168x00120_3857_idx
-- DROP INDEX "00168x00120_3857_idx";
CREATE INDEX "00168x00120_3857_idx"
  ON "00168x00120"
  USING gist
  (wkb_geometry_3857);

-- Index: 00168x00120_3946_idx
-- DROP INDEX "00168x00120_3946_idx";
CREATE INDEX "00168x00120_3946_idx"
  ON "00168x00120"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00182x00130
--
-- ----------------

-- Suppression de la table 00182x00130
drop table if exists "00182x00130";

-- Creation de la table 00182x00130
create table "00182x00130"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00182x00130_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00182x00130"
  OWNER TO contrib;

-- Index: 00182x00130_3857_idx
-- DROP INDEX "00182x00130_3857_idx";
CREATE INDEX "00182x00130_3857_idx"
  ON "00182x00130"
  USING gist
  (wkb_geometry_3857);

-- Index: 00182x00130_3946_idx
-- DROP INDEX "00182x00130_3946_idx";
CREATE INDEX "00182x00130_3946_idx"
  ON "00182x00130"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00210x00150
--
-- ----------------

-- Suppression de la table 00210x00150
drop table if exists "00210x00150";

-- Creation de la table 00210x00150
create table "00210x00150"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00210x00150_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00210x00150"
  OWNER TO contrib;

-- Index: 00210x00150_3857_idx
-- DROP INDEX "00210x00150_3857_idx";
CREATE INDEX "00210x00150_3857_idx"
  ON "00210x00150"
  USING gist
  (wkb_geometry_3857);

-- Index: 00210x00150_3946_idx
-- DROP INDEX "00210x00150_3946_idx";
CREATE INDEX "00210x00150_3946_idx"
  ON "00210x00150"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00224x00160
--
-- ----------------

-- Suppression de la table 00224x00160
drop table if exists "00224x00160";

-- Creation de la table 00224x00160
create table "00224x00160"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00224x00160_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00224x00160"
  OWNER TO contrib;

-- Index: 00224x00160_3857_idx
-- DROP INDEX "00224x00160_3857_idx";
CREATE INDEX "00224x00160_3857_idx"
  ON "00224x00160"
  USING gist
  (wkb_geometry_3857);

-- Index: 00224x00160_3946_idx
-- DROP INDEX "00224x00160_3946_idx";
CREATE INDEX "00224x00160_3946_idx"
  ON "00224x00160"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00245x00175
--
-- ----------------

-- Suppression de la table 00245x00175
drop table if exists "00245x00175";

-- Creation de la table 00245x00175
create table "00245x00175"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00245x00175_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00245x00175"
  OWNER TO contrib;

-- Index: 00245x00175_3857_idx
-- DROP INDEX "00245x00175_3857_idx";
CREATE INDEX "00245x00175_3857_idx"
  ON "00245x00175"
  USING gist
  (wkb_geometry_3857);

-- Index: 00245x00175_3946_idx
-- DROP INDEX "00245x00175_3946_idx";
CREATE INDEX "00245x00175_3946_idx"
  ON "00245x00175"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00336x00240
--
-- ----------------

-- Suppression de la table 00336x00240
drop table if exists "00336x00240";

-- Creation de la table 00336x00240
create table "00336x00240"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00336x00240_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00336x00240"
  OWNER TO contrib;

-- Index: 00336x00240_3857_idx
-- DROP INDEX "00336x00240_3857_idx";
CREATE INDEX "00336x00240_3857_idx"
  ON "00336x00240"
  USING gist
  (wkb_geometry_3857);

-- Index: 00336x00240_3946_idx
-- DROP INDEX "00336x00240_3946_idx";
CREATE INDEX "00336x00240_3946_idx"
  ON "00336x00240"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00350x00250
--
-- ----------------

-- Suppression de la table 00350x00250
drop table if exists "00350x00250";

-- Creation de la table 00350x00250
create table "00350x00250"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00350x00250_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00350x00250"
  OWNER TO contrib;

-- Index: 00350x00250_3857_idx
-- DROP INDEX "00350x00250_3857_idx";
CREATE INDEX "00350x00250_3857_idx"
  ON "00350x00250"
  USING gist
  (wkb_geometry_3857);

-- Index: 00350x00250_3946_idx
-- DROP INDEX "00350x00250_3946_idx";
CREATE INDEX "00350x00250_3946_idx"
  ON "00350x00250"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00490x00350
--
-- ----------------

-- Suppression de la table 00490x00350
drop table if exists "00490x00350";

-- Creation de la table 00490x00350
create table "00490x00350"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00490x00350_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00490x00350"
  OWNER TO contrib;

-- Index: 00490x00350_3857_idx
-- DROP INDEX "00490x00350_3857_idx";
CREATE INDEX "00490x00350_3857_idx"
  ON "00490x00350"
  USING gist
  (wkb_geometry_3857);

-- Index: 00490x00350_3946_idx
-- DROP INDEX "00490x00350_3946_idx";
CREATE INDEX "00490x00350_3946_idx"
  ON "00490x00350"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00525x00375
--
-- ----------------

-- Suppression de la table 00525x00375
drop table if exists "00525x00375";

-- Creation de la table 00525x00375
create table "00525x00375"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00525x00375_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00525x00375"
  OWNER TO contrib;

-- Index: 00525x00375_3857_idx
-- DROP INDEX "00525x00375_3857_idx";
CREATE INDEX "00525x00375_3857_idx"
  ON "00525x00375"
  USING gist
  (wkb_geometry_3857);

-- Index: 00525x00375_3946_idx
-- DROP INDEX "00525x00375_3946_idx";
CREATE INDEX "00525x00375_3946_idx"
  ON "00525x00375"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 00700x00500
--
-- ----------------

-- Suppression de la table 00700x00500
drop table if exists "00700x00500";

-- Creation de la table 00700x00500
create table "00700x00500"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "00700x00500_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "00700x00500"
  OWNER TO contrib;

-- Index: 00700x00500_3857_idx
-- DROP INDEX "00700x00500_3857_idx";
CREATE INDEX "00700x00500_3857_idx"
  ON "00700x00500"
  USING gist
  (wkb_geometry_3857);

-- Index: 00700x00500_3946_idx
-- DROP INDEX "00700x00500_3946_idx";
CREATE INDEX "00700x00500_3946_idx"
  ON "00700x00500"
  USING gist
  (wkb_geometry_3946);


-- ----------------
--
-- 01050x00750
--
-- ----------------

-- Suppression de la table 01050x00750
drop table if exists "01050x00750";

-- Creation de la table 01050x00750
create table "01050x00750"
(
  ogc_fid serial NOT NULL,
  id character varying(18),
  wkb_geometry_3857 geometry(Geometry,3857),
  wkb_geometry_3946 geometry(Geometry,3946),
  CONSTRAINT "01050x00750_pk" PRIMARY KEY (ogc_fid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "01050x00750"
  OWNER TO contrib;

-- Index: 01050x00750_3857_idx
-- DROP INDEX "01050x00750_3857_idx";
CREATE INDEX "01050x00750_3857_idx"
  ON "01050x00750"
  USING gist
  (wkb_geometry_3857);

-- Index: 01050x00750_3946_idx
-- DROP INDEX "01050x00750_3946_idx";
CREATE INDEX "01050x00750_3946_idx"
  ON "01050x00750"
  USING gist
  (wkb_geometry_3946);


