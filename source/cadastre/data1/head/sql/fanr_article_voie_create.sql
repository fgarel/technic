-- Suppression de la table fanr_article_voie
DROP TABLE IF EXISTS fanr_article_voie;
-- Creation de la table fanr_article_voie
CREATE TABLE fanr_article_voie (
"ccode" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccoriv" CHARACTER VARYING(4) NOT NULL,
"cleriv" CHARACTER VARYING(1) NOT NULL,
"natvoi" CHARACTER VARYING(4) NOT NULL,
"libvoi" CHARACTER VARYING(26) NOT NULL,
"filler02" CHARACTER VARYING(1) NOT NULL,
"typcom" CHARACTER VARYING(1) NOT NULL,
"filler03" CHARACTER VARYING(2) NOT NULL,
"crur" CHARACTER VARYING(1) NOT NULL,
"filler04" CHARACTER VARYING(2) NOT NULL,
"carvoi" CHARACTER VARYING(1) NOT NULL,
"carpop" CHARACTER VARYING(1) NOT NULL,
"filler05" CHARACTER VARYING(9) NOT NULL,
"popul2" CHARACTER VARYING(7) NOT NULL,
"popul3" CHARACTER VARYING(7) NOT NULL,
"cannul" CHARACTER VARYING(1) NOT NULL,
"datannul" CHARACTER VARYING(7) NOT NULL,
"datcreat" CHARACTER VARYING(7) NOT NULL,
"filler06" CHARACTER VARYING(15) NOT NULL,
"ccomaj" CHARACTER VARYING(5) NOT NULL,
"typvoie" CHARACTER VARYING(1) NOT NULL,
"clieudit" CHARACTER VARYING(1) NOT NULL,
"filler07" CHARACTER VARYING(2) NOT NULL,
"motdir" CHARACTER VARYING(8) NOT NULL);
-- Ajout des commentaires pour la table fanr_article_voie
COMMENT ON COLUMN fanr_article_voie."ccode" IS 'code département';
COMMENT ON COLUMN fanr_article_voie."ccodir" IS 'code direction';
COMMENT ON COLUMN fanr_article_voie."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN fanr_article_voie."ccoriv" IS 'Code Rivoli de la voie = id de la voie dans la commune';
COMMENT ON COLUMN fanr_article_voie."cleriv" IS 'Clé Rivoli';
COMMENT ON COLUMN fanr_article_voie."natvoi" IS 'nature de la voie';
COMMENT ON COLUMN fanr_article_voie."libvoi" IS 'libelle de la voie';
COMMENT ON COLUMN fanr_article_voie."filler02" IS '';
COMMENT ON COLUMN fanr_article_voie."typcom" IS 'type de la commune';
COMMENT ON COLUMN fanr_article_voie."filler03" IS '';
COMMENT ON COLUMN fanr_article_voie."crur" IS 'caractère RUR';
COMMENT ON COLUMN fanr_article_voie."filler04" IS '';
COMMENT ON COLUMN fanr_article_voie."carvoi" IS 'caractère de voie';
COMMENT ON COLUMN fanr_article_voie."carpop" IS 'caractère de population, blanc si < 3000 hab, * sinon';
COMMENT ON COLUMN fanr_article_voie."filler05" IS '';
COMMENT ON COLUMN fanr_article_voie."popul2" IS '';
COMMENT ON COLUMN fanr_article_voie."popul3" IS '';
COMMENT ON COLUMN fanr_article_voie."cannul" IS 'caractère d annulation';
COMMENT ON COLUMN fanr_article_voie."datannul" IS 'date d annulation';
COMMENT ON COLUMN fanr_article_voie."datcreat" IS 'date de creation de l article';
COMMENT ON COLUMN fanr_article_voie."filler06" IS '';
COMMENT ON COLUMN fanr_article_voie."ccomaj" IS 'code identifiant majic de la voie';
COMMENT ON COLUMN fanr_article_voie."typvoie" IS 'Type de voie';
COMMENT ON COLUMN fanr_article_voie."clieudit" IS 'caractère du lieu-dit';
COMMENT ON COLUMN fanr_article_voie."filler07" IS '';
COMMENT ON COLUMN fanr_article_voie."motdir" IS 'dernier mot entierement alphabetique du libelle de la voie';
