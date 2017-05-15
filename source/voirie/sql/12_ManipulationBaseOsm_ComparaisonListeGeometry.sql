
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

-- Attention, pour pouvoir comparer deux textes plus facilement,
-- il faut ajouter à la base de données une extension "unaccent"
-- cela est utile pour modifier les chaines de caractères accentués
-- vu ici
--   http://stackoverflow.com/questions/13596638/function-to-remove-accents-in-postgresql



-- ------------------------------------- --
-- Comparaison des tables intermediaires --
-- ------------------------------------- --

-- tables inner geometry --
-- Creation de la table_iga qui contient les informations sur
-- l'intersection des objets entre la table_01_g et la table_02_g
drop table if exists table_iga cascade;
create table table_iga with oids as
select
  "table_01_g".oid as table_01_oid,
  "table_01_g".text_original as table_01_text_original,
  "table_01_g".text_automatique as table_01_text_automatique,
  "table_01_g".text_manuel as table_01_text_manuel,
  --"table_01_g".geometry_original as table_01_geometry_original,
  "table_01_g".geometry_automatique as table_01_geometry_automatique,
  --"table_01_g".geometry_manuel as table_01_geometry_manuel,
  "table_02_g".oid as table_02_oid,
  "table_02_g".text_original as table_02_text_original,
  "table_02_g".text_automatique as table_02_text_automatique,
  "table_02_g".text_manuel as table_02_text_manuel,
  --"table_02_g".geometry_original as table_02_geometry_original,
  "table_02_g".geometry_automatique as table_02_geometry_automatique,
  --"table_02_g".geometry_manuel as table_02_geometry_manuel,
  st_intersection("table_01_g".geometry_automatique, "table_02_g".geometry_automatique) as intersection_geometry,
  st_area("table_01_g".geometry_automatique) as aire_01,
  st_area("table_02_g".geometry_automatique) as aire_02,
  st_area(st_intersection("table_01_g".geometry_automatique, "table_02_g".geometry_automatique)) as aire_inter,
  st_area(st_intersection("table_01_g".geometry_automatique, "table_02_g".geometry_automatique))/st_area("table_01_g".geometry_automatique) as ratio_01,
  st_area(st_intersection("table_01_g".geometry_automatique, "table_02_g".geometry_automatique))/st_area("table_02_g".geometry_automatique) as ratio_02

from table_01_g, table_02_g
where
  table_01_g.geometry_automatique && table_02_g.geometry_automatique
  and
  st_intersects(table_01_g.geometry_automatique, table_02_g.geometry_automatique)
;

--comptage des resultats
update comptage
  set table_iga = (select count(*) from table_iga);

-- ------------------------------------------ --
-- Parmi les intersections, choix du meilleur --
-- ------------------------------------------ --
-- Une fois que nous avons notre table intersection,
-- on se place selon deux points de vue différents
-- Recherche des objets de la table_01_g qui sont concernés par ces intersections
-- en choisissant meilleur correspondance => aire d'intersection maximum
--drop table if exists table_iga_01_temp;
create table table_iga_01_temp as
select
  table_01_oid,
  table_01_text_original,
  table_01_text_automatique,
  table_01_text_manuel,
  table_01_geometry_automatique,
  --table_02_oid,
  --table_02_text_automatique,
  --aire_01,
  --aire_02,
  max(aire_inter) as aire_inter_max
from table_iga
--where table_01_text_original = 'Avenue des Crapaudières'
group by
  table_01_oid,
  table_01_text_original,
  table_01_text_automatique,
  table_01_text_manuel,
  table_01_geometry_automatique--,
  --table_02_oid,
  --table_02_text_automatique--,
  --aire_01,
  --aire_02
;

-- Meme chose pour la table 02
-- Recherche des objets de la table_02_g qui sont concernés par ces intersections
-- en choisissant meilleur correspondance
--drop table if exists table_iga_02_temp;
create table table_iga_02_temp as
select
  table_02_oid,
  table_02_text_original,
  table_02_text_automatique,
  table_02_text_manuel,
  table_02_geometry_automatique,
  --table_02_oid,
  --table_02_text_automatique,
  --aire_01,
  --aire_02,
  max(aire_inter) as aire_inter_max
from table_iga
--where table_01_text_original = 'Avenue des Crapaudières'
group by
  table_02_oid,
  table_02_text_original,
  table_02_text_automatique,
  table_02_text_manuel,
  table_02_geometry_automatique--,
  --table_02_oid,
  --table_02_text_automatique--,
  --aire_01,
  --aire_02
;


-- ----------------------------------------------------------------------- --
-- On complete les tables précédentes avec les infos de l'objet intersecté --
-- ----------------------------------------------------------------------- --
-- pour chacun des objets de la table_01,
-- recherche de la meilleure correspondance dans la table_02
drop table if exists table_iga_01;
create table table_iga_01 as
select
  table_iga.table_01_oid,
  table_iga.table_01_text_original,
  table_iga.table_01_text_automatique,
  table_iga.table_01_text_manuel,
  --table_iga.table_01_geometry_original,
  table_iga.table_01_geometry_automatique,
  --table_iga.table_01_geometry_manuel,
  table_iga.table_02_oid,
  table_iga.table_02_text_original,
  table_iga.table_02_text_automatique,
  table_iga.table_02_text_manuel,
  --table_iga.table_02_geometry_original,
  table_iga.table_02_geometry_automatique,
  --table_iga.table_02_geometry_manuel,
  --table_iga.intersection_geometry,
  --table_iga.aire_01,
  --table_iga.aire_02,
  --table_iga.aire_inter,
  table_iga.ratio_01--,
  --table_iga.ratio_02
from table_iga inner join table_iga_01_temp
  on table_iga.table_01_oid = table_iga_01_temp.table_01_oid
    and table_iga.aire_inter = table_iga_01_temp.aire_inter_max;
;

drop table if exists table_iga_01_temp;

--comptage des resultats
update comptage
  set table_iga_01 = (select count(*) from table_iga_01);

-- pour chacun des objets de la table_02,
-- recherche de la meilleure correspondance dans la table_01
drop table if exists table_iga_02;
create table table_iga_02 as
select
  table_iga.table_01_oid,
  table_iga.table_01_text_original,
  table_iga.table_01_text_automatique,
  table_iga.table_01_text_manuel,
  --table_iga.table_01_geometry_original,
  table_iga.table_01_geometry_automatique,
  --table_iga.table_01_geometry_manuel,
  table_iga.table_02_oid,
  table_iga.table_02_text_original,
  table_iga.table_02_text_automatique,
  table_iga.table_02_text_manuel,
  --table_iga.table_02_geometry_original,
  table_iga.table_02_geometry_automatique,
  --table_iga.table_02_geometry_manuel,
  --table_iga.intersection_geometry,
  --table_iga.aire_01,
  --table_iga.aire_02,
  --table_iga.aire_inter,
  --table_iga.ratio_01--,
  table_iga.ratio_02
from table_iga inner join table_iga_02_temp
  on table_iga.table_02_oid = table_iga_02_temp.table_02_oid
    and table_iga.aire_inter = table_iga_02_temp.aire_inter_max;

drop table if exists table_iga_02_temp;


--comptage des resultats
update comptage
  set table_iga_02 = (select count(*) from table_iga_02);

-- sous-ensemble "Avenue des Crapaudières"
-- where table_01_text_original = 'Avenue des Crapaudières';

-- --------------------------------------------- --
-- Recherche des objets qui ne se touchent pas ! --
-- --------------------------------------------- --
-- Objets de la table_01_g qui ne touchent aucun objet de la table_iga
drop table if exists table_lga;
create table table_lga as
select distinct
  "table_01_g".oid as table_01_oid,
  "table_01_g".text_original as table_01_text_original,
  "table_01_g".text_automatique as table_01_text_automatique,
  "table_01_g".text_manuel as table_01_text_manuel,
  "table_01_g".geometry_automatique as table_01_geometry_automatique,
  0::float as aire_inter_max
  --"table_iga".table_01_oid,
  --"table_iga".table_01_geometry_automatique
from table_01_g left outer join table_iga
  on table_01_g.oid = table_iga.table_01_oid
where "table_iga".table_01_geometry_automatique is null
order by table_01_text_original;

--comptage des resultats
update comptage
  set table_lga = (select count(*) from table_lga);

-- Objets de la table_02_g qui ne touchent aucun objet de la table_iga
drop table if exists table_rga;
create table table_rga as
select distinct
  "table_02_g".oid as table_02_oid,
  "table_02_g".text_original as table_02_text_original,
  "table_02_g".text_automatique as table_02_text_automatique,
  "table_02_g".text_manuel as table_02_text_manuel,
  "table_02_g".geometry_automatique as table_02_geometry_automatique,
  0::float as aire_inter_max
  --"table_iga".table_02_oid,
  --"table_iga".table_02_geometry_automatique
from table_02_g left outer join table_iga
  on table_02_g.oid = table_iga.table_02_oid
where "table_iga".table_02_geometry_automatique is null
order by table_02_text_original;

--comptage des resultats
update comptage
  set table_rga = (select count(*) from table_rga);

/*
select
  "table_01",
  "table_01_t",
  "table_01_g",
  table_lga,
  table_iga_01,
  table_iga,
  table_iga_02,
  table_rga,
  "table_02_g",
  "table_02_t",
  "table_02"
from comptage;
*/




update comptage
  set "table_01" = (select count(*) from "table_01");
update comptage
  set "table_02" = (select count(*) from "table_02");
update comptage
  set "table_01_t" = (select count(*) from "table_01_t");
update comptage
  set "table_02_t" = (select count(*) from "table_02_t");
update comptage
  set "table_01_g" = (select count(*) from "table_01_g");
update comptage
  set "table_02_g" = (select count(*) from "table_02_g");
update comptage
  set "table_ita" = (select count(*) from "table_ita");
update comptage
  set "table_lta" = (select count(*) from "table_lta");
update comptage
  set "table_rta" = (select count(*) from "table_rta");
update comptage
  set "table_iga" = (select count(*) from "table_iga");
update comptage
  set "table_lga" = (select count(*) from "table_lga");
update comptage
  set "table_rga" = (select count(*) from "table_rga");
update comptage
  set "table_iga_01" = (select count(*) from "table_iga_01");
update comptage
  set "table_iga_02" = (select count(*) from "table_iga_02");
