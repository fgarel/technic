
-- AutoFromManuel :

-- Transfert des valeurs du champ original vers le champ manuel

-- Que ce soit pour le texte comme pour la géométrie
-- le champ manuel va etre transformé en champ automatique

-- Attention, pour pouvoir comparer deux textes plus facilement,
-- (d'ou la présence du champ automatique)
-- il faut ajouter à la base de données une extension "unaccent"
-- cela est utile pour modifier les chaines de caractères accentués
-- vu ici
--   http://stackoverflow.com/questions/13596638/function-to-remove-accents-in-postgresql



-- --------------------------------------------------------------------------- --
-- Remplissage de la colonne automatique avec les données de la colonne manuel --
-- --------------------------------------------------------------------------- --
-- C'est ici qu'il faut adapter les fonctions pour passer
-- du champ manuel au champ automatique
-- Pour les textes, on passe aux majuscules sans accent
-- Pour la géométrie, on fait un buffer de +/-5 m

-- ------------------------------- --
-- text_automatique <- text_manuel --
-- ------------------------------- --
UPDATE table_01
set text_automatique = unaccent(upper(rtrim(text_manuel)))::text;

UPDATE table_02
set text_automatique = unaccent(upper(rtrim(text_manuel)))::text;

-- --------------------------------------- --
-- geometry_automatique <- geometry_manuel --
-- --------------------------------------- --

-- Dans les cas des voies qui portent un nom,
-- on concatene d'abord les différents troncons
-- avant de faire un buffer
--drop table if exists table_01_tmp;

create table table_01_tmp as
select
  text_manuel,
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
          st_transform(geometry_manuel, 3946))
        )
      )
    ),
  5,
  'endcap=flat') as geometry_automatique
from table_01
group by text_manuel;

update table_01
set geometry_automatique = table_01_tmp.geometry_automatique
from
 table_01_tmp
where table_01.text_manuel = table_01_tmp.text_manuel;

drop table if exists table_01_tmp;


-- Dans les cas des voies qui ne portent pas de nom,
-- il *ne* faut *pas* concatener
-- avant de faire un buffer
update table_01
set geometry_automatique =  st_buffer(st_transform(geometry_manuel, 3946), 5, 'endcap=flat')
where text_manuel is null;

-- Geometrie des voies de la table_02
update table_02
set geometry_automatique = st_buffer(st_transform(st_force2d(geometry_manuel), 3946), 5, 'endcap=flat');


update comptage
  set "table_01" = (select count(*) from "table_01");
update comptage
  set "table_02" = (select count(*) from "table_02");



-- ----------------------------------------------- --
-- Creation de 4 autres sous-tables intermediaires --
-- ----------------------------------------------- --
-- A partir de ces deux tables intermediares, table_01 et table_02, --
-- Creation de 4 autres tables :
--   - table_01_t
--   - table_01_g
--   - table_02_t
--   - table_02_g
DROP table if exists table_01_t cascade;
CREATE table table_01_t with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel
from table_01;

update comptage
  set "table_01_t" = (select count(*) from "table_01_t");

DROP table if exists table_01_g cascade;
CREATE table table_01_g with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel,
  geometry_automatique
from table_01;

update comptage
  set "table_01_g" = (select count(*) from "table_01_g");

DROP table if exists table_02_t cascade;
CREATE table table_02_t with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel
from table_02;

update comptage
  set "table_02_t" = (select count(*) from "table_02_t");

DROP table if exists table_02_g cascade;
CREATE table table_02_g with oids as
select distinct
  --oid,
  text_original,
  text_automatique,
  text_manuel,
  geometry_automatique
from table_02;

update comptage
  set "table_02_g" = (select count(*) from "table_02_g");
