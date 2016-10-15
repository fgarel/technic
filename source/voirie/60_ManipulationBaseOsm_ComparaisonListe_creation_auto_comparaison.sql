
-- Comparaison des 2 libellés des deux tables

-- des tables intermediaires, contiennent chacune 3 colonnes :
--  - champ original
--  - champ automatique
--  - champ manuel


-- Attention, ajouter une extension unaccent
-- cela est utile pour modifier les chaines de caractères accentués
-- vu ici
--   http://stackoverflow.com/questions/13596638/function-to-remove-accents-in-postgresql


--select * from "ListeVoie_From_Osm";

--select st_asewkt(wkb_geometry)
--from "ListeVoie_From_VoieAdresse";


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

-- ---------------------------------------------------------------- --
-- Remplissage des tables intermediaires avec les données d'origine --
-- ---------------------------------------------------------------- --
-- table_01 <- ListeVoie_From_Osm
INSERT INTO table_01 (text_original, text_automatique, geometry_original)
(
select
  distinct voie_libelle_osm::text as text_original,
  unaccent(upper(rtrim(voie_libelle_osm)))::text as text_automatique,
  linestring as geometry_original
from "ListeVoie_From_Osm"
);


drop table if exists table_01_tmp;
create table table_01_tmp as 
select 
 text_original,
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
          )) as geometry_automatique

 from table_01 
--where text_automatique LIKE 'AVENUE%'
group by text_original;

update table_01
set geometry_automatique = table_01_tmp.geometry_automatique
from
 table_01_tmp
where table_01.text_original = table_01_tmp.text_original;

drop table if exists table_01_tmp;


-- table_02 <- ListeVoie_From_VoieAdresse
INSERT INTO table_02 (text_original, text_automatique, geometry_original)
select
  distinct voie_libelle::text as original,
  unaccent(upper(rtrim(voie_libelle)))::text as automatique,
  wkb_geometry as geometry_original
from "ListeVoie_From_VoieAdresse";

update table_02
set geometry_automatique = st_transform(st_force2d(geometry_original), 3946);


-- ------------------------------------- --
-- Comparaison des tables intermediaires --
-- ------------------------------------- --

-- tables inner text --
drop table if exists table_ito cascade;
create table table_ito with oids as
select distinct
  "table_01".text_original as text_original--,
  --"table_01".text_automatique as text_automatique ,
  --"table_01".text_manuel as table_01_text_manuel,
  --"table_01".geometry_original as table_01_geometry_original,
  --"table_01".geometry_automatique as table_01_geometry_automatique,
  --"table_01".geometry_manuel as table_01_geometry_manuel,
  --"table_02".text_original as table_02_text_original,
  --"table_02".text_automatique as table_02_text_automatique,
  --"table_02".text_manuel as table_02_text_manuel,
  --"table_02".geometry_original as table_02_geometry_original,
  --"table_02".geometry_automatique as table_02_geometry_automatique,
  --"table_02".geometry_manuel as table_02_geometry_manuel
  
from 
  "table_01" inner join "table_02"
    on "table_01".text_original = "table_02".text_original
order by text_original;

drop table if exists table_ita cascade;
create table table_ita with oids as
select distinct
  --"table_01".text_original as table_01_text_original,
  "table_01".text_automatique as text_automatique --,
  --"table_01".text_manuel as table_01_text_manuel,
  --"table_01".geometry_original as table_01_geometry_original,
  --"table_01".geometry_automatique as table_01_geometry_automatique,
  --"table_01".geometry_manuel as table_01_geometry_manuel,
  --"table_02".text_original as table_02_text_original,
  --"table_02".text_automatique as table_02_text_automatique,
  --"table_02".text_manuel as table_02_text_manuel,
  --"table_02".geometry_original as table_02_geometry_original,
  --"table_02".geometry_automatique as table_02_geometry_automatique,
  --"table_02".geometry_manuel as table_02_geometry_manuel
  
from 
  "table_01" inner join "table_02"
    on "table_01".text_automatique = "table_02".text_automatique
order by text_automatique;

drop table if exists table_itm cascade;
create table table_itm with oids as
select distinct
  --"table_01".text_original as table_01_text_original,
  --"table_01".text_automatique as text_automatique,
  "table_01".text_manuel as text_manuel--,
  --"table_01".geometry_original as table_01_geometry_original,
  --"table_01".geometry_automatique as table_01_geometry_automatique,
  --"table_01".geometry_manuel as table_01_geometry_manuel,
  --"table_02".text_original as table_02_text_original,
  --"table_02".text_automatique as table_02_text_automatique,
  --"table_02".text_manuel as table_02_text_manuel,
  --"table_02".geometry_original as table_02_geometry_original,
  --"table_02".geometry_automatique as table_02_geometry_automatique,
  --"table_02".geometry_manuel as table_02_geometry_manuel
  
from 
  "table_01" inner join "table_02"
    on "table_01".text_manuel = "table_02".text_manuel
order by text_manuel;

-- view inner text --
drop view if exists view_ita;
create view view_ita as
select distinct
  "table_01".text_original as table_01_text_original,
  "table_01".text_automatique as table_01_text_automatique,
  "table_01".text_manuel as table_01_text_manuel,
  "table_01".geometry_original as table_01_geometry_original,
  "table_01".geometry_automatique as table_01_geometry_automatique,
  "table_01".geometry_manuel as table_01_geometry_manuel,
  "table_02".text_original as table_02_text_original,
  "table_02".text_automatique as table_02_text_automatique,
  "table_02".text_manuel as table_02_text_manuel,
  "table_02".geometry_original as table_02_geometry_original,
  "table_02".geometry_automatique as table_02_geometry_automatique,
  "table_02".geometry_manuel as table_02_geometry_manuel
from 
  table_ita inner join table_01
    on "table_ita".text_automatique = table_01.text_automatique
     inner join table_02
       on "table_ita".text_automatique = table_02.text_automatique
  ;

select * from view_ita limit 10;

select count(*) from view_ita;

select * from view_ita where
table_01_text_automatique like '%PROU%';



-- tables left outer text --
drop table if exists table_lto;
create table table_lto with oids as
select distinct
  "table_01".text_original as table_01_text_original,
  "table_01".text_automatique as table_01_text_automatique,
  "table_01".text_manuel as table_01_text_manuel--,
  --"table_02".original as table_02_original,
  --"table_02".automatique as table_02_automatique,
  --"table_02".manuel as table_02_manuel
from 
  "table_01" left outer join "table_02"
  on "table_01".text_original = "table_02".text_original
where "table_02".text_original is null
order by table_01_text_original;

drop table if exists table_lta;
create table table_lta with oids as
select distinct
  "table_01".text_original as table_01_text_original,
  "table_01".text_automatique as table_01_text_automatique,
  "table_01".text_manuel as table_01_text_manuel--,
  --"table_02".original as table_02_original,
  --"table_02".automatique as table_02_automatique,
  --"table_02".manuel as table_02_manuel
from 
  "table_01" left outer join "table_02"
  on "table_01".text_automatique = "table_02".text_automatique
where "table_02".text_automatique is null
order by table_01_text_automatique;

drop table if exists table_ltm;
create table table_ltm with oids as
select distinct
  "table_01".text_original as table_01_text_original,
  "table_01".text_automatique as table_01_text_automatique,
  "table_01".text_manuel as table_01_text_manuel--,
  --"table_02".original as table_02_original,
  --"table_02".automatique as table_02_automatique,
  --"table_02".manuel as table_02_manuel
from 
  "table_01" left outer join "table_02"
  on "table_01".text_manuel = "table_02".text_manuel
where "table_02".text_manuel is null
order by table_01_text_manuel;


-- tables right outer text --
drop table if exists table_rto;
create table table_rto with oids as
select distinct
  --"table_02".text_original as table_02_text_original,
  --"table_02".text_automatique as table_02_text_automatique,
  --"table_02".text_manuel as table_02_text_manuel,
  "table_02".text_original as table_02_text_original,
  "table_02".text_automatique as table_02_text_automatique,
  "table_02".text_manuel as table_02_text_manuel
from 
  "table_01" right outer join "table_02"
  on "table_01".text_original = "table_02".text_original
where "table_01".text_original is null
order by table_02_text_original;

drop table if exists table_rta;
create table table_rta with oids as
select distinct
  --"table_02".text_original as table_02_text_original,
  --"table_02".text_automatique as table_02_text_automatique,
  --"table_02".text_manuel as table_02_text_manuel--,
  "table_02".text_original as table_02_text_original,
  "table_02".text_automatique as table_02_text_automatique,
  "table_02".text_manuel as table_02_text_manuel
from 
  "table_01" right outer join "table_02"
  on "table_01".text_automatique = "table_02".text_automatique
where "table_01".text_automatique is null
order by table_02_text_automatique;


drop table if exists table_rtm;
create table table_rtm with oids as
select distinct
  --"table_02".text_original as table_02_text_original,
  --"table_02".text_automatique as table_02_text_automatique,
  --"table_02".text_manuel as table_02_text_manuel--,
  "table_02".text_original as table_02_text_original,
  "table_02".text_automatique as table_02_text_automatique,
  "table_02".text_manuel as table_02_text_manuel
from 
  "table_01" right outer join "table_02"
  on "table_01".text_manuel = "table_02".text_manuel
where "table_01".text_manuel is null
order by table_02_text_manuel;
