-- Suppression de la table bati_article_99
DROP TABLE IF EXISTS bati_article_99;
-- Creation de la table bati_article_99
CREATE TABLE bati_article_99 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(7) DEFAULT NULL,
"janbil" CHARACTER VARYING(4) DEFAULT NULL,
"dnupev" CHARACTER VARYING(3) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"filler02" CHARACTER VARYING(3) DEFAULT NULL,
"vlbaic" CHARACTER VARYING(9) DEFAULT NULL,
"filler03" CHARACTER VARYING(1) DEFAULT NULL,
"vlbaiac" CHARACTER VARYING(9) DEFAULT NULL,
"filler04" CHARACTER VARYING(1) DEFAULT NULL,
"bipevlac" CHARACTER VARYING(9) DEFAULT NULL,
"filler05" CHARACTER VARYING(1) DEFAULT NULL,
"vlbaid" CHARACTER VARYING(9) DEFAULT NULL,
"filler06" CHARACTER VARYING(1) DEFAULT NULL,
"vlbaiad" CHARACTER VARYING(9) DEFAULT NULL,
"filler07" CHARACTER VARYING(1) DEFAULT NULL,
"bipevlad" CHARACTER VARYING(9) DEFAULT NULL,
"filler08" CHARACTER VARYING(1) DEFAULT NULL,
"vlbair" CHARACTER VARYING(9) DEFAULT NULL,
"filler09" CHARACTER VARYING(1) DEFAULT NULL,
"vlbaiar" CHARACTER VARYING(9) DEFAULT NULL,
"filler10" CHARACTER VARYING(1) DEFAULT NULL,
"bipevlar" CHARACTER VARYING(9) DEFAULT NULL,
"filler11" CHARACTER VARYING(1) DEFAULT NULL,
"vlbaigc" CHARACTER VARYING(9) DEFAULT NULL,
"filler12" CHARACTER VARYING(1) DEFAULT NULL,
"vlbaiagc" CHARACTER VARYING(9) DEFAULT NULL,
"filler13" CHARACTER VARYING(1) DEFAULT NULL,
"bipevlagc" CHARACTER VARYING(9) DEFAULT NULL,
"filler14" CHARACTER VARYING(1) DEFAULT NULL,
"bateom" CHARACTER VARYING(9) DEFAULT NULL,
"filler15" CHARACTER VARYING(1) DEFAULT NULL,
"baomec" CHARACTER VARYING(9) DEFAULT NULL,
"filler16" CHARACTER VARYING(26) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_99
COMMENT ON COLUMN bati_article_99."ccodep" IS 'Code département';
COMMENT ON COLUMN bati_article_99."ccodir" IS 'Code direction';
COMMENT ON COLUMN bati_article_99."ccocom" IS 'Code commune INSEE';
COMMENT ON COLUMN bati_article_99."invar" IS 'Numéro invariant';
COMMENT ON COLUMN bati_article_99."filler01" IS '';
COMMENT ON COLUMN bati_article_99."janbil" IS 'Année d’immobilisation';
COMMENT ON COLUMN bati_article_99."dnupev" IS 'Numéro de pev';
COMMENT ON COLUMN bati_article_99."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN bati_article_99."filler02" IS '';
COMMENT ON COLUMN bati_article_99."vlbaic" IS 'Part de VL imposée (valeur70)';
COMMENT ON COLUMN bati_article_99."filler03" IS '';
COMMENT ON COLUMN bati_article_99."vlbaiac" IS 'Part de VL imposée (valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler04" IS '';
COMMENT ON COLUMN bati_article_99."bipevlac" IS 'Base  d’imposition de la pev(valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler05" IS '';
COMMENT ON COLUMN bati_article_99."vlbaid" IS 'Part de VL imposée (valeur70)';
COMMENT ON COLUMN bati_article_99."filler06" IS '';
COMMENT ON COLUMN bati_article_99."vlbaiad" IS 'Part de VL imposée (valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler07" IS '';
COMMENT ON COLUMN bati_article_99."bipevlad" IS 'Base  d’imposition de la pev(valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler08" IS '';
COMMENT ON COLUMN bati_article_99."vlbair" IS 'Part de VL imposée (valeur70)';
COMMENT ON COLUMN bati_article_99."filler09" IS '';
COMMENT ON COLUMN bati_article_99."vlbaiar" IS 'Part de VL imposée (valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler10" IS '';
COMMENT ON COLUMN bati_article_99."bipevlar" IS 'Base  d’imposition de la pev(valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler11" IS '';
COMMENT ON COLUMN bati_article_99."vlbaigc" IS 'Part de VL imposée (valeur70)';
COMMENT ON COLUMN bati_article_99."filler12" IS '';
COMMENT ON COLUMN bati_article_99."vlbaiagc" IS 'Part de VL imposée (valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler13" IS '';
COMMENT ON COLUMN bati_article_99."bipevlagc" IS 'Base  d’imposition de la pev(valeur de l’année)';
COMMENT ON COLUMN bati_article_99."filler14" IS '';
COMMENT ON COLUMN bati_article_99."bateom" IS 'BASE ORDURES MENAGERES';
COMMENT ON COLUMN bati_article_99."filler15" IS '';
COMMENT ON COLUMN bati_article_99."baomec" IS 'BASE ORDURES MENAGERES ECRETEE';
COMMENT ON COLUMN bati_article_99."filler16" IS '';
