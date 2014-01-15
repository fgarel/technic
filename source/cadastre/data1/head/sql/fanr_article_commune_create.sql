-- Suppression de la table fanr_article_commune
DROP TABLE IF EXISTS fanr_article_commune;
-- Creation de la table fanr_article_commune
CREATE TABLE fanr_article_commune (
"ccode" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"filler01" CHARACTER VARYING(4) NOT NULL,
"cleriv" CHARACTER VARYING(1) NOT NULL,
"libdir" CHARACTER VARYING(30) NOT NULL,
"filler02" CHARACTER VARYING(1) NOT NULL,
"typcom" CHARACTER VARYING(1) NOT NULL,
"crur" CHARACTER VARYING(6) NOT NULL,
"cpop" CHARACTER VARYING(1) NOT NULL,
"filler03" CHARACTER VARYING(2) NOT NULL,
"popul1" CHARACTER VARYING(7) NOT NULL,
"popul2" CHARACTER VARYING(7) NOT NULL,
"popul3" CHARACTER VARYING(7) NOT NULL,
"cannul" CHARACTER VARYING(1) NOT NULL,
"datannul" CHARACTER VARYING(7) NOT NULL,
"datcreat" CHARACTER VARYING(7) NOT NULL,
"filler04" CHARACTER VARYING(42) NOT NULL);
-- Ajout des commentaires pour la table fanr_article_commune
COMMENT ON COLUMN fanr_article_commune."ccode" IS 'code département';
COMMENT ON COLUMN fanr_article_commune."ccodir" IS 'code direction';
COMMENT ON COLUMN fanr_article_commune."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN fanr_article_commune."filler01" IS '';
COMMENT ON COLUMN fanr_article_commune."cleriv" IS 'Clé Rivoli';
COMMENT ON COLUMN fanr_article_commune."libdir" IS 'libelle de la commune';
COMMENT ON COLUMN fanr_article_commune."filler02" IS '';
COMMENT ON COLUMN fanr_article_commune."typcom" IS 'type de la commune';
COMMENT ON COLUMN fanr_article_commune."crur" IS 'caractère RUR';
COMMENT ON COLUMN fanr_article_commune."cpop" IS 'caractère de population';
COMMENT ON COLUMN fanr_article_commune."filler03" IS '';
COMMENT ON COLUMN fanr_article_commune."popul1" IS 'population réelle';
COMMENT ON COLUMN fanr_article_commune."popul2" IS 'population à part';
COMMENT ON COLUMN fanr_article_commune."popul3" IS 'population fictive';
COMMENT ON COLUMN fanr_article_commune."cannul" IS 'caractère d annulation';
COMMENT ON COLUMN fanr_article_commune."datannul" IS 'date d annulation';
COMMENT ON COLUMN fanr_article_commune."datcreat" IS 'date de creation de l article';
COMMENT ON COLUMN fanr_article_commune."filler04" IS '';
