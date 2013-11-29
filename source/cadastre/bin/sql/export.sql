-- export des points vers un fichier csv
-- copy point
--  to '/home/garel/geodata/vecteur/test/point3.csv'
--  delimiters ','
--  CSV;

-- export d'une vue vers un fichier csv
COPY (SELECT * FROM vue_001)
  TO 'vue_001.csv'
  DELIMITER ';'
  CSV;


--  TO '/home/fred/geodata/autres/cadastre/Extraction2010Cda2/data1/foot/vue_001.csv'
--  TO '../data1/foot/vue_001.csv'
