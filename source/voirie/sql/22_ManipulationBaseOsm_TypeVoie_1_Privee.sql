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


SET search_path = stockage, travail, public;


-- ------------------------------ --
-- Creation des tables de stokage --
-- ------------------------------ --

DROP table if exists stockage."typeVoie" cascade;
CREATE table stockage."typeVoie"
(
  "codeTypeVoie" text,
  "boolVoieCommunale" boolean,
  "boolVoieCommunaleTableauClassement" boolean,
  "boolUsageOuvertAuPublic" boolean,
  "libelleTypeVoie" text,
  couleur text
)
with (oids=True);

insert into stockage."typeVoie" values ('VNAT', False, False, True, 'Voie Nationale', '');
insert into stockage."typeVoie" values ('VDEP', False, False, True, 'Voie Départementale', '');
insert into stockage."typeVoie" values ('VMAR', False, False, True, 'Domaine Maritime', '');
insert into stockage."typeVoie" values ('VCVC', True, True, True, 'Voie Communale "à caractère de chemin", en général hors agglomération', 'Vert');
insert into stockage."typeVoie" values ('VCVU', True, True, True, 'Voie Communale "à caractère de rue"', 'Rouge "Fushia"');
insert into stockage."typeVoie" values ('VCVP', True, True, True, 'Voie Communale "Voie Piétonne"', 'Bleu "Cyan"');
insert into stockage."typeVoie" values ('VCPC', True, True, True, 'Voie Communale "Piste Cyclable"', 'Bleu "Marine"');
insert into stockage."typeVoie" values ('VCPP', True, True, True, 'Voie Communale "Place Publique"', 'Orange');
insert into stockage."typeVoie" values ('VCCR', True, False, True, 'Voie Communale "Chemin Rural"', '');
insert into stockage."typeVoie" values ('VCCV', True, False, True, 'Voie Communale "Chemin Vicinal"', '');
insert into stockage."typeVoie" values ('VPCV', False, False, False, 'Voie Privée "Chemin de Voisinage ou de Quartier", Indivis entre les propriétaires privés, non ouvert au public', '');
insert into stockage."typeVoie" values ('VPCT', False, False, False, 'Voie Privée "Chemin de Terre", plus large qu un sentier, non affecté à la circulation', '');
insert into stockage."typeVoie" values ('VPCE', False, False, False, 'Voie Privée "Chemin et Sentier d Exploitation", plusieurs copropriétaires, il peut etre interdit au public', '');
insert into stockage."typeVoie" values ('VPCO', False, False, True, 'Voie Privée "Chemin et Sentier d Exploitation", plusieurs copropriétaires, ouvert au public', '');
insert into stockage."typeVoie" values ('VPCD', False, False, False, 'Voie Privée "Chemin de Desserte, de Culture, d Aisance", un seul propriétaire, non ouvert au public', '');
insert into stockage."typeVoie" values ('VPCP', False, False, True, 'Voie Privée "Chemin de Passage", un seul propriétaire, il peut etre ouvert à la circulation du public', '');
insert into stockage."typeVoie" values ('VPCH', False, False, True, 'Voie Privée "Chemin de Halage", dépendance du domaine public fluvial, il peut etre affecté à la circulation du public', '');
insert into stockage."typeVoie" values ('VPCC', False, False, False, 'Voie Privée "Chemin de Halage", dépendance du domaine public fluvial, non affecté à la circulation du public', '');



DROP table if exists stockage."diffManuel" cascade;
CREATE table stockage."diffManuel"
(
  id bigint,
  "libelleTypeVoie" text,
  "codeTypeVoie" text,
  "proprietaire" text
)
with (oids=True);

--insert into stockage."typeVoieManuel" values ( , 'VDEP');

-- ---------------------------------------------------------------------------------- --
-- table_01_extended : elle contient les données osm avec les tags et les infos ville --
-- ---------------------------------------------------------------------------------- --
/*
DROP table if exists stockage.table_01_tags cascade;
alter table stockage.table_01_tags
drop CONSTRAINT table_01_tags;
alter table stockage.table_01_extended
drop CONSTRAINT table_01_tags;
alter table stockage.table_01_extended
drop CONSTRAINT table_01_extended;*/


DROP table if exists stockage.table_01_extended cascade;
CREATE table stockage.table_01_extended with oids as
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
 "ListeVoie_From_Osm".tags,
 --False as "BoolClassementDeclassement",
 --20170501 as "DateClassementDeclassement"::Date,
 --'' as "CodeTypeVoie"::text,
 --table_01.oid,
 table_01.*
from travail."ListeVoie_From_Osm", travail.table_01
where travail."ListeVoie_From_Osm".linestring::Geometry = travail.table_01.geometry_original::Geometry
  and travail."ListeVoie_From_Osm".id = travail.table_01.id_original
;

alter table stockage.table_01_extended
add CONSTRAINT pk_table_01_extended PRIMARY KEY (oid);

alter table stockage.table_01_extended
add column "boolClassementDeclassement" Boolean;

alter table stockage.table_01_extended
add column "dateClassementDeclassement" Date;

alter table stockage.table_01_extended
add column "codeTypeVoie" Text;

alter table stockage.table_01_extended
add column "proprietaire" Text;

-- ------------------------------------------------ --
-- Remplissage des infos VLR à partir des infos Osm --
-- ------------------------------------------------ --
-- ------------ --
-- codeTypeVoie --
-- ------------ --
-- -------------- --
-- Voie Nationale --
-- -------------- --

update table_01_extended
  set "codeTypeVoie" = 'VNAT'
    where highway = 'trunk';

-- ------------------- --
-- Voie Départementale --
-- ------------------- --

update table_01_extended
  set "codeTypeVoie" = 'VDEP'
    where highway = 'path';


-- ----------------------------------- --
-- Voie Communale "à caractère de rue" --
-- ----------------------------------- --

update table_01_extended
  set "codeTypeVoie" = 'VCVU'
  where highway = 'residential';

-- ------------------------------ --
-- Voie Communale "Voie Piétonne" --
-- ------------------------------ --

update table_01_extended
  set "codeTypeVoie" = 'VCVP'
  where highway = 'footway';

-- ------------------------------- --
-- Voie Communale "Piste Cyclable" --
-- ------------------------------- --

update table_01_extended
  set "codeTypeVoie" = 'VCPC'
  where highway = 'cycleway';


-- ------------ --
-- Proprietaire --
-- ------------ --


-- ------------------------------------------------ --
-- Remplissage des infos VLR à partir des infos VLR --
-- ------------------------------------------------ --

select
*
from
  stockage.table_01_extended
    inner join stockage."diffManuel"
      on table_01_extended.id_original = "diffManuel".id;

-- -------------------------- --
-- tableau pour la préfecture --
-- -------------------------- --
DROP table if exists stockage.table_prefecture cascade;
CREATE table stockage.table_prefecture with oids as
select
  text_manuel,
  "boolClassementDeclassement",
  "dateClassementDeclassement",
  "typeVoie"."codeTypeVoie",
  "boolVoieCommunale",
  "boolVoieCommunaleTableauClassement",
  "libelleTypeVoie",
  st_length(
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
    )
  ) as geometry_length,
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
  ) as geometry_merge
  --geometry_manuel

from
  table_01_extended
    left join stockage."typeVoie"
      on table_01_extended."codeTypeVoie" = "typeVoie"."codeTypeVoie"
group by
  text_manuel,
  "boolClassementDeclassement",
  "dateClassementDeclassement",
  "typeVoie"."codeTypeVoie",
  "boolVoieCommunale",
  "boolVoieCommunaleTableauClassement",
  "libelleTypeVoie"
  --geometry_manuel
  ;


-- -------------------------------- --
-- Comparaison des tables, la suite --
-- -------------------------------- --
/*
SET search_path = travail;

-- selection des troncons qui ont en commun
-- - leurs noms
-- - et une partie de leur geometrie
drop view if exists view_iga_ita;
create view view_iga_ita as
select *
from table_iga
where
table_01_text_automatique = table_02_text_automatique;



select count(*) from view_iga_ita;

select
  table_01_text_automatique,
  table_02_text_automatique,
  ratio_01
 from table_iga_01
  where table_01_text_automatique > table_02_text_automatique
  --and (table_01_text_automatique = table_02_text_automatique)
  order by ratio_01 desc
limit 10;
*/
