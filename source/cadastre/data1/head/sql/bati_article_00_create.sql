-- Suppression de la table bati_article_00
DROP TABLE IF EXISTS bati_article_00;
-- Creation de la table bati_article_00
CREATE TABLE bati_article_00 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(14) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"filler02" CHARACTER VARYING(3) DEFAULT NULL,
"ccopre" CHARACTER VARYING(3) DEFAULT NULL,
"ccosec" CHARACTER VARYING(2) DEFAULT NULL,
"dnupla" CHARACTER VARYING(4) DEFAULT NULL,
"filler03" CHARACTER VARYING(1) DEFAULT NULL,
"dnubat" CHARACTER VARYING(2) DEFAULT NULL,
"desc" CHARACTER VARYING(2) DEFAULT NULL,
"dniv" CHARACTER VARYING(2) DEFAULT NULL,
"dpor" CHARACTER VARYING(5) DEFAULT NULL,
"ccoriv" CHARACTER VARYING(4) DEFAULT NULL,
"filler04" CHARACTER VARYING(1) DEFAULT NULL,
"ccovoi" CHARACTER VARYING(5) DEFAULT NULL,
"dnvoiri" CHARACTER VARYING(4) DEFAULT NULL,
"dindic" CHARACTER VARYING(1) DEFAULT NULL,
"ccocif" CHARACTER VARYING(4) DEFAULT NULL,
"dvoilib" CHARACTER VARYING(30) DEFAULT NULL,
"cleinvar" CHARACTER VARYING(1) DEFAULT NULL,
"locinc" CHARACTER VARYING(1) DEFAULT NULL,
"filler05" CHARACTER VARYING(93) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_00
COMMENT ON COLUMN bati_article_00."ccodep" IS 'code département';
COMMENT ON COLUMN bati_article_00."ccodir" IS 'code direction';
COMMENT ON COLUMN bati_article_00."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN bati_article_00."invar" IS 'numéro invariant';
COMMENT ON COLUMN bati_article_00."filler01" IS '';
COMMENT ON COLUMN bati_article_00."cenr" IS 'code enregistrement';
COMMENT ON COLUMN bati_article_00."filler02" IS '';
COMMENT ON COLUMN bati_article_00."ccopre" IS 'préfixe de section ou quartier servi pour les communes associées,';
COMMENT ON COLUMN bati_article_00."ccosec" IS 'lettres de section';
COMMENT ON COLUMN bati_article_00."dnupla" IS 'numéro de plan';
COMMENT ON COLUMN bati_article_00."filler03" IS '';
COMMENT ON COLUMN bati_article_00."dnubat" IS 'lettre de bâtiment';
COMMENT ON COLUMN bati_article_00."desc" IS 'numéro d’entrée';
COMMENT ON COLUMN bati_article_00."dniv" IS 'niveau étage';
COMMENT ON COLUMN bati_article_00."dpor" IS 'numéro de local';
COMMENT ON COLUMN bati_article_00."ccoriv" IS 'Code Rivoli de la voie';
COMMENT ON COLUMN bati_article_00."filler04" IS '';
COMMENT ON COLUMN bati_article_00."ccovoi" IS 'Code Majic2 de la voie';
COMMENT ON COLUMN bati_article_00."dnvoiri" IS 'Numéro de voirie';
COMMENT ON COLUMN bati_article_00."dindic" IS 'indice de répétition';
COMMENT ON COLUMN bati_article_00."ccocif" IS 'code du cdi/cdif (code topad)';
COMMENT ON COLUMN bati_article_00."dvoilib" IS 'libelle de la voie';
COMMENT ON COLUMN bati_article_00."cleinvar" IS 'clé alpha no invariant';
COMMENT ON COLUMN bati_article_00."locinc" IS 'code local sans évaluation';
COMMENT ON COLUMN bati_article_00."filler05" IS '';
