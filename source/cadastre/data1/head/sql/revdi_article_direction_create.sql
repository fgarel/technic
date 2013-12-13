-- Suppression de la table revdi_article_direction
DROP TABLE IF EXISTS revdi_article_direction;
-- Creation de la table revdi_article_direction
CREATE TABLE revdi_article_direction (
"ccode" CHARACTER VARYING(2) NOT NULL,
"datejour" CHARACTER VARYING(8) NOT NULL,
"filler01" CHARACTER VARYING(2) NOT NULL,
"datean" CHARACTER VARYING(4) NOT NULL);
-- Ajout des commentaires pour la table revdi_article_direction
COMMENT ON COLUMN revdi_article_direction."ccode" IS 'code département';
COMMENT ON COLUMN revdi_article_direction."datejour" IS 'date extraction';
COMMENT ON COLUMN revdi_article_direction."filler01" IS '';
COMMENT ON COLUMN revdi_article_direction."datean" IS 'annee extraction';
