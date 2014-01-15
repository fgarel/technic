-- Suppression de la table nbat_article_30
DROP TABLE IF EXISTS nbat_article_30;
-- Creation de la table nbat_article_30
CREATE TABLE nbat_article_30 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"ccosub" CHARACTER VARYING(2) NOT NULL,
"rnuexn" CHARACTER VARYING(2) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"vecexn" CHARACTER VARYING(10) NOT NULL,
"ccolloc" CHARACTER VARYING(2) NOT NULL,
"pexn" CHARACTER VARYING(5) NOT NULL,
"gnexts" CHARACTER VARYING(2) NOT NULL,
"jandeb" CHARACTER VARYING(4) NOT NULL,
"jfinex" CHARACTER VARYING(4) NOT NULL,
"fcexn" CHARACTER VARYING(10) NOT NULL,
"fcexna" CHARACTER VARYING(10) NOT NULL,
"rcexna" CHARACTER VARYING(10) NOT NULL,
"rcexnba" CHARACTER VARYING(10) NOT NULL,
"filler01" CHARACTER VARYING(1) NOT NULL,
"mpexnba" CHARACTER VARYING(10) NOT NULL,
"filler02" CHARACTER VARYING(101) NOT NULL);
-- Ajout des commentaires pour la table nbat_article_30
COMMENT ON COLUMN nbat_article_30."ccodep" IS 'Code département';
COMMENT ON COLUMN nbat_article_30."ccodir" IS 'Code direction';
COMMENT ON COLUMN nbat_article_30."ccocom" IS 'Code commune INSEE ou DGI d’arrondissement';
COMMENT ON COLUMN nbat_article_30."ccopre" IS 'Préfixe de section ou quartier servi pour les communes associées, &des1.';
COMMENT ON COLUMN nbat_article_30."ccosec" IS 'Section cadastrale';
COMMENT ON COLUMN nbat_article_30."dnupla" IS 'Numéro de plan';
COMMENT ON COLUMN nbat_article_30."ccosub" IS 'Lettres indicatives de suf';
COMMENT ON COLUMN nbat_article_30."rnuexn" IS 'Numéro d ordre d’exonération temporaire';
COMMENT ON COLUMN nbat_article_30."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN nbat_article_30."vecexn" IS 'Montant de VL sur lequel porte l’exonération';
COMMENT ON COLUMN nbat_article_30."ccolloc" IS 'Collectivité accordant l’exonération';
COMMENT ON COLUMN nbat_article_30."pexn" IS 'Pourcentage d’exonération';
COMMENT ON COLUMN nbat_article_30."gnexts" IS 'Code d’exonération temporaire';
COMMENT ON COLUMN nbat_article_30."jandeb" IS 'Année de début d’exonération';
COMMENT ON COLUMN nbat_article_30."jfinex" IS 'Année de retour à imposition';
COMMENT ON COLUMN nbat_article_30."fcexn" IS 'Fraction de vecsuf exonérée';
COMMENT ON COLUMN nbat_article_30."fcexna" IS 'fcexn en année N';
COMMENT ON COLUMN nbat_article_30."rcexna" IS 'revenu  (4/5 fcexna) correspondant';
COMMENT ON COLUMN nbat_article_30."rcexnba" IS 'Revenu cadastral exonéré, en valeur de l’année';
COMMENT ON COLUMN nbat_article_30."filler01" IS 'espace séparateur';
COMMENT ON COLUMN nbat_article_30."mpexnba" IS 'Fraction majo TC exonérée, en valeur de l’année';
COMMENT ON COLUMN nbat_article_30."filler02" IS '';
