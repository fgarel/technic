
-- Comparaison des 2 libellés des deux tables

-- des tables intermediaires, contiennent chacune 3 colonnes :
--  - champ original
--  - champ automatique
--  - champ manuel


-- Attention, ajouter une extension unaccent
-- cela est utile pour modifier les chaines de caractères accentués
-- vu ici
--   http://stackoverflow.com/questions/13596638/function-to-remove-accents-in-postgresql





-- Comparaison des tables intermediaires

drop table if exists table_inner_manuel;
create table table_inner_manuel as
select
  "table_left_outer".table_01_original as table_01_original,
  "table_left_outer".table_01_automatique as table_01_automatique,
  "table_left_outer".table_01_manuel as table_01_manuel,
  "table_right_outer".table_02_original as table_02_original,
  "table_right_outer".table_02_automatique as table_02_automatique,
  "table_right_outer".table_02_manuel as table_02_manuel
from 
  "table_left_outer" inner join "table_right_outer"
    on "table_left_outer".table_01_manuel LIKE "table_right_outer".table_02_manuel
order by table_01_manuel
  ;


drop table if exists table_left_outer_manuel;
create table table_left_outer_manuel WITH OIDS as
select
  "table_left_outer".table_01_original as table_01_original,
  "table_left_outer".table_01_automatique as table_01_automatique,
  "table_left_outer".table_01_manuel as table_01_manuel--,
  --"table_right_outer".table_02_original as table_02_original,
  --"table_right_outer".table_02_automatique as table_02_automatique,
  --"table_right_outer".table_02_manuel as table_02_manuel
from 
  "table_left_outer" left outer join "table_right_outer"
    on "table_left_outer".table_01_manuel LIKE "table_right_outer".table_02_manuel
where "table_right_outer".table_02_automatique is null
order by table_01_automatique
;




drop table if exists table_right_outer_manuel;
create table table_right_outer_manuel with oids as
select
  --"table_left_outer".table_01_original as table_01_original,
  --"table_left_outer".table_01_automatique as table_01_automatique,
  --"table_left_outer".table_01_manuel as table_01_manuel,
  "table_right_outer".table_02_original as table_02_original,
  "table_right_outer".table_02_automatique as table_02_automatique,
  "table_right_outer".table_02_manuel as table_02_manuel
from 
  "table_left_outer" right outer join "table_right_outer"
    on "table_left_outer".table_01_manuel LIKE "table_right_outer".table_02_manuel
where "table_left_outer".table_01_automatique is null
order by table_02_automatique
;

--vacuum table_right_outer;