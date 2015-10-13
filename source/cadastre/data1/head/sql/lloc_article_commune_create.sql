-- Suppression de la table lloc_article_commune
DROP TABLE IF EXISTS lloc_article_commune;
-- Creation de la table lloc_article_commune
CREATE TABLE lloc_article_commune (
"ccode" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"filler01" CHARACTER VARYING(10) NOT NULL,
"libcom" CHARACTER VARYING(44) NOT NULL);
-- Ajout des commentaires pour la table lloc_article_commune
COMMENT ON COLUMN lloc_article_commune."ccode" IS 'code département';
COMMENT ON COLUMN lloc_article_commune."ccodir" IS 'code direction';
COMMENT ON COLUMN lloc_article_commune."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN lloc_article_commune."filler01" IS '';
COMMENT ON COLUMN lloc_article_commune."libcom" IS 'libelle de la commune';
