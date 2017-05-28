-- Initialisation des tables

-- Une table de SymboleTest


SET search_path = stockage, public;


-- ------------------------------ --
-- Creation des tables de stokage --
-- ------------------------------ --


select Addgeometrycolumn('SymboleTest', 'geometry', 3946, 'GEOMETRY', 2);

update "SymboleTest" set geometry = ST_GeomFromEWKT('SRID=3946;POINT(' || x || ' ' || y || ')');

--select * from "SymboleTest";
