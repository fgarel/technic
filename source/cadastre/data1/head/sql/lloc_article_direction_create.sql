-- Suppression de la table lloc_article_direction
DROP TABLE IF EXISTS lloc_article_direction;
-- Creation de la table lloc_article_direction
CREATE TABLE lloc_article_direction (
"ccode" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"parmdat" CHARACTER VARYING(2) NOT NULL,
"jdatparm" CHARACTER VARYING(8) NOT NULL,
"filler01" CHARACTER VARYING(2) NOT NULL,
"datean" CHARACTER VARYING(4) NOT NULL);
-- Ajout des commentaires pour la table lloc_article_direction
COMMENT ON COLUMN lloc_article_direction."ccode" IS 'code département';
COMMENT ON COLUMN lloc_article_direction."ccodir" IS 'code direction';
COMMENT ON COLUMN lloc_article_direction."parmdat" IS 'date de référence du Fichier';
COMMENT ON COLUMN lloc_article_direction."jdatparm" IS 'date de création du fichier';
COMMENT ON COLUMN lloc_article_direction."filler01" IS '';
COMMENT ON COLUMN lloc_article_direction."datean" IS 'annee extraction';
