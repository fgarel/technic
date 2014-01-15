-- Suppression de la table bati_article_10
DROP TABLE IF EXISTS bati_article_10;
-- Creation de la table bati_article_10
CREATE TABLE bati_article_10 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(14) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"filler02" CHARACTER VARYING(3) DEFAULT NULL,
"gpdl" CHARACTER VARYING(1) DEFAULT NULL,
"dsrpar" CHARACTER VARYING(1) DEFAULT NULL,
"dnupro" CHARACTER VARYING(6) DEFAULT NULL,
"jdatat" CHARACTER VARYING(8) DEFAULT NULL,
"dnufnl" CHARACTER VARYING(6) DEFAULT NULL,
"ccoeva" CHARACTER VARYING(1) DEFAULT NULL,
"ccitlv" CHARACTER VARYING(1) DEFAULT NULL,
"dteloc" CHARACTER VARYING(1) DEFAULT NULL,
"gtauom" CHARACTER VARYING(2) DEFAULT NULL,
"dcomrd" CHARACTER VARYING(3) DEFAULT NULL,
"ccoplc" CHARACTER VARYING(1) DEFAULT NULL,
"cconlc" CHARACTER VARYING(2) DEFAULT NULL,
"dvltrt" CHARACTER VARYING(9) DEFAULT NULL,
"ccoape" CHARACTER VARYING(4) DEFAULT NULL,
"cc48lc" CHARACTER VARYING(2) DEFAULT NULL,
"dloy48a" CHARACTER VARYING(9) DEFAULT NULL,
"top48a" CHARACTER VARYING(1) DEFAULT NULL,
"dnatlc" CHARACTER VARYING(1) DEFAULT NULL,
"dnupas" CHARACTER VARYING(8) DEFAULT NULL,
"gnexcf" CHARACTER VARYING(2) DEFAULT NULL,
"dtaucf" CHARACTER VARYING(3) DEFAULT NULL,
"cchpr" CHARACTER VARYING(1) DEFAULT NULL,
"jannat" CHARACTER VARYING(4) DEFAULT NULL,
"dnbniv" CHARACTER VARYING(2) DEFAULT NULL,
"hlmsem" CHARACTER VARYING(1) DEFAULT NULL,
"postel" CHARACTER VARYING(1) DEFAULT NULL,
"dnatcg" CHARACTER VARYING(2) DEFAULT NULL,
"jdatcgl" CHARACTER VARYING(8) DEFAULT NULL,
"dnutbx" CHARACTER VARYING(6) DEFAULT NULL,
"dvltla" CHARACTER VARYING(9) DEFAULT NULL,
"janloc" CHARACTER VARYING(4) DEFAULT NULL,
"ccsloc" CHARACTER VARYING(2) DEFAULT NULL,
"fburx" CHARACTER VARYING(1) DEFAULT NULL,
"gimtom" CHARACTER VARYING(1) DEFAULT NULL,
"cbtabt" CHARACTER VARYING(2) DEFAULT NULL,
"jdtabt" CHARACTER VARYING(4) DEFAULT NULL,
"jrtabt" CHARACTER VARYING(4) DEFAULT NULL,
"filler03" CHARACTER VARYING(9) DEFAULT NULL,
"cconac" CHARACTER VARYING(5) DEFAULT NULL,
"filler04" CHARACTER VARYING(27) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_10
COMMENT ON COLUMN bati_article_10."ccodep" IS 'code département';
COMMENT ON COLUMN bati_article_10."ccodir" IS 'code direction';
COMMENT ON COLUMN bati_article_10."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN bati_article_10."invar" IS 'numéro invariant';
COMMENT ON COLUMN bati_article_10."filler01" IS '';
COMMENT ON COLUMN bati_article_10."cenr" IS 'code enregistrement';
COMMENT ON COLUMN bati_article_10."filler02" IS '';
COMMENT ON COLUMN bati_article_10."gpdl" IS 'indicateur d’appartenance à un lot de pdl';
COMMENT ON COLUMN bati_article_10."dsrpar" IS 'lettre de série rôle';
COMMENT ON COLUMN bati_article_10."dnupro" IS 'compte communal de propriétaire';
COMMENT ON COLUMN bati_article_10."jdatat" IS 'date d’acte de mutation';
COMMENT ON COLUMN bati_article_10."dnufnl" IS 'compte communal de fonctionnaire logé';
COMMENT ON COLUMN bati_article_10."ccoeva" IS 'code évaluation';
COMMENT ON COLUMN bati_article_10."ccitlv" IS 'local imposable à la taxe sur les locaux vacants';
COMMENT ON COLUMN bati_article_10."dteloc" IS 'type de local';
COMMENT ON COLUMN bati_article_10."gtauom" IS 'zone  de ramassage des ordures ménagères';
COMMENT ON COLUMN bati_article_10."dcomrd" IS 'Pourcentage de réduction sur tom';
COMMENT ON COLUMN bati_article_10."ccoplc" IS 'Code de construction particulière';
COMMENT ON COLUMN bati_article_10."cconlc" IS 'Code nature de local';
COMMENT ON COLUMN bati_article_10."dvltrt" IS 'Valeur locative totale retenue pour le local';
COMMENT ON COLUMN bati_article_10."ccoape" IS 'Code NAF pour les locaux professionnels';
COMMENT ON COLUMN bati_article_10."cc48lc" IS 'Catégorie de loi de 48';
COMMENT ON COLUMN bati_article_10."dloy48a" IS 'Loyer de 48 en valeur de l’année';
COMMENT ON COLUMN bati_article_10."top48a" IS 'top taxation indiquant si la pev est impose au loyer ou a la vl';
COMMENT ON COLUMN bati_article_10."dnatlc" IS 'Nature d occupation';
COMMENT ON COLUMN bati_article_10."dnupas" IS 'no passerelle TH/TP';
COMMENT ON COLUMN bati_article_10."gnexcf" IS 'code nature exo ecf';
COMMENT ON COLUMN bati_article_10."dtaucf" IS 'taux exo ecf';
COMMENT ON COLUMN bati_article_10."cchpr" IS 'Top indiquant une mutation propriétaire';
COMMENT ON COLUMN bati_article_10."jannat" IS 'Année de construction';
COMMENT ON COLUMN bati_article_10."dnbniv" IS 'Nombre de niveaux de la construction';
COMMENT ON COLUMN bati_article_10."hlmsem" IS 'Local appartenant à hlm ou sem';
COMMENT ON COLUMN bati_article_10."postel" IS 'Local de Poste ou France Telecom';
COMMENT ON COLUMN bati_article_10."dnatcg" IS 'Code  nature du changement évaluation';
COMMENT ON COLUMN bati_article_10."jdatcgl" IS 'date constatation changement';
COMMENT ON COLUMN bati_article_10."dnutbx" IS 'no gestionnaire déclarant taxe bureaux';
COMMENT ON COLUMN bati_article_10."dvltla" IS 'VL totale du local actualisée';
COMMENT ON COLUMN bati_article_10."janloc" IS 'Année de création du local';
COMMENT ON COLUMN bati_article_10."ccsloc" IS 'Code cause création du local';
COMMENT ON COLUMN bati_article_10."fburx" IS 'Indicateur présence bureaux';
COMMENT ON COLUMN bati_article_10."gimtom" IS 'Indicateur imposition OM exploitable à partir de 2002';
COMMENT ON COLUMN bati_article_10."cbtabt" IS 'Code exonération HLM zone sensible';
COMMENT ON COLUMN bati_article_10."jdtabt" IS 'Année début d’exonération ZS';
COMMENT ON COLUMN bati_article_10."jrtabt" IS 'Année fin d’exonération ZS';
COMMENT ON COLUMN bati_article_10."filler03" IS '';
COMMENT ON COLUMN bati_article_10."cconac" IS 'Coe NACE pour les locaux professionnels';
COMMENT ON COLUMN bati_article_10."filler04" IS '';
