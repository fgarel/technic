-- Suppression de la table bati_article_60
DROP TABLE IF EXISTS bati_article_60;
-- Creation de la table bati_article_60
CREATE TABLE bati_article_60 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(11) DEFAULT NULL,
"dnupev" CHARACTER VARYING(3) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"dnudes" CHARACTER VARYING(3) DEFAULT NULL,
"dsudep" CHARACTER VARYING(6) DEFAULT NULL,
"cconad" CHARACTER VARYING(2) DEFAULT NULL,
"asitet" CHARACTER VARYING(6) DEFAULT NULL,
"dmatgm" CHARACTER VARYING(2) DEFAULT NULL,
"dmatto" CHARACTER VARYING(2) DEFAULT NULL,
"detent" CHARACTER VARYING(1) DEFAULT NULL,
"geaulc" CHARACTER VARYING(1) DEFAULT NULL,
"gelelc" CHARACTER VARYING(1) DEFAULT NULL,
"gchclc" CHARACTER VARYING(1) DEFAULT NULL,
"dnbbai" CHARACTER VARYING(2) DEFAULT NULL,
"dnbdou" CHARACTER VARYING(2) DEFAULT NULL,
"dnblav" CHARACTER VARYING(2) DEFAULT NULL,
"dnbwc" CHARACTER VARYING(2) DEFAULT NULL,
"deqtlc" CHARACTER VARYING(3) DEFAULT NULL,
"dcimlc" CHARACTER VARYING(2) DEFAULT NULL,
"dcetde" CHARACTER VARYING(3) DEFAULT NULL,
"dcspde" CHARACTER VARYING(3) DEFAULT NULL,
"filler02" CHARACTER VARYING(124) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_60
COMMENT ON COLUMN bati_article_60."ccodep" IS 'Code département';
COMMENT ON COLUMN bati_article_60."ccodir" IS 'Code direction';
COMMENT ON COLUMN bati_article_60."ccocom" IS 'Code commune INSEE';
COMMENT ON COLUMN bati_article_60."invar" IS 'Numéro invariant';
COMMENT ON COLUMN bati_article_60."filler01" IS '';
COMMENT ON COLUMN bati_article_60."dnupev" IS 'Numéro de pev';
COMMENT ON COLUMN bati_article_60."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN bati_article_60."dnudes" IS 'Numéro d’ordre de descriptif';
COMMENT ON COLUMN bati_article_60."dsudep" IS 'Surface réelle de la dépendance';
COMMENT ON COLUMN bati_article_60."cconad" IS 'Nature de dépendance';
COMMENT ON COLUMN bati_article_60."asitet" IS 'Localisation (bat, esc, niv)';
COMMENT ON COLUMN bati_article_60."dmatgm" IS 'Matériaux des gros murs';
COMMENT ON COLUMN bati_article_60."dmatto" IS 'Matériaux des toitures';
COMMENT ON COLUMN bati_article_60."detent" IS 'état d’entretien';
COMMENT ON COLUMN bati_article_60."geaulc" IS 'Présence d’eau';
COMMENT ON COLUMN bati_article_60."gelelc" IS 'Présence d’électricité';
COMMENT ON COLUMN bati_article_60."gchclc" IS 'Présence du chauffage central';
COMMENT ON COLUMN bati_article_60."dnbbai" IS 'Nombre de baignoires';
COMMENT ON COLUMN bati_article_60."dnbdou" IS 'Nombre de douches';
COMMENT ON COLUMN bati_article_60."dnblav" IS 'Nombre de lavabos';
COMMENT ON COLUMN bati_article_60."dnbwc" IS 'Nombre de WC';
COMMENT ON COLUMN bati_article_60."deqtlc" IS 'Equivalence superficielle des éléments de confort';
COMMENT ON COLUMN bati_article_60."dcimlc" IS 'Coefficient de pondération';
COMMENT ON COLUMN bati_article_60."dcetde" IS 'Coefficient d entretien';
COMMENT ON COLUMN bati_article_60."dcspde" IS 'Coefficient de situation particulière';
COMMENT ON COLUMN bati_article_60."filler02" IS '';
