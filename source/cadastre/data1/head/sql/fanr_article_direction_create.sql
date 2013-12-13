-- Suppression de la table fanr_article_direction
DROP TABLE IF EXISTS fanr_article_direction;
-- Creation de la table fanr_article_direction
CREATE TABLE fanr_article_direction (
"ccode" CHARACTER VARYING(3) NOT NULL,
"filler01" CHARACTER VARYING(7) NOT NULL,
"filler02" CHARACTER VARYING(1) NOT NULL,
"libdir" CHARACTER VARYING(30) NOT NULL,
"filler03" CHARACTER VARYING(18) NOT NULL,
"code1" CHARACTER VARYING(14) NOT NULL,
"filler04" CHARACTER VARYING(1) NOT NULL,
"code2" CHARACTER VARYING(14) NOT NULL);
-- Ajout des commentaires pour la table fanr_article_direction
COMMENT ON COLUMN fanr_article_direction."ccode" IS 'code département';
COMMENT ON COLUMN fanr_article_direction."filler01" IS '';
COMMENT ON COLUMN fanr_article_direction."filler02" IS '';
COMMENT ON COLUMN fanr_article_direction."libdir" IS 'libelle du département';
COMMENT ON COLUMN fanr_article_direction."filler03" IS '';
COMMENT ON COLUMN fanr_article_direction."code1" IS 'code ?';
COMMENT ON COLUMN fanr_article_direction."filler04" IS '';
COMMENT ON COLUMN fanr_article_direction."code2" IS 'code ?';
