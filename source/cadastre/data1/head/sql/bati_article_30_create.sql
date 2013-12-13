-- Suppression de la table bati_article_30
DROP TABLE IF EXISTS bati_article_30;
-- Creation de la table bati_article_30
CREATE TABLE bati_article_30 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(7) DEFAULT NULL,
"janbil" CHARACTER VARYING(4) DEFAULT NULL,
"dnupev" CHARACTER VARYING(3) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"dnuexb" CHARACTER VARYING(3) DEFAULT NULL,
"ccolloc" CHARACTER VARYING(2) DEFAULT NULL,
"pexb" CHARACTER VARYING(5) DEFAULT NULL,
"gnextl" CHARACTER VARYING(2) DEFAULT NULL,
"jandeb" CHARACTER VARYING(4) DEFAULT NULL,
"janimp" CHARACTER VARYING(4) DEFAULT NULL,
"vecdif" CHARACTER VARYING(9) DEFAULT NULL,
"filler02" CHARACTER VARYING(1) DEFAULT NULL,
"vecdifa" CHARACTER VARYING(9) DEFAULT NULL,
"filler03" CHARACTER VARYING(1) DEFAULT NULL,
"fcexb" CHARACTER VARYING(9) DEFAULT NULL,
"filler04" CHARACTER VARYING(1) DEFAULT NULL,
"fcexba" CHARACTER VARYING(9) DEFAULT NULL,
"filler05" CHARACTER VARYING(1) DEFAULT NULL,
"rcexba" CHARACTER VARYING(9) DEFAULT NULL,
"filler06" CHARACTER VARYING(1) DEFAULT NULL,
"dvldif2" CHARACTER VARYING(9) DEFAULT NULL,
"filler07" CHARACTER VARYING(1) DEFAULT NULL,
"dvldif2a" CHARACTER VARYING(9) DEFAULT NULL,
"filler08" CHARACTER VARYING(1) DEFAULT NULL,
"fcexb2" CHARACTER VARYING(9) DEFAULT NULL,
"filler09" CHARACTER VARYING(1) DEFAULT NULL,
"fcexba2" CHARACTER VARYING(9) DEFAULT NULL,
"filler10" CHARACTER VARYING(1) DEFAULT NULL,
"rcexba2" CHARACTER VARYING(9) DEFAULT NULL,
"filler11" CHARACTER VARYING(49) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_30
COMMENT ON COLUMN bati_article_30."ccodep" IS 'Code département';
COMMENT ON COLUMN bati_article_30."ccodir" IS 'Code direction';
COMMENT ON COLUMN bati_article_30."ccocom" IS 'Code commune INSEE';
COMMENT ON COLUMN bati_article_30."invar" IS 'Numéro invariant';
COMMENT ON COLUMN bati_article_30."filler01" IS '';
COMMENT ON COLUMN bati_article_30."janbil" IS 'Année d’immobilisation';
COMMENT ON COLUMN bati_article_30."dnupev" IS 'Numéro de pev';
COMMENT ON COLUMN bati_article_30."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN bati_article_30."dnuexb" IS 'Numéro d’ordre de l’article';
COMMENT ON COLUMN bati_article_30."ccolloc" IS 'Code de collectivité locale accordant l’exonération';
COMMENT ON COLUMN bati_article_30."pexb" IS 'Taux d’exonération accordée';
COMMENT ON COLUMN bati_article_30."gnextl" IS 'Nature d’exonération temporaire (et permanente pour ets. Industriels)';
COMMENT ON COLUMN bati_article_30."jandeb" IS 'année de début d’exonération';
COMMENT ON COLUMN bati_article_30."janimp" IS 'année de retour à imposition';
COMMENT ON COLUMN bati_article_30."vecdif" IS 'montant saisi de l’EC bénéficiant exo';
COMMENT ON COLUMN bati_article_30."filler02" IS '';
COMMENT ON COLUMN bati_article_30."vecdifa" IS 'vecdif multiplié par coeff';
COMMENT ON COLUMN bati_article_30."filler03" IS '';
COMMENT ON COLUMN bati_article_30."fcexb" IS 'Fraction EC exonérée';
COMMENT ON COLUMN bati_article_30."filler04" IS '';
COMMENT ON COLUMN bati_article_30."fcexba" IS 'fcexb multiplié par coeff';
COMMENT ON COLUMN bati_article_30."filler05" IS '';
COMMENT ON COLUMN bati_article_30."rcexba" IS 'revenu cadastral exonéré';
COMMENT ON COLUMN bati_article_30."filler06" IS '';
COMMENT ON COLUMN bati_article_30."dvldif2" IS 'Montant de VL exonérée (valeur 70)';
COMMENT ON COLUMN bati_article_30."filler07" IS '';
COMMENT ON COLUMN bati_article_30."dvldif2a" IS 'Montant de VL exonérée (valeur de l’année)';
COMMENT ON COLUMN bati_article_30."filler08" IS '';
COMMENT ON COLUMN bati_article_30."fcexb2" IS 'Fraction de VL exonérée (valeur 70)';
COMMENT ON COLUMN bati_article_30."filler09" IS '';
COMMENT ON COLUMN bati_article_30."fcexba2" IS 'Fraction de VL exonérée (valeur de l’année)';
COMMENT ON COLUMN bati_article_30."filler10" IS '';
COMMENT ON COLUMN bati_article_30."rcexba2" IS 'Revenu  cadastral exonéré (valeur de l’année)';
COMMENT ON COLUMN bati_article_30."filler11" IS '';
