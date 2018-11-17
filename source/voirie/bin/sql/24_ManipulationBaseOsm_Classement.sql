-- Comparaison des 2 libellés des deux tables

-- tableau pour la préfecture


SET search_path = stockage, travail, public;


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
