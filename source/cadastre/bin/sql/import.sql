-- import des points à partir d'un fichier csv
--copy point
--  from '/home/garel/geodata/vecteur/test/point2.csv'
--  delimiters ','
--  CSV;


-- import des proprietaires à partir d'un fichier csv
--#psql -d cadastre -U contrib -h dsiappli14 -c "copy prop_article_courant from stdin delimiter ';';" < prop_article_courant.txt
COPY prop_article_courant
  FROM '/home/fred/geodata/autres/cadastre/Extraction2010Cda2/data1/foot/prop_article_courant.txt'
  DELIMITER ';'
  CSV;
  --FROM '../data1/foot/prop_article_courant.txt'


--#psql -d cadastre -U contrib -h dsiappli14 -c "copy prop_article_courant from stdin delimiter ';';" < prop_article_courant.txt
