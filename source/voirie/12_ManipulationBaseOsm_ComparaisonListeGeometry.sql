
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

-- tables inner geometry --
drop table if exists table_iga;
create table table_iga with oids as
select
  "table_01".oid as table_01_oid,
  "table_01".text_original as table_01_text_original,
  "table_01".text_automatique as table_01_text_automatique,
  "table_01".text_manuel as table_01_text_manuel,
  "table_01".geometry_original as table_01_geometry_original,
  "table_01".geometry_automatique as table_01_geometry_automatique,
  "table_01".geometry_manuel as table_01_geometry_manuel,
  "table_02".oid as table_02_oid,
  "table_02".text_original as table_02_text_original,
  "table_02".text_automatique as table_02_text_automatique,
  "table_02".text_manuel as table_02_text_manuel,
  "table_02".geometry_original as table_02_geometry_original,
  "table_02".geometry_automatique as table_02_geometry_automatique,
  "table_02".geometry_manuel as table_02_geometry_manuel,
  st_intersection("table_01".geometry_automatique, "table_02".geometry_automatique) as intersection_geometry,
  st_area("table_01".geometry_automatique) as aire_01,
  st_area("table_02".geometry_automatique) as aire_02,
  st_area(st_intersection("table_01".geometry_automatique, "table_02".geometry_automatique)) as aire_inter,
  st_area(st_intersection("table_01".geometry_automatique, "table_02".geometry_automatique))/st_area("table_01".geometry_automatique) as ratio_01,
  st_area(st_intersection("table_01".geometry_automatique, "table_02".geometry_automatique))/st_area("table_02".geometry_automatique) as ratio_02

from table_01, table_02
where
  table_01.geometry_automatique && table_02.geometry_automatique
  and
  st_intersects(table_01.geometry_automatique, table_02.geometry_automatique)
;


--comptage des resultats
select count(*) from table_iga;

-- affichage du sous-ensemble "Avenue des Crapaudières"
select
  table_01_oid,
  --table_01_text_original,
  table_01_text_automatique,
  --table_01_text_manuel,
  --table_01_geometry_original,
  --table_01_geometry_automatique,
  --table_01_geometry_manuel,
  table_02_oid,
  --table_02_text_original,
  table_02_text_automatique,
  --table_02_text_manuel,
  --table_02_geometry_original,
  --table_02_geometry_automatique,
  --table_02_geometry_manuel,
  --intersection_geometry,
  aire_01,
  aire_02,
  aire_inter--,
  --ratio_01,
  --ratio_02

from table_iga
where table_01_text_original = 'Avenue des Crapaudières';


-- pour chacun des objets de la table_01,
-- recherche de la meilleure correspondance dans la table_02
select
  table_iga.table_01_oid,
  table_iga.table_01_text_original,
  --table_iga.table_01_text_automatique,
  --table_iga.table_01_text_manuel,
  table_iga.table_01_geometry_original,
  table_iga.table_01_geometry_automatique,
  --table_iga.table_01_geometry_manuel,
  table_iga.table_02_oid,
  table_iga.table_02_text_original,
  --table_iga.table_02_text_automatique,
  --table_iga.table_02_text_manuel,
  table_iga.table_02_geometry_original,
  table_iga.table_02_geometry_automatique,
  --table_iga.table_02_geometry_manuel,
  --table_iga.intersection_geometry,
  --table_iga.aire_01,
  --table_iga.aire_02,
  --table_iga.aire_inter,
  table_iga.ratio_01--,
  --table_iga.ratio_02
from table_iga inner join
  (
    -- cette sous-requete permet d'obtenir un couple de valeur
    -- table_01_oid, aire_inter_max
    select
      table_01_oid,
      --table_01_text_original,
      table_01_text_automatique,
      --table_01_text_manuel,
      --table_02_oid,
      --table_02_text_automatique,
      --aire_01,
      --aire_02,
      max(aire_inter) as aire_inter_max
    from table_iga
    --where table_01_text_original = 'Avenue des Crapaudières'
    group by
      table_01_oid,
      --table_01_text_original,
      table_01_text_automatique--,
      --table_01_text_manuel,
      --table_02_oid,
      --table_02_text_automatique--,
      --aire_01,
      --aire_02
  ) req_temp
  on table_iga.table_01_oid = req_temp.table_01_oid
    and req_temp.aire_inter_max = table_iga.aire_inter;
--where req_temp.aire_inter_max = table_iga.aire_inter;


-- pour chacun des objets de la table_02,
-- recherche de la meilleure correspondance dans la table_01
select
  table_iga.table_01_oid,
  table_iga.table_01_text_original,
  --table_iga.table_01_text_automatique,
  --table_iga.table_01_text_manuel,
  table_iga.table_01_geometry_original,
  table_iga.table_01_geometry_automatique,
  --table_iga.table_01_geometry_manuel,
  table_iga.table_02_oid,
  table_iga.table_02_text_original,
  --table_iga.table_02_text_automatique,
  --table_iga.table_02_text_manuel,
  table_iga.table_02_geometry_original,
  table_iga.table_02_geometry_automatique,
  --table_iga.table_02_geometry_manuel,
  --table_iga.intersection_geometry,
  --table_iga.aire_01,
  --table_iga.aire_02,
  --table_iga.aire_inter,
  --table_iga.ratio_01--,
  table_iga.ratio_02
from table_iga inner join
  (
    -- cette sous-requete permet d'obtenir un couple de valeur
    -- table_02_oid, aire_inter_max
    select
      --table_01_oid,
      --table_01_text_original,
      --table_01_text_automatique,
      --table_01_text_manuel,
      table_02_oid,
      table_02_text_automatique,
      --aire_01,
      --aire_02,
      max(aire_inter) as aire_inter_max
    from table_iga
    --where table_01_text_original = 'Avenue des Crapaudières'
    group by
      --table_01_oid,
      --table_01_text_original,
      --table_01_text_automatique--,
      --table_01_text_manuel,
      table_02_oid,
      table_02_text_automatique--,
      --aire_01,
      --aire_02
  ) req_temp
  on table_iga.table_02_oid = req_temp.table_02_oid
    and req_temp.aire_inter_max = table_iga.aire_inter;
--where req_temp.aire_inter_max = table_iga.aire_inter;
