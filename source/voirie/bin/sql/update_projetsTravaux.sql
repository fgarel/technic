
-- les tables in* sont des tables pour la numérisation des objets
-- ces tables in* sont définies dans le fichier "create" espu_voirieTravaux_projetphaseobjet_create.SQL
-- les tables out* sont des tables pour la visualisationdes données
-- les tables out* sont définies dans le fichier "update"


-- ------------------ --
-- outObjetSimplePoint --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetSimplePoint";
drop table if exists voirie_travaux."outObjetSimplePoint";
create table voirie_travaux."outObjetSimplePoint" as
 select
   voirie_travaux."inObjetSimplePoint".id,
   --voirie_travaux."inObjetSimplePoint"."CodeSimplePoint",
   voirie_travaux."inObjetSimplePoint"."CodeObjet",
   voirie_travaux."inObjetSimplePoint".shape,
   voirie_travaux."objetGeometrique"."CodePhase", -- Code
   voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
   voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
   voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
   voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
   voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
   voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
   voirie_travaux."objetGeometrique"."Picto", -- nom du picto
   voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
   voirie_travaux."objetGeometrique"."Taille", --taille du symbole
   voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
   voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
   voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
   voirie_travaux."objetGeometrique"."CouleurRemplissage",
   voirie_travaux."objetGeometrique"."CouleurTexte",
   voirie_travaux."phase"."CodeProjet", -- Code
   voirie_travaux."phase"."LibellePhase1", -- Libelle1
   voirie_travaux."phase"."LibellePhase2", -- Libelle2
   voirie_travaux."phase"."LibellePhase3", -- Libelle3
   voirie_travaux."phase"."TagPhase1", -- Etiquette1
   voirie_travaux."phase"."TagPhase2", -- Etiquette1
   voirie_travaux."phase"."TagPhase3", -- Etiquette1
   voirie_travaux."phase"."DateDebut", -- Date de début des travaux
   voirie_travaux."phase"."DateFin", -- Date de fin des travaux
   voirie_travaux."phase"."DateTsrange" tsrange, -- plage
   voirie_travaux."projet"."LibelleProjet1", -- Libelle1
   voirie_travaux."projet"."LibelleProjet2", -- Libelle2
   voirie_travaux."projet"."LibelleProjet3", -- Libelle3
   voirie_travaux."projet"."TagProjet1", -- Etiquette1
   voirie_travaux."projet"."TagProjet2", -- Etiquette1
   voirie_travaux."projet"."TagProjet3" -- Etiquette1
 from
   voirie_travaux."inObjetSimplePoint",
   voirie_travaux."objetGeometrique",
   voirie_travaux."phase",
   voirie_travaux."projet"
 where
   voirie_travaux."inObjetSimplePoint"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
   and
   voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
   and
   voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

 ALTER TABLE voirie_travaux."outObjetSimplePoint"
   ADD constraint "outObjetSimplePoint_id_pk" PRIMARY KEY (id);
 ALTER TABLE voirie_travaux."outObjetSimplePoint"
   ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL);
 ALTER TABLE voirie_travaux."outObjetSimplePoint"
   ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
 ALTER TABLE voirie_travaux."outObjetSimplePoint"
   OWNER TO fred;
 COMMENT ON TABLE voirie_travaux."outObjetSimplePoint"
   IS 'Objet Simple Point.';



-- ------------------ --
-- outObjetMultiPoint --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetMultiPoint";
drop table if exists voirie_travaux."outObjetMultiPoint";
create table voirie_travaux."outObjetMultiPoint" as
select
  voirie_travaux."inObjetMultiPoint".id,
  --voirie_travaux."inObjetMultiPoint"."CodeMultiPoint",
  voirie_travaux."inObjetMultiPoint"."CodeObjet",
  voirie_travaux."inObjetMultiPoint".shape,
  voirie_travaux."objetGeometrique"."CodePhase", -- Code
  voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
  voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
  voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
  voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
  voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
  voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
  voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
  voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
  voirie_travaux."objetGeometrique"."Picto", -- nom du picto
  voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
  voirie_travaux."objetGeometrique"."Taille", --taille du symbole
  voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
  voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
  voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
  voirie_travaux."objetGeometrique"."CouleurRemplissage",
  voirie_travaux."objetGeometrique"."CouleurTexte",
  voirie_travaux."phase"."CodeProjet", -- Code
  voirie_travaux."phase"."LibellePhase1", -- Libelle1
  voirie_travaux."phase"."LibellePhase2", -- Libelle2
  voirie_travaux."phase"."LibellePhase3", -- Libelle3
  voirie_travaux."phase"."TagPhase1", -- Etiquette1
  voirie_travaux."phase"."TagPhase2", -- Etiquette1
  voirie_travaux."phase"."TagPhase3", -- Etiquette1
  voirie_travaux."phase"."DateDebut", -- Date de début des travaux
  voirie_travaux."phase"."DateFin", -- Date de fin des travaux
  voirie_travaux."phase"."DateTsrange" tsrange, -- plage
  voirie_travaux."projet"."LibelleProjet1", -- Libelle1
  voirie_travaux."projet"."LibelleProjet2", -- Libelle2
  voirie_travaux."projet"."LibelleProjet3", -- Libelle3
  voirie_travaux."projet"."TagProjet1", -- Etiquette1
  voirie_travaux."projet"."TagProjet2", -- Etiquette1
  voirie_travaux."projet"."TagProjet3" -- Etiquette1
from
  voirie_travaux."inObjetMultiPoint",
  voirie_travaux."objetGeometrique",
  voirie_travaux."phase",
  voirie_travaux."projet"
where
  voirie_travaux."inObjetMultiPoint"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
  and
  voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
  and
  voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetMultiPoint"
  ADD constraint "outObjetMultiPoint_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiPoint"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiPoint"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiPoint"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiPoint"
  IS 'Objet Multi Point.';



 -- ------------------ --
 -- outObjetSimpleLinestring --
 -- ------------------ --

 --drop view if exists voirie_travaux."outObjetSimpleLinestring";
 drop table if exists voirie_travaux."outObjetSimpleLinestring";
 create table voirie_travaux."outObjetSimpleLinestring" as
  select
    voirie_travaux."inObjetSimpleLinestring".id,
    --voirie_travaux."inObjetSimpleLinestring"."CodeSimpleLinestring",
    voirie_travaux."inObjetSimpleLinestring"."CodeObjet",
    voirie_travaux."inObjetSimpleLinestring".shape,
    voirie_travaux."objetGeometrique"."CodePhase", -- Code
    voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
    voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
    voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
    voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
    voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
    voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
    voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
    voirie_travaux."objetGeometrique"."Picto", -- nom du picto
    voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
    voirie_travaux."objetGeometrique"."Taille", --taille du symbole
    voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
    voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
    voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
    voirie_travaux."objetGeometrique"."CouleurRemplissage",
    voirie_travaux."objetGeometrique"."CouleurTexte",
    voirie_travaux."phase"."CodeProjet", -- Code
    voirie_travaux."phase"."LibellePhase1", -- Libelle1
    voirie_travaux."phase"."LibellePhase2", -- Libelle2
    voirie_travaux."phase"."LibellePhase3", -- Libelle3
    voirie_travaux."phase"."TagPhase1", -- Etiquette1
    voirie_travaux."phase"."TagPhase2", -- Etiquette1
    voirie_travaux."phase"."TagPhase3", -- Etiquette1
    voirie_travaux."phase"."DateDebut", -- Date de début des travaux
    voirie_travaux."phase"."DateFin", -- Date de fin des travaux
    voirie_travaux."phase"."DateTsrange" tsrange, -- plage
    voirie_travaux."projet"."LibelleProjet1", -- Libelle1
    voirie_travaux."projet"."LibelleProjet2", -- Libelle2
    voirie_travaux."projet"."LibelleProjet3", -- Libelle3
    voirie_travaux."projet"."TagProjet1", -- Etiquette1
    voirie_travaux."projet"."TagProjet2", -- Etiquette1
    voirie_travaux."projet"."TagProjet3" -- Etiquette1
  from
    voirie_travaux."inObjetSimpleLinestring",
    voirie_travaux."objetGeometrique",
    voirie_travaux."phase",
    voirie_travaux."projet"
  where
    voirie_travaux."inObjetSimpleLinestring"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
    and
    voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
    and
    voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

 ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
   ADD constraint "outObjetSimpleLinestring_id_pk" PRIMARY KEY (id);
 ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
   ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL);
 ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
   ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
 ALTER TABLE voirie_travaux."outObjetSimpleLinestring"
   OWNER TO fred;
 COMMENT ON TABLE voirie_travaux."outObjetSimpleLinestring"
   IS 'Objet Simple Linestring.';



-- ------------------ --
-- outObjetMultiLinestring --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetMultiLinestring";
drop table if exists voirie_travaux."outObjetMultiLinestring";
create table voirie_travaux."outObjetMultiLinestring" as
 select
   voirie_travaux."inObjetMultiLinestring".id,
   --voirie_travaux."inObjetMultiLinestring"."CodeMultiLinestring",
   voirie_travaux."inObjetMultiLinestring"."CodeObjet",
   voirie_travaux."inObjetMultiLinestring".shape,
   voirie_travaux."objetGeometrique"."CodePhase", -- Code
   voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
   voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
   voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
   voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
   voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
   voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
   voirie_travaux."objetGeometrique"."Picto", -- nom du picto
   voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
   voirie_travaux."objetGeometrique"."Taille", --taille du symbole
   voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
   voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
   voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
   voirie_travaux."objetGeometrique"."CouleurRemplissage",
   voirie_travaux."objetGeometrique"."CouleurTexte",
   voirie_travaux."phase"."CodeProjet", -- Code
   voirie_travaux."phase"."LibellePhase1", -- Libelle1
   voirie_travaux."phase"."LibellePhase2", -- Libelle2
   voirie_travaux."phase"."LibellePhase3", -- Libelle3
   voirie_travaux."phase"."TagPhase1", -- Etiquette1
   voirie_travaux."phase"."TagPhase2", -- Etiquette1
   voirie_travaux."phase"."TagPhase3", -- Etiquette1
   voirie_travaux."phase"."DateDebut", -- Date de début des travaux
   voirie_travaux."phase"."DateFin", -- Date de fin des travaux
   voirie_travaux."phase"."DateTsrange" tsrange, -- plage
   voirie_travaux."projet"."LibelleProjet1", -- Libelle1
   voirie_travaux."projet"."LibelleProjet2", -- Libelle2
   voirie_travaux."projet"."LibelleProjet3", -- Libelle3
   voirie_travaux."projet"."TagProjet1", -- Etiquette1
   voirie_travaux."projet"."TagProjet2", -- Etiquette1
   voirie_travaux."projet"."TagProjet3" -- Etiquette1
 from
   voirie_travaux."inObjetMultiLinestring",
   voirie_travaux."objetGeometrique",
   voirie_travaux."phase",
   voirie_travaux."projet"
 where
   voirie_travaux."inObjetMultiLinestring"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
   and
   voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
   and
   voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  ADD constraint "outObjetMultiLinestring_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTILINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiLinestring"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiLinestring"
  IS 'Objet Multi Linestring.';



-- ------------------ --
-- outObjetSimplePolygon --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetSimplePolygon";
drop table if exists voirie_travaux."outObjetSimplePolygon";
create table voirie_travaux."outObjetSimplePolygon" as
 select
   voirie_travaux."inObjetSimplePolygon".id,
   --voirie_travaux."inObjetSimplePolygon"."CodeSimplePolygon",
   voirie_travaux."inObjetSimplePolygon"."CodeObjet",
   voirie_travaux."inObjetSimplePolygon".shape,
   voirie_travaux."objetGeometrique"."CodePhase", -- Code
   voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
   voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
   voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
   voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
   voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
   voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
   voirie_travaux."objetGeometrique"."Picto", -- nom du picto
   voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
   voirie_travaux."objetGeometrique"."Taille", --taille du symbole
   voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
   voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
   voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
   voirie_travaux."objetGeometrique"."CouleurRemplissage",
   voirie_travaux."objetGeometrique"."CouleurTexte",
   voirie_travaux."phase"."CodeProjet", -- Code
   voirie_travaux."phase"."LibellePhase1", -- Libelle1
   voirie_travaux."phase"."LibellePhase2", -- Libelle2
   voirie_travaux."phase"."LibellePhase3", -- Libelle3
   voirie_travaux."phase"."TagPhase1", -- Etiquette1
   voirie_travaux."phase"."TagPhase2", -- Etiquette1
   voirie_travaux."phase"."TagPhase3", -- Etiquette1
   voirie_travaux."phase"."DateDebut", -- Date de début des travaux
   voirie_travaux."phase"."DateFin", -- Date de fin des travaux
   voirie_travaux."phase"."DateTsrange" tsrange, -- plage
   voirie_travaux."projet"."LibelleProjet1", -- Libelle1
   voirie_travaux."projet"."LibelleProjet2", -- Libelle2
   voirie_travaux."projet"."LibelleProjet3", -- Libelle3
   voirie_travaux."projet"."TagProjet1", -- Etiquette1
   voirie_travaux."projet"."TagProjet2", -- Etiquette1
   voirie_travaux."projet"."TagProjet3" -- Etiquette1
 from
   voirie_travaux."inObjetSimplePolygon",
   voirie_travaux."objetGeometrique",
   voirie_travaux."phase",
   voirie_travaux."projet"
 where
   voirie_travaux."inObjetSimplePolygon"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
   and
   voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
   and
   voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  ADD constraint "outObjetSimplePolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetSimplePolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetSimplePolygon"
  IS 'Objet Simple Polygon.';



-- ------------------ --
-- outObjetMultiPolygon --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetMultiPolygon";
drop table if exists voirie_travaux."outObjetMultiPolygon";
create table voirie_travaux."outObjetMultiPolygon" as
 select
   voirie_travaux."inObjetMultiPolygon".id,
   --voirie_travaux."inObjetMultiPolygon"."CodeMultiPolygon",
   voirie_travaux."inObjetMultiPolygon"."CodeObjet",
   voirie_travaux."inObjetMultiPolygon".shape,
   voirie_travaux."objetGeometrique"."CodePhase", -- Code
   voirie_travaux."objetGeometrique"."LibelleObjet1", -- Libelle1
   voirie_travaux."objetGeometrique"."LibelleObjet2", -- Libelle2
   voirie_travaux."objetGeometrique"."LibelleObjet3", -- Libelle3
   voirie_travaux."objetGeometrique"."TagObjet1", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet2", -- Etiquette1
   voirie_travaux."objetGeometrique"."TagObjet3", -- Etiquette1
   voirie_travaux."objetGeometrique"."ClasseObjet", -- classe de l'objet
   voirie_travaux."objetGeometrique"."CouleurSymbole", -- code de la couleur
   voirie_travaux."objetGeometrique"."Picto", -- nom du picto
   voirie_travaux."objetGeometrique"."Orientation", -- orientation du symbole
   voirie_travaux."objetGeometrique"."Taille", --taille du symbole
   voirie_travaux."objetGeometrique"."CouleurLigne", -- code de la couleur
   voirie_travaux."objetGeometrique"."Epaisseur", -- epaisseur
   voirie_travaux."objetGeometrique"."TypeDeLigne", -- type de ligne
   voirie_travaux."objetGeometrique"."CouleurRemplissage",
   voirie_travaux."objetGeometrique"."CouleurTexte",
   voirie_travaux."phase"."CodeProjet", -- Code
   voirie_travaux."phase"."LibellePhase1", -- Libelle1
   voirie_travaux."phase"."LibellePhase2", -- Libelle2
   voirie_travaux."phase"."LibellePhase3", -- Libelle3
   voirie_travaux."phase"."TagPhase1", -- Etiquette1
   voirie_travaux."phase"."TagPhase2", -- Etiquette1
   voirie_travaux."phase"."TagPhase3", -- Etiquette1
   voirie_travaux."phase"."DateDebut", -- Date de début des travaux
   voirie_travaux."phase"."DateFin", -- Date de fin des travaux
   voirie_travaux."phase"."DateTsrange" tsrange, -- plage
   voirie_travaux."projet"."LibelleProjet1", -- Libelle1
   voirie_travaux."projet"."LibelleProjet2", -- Libelle2
   voirie_travaux."projet"."LibelleProjet3", -- Libelle3
   voirie_travaux."projet"."TagProjet1", -- Etiquette1
   voirie_travaux."projet"."TagProjet2", -- Etiquette1
   voirie_travaux."projet"."TagProjet3" -- Etiquette1
 from
   voirie_travaux."inObjetMultiPolygon",
   voirie_travaux."objetGeometrique",
   voirie_travaux."phase",
   voirie_travaux."projet"
 where
   voirie_travaux."inObjetMultiPolygon"."CodeObjet" = voirie_travaux."objetGeometrique"."CodeObjet"
   and
   voirie_travaux."objetGeometrique"."CodePhase" = voirie_travaux."phase"."CodePhase"
   and
   voirie_travaux."phase"."CodeProjet" = voirie_travaux."projet"."CodeProjet";

ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  ADD constraint "outObjetMultiPolygon_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiPolygon"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiPolygon"
  IS 'Objet Multi Polygon.';







-- ------------------ --
-- outObjetSimplePointPpi --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetSimplePointPpi";
drop table if exists voirie_travaux."outObjetSimplePointPpi";
create table voirie_travaux."outObjetSimplePointPpi" as
  select
    --voirie_travaux."inObjetSimplePoint".id,
    coalesce( voirie_travaux."ppi"."ordre", voirie_travaux."inObjetSimplePoint".id+1000) as id,
    --voirie_travaux."inObjetSimplePoint"."CodeSimplePoint",
    voirie_travaux."inObjetSimplePoint"."CodeObjet",
    voirie_travaux."inObjetSimplePoint".shape,
    voirie_travaux."ppi"."ordre", -- Ordre
    voirie_travaux."ppi"."Code1", -- Code 1
    voirie_travaux."ppi"."Libelle1", -- Libelle 1
    voirie_travaux."ppi"."Code2", -- Code 2
    voirie_travaux."ppi"."Libelle2", -- Libelle 2
    voirie_travaux."ppi"."Code3", -- Code 3
    voirie_travaux."ppi"."Libelle3", -- Libelle 3
    voirie_travaux."ppi"."Code4", -- Code 4
    voirie_travaux."ppi"."Libelle4", -- Libelle 4
    voirie_travaux."ppi"."2016D", -- Année, Dépense
    voirie_travaux."ppi"."2016R", -- Année, Recette
    voirie_travaux."ppi"."2017D", -- Année, Dépense
    voirie_travaux."ppi"."2017R", -- Année, Recette
    voirie_travaux."ppi"."2018D", -- Année, Dépense
    voirie_travaux."ppi"."2018R", -- Année, Recette
    voirie_travaux."ppi"."2019D", -- Année, Dépense
    voirie_travaux."ppi"."2019R", -- Année, Recette
    voirie_travaux."ppi"."2020D", -- Année, Dépense
    voirie_travaux."ppi"."2020R", -- Année, Recette
    voirie_travaux."ppi"."2021D", -- Année, Dépense
    voirie_travaux."ppi"."2021R", -- Année, Recette
    voirie_travaux."ppi"."2022D", -- Année, Dépense
    voirie_travaux."ppi"."2022R", -- Année, Recette
    voirie_travaux."ppi"."2023D", -- Année, Dépense
    voirie_travaux."ppi"."2023R", -- Année, Recette
    voirie_travaux."ppi"."TotalD", -- Total, Dépense
    voirie_travaux."ppi"."TotalR", -- Total, Recette
    voirie_travaux."ppi"."Old_NumeroPPI", -- Ancien identifiant PPI
    voirie_travaux."ppi"."StartTimeD", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeD", -- Année, Recette
    voirie_travaux."ppi"."StartTimeR", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeR", -- Année, Recette
    voirie_travaux."ppi"."TotalDA", -- Total, Dépense
    voirie_travaux."ppi"."TotalRA", -- Total, Recette
    voirie_travaux."ppi"."CouleurSymbole", -- code de la couleur
    voirie_travaux."ppi"."Picto", -- nom du picto
    voirie_travaux."ppi"."Orientation", -- orientation du symbole
    voirie_travaux."ppi"."Taille", --taille du symbole
    voirie_travaux."ppi"."CouleurLigne", -- code de la couleur
    voirie_travaux."ppi"."Epaisseur", -- epaisseur
    voirie_travaux."ppi"."TypeDeLigne", -- type de ligne
    voirie_travaux."ppi"."CouleurRemplissage",
    voirie_travaux."ppi"."CouleurTexte",
    voirie_travaux."ppi"."Avancement"--, -- Etat d'avancement du projet
  from
    voirie_travaux."inObjetSimplePoint" left join
    voirie_travaux."ppi" on
    voirie_travaux."inObjetSimplePoint"."CodeObjet"::numeric = voirie_travaux."ppi"."Code4";

ALTER TABLE voirie_travaux."outObjetSimplePointPpi"
  ADD constraint "outObjetSimplePointPpi_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetSimplePointPpi"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetSimplePointPpi"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetSimplePointPpi"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetSimplePointPpi"
  IS 'Objet Simple Point.';


-- ------------------ --
-- outObjetMultiPointPpi --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetMultiPointPpi";
drop table if exists voirie_travaux."outObjetMultiPointPpi";
create table voirie_travaux."outObjetMultiPointPpi" as
  select
    --voirie_travaux."inObjetMultiPoint".id,
    coalesce( voirie_travaux."ppi"."ordre", voirie_travaux."inObjetMultiPoint".id+1000) as id,
    --voirie_travaux."inObjetMultiPoint"."CodeMultiPoint",
    voirie_travaux."inObjetMultiPoint"."CodeObjet",
    voirie_travaux."inObjetMultiPoint".shape,
    voirie_travaux."ppi"."ordre", -- Ordre
    voirie_travaux."ppi"."Code1", -- Code 1
    voirie_travaux."ppi"."Libelle1", -- Libelle 1
    voirie_travaux."ppi"."Code2", -- Code 2
    voirie_travaux."ppi"."Libelle2", -- Libelle 2
    voirie_travaux."ppi"."Code3", -- Code 3
    voirie_travaux."ppi"."Libelle3", -- Libelle 3
    voirie_travaux."ppi"."Code4", -- Code 4
    voirie_travaux."ppi"."Libelle4", -- Libelle 4
    voirie_travaux."ppi"."2016D", -- Année, Dépense
    voirie_travaux."ppi"."2016R", -- Année, Recette
    voirie_travaux."ppi"."2017D", -- Année, Dépense
    voirie_travaux."ppi"."2017R", -- Année, Recette
    voirie_travaux."ppi"."2018D", -- Année, Dépense
    voirie_travaux."ppi"."2018R", -- Année, Recette
    voirie_travaux."ppi"."2019D", -- Année, Dépense
    voirie_travaux."ppi"."2019R", -- Année, Recette
    voirie_travaux."ppi"."2020D", -- Année, Dépense
    voirie_travaux."ppi"."2020R", -- Année, Recette
    voirie_travaux."ppi"."2021D", -- Année, Dépense
    voirie_travaux."ppi"."2021R", -- Année, Recette
    voirie_travaux."ppi"."2022D", -- Année, Dépense
    voirie_travaux."ppi"."2022R", -- Année, Recette
    voirie_travaux."ppi"."2023D", -- Année, Dépense
    voirie_travaux."ppi"."2023R", -- Année, Recette
    voirie_travaux."ppi"."TotalD", -- Total, Dépense
    voirie_travaux."ppi"."TotalR", -- Total, Recette
    voirie_travaux."ppi"."Old_NumeroPPI", -- Ancien identifiant PPI
    voirie_travaux."ppi"."StartTimeD", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeD", -- Année, Recette
    voirie_travaux."ppi"."StartTimeR", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeR", -- Année, Recette
    voirie_travaux."ppi"."TotalDA", -- Total, Dépense
    voirie_travaux."ppi"."TotalRA", -- Total, Recette
    voirie_travaux."ppi"."CouleurSymbole", -- code de la couleur
    voirie_travaux."ppi"."Picto", -- nom du picto
    voirie_travaux."ppi"."Orientation", -- orientation du symbole
    voirie_travaux."ppi"."Taille", --taille du symbole
    voirie_travaux."ppi"."CouleurLigne", -- code de la couleur
    voirie_travaux."ppi"."Epaisseur", -- epaisseur
    voirie_travaux."ppi"."TypeDeLigne", -- type de ligne
    voirie_travaux."ppi"."CouleurRemplissage",
    voirie_travaux."ppi"."CouleurTexte",
    voirie_travaux."ppi"."Avancement"--, -- Etat d'avancement du projet
  from
    voirie_travaux."inObjetMultiPoint" left join
    voirie_travaux."ppi" on
    voirie_travaux."inObjetMultiPoint"."CodeObjet"::numeric = voirie_travaux."ppi"."Code4";

ALTER TABLE voirie_travaux."outObjetMultiPointPpi"
  ADD constraint "outObjetMultiPointPpi_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiPointPpi"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOINT'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiPointPpi"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiPointPpi"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiPointPpi"
  IS 'Objet Multi Point.';


-- ------------------ --
-- outObjetSimpleLinestringPpi --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetSimpleLinestringPpi";
drop table if exists voirie_travaux."outObjetSimpleLinestringPpi";
create table voirie_travaux."outObjetSimpleLinestringPpi" as
  select
    --voirie_travaux."inObjetSimpleLinestring".id,
    coalesce( voirie_travaux."ppi"."ordre", voirie_travaux."inObjetSimpleLinestring".id+1000) as id,
    --voirie_travaux."inObjetSimpleLinestring"."CodeSimpleLinestring",
    voirie_travaux."inObjetSimpleLinestring"."CodeObjet",
    voirie_travaux."inObjetSimpleLinestring".shape,
    voirie_travaux."ppi"."ordre", -- Ordre
    voirie_travaux."ppi"."Code1", -- Code 1
    voirie_travaux."ppi"."Libelle1", -- Libelle 1
    voirie_travaux."ppi"."Code2", -- Code 2
    voirie_travaux."ppi"."Libelle2", -- Libelle 2
    voirie_travaux."ppi"."Code3", -- Code 3
    voirie_travaux."ppi"."Libelle3", -- Libelle 3
    voirie_travaux."ppi"."Code4", -- Code 4
    voirie_travaux."ppi"."Libelle4", -- Libelle 4
    voirie_travaux."ppi"."2016D", -- Année, Dépense
    voirie_travaux."ppi"."2016R", -- Année, Recette
    voirie_travaux."ppi"."2017D", -- Année, Dépense
    voirie_travaux."ppi"."2017R", -- Année, Recette
    voirie_travaux."ppi"."2018D", -- Année, Dépense
    voirie_travaux."ppi"."2018R", -- Année, Recette
    voirie_travaux."ppi"."2019D", -- Année, Dépense
    voirie_travaux."ppi"."2019R", -- Année, Recette
    voirie_travaux."ppi"."2020D", -- Année, Dépense
    voirie_travaux."ppi"."2020R", -- Année, Recette
    voirie_travaux."ppi"."2021D", -- Année, Dépense
    voirie_travaux."ppi"."2021R", -- Année, Recette
    voirie_travaux."ppi"."2022D", -- Année, Dépense
    voirie_travaux."ppi"."2022R", -- Année, Recette
    voirie_travaux."ppi"."2023D", -- Année, Dépense
    voirie_travaux."ppi"."2023R", -- Année, Recette
    voirie_travaux."ppi"."TotalD", -- Total, Dépense
    voirie_travaux."ppi"."TotalR", -- Total, Recette
    voirie_travaux."ppi"."Old_NumeroPPI", -- Ancien identifiant PPI
    voirie_travaux."ppi"."StartTimeD", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeD", -- Année, Recette
    voirie_travaux."ppi"."StartTimeR", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeR", -- Année, Recette
    voirie_travaux."ppi"."TotalDA", -- Total, Dépense
    voirie_travaux."ppi"."TotalRA", -- Total, Recette
    voirie_travaux."ppi"."CouleurSymbole", -- code de la couleur
    voirie_travaux."ppi"."Picto", -- nom du picto
    voirie_travaux."ppi"."Orientation", -- orientation du symbole
    voirie_travaux."ppi"."Taille", --taille du symbole
    voirie_travaux."ppi"."CouleurLigne", -- code de la couleur
    voirie_travaux."ppi"."Epaisseur", -- epaisseur
    voirie_travaux."ppi"."TypeDeLigne", -- type de ligne
    voirie_travaux."ppi"."CouleurRemplissage",
    voirie_travaux."ppi"."CouleurTexte",
    voirie_travaux."ppi"."Avancement"--, -- Etat d'avancement du projet
  from
    voirie_travaux."inObjetSimpleLinestring" left join
    voirie_travaux."ppi" on
    voirie_travaux."inObjetSimpleLinestring"."CodeObjet"::numeric = voirie_travaux."ppi"."Code4";

ALTER TABLE voirie_travaux."outObjetSimpleLinestringPpi"
  ADD constraint "outObjetSimpleLinestringPpi_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetSimpleLinestringPpi"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetSimpleLinestringPpi"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetSimpleLinestringPpi"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetSimpleLinestringPpi"
  IS 'Objet Simple Linestring.';



-- ------------------ --
-- outObjetMultiLinestringPpi --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetMultiLinestringPpi";
drop table if exists voirie_travaux."outObjetMultiLinestringPpi";
create table voirie_travaux."outObjetMultiLinestringPpi" as
  select
    --voirie_travaux."inObjetMultiLinestring".id,
    coalesce( voirie_travaux."ppi"."ordre", voirie_travaux."inObjetMultiLinestring".id+1000) as id,
    --voirie_travaux."inObjetMultiLinestring"."CodeMultiLinestring",
    voirie_travaux."inObjetMultiLinestring"."CodeObjet",
    voirie_travaux."inObjetMultiLinestring".shape,
    voirie_travaux."ppi"."ordre", -- Ordre
    voirie_travaux."ppi"."Code1", -- Code 1
    voirie_travaux."ppi"."Libelle1", -- Libelle 1
    voirie_travaux."ppi"."Code2", -- Code 2
    voirie_travaux."ppi"."Libelle2", -- Libelle 2
    voirie_travaux."ppi"."Code3", -- Code 3
    voirie_travaux."ppi"."Libelle3", -- Libelle 3
    voirie_travaux."ppi"."Code4", -- Code 4
    voirie_travaux."ppi"."Libelle4", -- Libelle 4
    voirie_travaux."ppi"."2016D", -- Année, Dépense
    voirie_travaux."ppi"."2016R", -- Année, Recette
    voirie_travaux."ppi"."2017D", -- Année, Dépense
    voirie_travaux."ppi"."2017R", -- Année, Recette
    voirie_travaux."ppi"."2018D", -- Année, Dépense
    voirie_travaux."ppi"."2018R", -- Année, Recette
    voirie_travaux."ppi"."2019D", -- Année, Dépense
    voirie_travaux."ppi"."2019R", -- Année, Recette
    voirie_travaux."ppi"."2020D", -- Année, Dépense
    voirie_travaux."ppi"."2020R", -- Année, Recette
    voirie_travaux."ppi"."2021D", -- Année, Dépense
    voirie_travaux."ppi"."2021R", -- Année, Recette
    voirie_travaux."ppi"."2022D", -- Année, Dépense
    voirie_travaux."ppi"."2022R", -- Année, Recette
    voirie_travaux."ppi"."2023D", -- Année, Dépense
    voirie_travaux."ppi"."2023R", -- Année, Recette
    voirie_travaux."ppi"."TotalD", -- Total, Dépense
    voirie_travaux."ppi"."TotalR", -- Total, Recette
    voirie_travaux."ppi"."Old_NumeroPPI", -- Ancien identifiant PPI
    voirie_travaux."ppi"."StartTimeD", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeD", -- Année, Recette
    voirie_travaux."ppi"."StartTimeR", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeR", -- Année, Recette
    voirie_travaux."ppi"."TotalDA", -- Total, Dépense
    voirie_travaux."ppi"."TotalRA", -- Total, Recette
    voirie_travaux."ppi"."CouleurSymbole", -- code de la couleur
    voirie_travaux."ppi"."Picto", -- nom du picto
    voirie_travaux."ppi"."Orientation", -- orientation du symbole
    voirie_travaux."ppi"."Taille", --taille du symbole
    voirie_travaux."ppi"."CouleurLigne", -- code de la couleur
    voirie_travaux."ppi"."Epaisseur", -- epaisseur
    voirie_travaux."ppi"."TypeDeLigne", -- type de ligne
    voirie_travaux."ppi"."CouleurRemplissage",
    voirie_travaux."ppi"."CouleurTexte",
    voirie_travaux."ppi"."Avancement"--, -- Etat d'avancement du projet
  from
    voirie_travaux."inObjetMultiLinestring" left join
    voirie_travaux."ppi" on
    voirie_travaux."inObjetMultiLinestring"."CodeObjet" = voirie_travaux."ppi"."Code4"::varchar;

ALTER TABLE voirie_travaux."outObjetMultiLinestringPpi"
  ADD constraint "outObjetMultiLinestringPpi_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiLinestringPpi"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTILINESTRING'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiLinestringPpi"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiLinestringPpi"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiLinestringPpi"
  IS 'Objet Multi Linestring.';



-- ------------------ --
-- outObjetSimplePolygonPpi --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetSimplePolygonPpi";
drop table if exists voirie_travaux."outObjetSimplePolygonPpi";
create table voirie_travaux."outObjetSimplePolygonPpi" as
  select
    --voirie_travaux."inObjetSimplePolygon".id,
    coalesce( voirie_travaux."ppi"."ordre", voirie_travaux."inObjetSimplePolygon".id+1000) as id,
    --voirie_travaux."inObjetSimplePolygon"."CodeSimplePolygon",
    voirie_travaux."inObjetSimplePolygon"."CodeObjet",
    voirie_travaux."inObjetSimplePolygon".shape,
    voirie_travaux."ppi"."ordre", -- Ordre
    voirie_travaux."ppi"."Code1", -- Code 1
    voirie_travaux."ppi"."Libelle1", -- Libelle 1
    voirie_travaux."ppi"."Code2", -- Code 2
    voirie_travaux."ppi"."Libelle2", -- Libelle 2
    voirie_travaux."ppi"."Code3", -- Code 3
    voirie_travaux."ppi"."Libelle3", -- Libelle 3
    voirie_travaux."ppi"."Code4", -- Code 4
    voirie_travaux."ppi"."Libelle4", -- Libelle 4
    voirie_travaux."ppi"."2016D", -- Année, Dépense
    voirie_travaux."ppi"."2016R", -- Année, Recette
    voirie_travaux."ppi"."2017D", -- Année, Dépense
    voirie_travaux."ppi"."2017R", -- Année, Recette
    voirie_travaux."ppi"."2018D", -- Année, Dépense
    voirie_travaux."ppi"."2018R", -- Année, Recette
    voirie_travaux."ppi"."2019D", -- Année, Dépense
    voirie_travaux."ppi"."2019R", -- Année, Recette
    voirie_travaux."ppi"."2020D", -- Année, Dépense
    voirie_travaux."ppi"."2020R", -- Année, Recette
    voirie_travaux."ppi"."2021D", -- Année, Dépense
    voirie_travaux."ppi"."2021R", -- Année, Recette
    voirie_travaux."ppi"."2022D", -- Année, Dépense
    voirie_travaux."ppi"."2022R", -- Année, Recette
    voirie_travaux."ppi"."2023D", -- Année, Dépense
    voirie_travaux."ppi"."2023R", -- Année, Recette
    voirie_travaux."ppi"."TotalD", -- Total, Dépense
    voirie_travaux."ppi"."TotalR", -- Total, Recette
    voirie_travaux."ppi"."Old_NumeroPPI", -- Ancien identifiant PPI
    voirie_travaux."ppi"."StartTimeD", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeD", -- Année, Recette
    voirie_travaux."ppi"."StartTimeR", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeR", -- Année, Recette
    voirie_travaux."ppi"."TotalDA", -- Total, Dépense
    voirie_travaux."ppi"."TotalRA", -- Total, Recette
    voirie_travaux."ppi"."CouleurSymbole", -- code de la couleur
    voirie_travaux."ppi"."Picto", -- nom du picto
    voirie_travaux."ppi"."Orientation", -- orientation du symbole
    voirie_travaux."ppi"."Taille", --taille du symbole
    voirie_travaux."ppi"."CouleurLigne", -- code de la couleur
    voirie_travaux."ppi"."Epaisseur", -- epaisseur
    voirie_travaux."ppi"."TypeDeLigne", -- type de ligne
    voirie_travaux."ppi"."CouleurRemplissage",
    voirie_travaux."ppi"."CouleurTexte",
    voirie_travaux."ppi"."Avancement"--, -- Etat d'avancement du projet
  from
    voirie_travaux."inObjetSimplePolygon" left join
    voirie_travaux."ppi" on
    voirie_travaux."inObjetSimplePolygon"."CodeObjet"::numeric = voirie_travaux."ppi"."Code4";

ALTER TABLE voirie_travaux."outObjetSimplePolygonPpi"
  ADD constraint "outObjetSimplePolygonPpi_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetSimplePolygonPpi"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetSimplePolygonPpi"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetSimplePolygonPpi"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetSimplePolygonPpi"
  IS 'Objet Simple Polygon.';



-- ------------------ --
-- outObjetMultiPolygonPpi --
-- ------------------ --

--drop view if exists voirie_travaux."outObjetMultiPolygonPpi";
drop table if exists voirie_travaux."outObjetMultiPolygonPpi";
create table voirie_travaux."outObjetMultiPolygonPpi" as
  select
    --voirie_travaux."inObjetMultiPolygon".id,
    coalesce( voirie_travaux."ppi"."ordre", voirie_travaux."inObjetMultiPolygon".id+1000) as id,
    --voirie_travaux."inObjetMultiPolygon"."CodeMultiPolygon",
    voirie_travaux."inObjetMultiPolygon"."CodeObjet",
    voirie_travaux."inObjetMultiPolygon".shape,
    voirie_travaux."ppi"."ordre", -- Ordre
    voirie_travaux."ppi"."Code1", -- Code 1
    voirie_travaux."ppi"."Libelle1", -- Libelle 1
    voirie_travaux."ppi"."Code2", -- Code 2
    voirie_travaux."ppi"."Libelle2", -- Libelle 2
    voirie_travaux."ppi"."Code3", -- Code 3
    voirie_travaux."ppi"."Libelle3", -- Libelle 3
    voirie_travaux."ppi"."Code4", -- Code 4
    voirie_travaux."ppi"."Libelle4", -- Libelle 4
    voirie_travaux."ppi"."2016D", -- Année, Dépense
    voirie_travaux."ppi"."2016R", -- Année, Recette
    voirie_travaux."ppi"."2017D", -- Année, Dépense
    voirie_travaux."ppi"."2017R", -- Année, Recette
    voirie_travaux."ppi"."2018D", -- Année, Dépense
    voirie_travaux."ppi"."2018R", -- Année, Recette
    voirie_travaux."ppi"."2019D", -- Année, Dépense
    voirie_travaux."ppi"."2019R", -- Année, Recette
    voirie_travaux."ppi"."2020D", -- Année, Dépense
    voirie_travaux."ppi"."2020R", -- Année, Recette
    voirie_travaux."ppi"."2021D", -- Année, Dépense
    voirie_travaux."ppi"."2021R", -- Année, Recette
    voirie_travaux."ppi"."2022D", -- Année, Dépense
    voirie_travaux."ppi"."2022R", -- Année, Recette
    voirie_travaux."ppi"."2023D", -- Année, Dépense
    voirie_travaux."ppi"."2023R", -- Année, Recette
    voirie_travaux."ppi"."TotalD", -- Total, Dépense
    voirie_travaux."ppi"."TotalR", -- Total, Recette
    voirie_travaux."ppi"."Old_NumeroPPI", -- Ancien identifiant PPI
    voirie_travaux."ppi"."StartTimeD", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeD", -- Année, Recette
    voirie_travaux."ppi"."StartTimeR", -- Année, Dépense
    voirie_travaux."ppi"."EndTimeR", -- Année, Recette
    voirie_travaux."ppi"."TotalDA", -- Total, Dépense
    voirie_travaux."ppi"."TotalRA", -- Total, Recette
    voirie_travaux."ppi"."CouleurSymbole", -- code de la couleur
    voirie_travaux."ppi"."Picto", -- nom du picto
    voirie_travaux."ppi"."Orientation", -- orientation du symbole
    voirie_travaux."ppi"."Taille", --taille du symbole
    voirie_travaux."ppi"."CouleurLigne", -- code de la couleur
    voirie_travaux."ppi"."Epaisseur", -- epaisseur
    voirie_travaux."ppi"."TypeDeLigne", -- type de ligne
    voirie_travaux."ppi"."CouleurRemplissage",
    voirie_travaux."ppi"."CouleurTexte",
    voirie_travaux."ppi"."Avancement"--, -- Etat d'avancement du projet
  from
    voirie_travaux."inObjetMultiPolygon" left join
    voirie_travaux."ppi" on
    voirie_travaux."inObjetMultiPolygon"."CodeObjet"::numeric = voirie_travaux."ppi"."Code4";

ALTER TABLE voirie_travaux."outObjetMultiPolygonPpi"
  ADD constraint "outObjetMultiPolygonPpi_id_pk" PRIMARY KEY (id);
ALTER TABLE voirie_travaux."outObjetMultiPolygonPpi"
  ADD CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'MULTIPOLYGON'::text OR shape IS NULL);
ALTER TABLE voirie_travaux."outObjetMultiPolygonPpi"
  ADD CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946);
ALTER TABLE voirie_travaux."outObjetMultiPolygonPpi"
  OWNER TO fred;
COMMENT ON TABLE voirie_travaux."outObjetMultiPolygonPpi"
  IS 'Objet Multi Polygon.';
