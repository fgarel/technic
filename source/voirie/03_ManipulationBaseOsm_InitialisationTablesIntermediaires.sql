
-- Comparaison des 2 libellés des deux tables

-- Initialisation :

-- Au depart on a deux tables avec des données brutes
-- on fabrique deux tables intermédiaires
-- qui auront une structure identique et qui seront ainsi
-- plus facile à comparer

-- Ces tables intermediaires, contiennent chacune 3 colonnes :
--  - champ original
--  - champ automatique
--  - champ manuel

-- Attention, pour pouvoir comparer deux textes plus facielement,
-- il faut ajouter à la base de données une extension "unaccent"
-- cela est utile pour modifier les chaines de caractères accentués
-- vu ici
--   http://stackoverflow.com/questions/13596638/function-to-remove-accents-in-postgresql

-- ---------------------------------- --
-- Creation des tables intermediaires --
-- ---------------------------------- --

-- create
DROP TABLE if exists table_01 cascade;

CREATE TABLE table_01
(
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

ALTER TABLE table_01
  OWNER TO "Fred";

DROP TABLE if exists table_02 cascade;

CREATE TABLE table_02
(
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

ALTER TABLE table_02
  OWNER TO "Fred";

select Addgeometrycolumn('table_02', 'geometry_original', 2154, 'GEOMETRY', 3);
select Addgeometrycolumn('table_02', 'geometry_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('table_02', 'geometry_manuel', 3946, 'GEOMETRY', 2);

DROP TABLE if exists table_01_t cascade;
CREATE TABLE table_01_t
(
  text_original text,
  text_automatique text,
  text_manuel text
)
WITH (
  OIDS=TRUE
);
ALTER TABLE table_01_t
  OWNER TO "Fred";

DROP TABLE if exists table_01_g cascade;
CREATE TABLE table_01_g
(
  geometry_original geometry(Geometry,4326),
  geometry_automatique geometry(Geometry,3946),
  geometry_manuel geometry(Geometry,3946)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE table_01_g
  OWNER TO "Fred";

DROP TABLE if exists table_02_t cascade;
CREATE TABLE table_02_t
(
  text_original text,
  text_automatique text,
  text_manuel text
)
WITH (
  OIDS=TRUE
);
ALTER TABLE table_02_t
  OWNER TO "Fred";

DROP TABLE if exists table_02_g cascade;
CREATE TABLE table_02_g
(
  geometry_original geometry(Geometry,4326),
  geometry_automatique geometry(Geometry,3946),
  geometry_manuel geometry(Geometry,3946)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE table_02_g
  OWNER TO "Fred";

select Dropgeometrycolumn('table_02_g', 'geometry_original');
select Dropgeometrycolumn('table_02_g', 'geometry_automatique');
select Dropgeometrycolumn('table_02_g', 'geometry_manuel');
select Addgeometrycolumn('table_02_g', 'geometry_original', 2154, 'GEOMETRY', 3);
select Addgeometrycolumn('table_02_g', 'geometry_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('table_02_g', 'geometry_manuel', 3946, 'GEOMETRY', 2);


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


-- ---------------------------------------------------------------- --
-- Remplissage des tables intermediaires avec les données d'origine --
-- ---------------------------------------------------------------- --
-- C'est ici qu'il faut adapter les fonctions pour passer
-- du champ original au champ automatique
-- Pour les textes, on passe aux majuscules sans accent
-- Pour la géométrie, on fait un buffer de +/-5 m

-- ------------------------------ --
-- table_01 <- ListeVoie_From_Osm --
-- ------------------------------ --
INSERT INTO table_01 (text_original, text_automatique, geometry_original)
(
select
  distinct voie_libelle_osm::text as text_original,
  unaccent(upper(rtrim(voie_libelle_osm)))::text as text_automatique,
  linestring as geometry_original
from "ListeVoie_From_Osm"
-- ----
--where voie_libelle_osm LIKE 'Avenue%'
-- ----
);


-- dans les cas des voies qui portent un nom,
-- on concatene d'abord les différents troncons
-- avant de faire un buffer
--drop table if exists table_01_tmp;
create table table_01_tmp as
select
  text_original,
  st_buffer(
    st_linemerge(
      -- l'union renvoie un multi, st_linemerge permet de transformer en linestring
      -- http://postgis.net/docs/ST_LineMerge.html
      st_union(
        -- on fait une union de différentes lignes
        -- http://postgis.net/docs/ST_Union.html
        (ST_Accum(
          -- on aggrege dans un tableau de geometrie, les differents arcs trouvés
          -- http://postgis.net/docs/manual-2.1/ST_Accum.html
          st_transform(geometry_original, 3946))
        )
      )
    ),
  5) as geometry_automatique
from table_01
group by text_original;

update table_01
set geometry_automatique = table_01_tmp.geometry_automatique
from
 table_01_tmp
where table_01.text_original = table_01_tmp.text_original;

drop table if exists table_01_tmp;


-- dans les cas des voies qui ne portent pas de nom,
-- il ne faut pas concatener
-- avant de faire un buffer
update table_01
set geometry_automatique =  st_buffer(st_transform(geometry_original, 3946),5)
where text_original is null;


-- ----------------------------------------------------------- --
-- table_01_tags : elle contient les données osm avec les tags --
-- ----------------------------------------------------------- --

DROP TABLE if exists public.table_01_tags cascade;
create table public.table_01_tags as
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
where"ListeVoie_From_Osm".linestring = table_01.geometry_original
;




-- -------------------------------------- --
-- table_02 <- ListeVoie_From_VoieAdresse --
-- -------------------------------------- --
INSERT INTO table_02 (text_original, text_automatique, geometry_original)
select
  distinct voie_libelle::text as original,
  unaccent(upper(rtrim(voie_libelle)))::text as automatique,
  wkb_geometry as geometry_original
from "ListeVoie_From_VoieAdresse"
-- ----
--where voie_libelle LIKE 'Avenue%'
-- ----
;

update table_02
set geometry_automatique = st_buffer(st_transform(st_force2d(geometry_original), 3946),5);


update comptage
  set "table_01" = (select count(*) from "table_01");
update comptage
  set "table_02" = (select count(*) from "table_02");
-- ----------------------------------------------- --
-- Creation de 4 autres sous-tables intermeidaires --
-- ----------------------------------------------- --
-- A partir de ces deux tables intermediares, table_01 et table_02, --
-- Creation de 4 autres tables :
--   - table_01_t
--   - table_01_g
--   - table_02_t
--   - table_02_g
DROP TABLE if exists table_01_t cascade;
create table table_01_t with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel
from table_01;

update comptage
  set "table_01_t" = (select count(*) from "table_01_t");

DROP TABLE if exists table_01_g cascade;
create table table_01_g with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel,
  geometry_automatique
from table_01;

update comptage
  set "table_01_g" = (select count(*) from "table_01_g");

DROP TABLE if exists table_02_t cascade;
create table table_02_t with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel
from table_02;

update comptage
  set "table_02_t" = (select count(*) from "table_02_t");

DROP TABLE if exists table_02_g cascade;
create table table_02_g with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel,
  geometry_automatique
from table_02;

update comptage
  set "table_02_g" = (select count(*) from "table_02_g");


select
  "table_01",
  "table_01_t",
  "table_01_g",
  table_lta,
  table_ita,
  table_rta,
  "table_02_g",
  "table_02_t",
  "table_02"
from comptage;
