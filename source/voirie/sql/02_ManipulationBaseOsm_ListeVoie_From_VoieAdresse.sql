-- Recuperation des noms des voies dans la base voieadresse
-- execution dans la base osm

-- attention, ajout de l'extension dblink


-- la base espu, le schema travail, contient des vues vers
-- voieadresse

--drop table if exists travail."ListeVoie_From_VoieAdresse";
drop view if exists travail."ListeVoie_From_VoieAdresse" cascade;
create view "ListeVoie_From_VoieAdresse" as

SELECT *
FROM dblink(
   'dbname=voieadresse port=5432
   host=dsibdd09 user=sig password=Mie3Bhoutan',

   '-- selection des voies de la base interne
    select distinct
      id,
      voie_libelle,
      voie_code_fantoir,
      voie_classe,
      wkb_geometry
    from voirie_filaire_voie
    order by voie_libelle;
    '
    )
    AS "VoieAdresse"(
      id integer,
      voie_libelle varchar(100),
      voie_code_fantoir varchar(5),
      voie_classe smallint,
      wkb_geometry geometry
      );


-- et vers
-- osm (apidb)

--drop table if exists travail."ListeVoie_From_Osm";
drop view if exists travail."ListeVoie_From_Osm" cascade;
create view travail."ListeVoie_From_Osm" as

SELECT *
FROM dblink(
    'dbname=osm port=5432
     host=vlr6180y user=osmuser password=osmuser',

    '-- selection des voies de la base osm
     select distinct
            voie_libelle_osm,
            highway,
            oneway,
            lanes,
            maxspeed,
            maxheight,
            tunnel,
            junction,
            bicycle,
            cycleway,
            "cycleway:left",
            "oneway:bicycle",
            "access",
            foot,
            horse,
            service,
            source,
            "ref:FR:FANTOIR",
            id,
            "version",
            user_id,
            tstamp,
            changeset_id,
            tags,
            nodes,
            bbox,
            linestring
     from apidb."ListeVoie_From_Osm";
    '
    )
    AS "Osm"(
            voie_libelle_osm character varying(100),
            highway text,
            oneway text,
            lanes text,
            maxspeed text,
            maxheight text,
            tunnel text,
            junction text,
            bicycle text,
            cycleway text,
            "cycleway:left" text,
            "oneway:bicycle" text,
            "access" text,
            foot text,
            horse text,
            service text,
            source text,
            "ref:FR:FANTOIR" text,
            id bigint,
            "version" integer,
            user_id integer,
            tstamp timestamp without time zone,
            changeset_id bigint,
            tags hstore,
            nodes bigint[],
            bbox geometry,
            linestring geometry
    );
