
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

-- update comptage
--   set "table_01" = (select count(*) from "table_01");
-- update comptage
--   set "table_01_t" = (select count(*) from "table_01_t");
-- update comptage
--   set "table_01_g" = (select count(*) from "table_01_g");
-- update comptage
--   set "table_02" = (select count(*) from "table_02");
-- update comptage
--   set "table_02_t" = (select count(*) from "table_02_t");
-- update comptage
--   set "table_02_g" = (select count(*) from "table_02_g");
update comptage
  set table_ito = (select count(*) from table_ito);
update comptage
  set table_ita = (select count(*) from table_ita);
update comptage
  set table_itm = (select count(*) from table_itm);
update comptage
  set table_lto = (select count(*) from table_lto);
update comptage
  set table_lta = (select count(*) from table_lta);
update comptage
  set table_ltm = (select count(*) from table_ltm);
update comptage
  set table_rto = (select count(*) from table_rto);
update comptage
  set table_rta = (select count(*) from table_rta);
update comptage
  set table_rtm = (select count(*) from table_rtm);
-- update comptage
--   set table_igo = (select count(*) from table_igo);
-- update comptage
--   set table_iga = (select count(*) from table_iga);
-- update comptage
--   set table_igm = (select count(*) from table_igm);
-- update comptage
--   set table_lgo = (select count(*) from table_lgo);
-- update comptage
--   set table_lga = (select count(*) from table_lga);
-- update comptage
--   set table_lgm = (select count(*) from table_lgm);
-- update comptage
--   set table_rgo = (select count(*) from table_rgo);
-- update comptage
--   set table_rga = (select count(*) from table_rga);
-- update comptage
--   set table_rgm = (select count(*) from table_rgm);


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



-------------------------------------------------
-------------------------------------------------
/*
select
  oid,
  text_automatique
from table_ita
limit 10;

-- view inner text --
drop view if exists view_ita;
--create view view_ita as
drop table if exists table_ita2;
create table table_ita2 as
select distinct
  "table_01".oid,
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
--alter table table_ita  add CONSTRAINT pk_oid PRIMARY KEY (oid);

drop view if exists view_ita;
create view view_ita as
select
  oid,
  table_01_text_automatique,
  table_01_geometry_automatique,
  table_02_geometry_automatique,
  st_intersection(table_01_geometry_automatique, table_02_geometry_automatique),
  st_area(table_01_geometry_automatique) as aire_01,
  st_area(table_02_geometry_automatique) as aire_02,
  st_area(st_intersection(table_01_geometry_automatique, table_02_geometry_automatique)) as aire_inter,
  st_area(st_intersection(table_01_geometry_automatique, table_02_geometry_automatique))/st_area(table_01_geometry_automatique) as ratio_01,
  st_area(st_intersection(table_01_geometry_automatique, table_02_geometry_automatique))/st_area(table_02_geometry_automatique) as ratio_02

from table_ita2
where table_01_text_automatique like '%PROU%';



select * from view_ita limit 10;

select count(*) from view_ita;

select * from view_ita where
table_01_text_automatique like '%PROU%';
*/
