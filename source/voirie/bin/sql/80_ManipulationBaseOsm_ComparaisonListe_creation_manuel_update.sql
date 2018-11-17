
-- Comparaison des 2 libellés des deux tables

-- des tables intermediaires, contiennent chacune 3 colonnes :
--  - champ original
--  - champ automatique
--  - champ manuel


-- Attention, ajouter une extension unaccent
-- cela est utile pour modifier les chaines de caractères accentués
-- vu ici
--   http://stackoverflow.com/questions/13596638/function-to-remove-accents-in-postgresql


select * from "ListeVoie_From_Osm";
select * from "ListeVoie_From_VoieAdresse";


-- Creation des tables intermediaires

drop table if exists table_01;
create table table_01 as
select
  distinct voie_libelle_osm as original,
  unaccent(upper(rtrim(voie_libelle_osm)))::text as automatique,
  ''::text as manuel  
from "ListeVoie_From_Osm"
;

drop table if exists table_02;
create table table_02 as
select
  distinct voie_libelle as original,
  unaccent(upper(rtrim(voie_libelle)))::text as automatique,
  ''::text as manuel  
from "ListeVoie_From_VoieAdresse"
;


-- Comparaison des tables intermediaires

drop table if exists table_inner;
create table table_inner as
select
  "table_01".original as table_01_original,
  "table_01".automatique as table_01_automatique,
  "table_01".manuel as table_01_manuel,
  "table_02".original as table_02_original,
  "table_02".automatique as table_02_automatique,
  "table_02".manuel as table_02_manuel
from 
  "table_01" inner join "table_02"
    on "table_01".automatique LIKE "table_02".automatique
order by table_01_automatique
  ;


drop table if exists table_left_outer;
create table table_left_outer as
select
  "table_01".original as table_01_original,
  "table_01".automatique as table_01_automatique,
  "table_01".manuel as table_01_manuel,
  "table_02".original as table_02_original,
  "table_02".automatique as table_02_automatique,
  "table_02".manuel as table_02_manuel
from 
  "table_01" left outer join "table_02"
  on "table_01".automatique LIKE "table_02".automatique
where "table_02".automatique is null
order by table_01_automatique
;




drop table if exists table_right_outer;
create table table_right_outer as
select
  "table_01".original as table_01_original,
  "table_01".automatique as table_01_automatique,
  "table_01".manuel as table_01_manuel,
  "table_02".original as table_02_original,
  "table_02".automatique as table_02_automatique,
  "table_02".manuel as table_02_manuel
from 
  "table_01" right outer join "table_02"
  on "table_01".automatique LIKE "table_02".automatique
where "table_01".automatique is null
order by table_02_automatique
;

--vacuum table_right_outer;