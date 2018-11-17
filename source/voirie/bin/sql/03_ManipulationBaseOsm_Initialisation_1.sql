
-- Initialisation_1 :

-- Au depart on a deux tables avec des données brutes
-- on fabrique deux tables intermédiaires (table_01 et table_02)
-- qui auront une structure identique et qui seront ainsi
-- plus facile à comparer

-- Ces tables intermediaires, contiennent chacune 3 colonnes :
--  - champ original
--  - champ automatique
--  - champ manuel

-- ---------------------------------- --
-- Creation des tables intermediaires --
-- ---------------------------------- --

-- create
DROP TABLE if exists table_01 cascade;

CREATE TABLE table_01
(
  id_original bigint,
  text_original text,
  text_automatique text,
  text_manuel text,
  geometry_original geometry(Geometry,4326),
  geometry_automatique geometry(Geometry,3946),
  geometry_manuel geometry(Geometry,3946)
)
WITH (
  OIDS=TRUE
);

--ALTER TABLE table_01
--  OWNER TO "osmuser";

DROP TABLE if exists table_02 cascade;

CREATE TABLE table_02
(
  id_original integer,
  text_original text,
  text_automatique text,
  text_manuel text--,
  --geometry_original geometry(Geometry),
  --geometry_automatique geometry(Geometry,3946),
  --geometry_manuel geometry(Geometry,3946)
)
WITH (
  OIDS=TRUE
);

--ALTER TABLE table_02
--  OWNER TO "osmuser";

select Addgeometrycolumn('table_02', 'geometry_original', 2154, 'GEOMETRY', 3);
select Addgeometrycolumn('table_02', 'geometry_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('table_02', 'geometry_manuel', 3946, 'GEOMETRY', 2);

-- ---------------------------------------------------------- --
-- Creation d'une vue "comptage" avec le decompte des données --
-- ---------------------------------------------------------- --
-- version 1
/*
DROP TABLE if exists comptage cascade;
CREATE TABLE comptage
(
  "table_01" integer,
  "table_01_t" integer,
  "table_01_g" integer,
  "table_02" integer,
  "table_02_t" integer,
  "table_02_g" integer,
  table_ito integer,
  table_ita integer,
  table_itm integer,
  table_lto integer,
  table_lta integer,
  table_ltm integer,
  table_rto integer,
  table_rta integer,
  table_rtm integer,
  table_igo integer,
  table_iga integer,
  "table_iga_01" integer,
  "table_iga_02" integer,
  table_igm integer,
  table_lgo integer,
  table_lga integer,
  table_lgm integer,
  table_rgo integer,
  table_rga integer,
  table_rgm integer
)
WITH (
  OIDS=TRUE
);

insert into comptage values (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
*/

-- version 2
DROP TABLE if exists comptage cascade;
CREATE TABLE comptage
(
  "table_01" integer,
  "table_01_t" integer,
  "table_01_g" integer,
  "table_02" integer,
  "table_02_t" integer,
  "table_02_g" integer,
--  table_ito integer,
  table_ita integer,
--  table_itm integer,
--  table_lto integer,
  table_lta integer,
--  table_ltm integer,
--  table_rto integer,
  table_rta integer,
--  table_rtm integer,
--  table_igo integer,
  table_iga integer,
  "table_iga_01" integer,
  "table_iga_02" integer,
--  table_igm integer,
--  table_lgo integer,
  table_lga integer,
--  table_lgm integer,
--  table_rgo integer,
  table_rga integer
--  table_rgm integer
)
WITH (
  OIDS=TRUE
);

--insert into comptage values (0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
insert into comptage values (0,0,0,0,0,0,0,0,0,0,0,0,0,0);


-- ---------------------------------------------------------------- --
-- Remplissage des tables intermediaires avec les données d'origine --
-- ---------------------------------------------------------------- --

-- ------------------------------ --
-- table_01 <- ListeVoie_From_Osm --
-- ------------------------------ --
INSERT INTO table_01 (
  id_original,
  text_original,
--  text_automatique,
  geometry_original)
(
select
--  distinct voie_libelle_osm::text as text_original
  id as id_original,
  voie_libelle_osm::text as text_original,
--  unaccent(upper(rtrim(voie_libelle_osm)))::text as text_automatique,
  linestring as geometry_original
from "ListeVoie_From_Osm"
);


-- -------------------------------------- --
-- table_02 <- ListeVoie_From_VoieAdresse --
-- -------------------------------------- --
INSERT INTO table_02 (
  id_original,
  text_original,
--  text_automatique,
  geometry_original)
select
--  distinct voie_libelle::text as original,
  id as id_original,
  voie_libelle::text as original,
--  unaccent(upper(rtrim(voie_libelle)))::text as automatique,
  wkb_geometry as geometry_original
from "ListeVoie_From_VoieAdresse"
-- ----
--where voie_libelle LIKE 'Avenue%'
-- ----
;


-- ---------------------------------------------------------- --
-- view_01_tags : elle contient les données osm avec les tags --
-- ---------------------------------------------------------- --
/*
DROP VIEW if exists view_01_tags cascade;
CREATE VIEW view_01_tags as
select
 "ListeVoie_From_Osm".highway,
 "ListeVoie_From_Osm".oneway,
 "ListeVoie_From_Osm".lanes,
 "ListeVoie_From_Osm".maxspeed,
 "ListeVoie_From_Osm".maxheight,
 "ListeVoie_From_Osm".tunnel,
 "ListeVoie_From_Osm".junction,
 "ListeVoie_From_Osm".bicycle,
 "ListeVoie_From_Osm".cycleway,
 "ListeVoie_From_Osm"."cycleway:left",
 "ListeVoie_From_Osm"."oneway:bicycle",
 "ListeVoie_From_Osm"."access",
 "ListeVoie_From_Osm".foot,
 "ListeVoie_From_Osm".horse,
 "ListeVoie_From_Osm".service,
 "ListeVoie_From_Osm".source,
 "ListeVoie_From_Osm"."ref:FR:FANTOIR",
 --"ListeVoie_From_Osm".tags,
 table_01.*
from "ListeVoie_From_Osm", table_01
where "ListeVoie_From_Osm".linestring = table_01.geometry_original
  and "ListeVoie_From_Osm".id = table_01.id_original
;
*/

-- ----------------------------------------------------------- --
-- Mise à jour du decompte des objets présents dans les tables --
-- ----------------------------------------------------------- --
update comptage
  set "table_01" = (select count(*) from "table_01");
update comptage
  set "table_02" = (select count(*) from "table_02");
