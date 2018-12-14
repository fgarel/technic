
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
