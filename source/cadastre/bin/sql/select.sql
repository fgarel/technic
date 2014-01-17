
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

-- Parcelles
drop view if exists dgfip_parcelle cascade;
CREATE VIEW dgfip_parcelle AS
select
  concat(cgroup, dnumcp) as "numero_communal",
  dnuper as "prop_numero",
  ddenom as "prop_nom",
  --nbat_article_10.ccocom as pbd_commune,
  nbat_article_10.ccosec as pbd_section,
  ltrim(nbat_article_10.dnupla, '0') as pbd_numero,
  --concat(nbat_article_10.ccocom, ' ', nbat_article_10.ccosec, ' ', Ltrim(nbat_article_10.dnupla, '0')) as pbd_parcelle,
  ltrim(nbat_article_10.dnvoiri, '0') as pbd_numero_voirie,
  concat(nbat_article_10.cconvo, nbat_article_10.dvoilib) as pbd_adresse,
  nbat_article_10.ccoriv as pbd_code_rivoli--,
  --*
from nbat_article_10
inner join prop_article_courant on concat(prop_article_courant.cgroup, prop_article_courant.dnumcp) = nbat_article_10.dnupro
--WHERE prop_article_courant.ddenom like '%COMMUNE DE LA ROCHELLE%'
--WHERE prop_article_courant.ddenom like '%GAREL/FREDERIC%'
order by
  pbd_section,
  cast(nbat_article_10.dnupla as int)
;


-- Batiments
drop view if exists dgfip_batiment cascade;
CREATE VIEW dgfip_batiment AS
select distinct
  concat(cgroup, dnumcp) as "numero_communal",
  dnuper as "prop_numero",
  ddenom as "prop_nom",
  --nbat_article_10.ccocom as pbd_commune,
  nbat_article_10.ccosec as pbd_section,
  cast(ltrim(nbat_article_10.dnupla, '0') as int) as pbd_numero,
  --concat(nbat_article_10.ccocom, ' ', nbat_article_10.ccosec, ' ', Ltrim(nbat_article_10.dnupla, '0')) as pbd_parcelle,
  ltrim(nbat_article_10.dnvoiri, '0') as pbd_numero_voirie,
  concat(bati_article_00.dvoilib) as pbd_adresse,
  nbat_article_10.ccoriv as pbd_code_rivoli,
  bati_article_00.dnubat as pbi_bat--, -- Numéro du batiment
from bati_article_00
  join nbat_article_10 on (bati_article_00.ccosec = nbat_article_10.ccosec and bati_article_00.dnupla = nbat_article_10.dnupla)
  join prop_article_courant on concat(prop_article_courant.cgroup, prop_article_courant.dnumcp) = nbat_article_10.dnupro
  left join bati_article_10 on bati_article_00.invar = bati_article_10.invar
--WHERE prop_article_courant.ddenom like '%COMMUNE DE LA ROCHELLE%'
--WHERE prop_article_courant.ddenom like '%GAREL/FREDERIC%'
--WHERE prop_article_courant.ddenom like '%COPROP IMM 7B RUE DES FONDERIES%'
order by
  pbd_section,
  pbd_numero,
  pbi_bat
;


-- Locaux
drop view if exists dgfip_local cascade;
CREATE VIEW dgfip_local AS
select
  concat(cgroup, dnumcp) as "numero_communal",
  dnuper as "prop_numero",
  ddenom as "prop_nom",
  --nbat_article_10.ccocom as pbd_commune,
  nbat_article_10.ccosec as pbd_section,
  ltrim(nbat_article_10.dnupla, '0') as pbd_numero,
  --concat(nbat_article_10.ccocom, ' ', nbat_article_10.ccosec, ' ', Ltrim(nbat_article_10.dnupla, '0')) as pbd_parcelle,
  ltrim(nbat_article_10.dnvoiri, '0') as pbd_numero_voirie,
  concat(bati_article_00.dvoilib) as pbd_adresse,
  nbat_article_10.ccoriv as pbd_code_rivoli,
  bati_article_00.dnubat as pbi_bat, -- Numéro du batiment
  bati_article_00.desc as pbi_ent, -- Numéro d'entrée / d'escalier
  bati_article_00.dniv as pbi_niv, -- Numéro du niveau
  bati_article_00.dpor as pbi_porte, -- Numéro de la porte
  --bati_article_00.invar as pbi_invar,
  --bati_article_00.cleinvar as pbi_cleinvar,
  concat(substring(bati_article_00.invar from 4),bati_article_00.cleinvar) as pbi_invariant--,
  --bati_article_21.dnupev as pbe_pev--,
  --*
from bati_article_00
  join nbat_article_10 on (bati_article_00.ccosec = nbat_article_10.ccosec and bati_article_00.dnupla = nbat_article_10.dnupla)
  join prop_article_courant on concat(prop_article_courant.cgroup, prop_article_courant.dnumcp) = nbat_article_10.dnupro
  left join bati_article_10 on bati_article_00.invar = bati_article_10.invar
--WHERE prop_article_courant.ddenom like '%COMMUNE DE LA ROCHELLE%'
--WHERE prop_article_courant.ddenom like '%GAREL/FREDERIC%'
--WHERE prop_article_courant.ddenom like '%COPROP IMM 7B RUE DES FONDERIES%'
order by
  pbd_section,
  cast(nbat_article_10.dnupla as int),
  pbi_bat,
  pbi_ent,
  pbi_niv,
  pbi_porte
;


-- pev de la rochelle
-- pev de la rochelle
drop view if exists dgfip_pev cascade;
CREATE VIEW dgfip_pev AS
select
  concat(cgroup, dnumcp) as "numero_communal",
  dnuper as "prop_numero",
  ddenom as "prop_nom",
  --nbat_article_10.ccocom as pbd_commune,
  nbat_article_10.ccosec as pbd_section,
  ltrim(nbat_article_10.dnupla, '0') as pbd_numero,
  --concat(nbat_article_10.ccocom, ' ', nbat_article_10.ccosec, ' ', Ltrim(nbat_article_10.dnupla, '0')) as pbd_parcelle,
  ltrim(nbat_article_10.dnvoiri, '0') as pbd_numero_voirie,
  concat(bati_article_00.dvoilib) as pbd_adresse,
  nbat_article_10.ccoriv as pbd_code_rivoli,
  bati_article_00.dnubat as pbi_bat, -- Numéro du batiment
  bati_article_00.desc as pbi_ent, -- Numéro d'entrée / d'escalier
  bati_article_00.dniv as pbi_niv, -- Numéro du niveau
  bati_article_00.dpor as pbi_porte, -- Numéro de la porte
  --bati_article_00.invar as pbi_invar,
  --bati_article_00.cleinvar as pbi_cleinvar,
  concat(substring(bati_article_00.invar from 4),bati_article_00.cleinvar) as pbi_invariant,
  --bati_article_21.dnupev as pbe_pev--,
  bati_article_21.dnupev as pbe_pev,
  bati_article_21.dnuref as pbe_numero_local_type,
  bati_article_21.ccostb as pbe_lettre_serie_tarif, -- Lettre de série tarif bati
  bati_article_10.ccoeva as pbe_methode_evaluation, -- Methode evaluation
  bati_article_21.ccoaff as pbe_affectation_code, -- Affectation de la pev
  ccoaff_signification as pbe_affectation, -- Affectation de la pev
  CASE
    WHEN bati_article_10.cconlc='DE' THEN bati_article_60.cconad -- nature de la dependance
    ELSE bati_article_10.cconlc                                  -- nature du local
  END as pbe_nature_local_code,
  CASE
    WHEN bati_article_10.cconlc='DE' THEN cconad_signification -- nature de la dependance
    ELSE cconlc_signification                                  -- nature du local
  END as pbe_nature_local_signification,
  --cconlc_signification as pbe_nature_local_signification_1, -- Nature du local
  --cconad_signification as pbe_nature_local_signification_2, -- Nature du local
  --bati_article_10.cconlc as pbe_nature_local_1, -- Nature du local
  --bati_article_60.cconad as pbe_nature_local_1, -- Nature du local
  bati_article_21.dcapec as pbe_categorie, -- Categorie
  ltrim(bati_article_36.bipevlac, '0') as pbd_revenu_cadastral_control, -- Revenu_cadastral
  --ceiling(cast(ltrim(bati_article_21.dvlpera, '0') as int) / 2.0) as pbe_revenu_cadastral_controle, -- Revenu_cadastral
  bati_article_10.gtauom as pbe_taux_om--,
  --bati_article_60.*
  --*
from bati_article_00
  join nbat_article_10 on (bati_article_00.ccosec = nbat_article_10.ccosec and bati_article_00.dnupla = nbat_article_10.dnupla)
  join prop_article_courant on concat(prop_article_courant.cgroup, prop_article_courant.dnumcp) = nbat_article_10.dnupro
  join bati_article_10 on bati_article_00.invar = bati_article_10.invar
  join bati_article_21 on bati_article_00.invar = bati_article_21.invar
  left join bati_article_30 on bati_article_00.invar = bati_article_30.invar
  join bati_article_36 on (bati_article_21.invar = bati_article_36.invar and bati_article_21.dnupev = bati_article_36.dnupev)
  left join bati_article_40 on bati_article_00.invar = bati_article_40.invar
  left join bati_article_50 on bati_article_00.invar = bati_article_50.invar
  left join bati_article_60 on (bati_article_21.invar = bati_article_60.invar and bati_article_21.dnupev = bati_article_60.dnupev)
  left join liste_ccoaff on bati_article_21.ccoaff = liste_ccoaff.ccoaff
  left join liste_cconlc on bati_article_10.cconlc = liste_cconlc.cconlc
  left join liste_cconad on bati_article_60.cconad = liste_cconad.cconad
--WHERE prop_article_courant.ddenom like '%COMMUNE DE LA ROCHELLE%'
--WHERE prop_article_courant.ddenom like '%GAREL/FREDERIC%'
--WHERE prop_article_courant.ddenom like '%COPROP IMM 7B RUE DES FONDERIES%'
order by
  pbd_section,
  cast(nbat_article_10.dnupla as int),
  pbi_bat,
  pbi_ent,
  pbi_niv,
  pbi_porte
;

drop view if exists vlr_dgfip_parcelle;
create view vlr_dgfip_parcelle as
select 
  cast('300' as int) as pbd_commune,
  pbd_section,
  pbd_numero,
  concat('300', ' ', pbd_section, ' ', pbd_numero) as pbd_parcelle,
  ltrim(concat(pbd_numero_voirie, ' ', pbd_adresse)) as pbd_adresse
from dgfip_parcelle
where prop_nom like '%COMMUNE DE LA ROCHELLE%';


drop view if exists vlr_dgfip_batiment;
create view vlr_dgfip_batiment as
select
  cast('300' as int) as pbd_commune,
  pbd_section,
  pbd_numero,
  concat('300', ' ', pbd_section, ' ', pbd_numero) as pbd_parcelle,
  pbi_bat,
  ltrim(concat(pbd_numero_voirie, ' ', pbd_adresse)) as pbd_adresse
from dgfip_batiment
where prop_nom like '%COMMUNE DE LA ROCHELLE%';

drop view if exists vlr_dgfip_local;
create view vlr_dgfip_local as
select
  cast('300' as int) as pbd_commune,
  pbd_section,
  pbd_numero,
  concat('300', ' ', pbd_section, ' ', pbd_numero) as pbd_parcelle,
  pbi_bat,
  pbi_invariant,
  ltrim(concat(pbd_numero_voirie, ' ', pbd_adresse)) as pbd_adresse
from dgfip_local
where prop_nom like '%COMMUNE DE LA ROCHELLE%';


drop view if exists vlr_dgfip_pev;
create view vlr_dgfip_pev as
select
  cast('300' as int) as pbd_commune,
  pbd_section,
  pbd_numero,
  concat('300', ' ', pbd_section, ' ', pbd_numero) as pbd_parcelle,
  pbi_bat,
  pbi_invariant,
  pbe_pev,
  pbe_nature_local_code,
  pbe_nature_local_signification,
  ltrim(concat(pbd_numero_voirie, ' ', pbd_adresse)) as pbd_adresse
from dgfip_pev
where prop_nom like '%COMMUNE DE LA ROCHELLE%';

drop view if exists dgfip_compte_communal cascade;
create view dgfip_compte_communal as
select
  concat(prop2.cgroup, prop2.dnumcp) as "numero_communal",
  prop2.dnulp as "prop_ordre_dans_compte",
  --prop1.dnuper as "prop_numero_1",
  prop1.ddenom as "prop_nom_1",
  --prop1.dqualp,
  --prop1.dnomlp,
  --prop1.dprnlp, 
  --prop1.jdatnss,
  prop2.dnuper as "prop_numero",
  prop2.ddenom as "prop_nom",
  prop2.ccodro as "droit_code",
  ccodro_signification as "droit_libelle",
  prop2.ccodem as "demembrement_code",
  ccodem_signification as "demembrement_libelle",
  prop2.dqualp as "personne_physique_qualite",
  prop2.dnomlp as "personne_physique_nom",
  prop2.dprnlp as "personne_physique_prenom", 
  prop2.jdatnss as "personne_physique_date_naissance",
  prop2.dnatpr as "nature_personne_code",
  dnatpr_signification as "nature_personne_libelle",
  prop2.ccogrm as "personne_morale_groupe_code",
  ccogrm_signification as "personne_morale_groupe_libelle",
  prop2.dforme as "forme_juridique_code",
  formjur as "forme_juridique_libelle_simplifie",
  prop2.dformjur as "forme_juridique_libelle_simplifie_controle",
  libformjur as "forme_juridique_libelle_complet",
  prop2.dsiren as "personne_morale_siren"--,
  --prop2.*
from prop_article_courant as prop1
join prop_article_courant as prop2 on (concat(prop1.cgroup, prop1.dnumcp) = concat(prop2.cgroup, prop2.dnumcp))
left join liste_ccodro on prop2.ccodro = liste_ccodro.ccodro
left join liste_ccodem on prop2.ccodem = liste_ccodem.ccodem
left join liste_dnatpr on prop2.dnatpr = liste_dnatpr.dnatpr
left join liste_ccogrm on prop2.ccogrm = liste_ccogrm.ccogrm
left join liste_dformjur on rtrim(prop2.dforme) = liste_dformjur.dformjur
--WHERE prop1.ddenom LIKE '%GAREL/FREDERIC%'
--WHERE prop1.ddenom LIKE '%COMMUNE DE LA ROCHELLE%'
order by
  numero_communal,
  prop_ordre_dans_compte
;

drop view if exists vlr_dgfip_compte_communal;
create view vlr_dgfip_compte_communal as
select
  "numero_communal",
  "prop_ordre_dans_compte",
  "prop_numero",
  "prop_nom",
  "droit_code",
  "droit_libelle",
  "demembrement_code",
  "demembrement_libelle",
  "personne_physique_qualite",
  "personne_physique_nom",
  "personne_physique_prenom", 
  "personne_physique_date_naissance",
  "nature_personne_code",
  "nature_personne_libelle",
  "personne_morale_groupe_code",
  "personne_morale_groupe_libelle",
  "forme_juridique_code",
  "forme_juridique_libelle_simplifie",
  "forme_juridique_libelle_simplifie_controle",
  "forme_juridique_libelle_complet",
  "personne_morale_siren"--,
from dgfip_compte_communal
WHERE prop_nom_1 LIKE '%COMMUNE DE LA ROCHELLE%'
;




drop view if exists dgfip_pdl cascade;
create view dgfip_pdl as
select
  concat(prop1.cgroup, prop1.dnumcp) as "numero_communal",
  prop1.dnulp as "prop_ordre_dans_compte",
  --prop1.dnuper as "prop_numero_1",
  prop1.ddenom as "prop_nom_1",
  --prop1.dqualp,
  --prop1.dnomlp,
  --prop1.dprnlp, 
  --prop1.jdatnss,
  prop1.dnuper as "prop_numero",
  prop1.ddenom as "prop_nom"--,
  --prop2.*
from prop_article_courant as prop1
  join pdl_article_10 on (concat(prop1.cgroup, prop1.dnumcp) = pdl_article_10.dnupro)

--WHERE prop1.ddenom LIKE '%GAREL/FREDERIC%'
--WHERE prop1.ddenom LIKE '%COMMUNE DE LA ROCHELLE%'
order by
  numero_communal,
  prop_ordre_dans_compte
--limit 100
;


