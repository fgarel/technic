-- Recuperation des noms des voies dans la base voieadresse
-- execution dans la base osm

-- attention, ajout de l'extension dblink

drop table if exists "ListeVoie_From_VoieAdresse";
create table "ListeVoie_From_VoieAdresse" as

SELECT *
FROM dblink(
   'dbname=voieadresse port=5432
   host=dsibdd09 user=sig password=Mie3Bhoutan',

   '-- selection des voies de la base interne
    select distinct voie_libelle,
      voie_code_fantoir,
      voie_classe,
      wkb_geometry
    from voirie_filaire_voie
    order by voie_libelle;
    '
    )
    AS voirie_filiare(
      voie_libelle varchar(100),
      voie_code_fantoir varchar(5),
      voie_classe smallint,
      wkb_geometry geometry
      );
