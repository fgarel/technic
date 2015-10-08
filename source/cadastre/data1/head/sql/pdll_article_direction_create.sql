-- Suppression de la table pdll_article_direction
DROP TABLE IF EXISTS pdll_article_direction;
-- Creation de la table pdll_article_direction
CREATE TABLE pdll_article_direction (
"ccode" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"dep" CHARACTER VARYING(30) NOT NULL,
"parmdat" CHARACTER VARYING(2) NOT NULL,
"jdatparm" CHARACTER VARYING(8) NOT NULL);
-- Ajout des commentaires pour la table pdll_article_direction
COMMENT ON COLUMN pdll_article_direction."ccode" IS 'code département';
COMMENT ON COLUMN pdll_article_direction."ccodir" IS 'code direction';
COMMENT ON COLUMN pdll_article_direction."dep" IS 'département';
COMMENT ON COLUMN pdll_article_direction."parmdat" IS 'date de référence du Fichier';
COMMENT ON COLUMN pdll_article_direction."jdatparm" IS 'date de création du fichier';
