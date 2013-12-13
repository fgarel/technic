-- Suppression de la table pdl_article_30
DROP TABLE IF EXISTS pdl_article_30;
-- Creation de la table pdl_article_30
CREATE TABLE pdl_article_30 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"dnupdl" CHARACTER VARYING(3) NOT NULL,
"dnulot" CHARACTER VARYING(7) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"cconlo" CHARACTER VARYING(1) NOT NULL,
"dcntlo" CHARACTER VARYING(9) NOT NULL,
"dnumql" CHARACTER VARYING(7) NOT NULL,
"ddenql" CHARACTER VARYING(7) NOT NULL,
"dfilot" CHARACTER VARYING(20) NOT NULL,
"datact" CHARACTER VARYING(8) NOT NULL,
"filler01" CHARACTER VARYING(3) NOT NULL,
"dnuprol" CHARACTER VARYING(6) NOT NULL,
"dreflf" CHARACTER VARYING(5) NOT NULL,
"ccocif" CHARACTER VARYING(4) NOT NULL,
"filler02" CHARACTER VARYING(3) NOT NULL);
-- Ajout des commentaires pour la table pdl_article_30
COMMENT ON COLUMN pdl_article_30."ccodep" IS 'code département';
COMMENT ON COLUMN pdl_article_30."ccodir" IS 'code direction';
COMMENT ON COLUMN pdl_article_30."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN pdl_article_30."ccopre" IS 'code du préfixe';
COMMENT ON COLUMN pdl_article_30."ccosec" IS 'lettres de section';
COMMENT ON COLUMN pdl_article_30."dnupla" IS 'numéro de plan';
COMMENT ON COLUMN pdl_article_30."dnupdl" IS 'no de pdl';
COMMENT ON COLUMN pdl_article_30."dnulot" IS 'Numéro de lot';
COMMENT ON COLUMN pdl_article_30."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN pdl_article_30."cconlo" IS 'Code nature du lot';
COMMENT ON COLUMN pdl_article_30."dcntlo" IS 'Superficie du lot';
COMMENT ON COLUMN pdl_article_30."dnumql" IS 'Numérateur';
COMMENT ON COLUMN pdl_article_30."ddenql" IS 'Dénominateur';
COMMENT ON COLUMN pdl_article_30."dfilot" IS 'pdl-fille du lot';
COMMENT ON COLUMN pdl_article_30."datact" IS 'date de l acte';
COMMENT ON COLUMN pdl_article_30."filler01" IS '';
COMMENT ON COLUMN pdl_article_30."dnuprol" IS 'Compte du lot';
COMMENT ON COLUMN pdl_article_30."dreflf" IS 'Référence livre foncier';
COMMENT ON COLUMN pdl_article_30."ccocif" IS 'code cdif';
COMMENT ON COLUMN pdl_article_30."filler02" IS '';
