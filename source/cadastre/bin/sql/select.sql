
--select * from point;

--select x,y,st_asewkt(the_geom) from point;
--select
--  x,
--  y,
--  st_asewkt(the_geom), 
--  st_asewkt(st_transform(the_geom, 2154))
--from point;


-- verification
--select
--  x,
--  y,
--  st_asewkt(the_geom), 
--  st_asewkt(st_transform(the_geom, 2154))
--from point;

-- -------------------------------
-- controle de l'import : comptage
-- -------------------------------
DROP TABLE "comptage";
CREATE TABLE "comptage" (
nb_enreg INTEGER,
nom_table CHARACTER VARYING(256) NOT NULL
);
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_direction), 'bati_article_direction');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_00), 'bati_article_00');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_10), 'bati_article_10');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_21), 'bati_article_21');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_30), 'bati_article_30');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_36), 'bati_article_36');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_40), 'bati_article_40');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_50), 'bati_article_50');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_60), 'bati_article_60');
INSERT INTO comptage VALUES ((select count(1) FROM bati_article_99), 'bati_article_99');

INSERT INTO comptage VALUES ((select count(1) FROM fanr_article_commune), 'fanr_article_commune');
INSERT INTO comptage VALUES ((select count(1) FROM fanr_article_direction), 'fanr_article_direction');
INSERT INTO comptage VALUES ((select count(1) FROM fanr_article_voie), 'fanr_article_voie');

INSERT INTO comptage VALUES ((select count(1) FROM nbat_article_direction), 'nbat_article_direction');
INSERT INTO comptage VALUES ((select count(1) FROM nbat_article_10), 'nbat_article_10');
INSERT INTO comptage VALUES ((select count(1) FROM nbat_article_21), 'nbat_article_21');
INSERT INTO comptage VALUES ((select count(1) FROM nbat_article_30), 'nbat_article_30');
INSERT INTO comptage VALUES ((select count(1) FROM nbat_article_36), 'nbat_article_36');
INSERT INTO comptage VALUES ((select count(1) FROM nbat_article_99), 'nbat_article_99');

INSERT INTO comptage VALUES ((select count(1) FROM pdl_article_direction), 'pdl_article_direction');
INSERT INTO comptage VALUES ((select count(1) FROM pdl_article_10), 'pdl_article_10');
INSERT INTO comptage VALUES ((select count(1) FROM pdl_article_20), 'pdl_article_20');
INSERT INTO comptage VALUES ((select count(1) FROM pdl_article_30), 'pdl_article_30');

INSERT INTO comptage VALUES ((select count(1) FROM prop_article_direction), 'prop_article_direction');
INSERT INTO comptage VALUES ((select count(1) FROM prop_article_courant), 'prop_article_courant');

INSERT INTO comptage VALUES ((select count(1) FROM revdi_article_direction), 'revdi_article_direction');
INSERT INTO comptage VALUES ((select count(1) FROM revdi_article_lotlocal), 'revdi_article_lotlocal');


-- -------------------------------
-- vacuum
-- -------------------------------
-- il faut realiser un vacuum sur la base
-- 43 s
--vacuum full analyse;

-- 38 s
--vacuum analyse;

-- 37 s
--analyse;

-- 6 s
vacuum full;

-- 60 ms
--vacuum;

-- ----------------
-- creation d'index
-- ----------------
-- ---------------------
-- table bati_article_00
-- ---------------------

-- le champ invar est l'identifiant de bati_article_00
select count(invar) from bati_article_00;
--select count(distinct invar) from bati_article_00;

-- pour créer la cle primaire
ALTER TABLE bati_article_00 DROP CONSTRAINT if exists b_00_invar;
ALTER TABLE bati_article_00 ADD CONSTRAINT b_00_invar PRIMARY KEY (invar);


-- ---------------------
-- table bati_article_10
-- ---------------------

-- le champ invar est l'identifiant de bati_article_10
--select count(invar) from bati_article_10;
--select count(distinct invar) from bati_article_10;

-- pour créer la cle primaire
ALTER TABLE bati_article_10 DROP CONSTRAINT if EXISTS b_10_invar;
ALTER TABLE bati_article_10 ADD CONSTRAINT b_10_invar PRIMARY KEY (invar);



-- ----------------------------
-- selection affichée à l'ecran
-- ----------------------------
-- selection des proprietaires "GAREL Frédéric";
select
  ddenom,
  dnuper,
  dqualp,
  dnomlp,
  dprnlp, 
  jdatnss
from prop_article_courant
WHERE "ddenom" LIKE '%GAREL/FREDERIC%';

-- ------------------------------
-- selection stockee dans une vue
-- ------------------------------
-- selection des proprietaires "commune de La Rochelle";
-- et sauvegarde du resultat dans une vue
-- qui sera facilement exportee par la suite
CREATE VIEW vue_001 AS
SELECT
  ddenom,
  dnuper,
  dqualp,
  dnomlp,
  dprnlp, 
  jdatnss
FROM prop_article_courant
WHERE "ddenom" LIKE '%COMMUNE DE LA ROCHELLE%';

-- Selection de prop_article_courant
CREATE VIEW vue_002 AS
select 
  ccodep, -- code département
  ccodir, -- code direction
  ccocom, -- code commune INSEE
  cgroup_signification, -- groupe de compte communal
  dnumcp, -- numéro d’ordre de compte
  dnulp, -- numéro de libellé partiel
  ccocif, -- code cdif
  dnuper, -- numéro de personne dans le cdif
  ccodro_signification, -- code du droit réel ou parti- culier
  ccodem_signification, -- code du démembrement/indivi-sion
  gdesip, -- indicateur du destinataire de l’avis d’imposition
  gtoper_signification, -- indicateur de personne physi-que ou morale
  ccoqua_signification, -- Code qualité de personne phy-sique
  gnexcf, -- code exo ecf
  dtaucf, -- taux exo ecf
  dnatpr, -- Code nature de personne physique ou morale
  ccogrm_signification, -- Code groupe de personne morale
  dsglpm, -- sigle de personne morale
  dforme, -- forme juridique abrégée majic2
  ddenom, -- Dénomination de personne physique ou morale
  gtyp3, -- type de la 3eme ligne d’a-dresse
  gtyp4, -- Type de la 4eme ligne d’a-dresse
  gtyp5, -- type de la 5eme ligne d’a-dresse
  gtyp6, -- type de la 6eme ligne d’a-dresse
  dlign3, -- 3eme ligne d’adresse
  dlign4, -- 4eme ligne d’adresse
  dlign5, -- 5eme ligne d’adresse
  dlign6, -- 6eme ligne d’adresse
  ccopay, -- code de pays étranger et TOM
  ccodep1a2, -- Code département de l’adresse
  ccodira, -- Code direction de l’adresse
  "ccocom-adr", -- Code commune de l’adresse
  ccovoi, -- Code majic2 de la voie
  ccoriv, -- Code rivoli de la voie
  dnvoiri, -- numéro de voirie
  dindic, -- indice de répétition de voirie
  ccopos, -- Code postal
  dnirpp, -- zone à blanc
  dqualp, -- Qualité abrégée
  dnomlp, -- Nom d’usage
  dprnlp, -- Prénoms associés au nom d’usage
  jdatnss, -- date de naissance
  dldnss, -- lieu de naissance
  epxnee, -- mention du complément
  dnomcp, -- Nom complément
  dprncp, -- Prénoms associés au complément
  topcdi, -- top transalp
  oriard, -- origine adresse
  fixard, -- pérennité adresse
  datadr, -- date adresse
  topdec, -- origine décès
  datdec, -- date de décès
  dsiren, -- numéro siren
  ccmm, -- création compte cadastral
  topja, -- indic jeune agriculteur
  datja, -- date jeune agriculteur
  filler1,
  anospi, -- ano transalp
  cblpmo, -- code blocage caractère personne morale
  gtodge, -- top appartenance à la DGE
  gpctf, -- top paiement centralisé à la taxe foncière
  gpctsb, -- top paiement centralisé à la TSBCS
  jmodge, -- mois d’entrée à la DGE
  jandge, -- année d’entrée à la DGE
  jantfc, -- année d’entrée paiement TF
  jantbc, -- année d’entrée paiement TSBCS
  filler2
from prop_article_courant
left join liste_cgroup on prop_article_courant.cgroup = liste_cgroup.cgroup
left join liste_ccodro on prop_article_courant.ccodro = liste_ccodro.ccodro
left join liste_ccodem on prop_article_courant.ccodem = liste_ccodem.ccodem
left join liste_gtoper on prop_article_courant.gtoper = liste_gtoper.gtoper
left join liste_ccoqua on prop_article_courant.ccoqua = liste_ccoqua.ccoqua
left join liste_ccogrm on prop_article_courant.ccogrm = liste_ccogrm.ccogrm
WHERE "ddenom" LIKE '%COMMUNE DE LA ROCHELLE%';

CREATE VIEW ex_bati_article_00 AS
select
  ccodep, -- code département
  ccodir, -- code direction
  ccocom, -- code commune INSEE
  invar, -- numéro invariant
  --filler01,
  cenr, -- code enregistrement
  --filler02,
  --ccopre, -- préfixe de section ou quartier servi pour les communes associées,
  ccosec, -- lettres de section
  dnupla, -- numéro de plan
  --filler03,
  dnubat, -- lettre de bâtiment
  "desc", -- numéro d’entrée
  dniv, -- niveau étage
  dpor, -- numéro de local
  ccoriv, -- Code Rivoli de la voie
  --filler04,
  ccovoi, -- Code Majic2 de la voie
  dnvoiri, -- Numéro de voirie
  dindic, -- indice de répétition
  --ccocif, -- code du cdi/cdif (code topad)
  dvoilib, -- libelle de la voie
  cleinvar--, -- clé alpha no invariant
  --locinc--, -- code local sans évaluation
  --filler05
from bati_article_00
limit 100;

CREATE VIEW ex_bati_article_10 AS
SELECT
  ccodep, -- code département
  ccodir, -- code direction
  ccocom, -- code commune INSEE
  invar, -- numéro invariant
  --filler01,
   cenr, -- code enregistrement
  --filler02,
  gpdl, -- indicateur d’appartenance à un lot de pdl
  dsrpar, -- lettre de série rôle
  dnupro, -- compte communal de propriétaire
  jdatat, -- date d’acte de mutation
  dnufnl, -- compte communal de fonctionnaire logé
  ccoeva_signification, -- code évaluation
  ccitlv, -- local imposable à la taxe sur les locaux vacants
  dteloc_signification, -- type de local
  gtauom, -- zone  de ramassage des ordures ménagères
  dcomrd, -- Pourcentage de réduction sur tom
  ccoplc_signification, -- Code de construction particulière
  cconlc_signification, -- Code nature de local
  dvltrt, -- Valeur locative totale retenue pour le local
  ccoape, -- Code NAF pour les locaux professionnels
  cc48lc, -- Catégorie de loi de 48
  dloy48a, -- Loyer de 48 en valeur de l’année
  top48a, -- top taxation indiquant si la pev est impose au loyer ou a la vl
  dnatlc_signification, -- Nature d occupation
  dnupas, -- no passerelle TH/TP
  gnexcf, -- code nature exo ecf
  dtaucf, -- taux exo ecf
  cchpr, -- Top indiquant une mutation propriétaire
  jannat, -- Année de construction
  dnbniv, -- Nombre de niveaux de la construction
  hlmsem, -- Local appartenant à hlm ou sem
  postel, -- Local de Poste ou France Telecom
  dnatcg, -- Code  nature du changement évaluation
  jdatcgl, -- date constatation changement
  dnutbx, -- no gestionnaire déclarant taxe bureaux
  dvltla, -- VL totale du local actualisée
  janloc, -- Année de création du local
  ccsloc, -- Code cause création du local
  fburx, -- Indicateur présence bureaux
  gimtom, -- Indicateur imposition OM exploitable à partir de 2002
  cbtabt, -- Code exonération HLM zone sensible
  jdtabt, -- Année début d’exonération ZS
  jrtabt, -- Année fin d’exonération ZS
  cconac, -- Code NACE pour les locaux professionnels
  filler03
from bati_article_10
left join liste_ccoeva on bati_article_10.ccoeva = liste_ccoeva.ccoeva
left join liste_dteloc on bati_article_10.dteloc = liste_dteloc.dteloc
left join liste_ccoplc on bati_article_10.ccoplc = liste_ccoplc.ccoplc
left join liste_cconlc on bati_article_10.cconlc = liste_cconlc.cconlc
left join liste_dnatlc on bati_article_10.dnatlc = liste_dnatlc.dnatlc
limit 100;

CREATE VIEW ex_bati_article_21 AS
SELECT
  *
FROM bati_article_21
limit 100;

CREATE VIEW ex_bati_article_30 AS
SELECT
  *
FROM bati_article_30
limit 100;

CREATE VIEW ex_bati_article_36 AS
SELECT
  *
FROM bati_article_36
limit 100;


CREATE VIEW ex_bati_article_40 AS
SELECT
  *
FROM bati_article_40
limit 100;

CREATE VIEW ex_bati_article_50 AS
SELECT
  *
FROM bati_article_50
limit 100;

CREATE VIEW ex_bati_article_60 AS
SELECT
  *
FROM bati_article_60
limit 100;



CREATE VIEW local AS
SELECT
  bati_article_00.*,
  bati_article_10.*
FROM bati_article_00
left join bati_article_10 on bati_article_00.invar = bati_article_10.invar
WHERE bati_article_10."ccosec" == 'CH'
  AND bati_article_10."dnupla" == "0385";

CREATE VIEW pev AS
SELECT
  bati_article_21.*
FROM bati_article_21
limit 100;


