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


-- export d'une vue vers un fichier csv
COPY (SELECT * FROM vue_002)
  TO 'vue_002.csv'
  DELIMITER ';'
  CSV;

--  TO '/home/fred/geodata/autres/cadastre/Extraction2010Cda2/data1/foot/vue_001.csv'
--  TO '../data1/foot/vue_001.csv'
COPY (SELECT * FROM ex_bati_article_00)
  TO 'ex_bati_article_00.csv'
  DELIMITER ';'
  CSV;

COPY (SELECT * FROM ex_bati_article_10)
  TO 'ex_bati_article_10.csv'
  DELIMITER ';'
  CSV;

COPY (SELECT * FROM ex_bati_article_21)
  TO 'ex_bati_article_21.csv'
  DELIMITER ';'
  CSV;

COPY (SELECT * FROM ex_bati_article_30)
  TO 'ex_bati_article_30.csv'
  DELIMITER ';'
  CSV;

COPY (SELECT * FROM ex_bati_article_36)
  TO 'ex_bati_article_36.csv'
  DELIMITER ';'
  CSV;

COPY (SELECT * FROM ex_bati_article_40)
  TO 'ex_bati_article_40.csv'
  DELIMITER ';'
  CSV;

COPY (SELECT * FROM ex_bati_article_50)
  TO 'ex_bati_article_50.csv'
  DELIMITER ';'
  CSV;

COPY (SELECT * FROM ex_bati_article_60)
  TO 'ex_bati_article_60.csv'
  DELIMITER ';'
  CSV;

