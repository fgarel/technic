-- Suppression de la table bati_article_40
DROP TABLE IF EXISTS bati_article_40;
-- Creation de la table bati_article_40
CREATE TABLE bati_article_40 (
"ccodep" CHARACTER VARYING(2) DEFAULT NULL,
"ccodir" CHARACTER VARYING(1) DEFAULT NULL,
"ccocom" CHARACTER VARYING(3) DEFAULT NULL,
"invar" CHARACTER VARYING(10) DEFAULT NULL,
"filler01" CHARACTER VARYING(11) DEFAULT NULL,
"dnupev" CHARACTER VARYING(3) DEFAULT NULL,
"cenr" CHARACTER VARYING(2) DEFAULT NULL,
"dnudes" CHARACTER VARYING(3) DEFAULT NULL,
"cconad1" CHARACTER VARYING(2) DEFAULT NULL,
"dsueic1" CHARACTER VARYING(6) DEFAULT NULL,
"dcimei1" CHARACTER VARYING(2) DEFAULT NULL,
"cconad2" CHARACTER VARYING(2) DEFAULT NULL,
"dsueic2" CHARACTER VARYING(6) DEFAULT NULL,
"dcimei2" CHARACTER VARYING(2) DEFAULT NULL,
"cconad3" CHARACTER VARYING(2) DEFAULT NULL,
"dsueic3" CHARACTER VARYING(6) DEFAULT NULL,
"dcimei3" CHARACTER VARYING(2) DEFAULT NULL,
"cconad4" CHARACTER VARYING(2) DEFAULT NULL,
"dsueic4" CHARACTER VARYING(6) DEFAULT NULL,
"dcimei4" CHARACTER VARYING(2) DEFAULT NULL,
"geaulc" CHARACTER VARYING(1) DEFAULT NULL,
"gelelc" CHARACTER VARYING(1) DEFAULT NULL,
"gesclc" CHARACTER VARYING(1) DEFAULT NULL,
"ggazlc" CHARACTER VARYING(1) DEFAULT NULL,
"gasclc" CHARACTER VARYING(1) DEFAULT NULL,
"gchclc" CHARACTER VARYING(1) DEFAULT NULL,
"gvorlc" CHARACTER VARYING(1) DEFAULT NULL,
"gteglc" CHARACTER VARYING(1) DEFAULT NULL,
"dnbbai" CHARACTER VARYING(2) DEFAULT NULL,
"dnbdou" CHARACTER VARYING(2) DEFAULT NULL,
"dnblav" CHARACTER VARYING(2) DEFAULT NULL,
"dnbwc" CHARACTER VARYING(2) DEFAULT NULL,
"deqdha" CHARACTER VARYING(3) DEFAULT NULL,
"dnbppr" CHARACTER VARYING(2) DEFAULT NULL,
"dnbsam" CHARACTER VARYING(2) DEFAULT NULL,
"dnbcha" CHARACTER VARYING(2) DEFAULT NULL,
"dnbcu8" CHARACTER VARYING(2) DEFAULT NULL,
"dnbcu9" CHARACTER VARYING(2) DEFAULT NULL,
"dnbsea" CHARACTER VARYING(2) DEFAULT NULL,
"dnbann" CHARACTER VARYING(2) DEFAULT NULL,
"dnbpdc" CHARACTER VARYING(2) DEFAULT NULL,
"dsupdc" CHARACTER VARYING(6) DEFAULT NULL,
"dmatgm" CHARACTER VARYING(2) DEFAULT NULL,
"dmatto" CHARACTER VARYING(2) DEFAULT NULL,
"jannat" CHARACTER VARYING(4) DEFAULT NULL,
"detent" CHARACTER VARYING(1) DEFAULT NULL,
"dnbniv" CHARACTER VARYING(2) DEFAULT NULL,
"filler02" CHARACTER VARYING(73) DEFAULT NULL);
-- Ajout des commentaires pour la table bati_article_40
COMMENT ON COLUMN bati_article_40."ccodep" IS 'Code département';
COMMENT ON COLUMN bati_article_40."ccodir" IS 'Code direction';
COMMENT ON COLUMN bati_article_40."ccocom" IS 'Code commune INSEE';
COMMENT ON COLUMN bati_article_40."invar" IS 'Numéro invariant';
COMMENT ON COLUMN bati_article_40."filler01" IS '';
COMMENT ON COLUMN bati_article_40."dnupev" IS 'Numéro de pev';
COMMENT ON COLUMN bati_article_40."cenr" IS 'Code enregistrement';
COMMENT ON COLUMN bati_article_40."dnudes" IS 'Numéro d’ordre de descriptif';
COMMENT ON COLUMN bati_article_40."cconad1" IS 'Nature de dépendance';
COMMENT ON COLUMN bati_article_40."dsueic1" IS 'Surface réelle de l’élément incorporé';
COMMENT ON COLUMN bati_article_40."dcimei1" IS 'Coefficient de pondération';
COMMENT ON COLUMN bati_article_40."cconad2" IS 'Nature de dépendance';
COMMENT ON COLUMN bati_article_40."dsueic2" IS 'Surface réelle de l’élément incorporé';
COMMENT ON COLUMN bati_article_40."dcimei2" IS 'Coefficient de pondération';
COMMENT ON COLUMN bati_article_40."cconad3" IS 'Nature de dépendance';
COMMENT ON COLUMN bati_article_40."dsueic3" IS 'Surface réelle de l’élément incorporé';
COMMENT ON COLUMN bati_article_40."dcimei3" IS 'Coefficient de pondération';
COMMENT ON COLUMN bati_article_40."cconad4" IS 'Nature de dépendance';
COMMENT ON COLUMN bati_article_40."dsueic4" IS 'Surface réelle de l’élément incorporé';
COMMENT ON COLUMN bati_article_40."dcimei4" IS 'Coefficient de pondération';
COMMENT ON COLUMN bati_article_40."geaulc" IS 'Présence d’eau';
COMMENT ON COLUMN bati_article_40."gelelc" IS 'Présence d’électricité';
COMMENT ON COLUMN bati_article_40."gesclc" IS 'Présence d’escalier de ser- vice (appartement)';
COMMENT ON COLUMN bati_article_40."ggazlc" IS 'Présence du gaz';
COMMENT ON COLUMN bati_article_40."gasclc" IS 'Présence d’ascenseur (appartement)';
COMMENT ON COLUMN bati_article_40."gchclc" IS 'Présence du chauffage central';
COMMENT ON COLUMN bati_article_40."gvorlc" IS 'Présence de vide-ordures (appartement)';
COMMENT ON COLUMN bati_article_40."gteglc" IS 'Présence du tout à l’égout';
COMMENT ON COLUMN bati_article_40."dnbbai" IS 'Nombre de baignoires';
COMMENT ON COLUMN bati_article_40."dnbdou" IS 'Nombre de douches';
COMMENT ON COLUMN bati_article_40."dnblav" IS 'Nombre de lavabos';
COMMENT ON COLUMN bati_article_40."dnbwc" IS 'Nombre de WC';
COMMENT ON COLUMN bati_article_40."deqdha" IS 'Equivalence superficielle des éléments de confort';
COMMENT ON COLUMN bati_article_40."dnbppr" IS 'Nombre de pièces principales';
COMMENT ON COLUMN bati_article_40."dnbsam" IS 'Nombre de salles à manger';
COMMENT ON COLUMN bati_article_40."dnbcha" IS 'Nombre de chambres';
COMMENT ON COLUMN bati_article_40."dnbcu8" IS 'Nombre de cuisines de moins de 9 m2';
COMMENT ON COLUMN bati_article_40."dnbcu9" IS 'Nombre  de  cuisines  d’au moins 9 m2';
COMMENT ON COLUMN bati_article_40."dnbsea" IS 'Nombre de salles d’eau';
COMMENT ON COLUMN bati_article_40."dnbann" IS 'Nombre de pièces annexes';
COMMENT ON COLUMN bati_article_40."dnbpdc" IS 'Nombre de pièces';
COMMENT ON COLUMN bati_article_40."dsupdc" IS 'Superficie des pièces';
COMMENT ON COLUMN bati_article_40."dmatgm" IS 'Matériaux des gros murs';
COMMENT ON COLUMN bati_article_40."dmatto" IS 'Matériaux des toitures';
COMMENT ON COLUMN bati_article_40."jannat" IS 'Année d’achèvement';
COMMENT ON COLUMN bati_article_40."detent" IS 'état d’entretien';
COMMENT ON COLUMN bati_article_40."dnbniv" IS 'Nombre de niveaux';
COMMENT ON COLUMN bati_article_40."filler02" IS '';
