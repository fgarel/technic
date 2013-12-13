-- Suppression de la table bati_article_50
DROP TABLE IF EXISTS bati_article_50;
-- Creation de la table bati_article_50
CREATE TABLE bati_article_50 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(11) DEFAULT NULL,
"dnupev" CHARACTER VARYING(3) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"dnudes" CHARACTER VARYING(3) DEFAULT NULL,
"vsupot" CHARACTER VARYING(9) DEFAULT NULL,
"vsurz1" CHARACTER VARYING(9) DEFAULT NULL,
"vsurz2" CHARACTER VARYING(9) DEFAULT NULL,
"vsurz3" CHARACTER VARYING(9) DEFAULT NULL,
"vsurzt" CHARACTER VARYING(9) DEFAULT NULL,
"filler02" CHARACTER VARYING(1) DEFAULT NULL,
"vsurb1" CHARACTER VARYING(9) DEFAULT NULL,
"vsurb2" CHARACTER VARYING(9) DEFAULT NULL,
"filler03" CHARACTER VARYING(101) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_50
COMMENT ON COLUMN bati_article_50."ccodep" IS 'Code département';
COMMENT ON COLUMN bati_article_50."ccodir" IS 'Code direction';
COMMENT ON COLUMN bati_article_50."ccocom" IS 'Code commune INSEE';
COMMENT ON COLUMN bati_article_50."invar" IS 'Numéro invariant';
COMMENT ON COLUMN bati_article_50."filler01" IS '';
COMMENT ON COLUMN bati_article_50."dnupev" IS 'Numéro de pev';
COMMENT ON COLUMN bati_article_50."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN bati_article_50."dnudes" IS 'Numéro d’ordre de descriptif';
COMMENT ON COLUMN bati_article_50."vsupot" IS 'surface pondérée';
COMMENT ON COLUMN bati_article_50."vsurz1" IS 'Surface réelle totale zone 1';
COMMENT ON COLUMN bati_article_50."vsurz2" IS 'Surface réelle totale zone 2';
COMMENT ON COLUMN bati_article_50."vsurz3" IS 'Surface réelle totale zone 3';
COMMENT ON COLUMN bati_article_50."vsurzt" IS 'Surface réelle totale';
COMMENT ON COLUMN bati_article_50."filler02" IS '';
COMMENT ON COLUMN bati_article_50."vsurb1" IS 'surface réelle des bureaux 1';
COMMENT ON COLUMN bati_article_50."vsurb2" IS 'surface réelle des bureaux 2';
COMMENT ON COLUMN bati_article_50."filler03" IS '';
