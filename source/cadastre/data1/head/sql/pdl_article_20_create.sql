-- Suppression de la table pdl_article_20
DROP TABLE IF EXISTS pdl_article_20;
-- Creation de la table pdl_article_20
CREATE TABLE pdl_article_20 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"dnupdl" CHARACTER VARYING(3) NOT NULL,
"filler01" CHARACTER VARYING(7) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"ccoprea" CHARACTER VARYING(3) NOT NULL,
"ccoseca" CHARACTER VARYING(2) NOT NULL,
"dnuplaa" CHARACTER VARYING(4) NOT NULL,
"filler02" CHARACTER VARYING(57) NOT NULL,
"ccocif" CHARACTER VARYING(4) NOT NULL,
"filler03" CHARACTER VARYING(3) NOT NULL);
-- Ajout des commentaires pour la table pdl_article_20
COMMENT ON COLUMN pdl_article_20."ccodep" IS 'code département';
COMMENT ON COLUMN pdl_article_20."ccodir" IS 'code direction';
COMMENT ON COLUMN pdl_article_20."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN pdl_article_20."ccopre" IS 'code du préfixe';
COMMENT ON COLUMN pdl_article_20."ccosec" IS 'lettres de section';
COMMENT ON COLUMN pdl_article_20."dnupla" IS 'numéro de plan';
COMMENT ON COLUMN pdl_article_20."dnupdl" IS 'no de pdl';
COMMENT ON COLUMN pdl_article_20."filler01" IS '';
COMMENT ON COLUMN pdl_article_20."cenr" IS 'code enregistrement';
COMMENT ON COLUMN pdl_article_20."ccoprea" IS 'code du préfixe';
COMMENT ON COLUMN pdl_article_20."ccoseca" IS 'lettres de section';
COMMENT ON COLUMN pdl_article_20."dnuplaa" IS 'numéro de plan';
COMMENT ON COLUMN pdl_article_20."filler02" IS '';
COMMENT ON COLUMN pdl_article_20."ccocif" IS 'code cdif';
COMMENT ON COLUMN pdl_article_20."filler03" IS '';
