-- Initialisation des tables

-- Une table de SymboleTest


SET search_path = stockage, public;


-- ------------------------------ --
-- Creation des tables de stokage --
-- ------------------------------ --


DROP table if exists "SymboleTest" cascade;
CREATE table "SymboleTest"
(
  "CodeSymbole" text,
  "EchelleRepresentation" text,
  "Rotation" numeric,
  "Echelle_X" numeric,
  "Echelle_Y" numeric,
  X numeric,
  Y numeric
)
with (oids=True);
