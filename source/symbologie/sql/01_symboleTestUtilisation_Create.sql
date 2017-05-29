-- Initialisation des tables

-- Une table de SymboleTest


SET search_path = stockage, public;


-- ------------------- --
-- Creation des tables --
-- ------------------- --


DROP table if exists "SymboleTest" cascade;
CREATE table "SymboleTest"
(
  "CodeSymbole" text,
  "EchelleRepresentation" text,
  "Rotation" numeric,
  "Echelle_X" numeric,
  "Echelle_Y" numeric,
  "X" numeric,
  "Y" numeric
)
with (oids=True);



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
  "Y_fin" numeric
)
with (oids=True);


DROP table if exists "SymboleCreationFace" cascade;
CREATE table "SymboleCreationFace"
(
  "id" numeric,
  "CodeRepresentation" text,
  "CouleurRepresentation" text,
  "DimensionEchelleRepresentation" text,
  "CouleurRepresentation2" text
)
with (oids=True);


DROP table if exists "SymboleCreationTexte" cascade;
CREATE table "SymboleCreationTexte"
(
  "id" numeric,
  "CodeRepresentation" text,
  "CouleurRepresentation" text,
  "DimensionEchelleRepresentation" text,
  "PoliceRepresentation" text,
  "Valeur" text
)
with (oids=True);
