-- Initialisation des tables

-- Une table de SymboleTest


SET search_path = stockage, public;


-- ------------------- --
-- Creation des tables --
-- ------------------- --

-- Table SymboleCreationNoeud

DROP table if exists "SymboleCreationNoeud" cascade;
CREATE table "SymboleCreationNoeud"
(
  "id" numeric,
  "CodeRepresentation" text,
  "CouleurRepresentation" text,
  "DimensionEchelleRepresentation" text,
  "Rotation" numeric,
  "X" numeric,
  "Y" numeric
)
with (oids=True);

select Addgeometrycolumn('SymboleCreationNoeud', 'geometry', 3946, 'POINT', 2);


-- Table SymboleCreationArc

DROP table if exists "SymboleCreationArc" cascade;
CREATE table "SymboleCreationArc"
(
  "id" numeric,
  "CodeRepresentation" text,
  "CouleurRepresentation" text,
  "DimensionEchelleRepresentation" text,
  "X_ini" numeric,
  "Y_ini" numeric,
  "X_fin" numeric,
  "Y_fin" numeric,
  "st_asewkt" text
)
with (oids=True);

select Addgeometrycolumn('SymboleCreationArc', 'geometry', 3946, 'LINESTRING', 2);


-- Table SymboleCreationFace

DROP table if exists "SymboleCreationFace" cascade;
CREATE table "SymboleCreationFace"
(
  "id" numeric,
  "CodeRepresentation" text,
  "CouleurRepresentation" text,
  "DimensionEchelleRepresentation" text,
  "CouleurRepresentation2" text,
  "st_asewkt" text
)
with (oids=True);

select Addgeometrycolumn('SymboleCreationFace', 'geometry', 3946, 'POLYGON', 2);


-- Table SymboleCreationTexte

DROP table if exists "SymboleCreationTexte" cascade;
CREATE table "SymboleCreationTexte"
(
  "id" numeric,
  "CodeRepresentation" text,
  "CouleurRepresentation" text,
  "DimensionEchelleRepresentation" text,
  "PoliceRepresentation" text,
  "Valeur" text,
  "st_asewkt" text
)
with (oids=True);

select Addgeometrycolumn('SymboleCreationTexte', 'geometry', 3946, 'POINT', 2);


-- Table SymboleTest

DROP table if exists "SymboleTest" cascade;
CREATE table "SymboleTest"
(
  "CodeSymbole" text,
  "EchelleRepresentation" text,
  "Obs_Rotation" numeric,
  "Obs_LargeurX" numeric,
  "Obs_HauteurY" numeric,
  "X" numeric,
  "Y" numeric
)
with (oids=True);

select Addgeometrycolumn('SymboleTest', 'geometry', 3946, 'POINT', 2);


--select * from "SymboleTest";
