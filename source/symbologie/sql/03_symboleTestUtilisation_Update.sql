-- Initialisation des tables

-- Une table de SymboleTest


SET search_path = stockage, public;


-- --------------------------------------- --
-- Mise à jour des données dans les tables --
-- --------------------------------------- --

-- Table SymboleCreationNoeud

select Addgeometrycolumn('SymboleCreationNoeud', 'geometry', 3946, 'GEOMETRY', 2);

update "SymboleCreationNoeud" set geometry = ST_GeomFromEWKT('SRID=3946;POINT(' || "X" || ' ' || "Y" || ')');

-- Table SymboleTest

select Addgeometrycolumn('SymboleTest', 'geometry', 3946, 'GEOMETRY', 2);

update "SymboleTest" set geometry = ST_GeomFromEWKT('SRID=3946;POINT(' || "X" || ' ' || "Y" || ')');

--select * from "SymboleTest";
