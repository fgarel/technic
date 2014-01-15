-- Suppression de la table nbat_article_36
DROP TABLE IF EXISTS nbat_article_36;
-- Creation de la table nbat_article_36
CREATE TABLE nbat_article_36 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"cocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"ccosub" CHARACTER VARYING(2) NOT NULL,
"filler01" CHARACTER VARYING(2) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"filler02" CHARACTER VARYING(1) NOT NULL,
"majposa1" CHARACTER VARYING(10) NOT NULL,
"filler03" CHARACTER VARYING(1) NOT NULL,
"bisufad1" CHARACTER VARYING(10) NOT NULL,
"filler04" CHARACTER VARYING(1) NOT NULL,
"majposa2" CHARACTER VARYING(10) NOT NULL,
"filler05" CHARACTER VARYING(1) NOT NULL,
"bisufad2" CHARACTER VARYING(10) NOT NULL,
"filler06" CHARACTER VARYING(1) NOT NULL,
"majposa3" CHARACTER VARYING(10) NOT NULL,
"filler07" CHARACTER VARYING(1) NOT NULL,
"bisufad3" CHARACTER VARYING(10) NOT NULL,
"filler08" CHARACTER VARYING(1) NOT NULL,
"majposa4" CHARACTER VARYING(10) NOT NULL,
"filler09" CHARACTER VARYING(1) NOT NULL,
"bisufad4" CHARACTER VARYING(10) NOT NULL,
"cntmajtc" CHARACTER VARYING(9) NOT NULL,
"filler10" CHARACTER VARYING(82) NOT NULL);
-- Ajout des commentaires pour la table nbat_article_36
COMMENT ON COLUMN nbat_article_36."ccodep" IS 'Code département';
COMMENT ON COLUMN nbat_article_36."ccodir" IS 'Code direction';
COMMENT ON COLUMN nbat_article_36."cocom" IS 'Code commune INSEE ou DGI d’arrondissement';
COMMENT ON COLUMN nbat_article_36."ccopre" IS 'Préfixe de section ou quartier servi pour les communes associées, &des1.';
COMMENT ON COLUMN nbat_article_36."ccosec" IS 'Section cadastrale';
COMMENT ON COLUMN nbat_article_36."dnupla" IS 'Numéro de plan';
COMMENT ON COLUMN nbat_article_36."ccosub" IS 'Lettres indicatives de suf';
COMMENT ON COLUMN nbat_article_36."filler01" IS 'Espace séparateur 1';
COMMENT ON COLUMN nbat_article_36."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN nbat_article_36."filler02" IS 'Espace séparateur 2';
COMMENT ON COLUMN nbat_article_36."majposa1" IS 'Montant de la majoration terrain constructible. Servi pour la part communale. Toujours à zéro pour autres collectivités.';
COMMENT ON COLUMN nbat_article_36."filler03" IS 'Espace séparateur 3';
COMMENT ON COLUMN nbat_article_36."bisufad1" IS 'Base d’imposition de la suf en valeur de l’année';
COMMENT ON COLUMN nbat_article_36."filler04" IS 'Espace séparateur 4';
COMMENT ON COLUMN nbat_article_36."majposa2" IS 'Montant de la majoration terrain constructible. Servi pour la part communale. Toujours à zéro pour autres collectivités.';
COMMENT ON COLUMN nbat_article_36."filler05" IS 'Espace séparateur 5';
COMMENT ON COLUMN nbat_article_36."bisufad2" IS 'Base d’imposition de la suf en valeur de l’année';
COMMENT ON COLUMN nbat_article_36."filler06" IS 'Espace séparateur 6';
COMMENT ON COLUMN nbat_article_36."majposa3" IS 'Montant de la majoration terrain constructible. Servi pour la part communale. Toujours à zéro pour autres collectivités.';
COMMENT ON COLUMN nbat_article_36."filler07" IS 'Espace séparateur 7';
COMMENT ON COLUMN nbat_article_36."bisufad3" IS 'Base d’imposition de la suf en valeur de l’année';
COMMENT ON COLUMN nbat_article_36."filler08" IS 'Espace séparateur 8';
COMMENT ON COLUMN nbat_article_36."majposa4" IS 'Montant de la majoration terrain constructible. Servi pour la part communale. Toujours à zéro pour autres collectivités.';
COMMENT ON COLUMN nbat_article_36."filler09" IS 'Espace séparateur 9';
COMMENT ON COLUMN nbat_article_36."bisufad4" IS 'Base d’imposition de la suf en valeur de l’année';
COMMENT ON COLUMN nbat_article_36."cntmajtc" IS 'Nouvelle contenance suf pour calcul majoration TC';
COMMENT ON COLUMN nbat_article_36."filler10" IS 'Espace séparateur 10';
