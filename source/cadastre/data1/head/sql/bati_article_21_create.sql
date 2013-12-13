-- Suppression de la table bati_article_21
DROP TABLE IF EXISTS bati_article_21;
-- Creation de la table bati_article_21
CREATE TABLE bati_article_21 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(11) DEFAULT NULL,
"dnupev" CHARACTER VARYING(3) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"filler02" CHARACTER VARYING(3) DEFAULT NULL,
"ccoaff" CHARACTER VARYING(1) DEFAULT NULL,
"ccostb" CHARACTER VARYING(1) DEFAULT NULL,
"dcapec" CHARACTER VARYING(2) DEFAULT NULL,
"dcetlc" CHARACTER VARYING(3) DEFAULT NULL,
"dcsplc" CHARACTER VARYING(3) DEFAULT NULL,
"dsupot" CHARACTER VARYING(6) DEFAULT NULL,
"dvlper" CHARACTER VARYING(9) DEFAULT NULL,
"dvlpera" CHARACTER VARYING(9) DEFAULT NULL,
"gnexpl" CHARACTER VARYING(2) DEFAULT NULL,
"libocc" CHARACTER VARYING(30) DEFAULT NULL,
"ccthp" CHARACTER VARYING(1) DEFAULT NULL,
"retimp" CHARACTER VARYING(1) DEFAULT NULL,
"dnuref" CHARACTER VARYING(3) DEFAULT NULL,
"rclsst" CHARACTER VARYING(32) DEFAULT NULL,
"gnidom" CHARACTER VARYING(1) DEFAULT NULL,
"dcsglc" CHARACTER VARYING(3) DEFAULT NULL,
"ccogrb" CHARACTER VARYING(1) DEFAULT NULL,
"cocdi" CHARACTER VARYING(4) DEFAULT NULL,
"cosatp" CHARACTER VARYING(3) DEFAULT NULL,
"gsatp" CHARACTER VARYING(1) DEFAULT NULL,
"clocv" CHARACTER VARYING(1) DEFAULT NULL,
"dvltpe" CHARACTER VARYING(9) DEFAULT NULL,
"dcralc" CHARACTER VARYING(3) DEFAULT NULL,
"filler03" CHARACTER VARYING(36) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_21
COMMENT ON COLUMN bati_article_21."ccodep" IS 'Code département';
COMMENT ON COLUMN bati_article_21."ccodir" IS 'Code direction';
COMMENT ON COLUMN bati_article_21."ccocom" IS 'Code commune INSEE';
COMMENT ON COLUMN bati_article_21."invar" IS 'Numéro invariant';
COMMENT ON COLUMN bati_article_21."filler01" IS '';
COMMENT ON COLUMN bati_article_21."dnupev" IS 'Numéro de pev';
COMMENT ON COLUMN bati_article_21."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN bati_article_21."filler02" IS '';
COMMENT ON COLUMN bati_article_21."ccoaff" IS 'Affectation de la pev';
COMMENT ON COLUMN bati_article_21."ccostb" IS 'lettre  de série tarif bâtie ou secteur locatif';
COMMENT ON COLUMN bati_article_21."dcapec" IS 'Catégorie';
COMMENT ON COLUMN bati_article_21."dcetlc" IS 'Coefficient d entretien';
COMMENT ON COLUMN bati_article_21."dcsplc" IS 'Coefficient de situation particulière';
COMMENT ON COLUMN bati_article_21."dsupot" IS 'Surface pondérée';
COMMENT ON COLUMN bati_article_21."dvlper" IS 'Valeur  locative  de la pev, en valeur de référence (1970) sauf pour les établissements de code évaluation A';
COMMENT ON COLUMN bati_article_21."dvlpera" IS 'Valeur  locative  de la pev, en valeur de l’année';
COMMENT ON COLUMN bati_article_21."gnexpl" IS 'Nature d’exonération permanente';
COMMENT ON COLUMN bati_article_21."libocc" IS 'nom de l occupant';
COMMENT ON COLUMN bati_article_21."ccthp" IS 'Code occupation à la Th ou à la TP';
COMMENT ON COLUMN bati_article_21."retimp" IS 'Top : retour partiel ou total à imposition';
COMMENT ON COLUMN bati_article_21."dnuref" IS 'Numéro de local type';
COMMENT ON COLUMN bati_article_21."rclsst" IS 'Données reclassement';
COMMENT ON COLUMN bati_article_21."gnidom" IS 'Top : pev non imposable (Dom)';
COMMENT ON COLUMN bati_article_21."dcsglc" IS 'Coefficient de situation générale';
COMMENT ON COLUMN bati_article_21."ccogrb" IS 'Code groupe bâti révisé';
COMMENT ON COLUMN bati_article_21."cocdi" IS 'Code cdi topad';
COMMENT ON COLUMN bati_article_21."cosatp" IS 'Code service topad';
COMMENT ON COLUMN bati_article_21."gsatp" IS 'Nature service gérant tp';
COMMENT ON COLUMN bati_article_21."clocv" IS 'Indicateur local vacant';
COMMENT ON COLUMN bati_article_21."dvltpe" IS 'VL TOTALE DE LA PEV MAJIC2';
COMMENT ON COLUMN bati_article_21."dcralc" IS 'correctif d’ascenseur';
COMMENT ON COLUMN bati_article_21."filler03" IS '';
