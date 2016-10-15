
-- 1. recherche des voies qui sont incluses dans l'emprise geotrique de l'objet commune


-- Selection de l'objet composé "commune de La Rochelle"
/*
select *
from relations
where
      "tags" -> 'type' = 'boundary'
  and "tags" -> 'boundary' = 'administrative' is not null
  and "tags" -> 'admin_level' = '8'
  and "tags" -> 'name' = 'La Rochelle'
;
*/

-- Creation de la liste des objets simples (nodes et ways) composant l'objet composé "commune de La Rochelle"
/*
select *
from relation_members
where relation_id =
  (
  select id
  from relations
  where
        "tags" -> 'type' = 'boundary'
    and "tags" -> 'boundary' = 'administrative' is not null
    and "tags" -> 'admin_level' = '8'
    and "tags" -> 'name' = 'La Rochelle'
  )
  and "member_type"='W'
limit 100;
*/

-- Meme liste, mais en gardant les attributs de l'objet complexe
/*
select *
from relation_members
  inner join relations on relations.id = relation_members.relation_id
where relation_id =
  (
  select id
  from relations
  where
        "tags" -> 'type' = 'boundary'
    and "tags" -> 'boundary' = 'administrative' is not null
    and "tags" -> 'admin_level' = '8'
    and "tags" -> 'name' = 'La Rochelle'
  )
  and "member_type"='W'
limit 100;
*/

-- Selection des objets simples (nodes et ways) composant l'objet composé "commune de La Rochelle"
/*
select
  id,
  tags,
  --linestring,
  st_asewkt(st_transform(linestring,3946))
from ways
where id in
  (
  select member_id
  from relation_members
  where relation_id =
    (
    select id
    from relations
    where
          "tags" -> 'type' = 'boundary'
      and "tags" -> 'boundary' = 'administrative' is not null
      and "tags" -> 'admin_level' = '8'
      and "tags" -> 'name' = 'La Rochelle'
    )
    and "member_type"='W'
  );
*/

-- Même selection de ces objets simples, mais en gardant les attributs de l'objet complexe
/*
select
  linestring,
  relations.*
from ways
  inner join relation_members on relation_members.member_id = ways.id
  inner join relations on relations.id = relation_members.relation_id
where ways.id in
  (
  select member_id
  from relation_members
  where relation_id =
    (
    select id
    from relations
    where
          "tags" -> 'type' = 'boundary'
      and "tags" -> 'boundary' = 'administrative' is not null
      and "tags" -> 'admin_level' = '8'
      and "tags" -> 'name' = 'La Rochelle'
    )
    and "member_type"='W'
  )
  and
  (
    relation_members.relation_id =
        (
    select id
    from relations
    where
          "tags" -> 'type' = 'boundary'
      and "tags" -> 'boundary' = 'administrative' is not null
      and "tags" -> 'admin_level' = '8'
      and "tags" -> 'name' = 'La Rochelle'
    )
  )
order by sequence_id;
*/

-- Recomposition de l'objet surfacique commune à partir des objets simples (nodes et ways) composant l'objet composé "commune de La Rochelle"
drop table if exists "ObjetSurfaciqueCompose";
create table "ObjetSurfaciqueCompose" as
select
      subquery.id,
      subquery.version,
      subquery.user_id,
      subquery.tstamp,
      subquery.changeset_id,
      subquery.tags,
--  st_asewkt(
--    st_transform(
      st_makepolygon(
        -- Transformation de la polyligne en polygon
        -- http://postgis.net/docs/ST_MakePolygon.html
        st_linemerge(
          -- l'union renvoie un multi, st_linemerge permet de transformer en linestring
          -- http://postgis.net/docs/ST_LineMerge.html
          st_union(
            -- on fait une union de différentes lignes
            -- http://postgis.net/docs/ST_Union.html
            (ST_Accum(
              -- on aggrege dans un tableau de geometrie, les differents arcs trouvés
              -- http://postgis.net/docs/manual-2.1/ST_Accum.html
              linestring)
            )
          )
        )
      ) as the_geom
--       ,3946
--    )
--  )
from (
  -- Selection des objets simples (nodes et ways) composant l'objet composé "commune de La Rochelle"
  select
  linestring,
  relations.*
  from ways
    inner join relation_members on relation_members.member_id = ways.id
    inner join relations on relations.id = relation_members.relation_id
  where ways.id in
    (
      select member_id
      from relation_members
      where relation_id =
      (
        select id
        from relations
        where
              "tags" -> 'type' = 'boundary'
          and "tags" -> 'boundary' = 'administrative' is not null
          and "tags" -> 'admin_level' = '8'
          and "tags" -> 'name' = 'La Rochelle'
      )
      and "member_type"='W'
    )
    and
    (
      relation_members.relation_id =
      (
        select id
        from relations
        where
              "tags" -> 'type' = 'boundary'
          and "tags" -> 'boundary' = 'administrative' is not null
          and "tags" -> 'admin_level' = '8'
          and "tags" -> 'name' = 'La Rochelle'
      )
    )
  ) as subquery
group by
  subquery.id,
  subquery.version,
  subquery.user_id,
  subquery.tstamp,
  subquery.changeset_id,
  subquery.tags
;

-- Selection des voies, qui ont un nom, et qui sont dans le poygone emprise de la commune de La Rochelle
/*
select
  "tags" -> 'name' as name,
  "tags" -> 'highway' as highway,
  "tags" -> 'oneway' as oneway,
  "tags" -> 'lanes' as lanes,
  "tags" -> 'maxspeed' as maxspeed,
  "tags" -> 'maxheight' as maxheight,
  "tags" -> 'tunnel' as tunnel,
  "tags" -> 'junction' as junction,
  "tags" -> 'bicycle' as bicycle,
  "tags" -> 'cycleway' as cycleway,
  "tags" -> 'cycleway:left' as "cycleway:left",
  "tags" -> 'oneway:bicycle' as "oneway:bicycle",
  "tags" -> 'access' as access,
  "tags" -> 'foot' as foot,
  "tags" -> 'horse' as horse,
  "tags" -> 'service' as service,
  "tags" -> 'source' as source,
  "tags" -> 'ref:FR:FANTOIR' as "ref:FR:FANTOIR",
  "tags"
from
  ways
where
  (
  -- condition 1 : voie avec un nom
      ("tags" -> 'name' is not null
      and "tags" -> 'amenity' = 'parking'
      )
    or
      ("tags" -> 'name' is not null
      and "tags" -> 'highway' is not null
      )
  )
  and
  (
  -- condition 2 : intersection avec le polygone de la commune
      (select the_geom as the_geom2 from "ObjetSurfaciqueCompose") && ways.bbox
    and
      st_intersects((select the_geom as the_geom2 from "ObjetSurfaciqueCompose"), ways.linestring)
  )
order by name;
*/

-- Selection des voies, qui ont un nom, et qui sont dans le poygone emprise de la commune de La Rochelle
drop table if exists "ListeVoie_From_Osm";
create table "ListeVoie_From_Osm" as
select distinct
  ("tags" -> 'name')::varchar(100) as voie_libelle_osm,
  *
from
  ways
where
  (
  -- condition 1 : voie avec un nom
      ("tags" -> 'name' is not null
      and "tags" -> 'amenity' = 'parking'
      )
    or
      ("tags" -> 'name' is not null
      and "tags" -> 'highway' is not null
      )
  )
  and
  (
  -- condition 2 : intersection avec le polygone de la commune
      (select the_geom as the_geom2 from "ObjetSurfaciqueCompose") && ways.bbox
    and
      st_intersects((select the_geom as the_geom2 from "ObjetSurfaciqueCompose"), ways.linestring)
  )
order by voie_libelle_osm;
