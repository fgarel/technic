-- Suppression de la table nbat_article_99
DROP TABLE IF EXISTS nbat_article_99;
-- Creation de la table nbat_article_99
CREATE TABLE nbat_article_99 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"filler01" CHARACTER VARYING(2) NOT NULL);
-- Ajout des commentaires pour la table nbat_article_99
COMMENT ON COLUMN nbat_article_99."ccodep" IS 'code département';
COMMENT ON COLUMN nbat_article_99."ccodir" IS 'code direction';
COMMENT ON COLUMN nbat_article_99."ccocom" IS 'code commune INSEE ou DGI d’arrondissement';
COMMENT ON COLUMN nbat_article_99."ccopre" IS 'Préfixe de section ou quartier servi pour les communes associées';
COMMENT ON COLUMN nbat_article_99."ccosec" IS 'Section cadastrale';
COMMENT ON COLUMN nbat_article_99."dnupla" IS 'Numéro de plan';
COMMENT ON COLUMN nbat_article_99."filler01" IS '';
