-- Suppression de la table pdl_article_10
DROP TABLE IF EXISTS pdl_article_10;
-- Creation de la table pdl_article_10
CREATE TABLE pdl_article_10 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"dnupdl" CHARACTER VARYING(3) NOT NULL,
"filler01" CHARACTER VARYING(7) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"dnivim" CHARACTER VARYING(1) NOT NULL,
"ctpdl" CHARACTER VARYING(3) NOT NULL,
"dnompdl" CHARACTER VARYING(30) NOT NULL,
"dmrpdl" CHARACTER VARYING(20) NOT NULL,
"gprmut" CHARACTER VARYING(1) NOT NULL,
"dnupro" CHARACTER VARYING(6) NOT NULL,
"filler02" CHARACTER VARYING(5) NOT NULL,
"ccocif" CHARACTER VARYING(4) NOT NULL,
"filler03" CHARACTER VARYING(3) NOT NULL);
-- Ajout des commentaires pour la table pdl_article_10
COMMENT ON COLUMN pdl_article_10."ccodep" IS 'code département';
COMMENT ON COLUMN pdl_article_10."ccodir" IS 'code direction';
COMMENT ON COLUMN pdl_article_10."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN pdl_article_10."ccopre" IS 'code du préfixe';
COMMENT ON COLUMN pdl_article_10."ccosec" IS 'lettres de section';
COMMENT ON COLUMN pdl_article_10."dnupla" IS 'numéro de plan';
COMMENT ON COLUMN pdl_article_10."dnupdl" IS 'no de pdl';
COMMENT ON COLUMN pdl_article_10."filler01" IS '';
COMMENT ON COLUMN pdl_article_10."cenr" IS 'code enregistrement';
COMMENT ON COLUMN pdl_article_10."dnivim" IS 'niveau imbrication';
COMMENT ON COLUMN pdl_article_10."ctpdl" IS 'type de pdl';
COMMENT ON COLUMN pdl_article_10."dnompdl" IS '';
COMMENT ON COLUMN pdl_article_10."dmrpdl" IS 'lot mère(plan+pdl+lot)';
COMMENT ON COLUMN pdl_article_10."gprmut" IS 'top 1ere mut effectuée';
COMMENT ON COLUMN pdl_article_10."dnupro" IS 'compte de la pdl';
COMMENT ON COLUMN pdl_article_10."filler02" IS '';
COMMENT ON COLUMN pdl_article_10."ccocif" IS 'code cdif';
COMMENT ON COLUMN pdl_article_10."filler03" IS '';
