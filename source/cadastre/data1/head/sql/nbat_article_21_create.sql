-- Suppression de la table nbat_article_21
DROP TABLE IF EXISTS nbat_article_21;
-- Creation de la table nbat_article_21
CREATE TABLE nbat_article_21 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"ccosub" CHARACTER VARYING(2) NOT NULL,
"filler01" CHARACTER VARYING(2) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"dcntsf" CHARACTER VARYING(9) NOT NULL,
"dnupro" CHARACTER VARYING(6) NOT NULL,
"gnexps" CHARACTER VARYING(2) NOT NULL,
"drcsub" CHARACTER VARYING(10) NOT NULL,
"drcsuba" CHARACTER VARYING(10) NOT NULL,
"ccostn" CHARACTER VARYING(1) NOT NULL,
"cgrnum" CHARACTER VARYING(2) NOT NULL,
"dsgrpf" CHARACTER VARYING(2) NOT NULL,
"dclssf" CHARACTER VARYING(2) NOT NULL,
"cnatsp" CHARACTER VARYING(5) NOT NULL,
"drgpos" CHARACTER VARYING(1) NOT NULL,
"ccoprel" CHARACTER VARYING(3) NOT NULL,
"ccosecl" CHARACTER VARYING(2) NOT NULL,
"dnuplal" CHARACTER VARYING(4) NOT NULL,
"dnupdl" CHARACTER VARYING(3) NOT NULL,
"dnulot" CHARACTER VARYING(7) NOT NULL);
-- Ajout des commentaires pour la table nbat_article_21
COMMENT ON COLUMN nbat_article_21."ccodep" IS 'Code département';
COMMENT ON COLUMN nbat_article_21."ccodir" IS 'Code direction';
COMMENT ON COLUMN nbat_article_21."ccocom" IS 'Code commune INSEE ou DGI d’arrondissement';
COMMENT ON COLUMN nbat_article_21."ccopre" IS 'Préfixe de section ou quartier servi pour les communes associées, &des1.';
COMMENT ON COLUMN nbat_article_21."ccosec" IS 'Section cadastrale';
COMMENT ON COLUMN nbat_article_21."dnupla" IS 'Numéro de plan';
COMMENT ON COLUMN nbat_article_21."ccosub" IS 'Lettres indicatives de suf';
COMMENT ON COLUMN nbat_article_21."filler01" IS '';
COMMENT ON COLUMN nbat_article_21."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN nbat_article_21."dcntsf" IS 'Contenance de la suf';
COMMENT ON COLUMN nbat_article_21."dnupro" IS 'Compte communal du propriétaire de la suf';
COMMENT ON COLUMN nbat_article_21."gnexps" IS 'Code exonération permanente';
COMMENT ON COLUMN nbat_article_21."drcsub" IS 'Revenu cadastral en valeur actualise référence 1980';
COMMENT ON COLUMN nbat_article_21."drcsuba" IS 'Revenu cadastral revalorisé en valeur du 01/01 de l’année';
COMMENT ON COLUMN nbat_article_21."ccostn" IS 'Série-tarif';
COMMENT ON COLUMN nbat_article_21."cgrnum" IS 'Groupe de nature de culture';
COMMENT ON COLUMN nbat_article_21."dsgrpf" IS 'Sous-groupe alphabétique';
COMMENT ON COLUMN nbat_article_21."dclssf" IS 'Classe dans le groupe et la série-tarif';
COMMENT ON COLUMN nbat_article_21."cnatsp" IS 'code nature de culture spéciale';
COMMENT ON COLUMN nbat_article_21."drgpos" IS 'Top terrain constructible';
COMMENT ON COLUMN nbat_article_21."ccoprel" IS 'Préfixe de la parcelle identifiant le lot';
COMMENT ON COLUMN nbat_article_21."ccosecl" IS 'Section de la parcelle identifiant le lot';
COMMENT ON COLUMN nbat_article_21."dnuplal" IS 'N° de plan de la parcelle de référence';
COMMENT ON COLUMN nbat_article_21."dnupdl" IS 'Numéro d ordre de la pdl';
COMMENT ON COLUMN nbat_article_21."dnulot" IS 'Numéro du lot - Le lot de BND se présente sous la forme 00Axxxx';
