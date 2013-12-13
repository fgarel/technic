-- Suppression de la table fanr_article_commune
DROP TABLE IF EXISTS fanr_article_commune;
-- Creation de la table fanr_article_commune
CREATE TABLE fanr_article_commune (
"ccode" CHARACTER VARYING(3) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"filler01" CHARACTER VARYING(4) NOT NULL,
"cleriv" CHARACTER VARYING(1) NOT NULL,
"libdir" CHARACTER VARYING(30) NOT NULL,
"filler02" CHARACTER VARYING(1) NOT NULL,
"typcom" CHARACTER VARYING(1) NOT NULL,
"crur" CHARACTER VARYING(6) NOT NULL,
"cpop" CHARACTER VARYING(1) NOT NULL,
"filler03" CHARACTER VARYING(2) NOT NULL,
"popul" CHARACTER VARYING(7) NOT NULL,
"code1" CHARACTER VARYING(14) NOT NULL,
"filler04" CHARACTER VARYING(1) NOT NULL,
"code2" CHARACTER VARYING(14) NOT NULL);
-- Ajout des commentaires pour la table fanr_article_commune
COMMENT ON COLUMN fanr_article_commune."ccode" IS 'code département';
COMMENT ON COLUMN fanr_article_commune."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN fanr_article_commune."filler01" IS '';
COMMENT ON COLUMN fanr_article_commune."cleriv" IS 'Clé Rivoli';
COMMENT ON COLUMN fanr_article_commune."libdir" IS 'libelle de la commune';
COMMENT ON COLUMN fanr_article_commune."filler02" IS '';
COMMENT ON COLUMN fanr_article_commune."typcom" IS 'type de la commune';
COMMENT ON COLUMN fanr_article_commune."crur" IS 'caractère RUR';
COMMENT ON COLUMN fanr_article_commune."cpop" IS 'caractère de population';
COMMENT ON COLUMN fanr_article_commune."filler03" IS '';
COMMENT ON COLUMN fanr_article_commune."popul" IS 'population';
COMMENT ON COLUMN fanr_article_commune."code1" IS 'caractère et date d`annulation ?';
COMMENT ON COLUMN fanr_article_commune."filler04" IS '';
COMMENT ON COLUMN fanr_article_commune."code2" IS 'date de création ?';
