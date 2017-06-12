-- Initialisation des tables

-- Une table de SymboleTest


SET search_path = stockage, public;


-- --------------------------------------- --
-- Mise à jour des données dans les tables --
-- --------------------------------------- --

-- Table SymboleCreationNoeud
update "SymboleCreationNoeud" set geometry = ST_GeomFromEWKT('SRID=3946;POINT(' || "X" || ' ' || "Y" || ')');

-- Table SymboleCreationArc
update "SymboleCreationArc" set geometry = ST_GeomFromEWKT("st_asewkt");

-- Table SymboleCreationFace
update "SymboleCreationFace" set geometry = ST_GeomFromEWKT("st_asewkt");

-- Table SymboleCreationTexte
update "SymboleCreationTexte" set geometry = ST_GeomFromEWKT("st_asewkt");

-- Table SymboleTest
update "SymboleTest" set geometry = ST_GeomFromEWKT('SRID=3946;POINT(' || "X" || ' ' || "Y" || ')');
