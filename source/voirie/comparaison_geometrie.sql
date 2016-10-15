-- ----------------------------- --
-- creation des tables de depart --
-- ----------------------------- --

drop table if exists jeu_osm_avenue;
create table jeu_osm_avenue as 
select 
 text_automatique,

   st_linemerge(
     -- l'union renvoie un multi, st_linemerge permet de transformer en linestring
     -- http://postgis.net/docs/ST_LineMerge.html
     st_union(
       -- on fait une union de différentes lignes
       -- http://postgis.net/docs/ST_Union.html
       (ST_Accum(
         -- on aggrege dans un tableau de geometrie, les differents arcs trouvés
         -- http://postgis.net/docs/manual-2.1/ST_Accum.html
         geometry_original)
       )
     )) as geometry_original


 from table_01 
where text_automatique LIKE 'AVENUE%'
group by text_automatique;


drop table if exists jeu_vlr_avenue;
create table jeu_vlr_avenue as 
select 
  text_automatique,
  geometry_original
from table_02 
where text_automatique LIKE 'AVENUE%';

-- ------------------------------ -- 
-- Creation de deux tables buffer --
-- ------------------------------ --
drop table if exists buffer_osm;
create table buffer_osm with oids as
select
  text_automatique,
  st_buffer(st_transform(geometry_original,3946),10) as geometry_automatique
from jeu_osm_avenue;


drop table if exists buffer_vlr;
create table buffer_vlr with oids as
select 
  text_automatique,
  st_buffer(st_transform(geometry_original,3946),10) as geometry_automatique
from jeu_vlr_avenue;

-- ----------------------------------------- --
-- outer join des deux tables intermediaires --
-- ----------------------------------------- --

-- ----------------------------------------- --
-- comparaison des deux tables intermediares --
-- ----------------------------------------- --
drop table if exists compare;
create table compare as 
select
  req_tmp.libelle,
  aire_intersection,
  aire_osm,
  aire_vlr,
  aire_intersection/aire_osm as ratio_osm,
  aire_intersection/aire_vlr as ratio_vlr,
  case
    when aire_intersection/aire_osm > aire_intersection/aire_vlr then aire_intersection/aire_vlr
    else aire_intersection/aire_osm
  end as min_ratio,
  intersection
from
(
select 
  --jeu_osm_avenue.text_automatique,
  buffer_osm.text_automatique,
  st_intersection(
    buffer_osm.geometry_automatique,
    buffer_vlr.geometry_automatique) as intersection,
  st_area(st_intersection(
    buffer_osm.geometry_automatique,
    buffer_vlr.geometry_automatique)) as aire_intersection,
  st_area(buffer_osm.geometry_automatique) as aire_osm,
  st_area(buffer_vlr.geometry_automatique) as aire_vlr
  
from buffer_osm
 inner join buffer_vlr on buffer_osm.text_automatique = buffer_vlr.text_automatique
) req_tmp;