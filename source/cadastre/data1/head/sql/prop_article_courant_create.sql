-- Suppression de la table prop_article_courant
DROP TABLE IF EXISTS prop_article_courant;
-- Creation de la table prop_article_courant
CREATE TABLE prop_article_courant (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"cgroup" CHARACTER VARYING(1) NOT NULL,
"dnumcp" CHARACTER VARYING(5) NOT NULL,
"dnulp" CHARACTER VARYING(2) NOT NULL,
"ccocif" CHARACTER VARYING(4) NOT NULL,
"dnuper" CHARACTER VARYING(6) NOT NULL,
"ccodro" CHARACTER VARYING(1) NOT NULL,
"ccodem" CHARACTER VARYING(1) NOT NULL,
"gdesip" CHARACTER VARYING(1) NOT NULL,
"gtoper" CHARACTER VARYING(1) NOT NULL,
"ccoqua" CHARACTER VARYING(1) NOT NULL,
"gnexcf" CHARACTER VARYING(2) NOT NULL,
"dtaucf" CHARACTER VARYING(3) NOT NULL,
"dnatpr" CHARACTER VARYING(3) NOT NULL,
"ccogrm" CHARACTER VARYING(2) NOT NULL,
"dsglpm" CHARACTER VARYING(10) NOT NULL,
"dforme" CHARACTER VARYING(7) NOT NULL,
"ddenom" CHARACTER VARYING(60) NOT NULL,
"gtyp3" CHARACTER VARYING(1) NOT NULL,
"gtyp4" CHARACTER VARYING(1) NOT NULL,
"gtyp5" CHARACTER VARYING(1) NOT NULL,
"gtyp6" CHARACTER VARYING(1) NOT NULL,
"dlign3" CHARACTER VARYING(30) NOT NULL,
"dlign4" CHARACTER VARYING(36) NOT NULL,
"dlign5" CHARACTER VARYING(30) NOT NULL,
"dlign6" CHARACTER VARYING(32) NOT NULL,
"ccopay" CHARACTER VARYING(3) NOT NULL,
"ccodep1a2" CHARACTER VARYING(2) NOT NULL,
"ccodira" CHARACTER VARYING(1) NOT NULL,
"ccocom-adr" CHARACTER VARYING(3) NOT NULL,
"ccovoi" CHARACTER VARYING(5) NOT NULL,
"ccoriv" CHARACTER VARYING(4) NOT NULL,
"dnvoiri" CHARACTER VARYING(4) NOT NULL,
"dindic" CHARACTER VARYING(1) NOT NULL,
"ccopos" CHARACTER VARYING(5) NOT NULL,
"dnirpp" CHARACTER VARYING(10) NOT NULL,
"dqualp" CHARACTER VARYING(3) NOT NULL,
"dnomlp" CHARACTER VARYING(30) NOT NULL,
"dprnlp" CHARACTER VARYING(15) NOT NULL,
"jdatnss" CHARACTER VARYING(10) NOT NULL,
"dldnss" CHARACTER VARYING(58) NOT NULL,
"epxnee" CHARACTER VARYING(3) NOT NULL,
"dnomcp" CHARACTER VARYING(30) NOT NULL,
"dprncp" CHARACTER VARYING(15) NOT NULL,
"topcdi" CHARACTER VARYING(1) NOT NULL,
"oriard" CHARACTER VARYING(1) NOT NULL,
"fixard" CHARACTER VARYING(1) NOT NULL,
"datadr" CHARACTER VARYING(8) NOT NULL,
"topdec" CHARACTER VARYING(1) NOT NULL,
"datdec" CHARACTER VARYING(4) NOT NULL,
"dsiren" CHARACTER VARYING(10) NOT NULL,
"ccmm" CHARACTER VARYING(1) NOT NULL,
"topja" CHARACTER VARYING(1) NOT NULL,
"datja" CHARACTER VARYING(8) NOT NULL,
"filler1" CHARACTER VARYING(4) NOT NULL,
"anospi" CHARACTER VARYING(3) NOT NULL,
"cblpmo" CHARACTER VARYING(1) NOT NULL,
"gtodge" CHARACTER VARYING(1) NOT NULL,
"gpctf" CHARACTER VARYING(1) NOT NULL,
"gpctsb" CHARACTER VARYING(1) NOT NULL,
"jmodge" CHARACTER VARYING(2) NOT NULL,
"jandge" CHARACTER VARYING(4) NOT NULL,
"jantfc" CHARACTER VARYING(4) NOT NULL,
"jantbc" CHARACTER VARYING(4) NOT NULL,
"filler2" CHARACTER VARYING(39) NOT NULL);
-- Ajout des commentaires pour la table prop_article_courant
COMMENT ON COLUMN prop_article_courant."ccodep" IS 'code département';
COMMENT ON COLUMN prop_article_courant."ccodir" IS 'code direction';
COMMENT ON COLUMN prop_article_courant."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN prop_article_courant."cgroup" IS 'groupe de compte communal';
COMMENT ON COLUMN prop_article_courant."dnumcp" IS 'numéro d’ordre de compte';
COMMENT ON COLUMN prop_article_courant."dnulp" IS 'numéro de libellé partiel';
COMMENT ON COLUMN prop_article_courant."ccocif" IS 'code cdif';
COMMENT ON COLUMN prop_article_courant."dnuper" IS 'numéro de personne dans le cdif';
COMMENT ON COLUMN prop_article_courant."ccodro" IS 'code du droit réel ou parti- culier';
COMMENT ON COLUMN prop_article_courant."ccodem" IS 'code du démembrement/indivi-sion';
COMMENT ON COLUMN prop_article_courant."gdesip" IS 'indicateur du destinataire de l’avis d’imposition';
COMMENT ON COLUMN prop_article_courant."gtoper" IS 'indicateur de personne physi-que ou morale';
COMMENT ON COLUMN prop_article_courant."ccoqua" IS 'Code qualité de personne phy-sique';
COMMENT ON COLUMN prop_article_courant."gnexcf" IS 'code exo ecf';
COMMENT ON COLUMN prop_article_courant."dtaucf" IS 'taux exo ecf';
COMMENT ON COLUMN prop_article_courant."dnatpr" IS 'Code nature de personne physique ou morale';
COMMENT ON COLUMN prop_article_courant."ccogrm" IS 'Code groupe de personne morale';
COMMENT ON COLUMN prop_article_courant."dsglpm" IS 'sigle de personne morale';
COMMENT ON COLUMN prop_article_courant."dforme" IS 'forme juridique abrégée majic2';
COMMENT ON COLUMN prop_article_courant."ddenom" IS 'Dénomination de personne physique ou morale';
COMMENT ON COLUMN prop_article_courant."gtyp3" IS 'type de la 3eme ligne d’a-dresse';
COMMENT ON COLUMN prop_article_courant."gtyp4" IS 'Type de la 4eme ligne d’a-dresse';
COMMENT ON COLUMN prop_article_courant."gtyp5" IS 'type de la 5eme ligne d’a-dresse';
COMMENT ON COLUMN prop_article_courant."gtyp6" IS 'type de la 6eme ligne d’a-dresse';
COMMENT ON COLUMN prop_article_courant."dlign3" IS '3eme ligne d’adresse';
COMMENT ON COLUMN prop_article_courant."dlign4" IS '4eme ligne d’adresse';
COMMENT ON COLUMN prop_article_courant."dlign5" IS '5eme ligne d’adresse';
COMMENT ON COLUMN prop_article_courant."dlign6" IS '6eme ligne d’adresse';
COMMENT ON COLUMN prop_article_courant."ccopay" IS 'code de pays étranger et TOM';
COMMENT ON COLUMN prop_article_courant."ccodep1a2" IS 'Code département de l’adresse';
COMMENT ON COLUMN prop_article_courant."ccodira" IS 'Code direction de l’adresse';
COMMENT ON COLUMN prop_article_courant."ccocom-adr" IS 'Code commune de l’adresse';
COMMENT ON COLUMN prop_article_courant."ccovoi" IS 'Code majic2 de la voie';
COMMENT ON COLUMN prop_article_courant."ccoriv" IS 'Code rivoli de la voie';
COMMENT ON COLUMN prop_article_courant."dnvoiri" IS 'numéro de voirie';
COMMENT ON COLUMN prop_article_courant."dindic" IS 'indice de répétition de voirie';
COMMENT ON COLUMN prop_article_courant."ccopos" IS 'Code postal';
COMMENT ON COLUMN prop_article_courant."dnirpp" IS 'zone à blanc';
COMMENT ON COLUMN prop_article_courant."dqualp" IS 'Qualité abrégée';
COMMENT ON COLUMN prop_article_courant."dnomlp" IS 'Nom d’usage';
COMMENT ON COLUMN prop_article_courant."dprnlp" IS 'Prénoms associés au nom d’usage';
COMMENT ON COLUMN prop_article_courant."jdatnss" IS 'date de naissance';
COMMENT ON COLUMN prop_article_courant."dldnss" IS 'lieu de naissance';
COMMENT ON COLUMN prop_article_courant."epxnee" IS 'mention du complément';
COMMENT ON COLUMN prop_article_courant."dnomcp" IS 'Nom complément';
COMMENT ON COLUMN prop_article_courant."dprncp" IS 'Prénoms associés au complément';
COMMENT ON COLUMN prop_article_courant."topcdi" IS 'top transalp';
COMMENT ON COLUMN prop_article_courant."oriard" IS 'origine adresse';
COMMENT ON COLUMN prop_article_courant."fixard" IS 'pérennité adresse';
COMMENT ON COLUMN prop_article_courant."datadr" IS 'date adresse';
COMMENT ON COLUMN prop_article_courant."topdec" IS 'origine décès';
COMMENT ON COLUMN prop_article_courant."datdec" IS 'date de décès';
COMMENT ON COLUMN prop_article_courant."dsiren" IS 'numéro siren';
COMMENT ON COLUMN prop_article_courant."ccmm" IS 'création compte cadastral';
COMMENT ON COLUMN prop_article_courant."topja" IS 'indic jeune agriculteur';
COMMENT ON COLUMN prop_article_courant."datja" IS 'date jeune agriculteur';
COMMENT ON COLUMN prop_article_courant."filler1" IS '';
COMMENT ON COLUMN prop_article_courant."anospi" IS 'ano transalp';
COMMENT ON COLUMN prop_article_courant."cblpmo" IS 'code blocage caractère personne morale';
COMMENT ON COLUMN prop_article_courant."gtodge" IS 'top appartenance à la DGE';
COMMENT ON COLUMN prop_article_courant."gpctf" IS 'top paiement centralisé à la taxe foncière';
COMMENT ON COLUMN prop_article_courant."gpctsb" IS 'top paiement centralisé à la TSBCS';
COMMENT ON COLUMN prop_article_courant."jmodge" IS 'mois d’entrée à la DGE';
COMMENT ON COLUMN prop_article_courant."jandge" IS 'année d’entrée à la DGE';
COMMENT ON COLUMN prop_article_courant."jantfc" IS 'année d’entrée paiement TF';
COMMENT ON COLUMN prop_article_courant."jantbc" IS 'année d’entrée paiement TSBCS';
COMMENT ON COLUMN prop_article_courant."filler2" IS 'à blanc';
