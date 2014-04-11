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
--select count(invar) from bati_article_00;
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
/*select
  ddenom,
  dnuper,
  dqualp,
  dnomlp,
  dprnlp, 
  jdatnss
from prop_article_courant
WHERE "ddenom" LIKE '%GAREL/FREDERIC%';
*/

-- ---------------------------------
-- selections stockees dans des vues
-- ---------------------------------

-- ----------------
-- Compte communaux
-- ----------------

ALTER ROLE contrib
  SET search_path TO cadastre_travail, cadastre_majic, cadastre_public, public;

-- -----------------
-- Comptes communaux
-- -----------------
-- A partir de prop_article_courant
-- creation de tables permettant de manipuler les comptes propriétaires (compte communal)


-- la table dgfip_compte_communal contient une extration de prop_article_courant
-- avec en plus un numero_communal, qui sera indexé pour améliorer les performances
drop table if exists cadastre_travail.dgfip_compte_communal cascade;
create table cadastre_travail.dgfip_compte_communal as
select distinct
  cast(concat(prop2.cgroup, prop2.dnumcp) as VARCHAR(6)) as "numero_communal",
  prop2.dnulp as "prop_ordre_dans_compte",
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
  --liste_dformjur.formjur as "forme_juridique_libelle_simplifie",
  prop2.dformjur as "forme_juridique_libelle_simplifie_controle",
  libformjur as "forme_juridique_libelle_complet",
  prop2.dsiren as "personne_morale_siren"--,
  --prop2.*

from prop_article_courant as prop2
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

-- indexation de la table dgfip_compte_communal

DROP INDEX if exists cc_numero_communal;
CREATE INDEX cc_numero_communal
  ON dgfip_compte_communal
  USING btree
  (numero_communal COLLATE pg_catalog."default" );
DROP INDEX if exists cc_prop_numero;
CREATE INDEX cc_prop_numero
  ON dgfip_compte_communal
  USING btree
  (prop_numero COLLATE pg_catalog."default" );


--vacuum full analyse cadastre_travail.dgfip_compte_communal;


-- recherche du nombre de membres pouvant etre compté dans un compte communal

/*
select
  numero_communal,
  count(prop_numero) as nombre
from dgfip_compte_communal
group by numero_communal
order by  nombre desc;

select *
from dgfip_compte_communal
where numero_communal = 'A01985';
*/


-- Les requetes ci-dessus montrent qu'un propriétaire est impliqué dans plusieurs comptes communaux.
-- Dans la table, un compte communal est répété sur deux lignes si ce compte englobe 2 personnes différentes.
-- Cependant, il serait interressant d'avoir une autre table, que l'on va appelé dgfip_compte_communal_membre
-- dont le nombre de lignes correspond au nombre de compte.
-- C'est ce travail que nous allons faire ci-dessous.
-- On cherche les comptes communaux dont le propriétaire est l'un des membres
-- un compte communal englobe un ou plusieurs propriétaires
-- Ici, nous avons commencé nos recherches de compte communaux allant jusqu'a huit membres,
-- en allant du plus grand au plus petit.
-- Il faut en effet faire cette recherche dans ce sens, car par exmple,
-- un compte communal qui a 3 membres est aussi un compte communal qui a 2 membres...
-- l'astuce est donc de faire dans l'ordre :
--   1 lister les comptes à trois membres
--   2 lister les comptes à deux membres et qui ne sont pas des comptes à 3 membres
--   3 lister les comptes a un membre et qui ne sont pas des comptes à deux membres ni des comptes à 3 membres
-- Quand on concatene les differentes tables de x membres, on obtient la table
-- dgfip_compte_communal_membre

-- controle du nombre de compte communaux
--         table          |  count  | k x count
--                     un |  17 450 |  17 450
--                   deux |  14 980 |  29 960
--                  trois |   1 979 |   5 937
--                 quatre |     897 |   3 588
--                   cinq |     351 |   1 755
--                    six |     295 |   1 770
--                   sept |       0 |       0
--                   huit |       0 |       0
--        compte_communal |  35 952 |
-- compte_communal_membre |         |  60 460


-- selection des comptes à 8 membres
drop table if exists cadastre_travail.dgfip_compte_communal_membre_huit;
create table cadastre_travail.dgfip_compte_communal_membre_huit as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, '] / ',
         rtrim(t2.prop_nom), ' [', t2.droit_code, ' : ', t2.droit_libelle, '] / ',
         rtrim(t3.prop_nom), ' [', t3.droit_code, ' : ', t3.droit_libelle, '] / ',
         rtrim(t4.prop_nom), ' [', t4.droit_code, ' : ', t4.droit_libelle, '] / ',
         rtrim(t5.prop_nom), ' [', t5.droit_code, ' : ', t5.droit_libelle, '] / ',
         rtrim(t6.prop_nom), ' [', t6.droit_code, ' : ', t6.droit_libelle, '] / ',
         rtrim(t7.prop_nom), ' [', t7.droit_code, ' : ', t7.droit_libelle, '] / ',
         rtrim(t8.prop_nom), ' [', t8.droit_code, ' : ', t8.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   inner join dgfip_compte_communal as t2 on t1.numero_communal = t2.numero_communal
   inner join dgfip_compte_communal as t3 on t1.numero_communal = t3.numero_communal
   inner join dgfip_compte_communal as t4 on t1.numero_communal = t4.numero_communal
   inner join dgfip_compte_communal as t5 on t1.numero_communal = t5.numero_communal
   inner join dgfip_compte_communal as t6 on t1.numero_communal = t6.numero_communal
   inner join dgfip_compte_communal as t7 on t1.numero_communal = t7.numero_communal
   inner join dgfip_compte_communal as t8 on t1.numero_communal = t8.numero_communal
WHERE 
   t1.prop_numero < t2.prop_numero
   and t2.prop_numero < t3.prop_numero
   and t3.prop_numero < t4.prop_numero
   and t4.prop_numero < t5.prop_numero
   and t5.prop_numero < t6.prop_numero
   and t6.prop_numero < t7.prop_numero
   and t7.prop_numero < t8.prop_numero
;


-- selection des comptes à 7 membres
-- attention, ici il faut enlever les comptes deja selectionne dans membre_huit
drop table if exists cadastre_travail.dgfip_compte_communal_membre_sept;
create table cadastre_travail.dgfip_compte_communal_membre_sept as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, '] / ',
         rtrim(t2.prop_nom), ' [', t2.droit_code, ' : ', t2.droit_libelle, '] / ',
         rtrim(t3.prop_nom), ' [', t3.droit_code, ' : ', t3.droit_libelle, '] / ',
         rtrim(t4.prop_nom), ' [', t4.droit_code, ' : ', t4.droit_libelle, '] / ',
         rtrim(t5.prop_nom), ' [', t5.droit_code, ' : ', t5.droit_libelle, '] / ',
         rtrim(t6.prop_nom), ' [', t6.droit_code, ' : ', t6.droit_libelle, '] / ',
         rtrim(t7.prop_nom), ' [', t7.droit_code, ' : ', t7.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   inner join dgfip_compte_communal as t2 on t1.numero_communal = t2.numero_communal
   inner join dgfip_compte_communal as t3 on t1.numero_communal = t3.numero_communal
   inner join dgfip_compte_communal as t4 on t1.numero_communal = t4.numero_communal
   inner join dgfip_compte_communal as t5 on t1.numero_communal = t5.numero_communal
   inner join dgfip_compte_communal as t6 on t1.numero_communal = t6.numero_communal
   inner join dgfip_compte_communal as t7 on t1.numero_communal = t7.numero_communal
   left join (
      select
        *
      from cadastre_travail.dgfip_compte_communal_membre_huit
      ) as t8 on (t1.numero_communal = t8.numero_communal
                  and t2.numero_communal = t8.numero_communal
                  and t3.numero_communal = t8.numero_communal
                  and t4.numero_communal = t8.numero_communal
                  and t5.numero_communal = t8.numero_communal
                  and t6.numero_communal = t8.numero_communal
                  and t7.numero_communal = t8.numero_communal)
WHERE 
   t1.prop_numero < t2.prop_numero
   and t2.prop_numero < t3.prop_numero
   and t3.prop_numero < t4.prop_numero
   and t4.prop_numero < t5.prop_numero
   and t5.prop_numero < t6.prop_numero
   and t6.prop_numero < t7.prop_numero
   and t8.numero_communal is null
;


-- selection des comptes à 6 membres
drop table if exists cadastre_travail.dgfip_compte_communal_membre_six;
create table cadastre_travail.dgfip_compte_communal_membre_six as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, '] / ',
         rtrim(t2.prop_nom), ' [', t2.droit_code, ' : ', t2.droit_libelle, '] / ',
         rtrim(t3.prop_nom), ' [', t3.droit_code, ' : ', t3.droit_libelle, '] / ',
         rtrim(t4.prop_nom), ' [', t4.droit_code, ' : ', t4.droit_libelle, '] / ',
         rtrim(t5.prop_nom), ' [', t5.droit_code, ' : ', t5.droit_libelle, '] / ',
         rtrim(t6.prop_nom), ' [', t6.droit_code, ' : ', t6.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   inner join dgfip_compte_communal as t2 on t1.numero_communal = t2.numero_communal
   inner join dgfip_compte_communal as t3 on t1.numero_communal = t3.numero_communal
   inner join dgfip_compte_communal as t4 on t1.numero_communal = t4.numero_communal
   inner join dgfip_compte_communal as t5 on t1.numero_communal = t5.numero_communal
   inner join dgfip_compte_communal as t6 on t1.numero_communal = t6.numero_communal
   left join (
     (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_huit
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_sept
       ) 
     )
      as t7 on (t1.numero_communal = t7.numero_communal
                  and t2.numero_communal = t7.numero_communal
                  and t3.numero_communal = t7.numero_communal
                  and t4.numero_communal = t7.numero_communal
                  and t5.numero_communal = t7.numero_communal
                  and t6.numero_communal = t7.numero_communal)
WHERE 
   t1.prop_numero < t2.prop_numero
   and t2.prop_numero < t3.prop_numero
   and t3.prop_numero < t4.prop_numero
   and t4.prop_numero < t5.prop_numero
   and t5.prop_numero < t6.prop_numero
   and t7.numero_communal is null
;

-- selection des comptes à 5 membres
drop table if exists cadastre_travail.dgfip_compte_communal_membre_cinq;
create table cadastre_travail.dgfip_compte_communal_membre_cinq as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, '] / ',
         rtrim(t2.prop_nom), ' [', t2.droit_code, ' : ', t2.droit_libelle, '] / ',
         rtrim(t3.prop_nom), ' [', t3.droit_code, ' : ', t3.droit_libelle, '] / ',
         rtrim(t4.prop_nom), ' [', t4.droit_code, ' : ', t4.droit_libelle, '] / ',
         rtrim(t5.prop_nom), ' [', t5.droit_code, ' : ', t5.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   inner join dgfip_compte_communal as t2 on t1.numero_communal = t2.numero_communal
   inner join dgfip_compte_communal as t3 on t1.numero_communal = t3.numero_communal
   inner join dgfip_compte_communal as t4 on t1.numero_communal = t4.numero_communal
   inner join dgfip_compte_communal as t5 on t1.numero_communal = t5.numero_communal
   left join (
     (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_huit
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_sept
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_six
       )
     )
      as t6 on (t1.numero_communal = t6.numero_communal
                  and t2.numero_communal = t6.numero_communal
                  and t3.numero_communal = t6.numero_communal
                  and t4.numero_communal = t6.numero_communal
                  and t5.numero_communal = t6.numero_communal)
WHERE 
   t1.prop_numero < t2.prop_numero
   and t2.prop_numero < t3.prop_numero
   and t3.prop_numero < t4.prop_numero
   and t4.prop_numero < t5.prop_numero
   and t6.numero_communal is null
;

-- selection des comptes à 4 membres
drop table if exists cadastre_travail.dgfip_compte_communal_membre_quatre;
create table cadastre_travail.dgfip_compte_communal_membre_quatre as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, '] / ',
         rtrim(t2.prop_nom), ' [', t2.droit_code, ' : ', t2.droit_libelle, '] / ',
         rtrim(t3.prop_nom), ' [', t3.droit_code, ' : ', t3.droit_libelle, '] / ',
         rtrim(t4.prop_nom), ' [', t4.droit_code, ' : ', t4.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   inner join dgfip_compte_communal as t2 on t1.numero_communal = t2.numero_communal
   inner join dgfip_compte_communal as t3 on t1.numero_communal = t3.numero_communal
   inner join dgfip_compte_communal as t4 on t1.numero_communal = t4.numero_communal
   left join (
     (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_huit
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_sept
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_six
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_cinq
       )
     )
      as t5 on (t1.numero_communal = t5.numero_communal
                  and t2.numero_communal = t5.numero_communal
                  and t3.numero_communal = t5.numero_communal
                  and t4.numero_communal = t5.numero_communal)
WHERE
   t1.prop_numero < t2.prop_numero
   and t2.prop_numero < t3.prop_numero
   and t3.prop_numero < t4.prop_numero
   and t5.numero_communal is null
;

-- selection des comptes à 3 membres
drop table if exists cadastre_travail.dgfip_compte_communal_membre_trois;
create table cadastre_travail.dgfip_compte_communal_membre_trois as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, '] / ',
         rtrim(t2.prop_nom), ' [', t2.droit_code, ' : ', t2.droit_libelle, '] / ',
         rtrim(t3.prop_nom), ' [', t3.droit_code, ' : ', t3.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   inner join dgfip_compte_communal as t2 on t1.numero_communal = t2.numero_communal
   inner join dgfip_compte_communal as t3 on t1.numero_communal = t3.numero_communal
   left join (
     (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_huit
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_sept
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_six
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_cinq
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_quatre
       )
     )
      as t4 on (t1.numero_communal = t4.numero_communal
                  and t2.numero_communal = t4.numero_communal
                  and t3.numero_communal = t4.numero_communal)
WHERE
   t1.prop_numero < t2.prop_numero
   and t2.prop_numero < t3.prop_numero
   and t4.numero_communal is null
;

-- selection des comptes à 2 membres
drop table if exists cadastre_travail.dgfip_compte_communal_membre_deux;
create table cadastre_travail.dgfip_compte_communal_membre_deux as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, '] / ',
         rtrim(t2.prop_nom), ' [', t2.droit_code, ' : ', t2.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   inner join dgfip_compte_communal as t2 on t1.numero_communal = t2.numero_communal
   left join (
     (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_huit
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_sept
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_six
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_cinq
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_quatre
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_trois
       )
     )
      as t3 on (t1.numero_communal = t3.numero_communal
                  and t2.numero_communal = t3.numero_communal)
WHERE
   t1.prop_numero < t2.prop_numero
   and t3.numero_communal is null
;


-- selection des comptes à 1 seul membre
drop table if exists cadastre_travail.dgfip_compte_communal_membre_un;
create table cadastre_travail.dgfip_compte_communal_membre_un as
select
  t1.numero_communal,
  CONCAT(rtrim(t1.prop_nom), ' [', t1.droit_code, ' : ', t1.droit_libelle, ']') as proprietaire--,
--  numero_communal

from dgfip_compte_communal as t1
   left join (
     (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_huit
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_sept
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_six
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_cinq
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_quatre
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_trois
     ) union (
       select
         *
       from cadastre_travail.dgfip_compte_communal_membre_deux
       )
     )
      as t2 on (t1.numero_communal = t2.numero_communal)
WHERE
   t2.numero_communal is null
;

-- selection des comptes à x membres
drop table if exists cadastre_travail.dgfip_compte_communal_membre;
create table cadastre_travail.dgfip_compte_communal_membre as
   (
     select
       *
     from dgfip_compte_communal_membre_un
   ) union (
     select
     *
     from dgfip_compte_communal_membre_deux
   ) union (
     select
     *
     from dgfip_compte_communal_membre_trois
   ) union (
     select
     *
     from dgfip_compte_communal_membre_quatre
   ) union (
     select
     *
     from dgfip_compte_communal_membre_cinq
   ) union (
     select
     *
     from dgfip_compte_communal_membre_six
   ) union (
     select
     *
     from dgfip_compte_communal_membre_sept
   ) union (
     select
     *
     from dgfip_compte_communal_membre_huit
   )
;


-- recherche des 28 comptes dont la commune de la rochelle est membre
drop table if exists cadastre_travail.vlr_dgfip_compte_communal_membre;
create table cadastre_travail.vlr_dgfip_compte_communal_membre as
select
  dgfip_compte_communal.*,
  dgfip_compte_communal_membre.proprietaire
from dgfip_compte_communal
  join dgfip_compte_communal_membre on dgfip_compte_communal.numero_communal = dgfip_compte_communal_membre.numero_communal
where prop_nom like '%COMMUNE DE LA ROCHELLE%';

-- recherche de tout les renseignements (40 lignes) sur les 28 comptes dont la commune de la rochelle est membre
drop table if exists cadastre_travail.vlr_dgfip_compte_communal;
create table cadastre_travail.vlr_dgfip_compte_communal as
select
  dgfip_compte_communal.*,
  dgfip_compte_communal_membre.proprietaire
from dgfip_compte_communal
  join dgfip_compte_communal_membre on dgfip_compte_communal.numero_communal = dgfip_compte_communal_membre.numero_communal
where proprietaire like '%COMMUNE DE LA ROCHELLE%';


-- -----------------
-- Parcelles
-- -----------------
-- A partir de nbat_article_10
-- creation de tables associant parcelles et infos propriétaires


-- Parcelles
drop table if exists cadastre_travail.dgfip_parcelle cascade;
CREATE table cadastre_travail.dgfip_parcelle AS
select
  numero_communal,
  proprietaire,
  nbat_article_10.ccosec as pbd_section,
  cast(ltrim(nbat_article_10.dnupla, '0') as int) as pbd_numero,
  concat(nbat_article_10.ccocom, ' ', nbat_article_10.ccosec, ' ', Ltrim(nbat_article_10.dnupla, '0')) as pbd_parcelle,
  CASE nbat_article_10.dnvoiri < '0'
    WHEN true then ''
    else 
      case cast(ltrim(nbat_article_10.dnvoiri, '0') as int) < 4999
        when true then ltrim(nbat_article_10.dnvoiri, '0')
        else ''
      end
  end as pbd_numero_voirie,
  Ltrim(concat(trim(nbat_article_10.cconvo), ' ', Rtrim(nbat_article_10.dvoilib))) as pbd_adresse,
  ltrim(concat(
               CASE nbat_article_10.dnvoiri < '0'
                 WHEN true then ''
                 else 
                  case cast(ltrim(nbat_article_10.dnvoiri, '0') as int) < 4999
                    when true then ltrim(nbat_article_10.dnvoiri, '0')
                    else ''
                  end
               end,
               ' ',
               Ltrim(concat(trim(nbat_article_10.cconvo), ' ', Rtrim(nbat_article_10.dvoilib)))
               )
       ) as pbd_adresse_complete,
  nbat_article_10.ccoriv as pbd_code_rivoli
from nbat_article_10
inner join dgfip_compte_communal_membre on dgfip_compte_communal_membre.numero_communal = nbat_article_10.dnupro
order by
  pbd_section,
  cast(nbat_article_10.dnupla as int)
;


--vacuum full analyse cadastre_travail.dgfip_parcelle;

-- selection des parcelles de la rochelle
drop table if exists cadastre_travail.vlr_dgfip_parcelle cascade;
CREATE table cadastre_travail.vlr_dgfip_parcelle AS
select
  numero_communal,
  proprietaire,
  nbat_article_10.ccosec as pbd_section,
  cast(ltrim(nbat_article_10.dnupla, '0') as int) as pbd_numero,
  concat(nbat_article_10.ccocom, ' ', nbat_article_10.ccosec, ' ', Ltrim(nbat_article_10.dnupla, '0')) as pbd_parcelle,
  CASE nbat_article_10.dnvoiri < '0'
    WHEN true then ''
    else 
      case cast(ltrim(nbat_article_10.dnvoiri, '0') as int) < 4999
        when true then ltrim(nbat_article_10.dnvoiri, '0')
        else ''
      end
  end as pbd_numero_voirie,
  Ltrim(concat(trim(nbat_article_10.cconvo), ' ', Rtrim(nbat_article_10.dvoilib))) as pbd_adresse,
  ltrim(concat(
               CASE nbat_article_10.dnvoiri < '0'
                 WHEN true then ''
                 else 
                  case cast(ltrim(nbat_article_10.dnvoiri, '0') as int) < 4999
                    when true then ltrim(nbat_article_10.dnvoiri, '0')
                    else ''
                  end
               end,
               ' ',
               Ltrim(concat(trim(nbat_article_10.cconvo), ' ', Rtrim(nbat_article_10.dvoilib)))
               )
       ) as pbd_adresse_complete,
  nbat_article_10.ccoriv as pbd_code_rivoli
from nbat_article_10
inner join vlr_dgfip_compte_communal_membre on vlr_dgfip_compte_communal_membre.numero_communal = nbat_article_10.dnupro
order by
  pbd_section,
  cast(nbat_article_10.dnupla as int)
;


drop table if exists cadastre_travail.vlr_dgfip_parcelle cascade;
CREATE table cadastre_travail.vlr_dgfip_parcelle AS
select
  dgfip_parcelle.*--,
  --vlr_dgfip_compte_communal_membre.proprietaire
from dgfip_parcelle
  inner join vlr_dgfip_compte_communal_membre on vlr_dgfip_compte_communal_membre.numero_communal = dgfip_parcelle.numero_communal
order by
  pbd_section,
  pbd_numero
;

-- -------------------
-- copropriétés et PDL
-- -------------------

-- les propriétés divisées en lot ne font pas encore objet de traitement
-- pour info, voici quelques traitements rudimentaires :


-- liste des lots de la pdl

-- table permettant de faire le lien entre un compte de copropriété 
-- et les différents lots de cette copropriété
/*
select
  pdl_article_10.ccosec,
  pdl_article_10.dnupla,
  pdl_article_10.dnupdl,
  pdl_article_10.dnompdl,
  pdl_article_10.dnupro,
  pdl_article_30.dnulot,
  pdl_article_30.cconlo,
  ltrim(pdl_article_30.dnumql, '0') as tantieme_numerateur,
  ltrim(pdl_article_30.ddenql, '0') as tantieme_denominateur,
  pdl_article_30.dnuprol
from pdl_article_10
  --left join pdl_article_20 on (pdl_article_10.ccosec = pdl_article_20.ccosec and pdl_article_10.dnupla = pdl_article_20.dnupla and pdl_article_10.dnupdl = pdl_article_20.dnupdl)
  left join pdl_article_30 on (pdl_article_10.ccosec = pdl_article_30.ccosec and pdl_article_10.dnupla = pdl_article_30.dnupla and pdl_article_10.dnupdl = pdl_article_30.dnupdl)
where pdl_article_10.ccosec='HD'
and
pdl_article_10.dnupla='0115'
;
*/

-- liste des parcelles de la pdl

-- table permettant de faire le lien entre un compte de copropriété 
-- et les différentes parcelles de cette copropriété
/*
select
  pdl_article_10.ccosec,
  pdl_article_10.dnupla,
  pdl_article_10.dnupdl,
  pdl_article_10.dnompdl,
  pdl_article_10.dnupro,
  pdl_article_20.ccoseca,
  pdl_article_20.dnuplaa
from pdl_article_10
  left join pdl_article_20 on (pdl_article_10.ccosec = pdl_article_20.ccosec and pdl_article_10.dnupla = pdl_article_20.dnupla and pdl_article_10.dnupdl = pdl_article_20.dnupdl)
  --left join pdl_article_30 on (pdl_article_10.ccosec = pdl_article_30.ccosec and pdl_article_10.dnupla = pdl_article_30.dnupla and pdl_article_10.dnupdl = pdl_article_30.dnupdl)
where pdl_article_10.ccosec='HD'
and
pdl_article_10.dnupla='0015'
;
*/

-- -----------------
-- Parcelles bati
-- -----------------
-- A partir de bati_article_**,
-- creation de tables associant bati et infos propriétaires

-- tout d'abord, creation d'index pour accelerer les traitements

--ALTER TABLE cadastre_majic.bati_article_00
--  ADD CONSTRAINT pk_invar PRIMARY KEY(invar);
--ALTER TABLE cadastre_majic.bati_article_10
--  ADD CONSTRAINT pk_invar PRIMARY KEY(invar);


DROP INDEX if exists a00_invar;
CREATE INDEX a00_invar
  ON bati_article_00
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists a10_invar;
CREATE INDEX a10_invar
  ON bati_article_10
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists a21_invar;
CREATE INDEX a21_invar
  ON bati_article_21
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists a30_invar;
CREATE INDEX a30_invar
  ON bati_article_30
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists a36_invar;
CREATE INDEX a36_invar
  ON bati_article_36
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists a40_invar;
CREATE INDEX a40_invar
  ON bati_article_40
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists a50_invar;
CREATE INDEX a50_invar
  ON bati_article_50
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists a60_invar;
CREATE INDEX a60_invar
  ON bati_article_60
  USING btree
  (invar COLLATE pg_catalog."default" );

DROP INDEX if exists a10_dnupro;
CREATE INDEX a10_dnupro
  ON bati_article_10
  USING btree
  (dnupro COLLATE pg_catalog."default" );



-- Creation d'une table contenant des infos sur le bati
DROP TABLE if exists cadastre_travail.bati_article;
CREATE TABLE cadastre_travail.bati_article as
select --distinct
  bati_article_10.dnupro as "numero_communal",
  bati_article_00.ccosec as pbd_section,
  cast(ltrim(bati_article_00.dnupla, '0') as int) as pbd_numero,
  concat(bati_article_00.ccocom, ' ', bati_article_00.ccosec, ' ', Ltrim(bati_article_00.dnupla, '0')) as pbd_parcelle,
  CASE bati_article_00.dnvoiri < '0'
    WHEN true then ''
    else 
      case cast(ltrim(bati_article_00.dnvoiri, '0') as int) < 4999
        when true then ltrim(bati_article_00.dnvoiri, '0')
        else ''
      end
  end as pbd_numero_voirie,
  trim(bati_article_00.dindic) as pbd_numero_voirie_indic,
  Rtrim(bati_article_00.dvoilib) as pbd_adresse,
  ltrim(concat(
               CASE bati_article_00.dnvoiri < '0'
                 WHEN true then ''
                 else 
                  case cast(ltrim(bati_article_00.dnvoiri, '0') as int) < 4999
                    when true then ltrim(bati_article_00.dnvoiri, '0')
                    else ''
                  end
               end
               ,
               CASE trim(bati_article_00.dindic) = ''
                 WHEN true then ''
                 else concat(' ', trim(bati_article_00.dindic))
               END,
               ' ',
               Rtrim(bati_article_00.dvoilib)
               )
       ) as pbd_adresse_complete,
  bati_article_00.ccoriv as pbd_code_rivoli,
  
  trim(bati_article_00.dnubat) as pbi_bat, -- Numéro du batiment
  
  bati_article_00.desc as pbi_ent, -- Numéro d'entrée / d'escalier
  bati_article_00.dniv as pbi_niv, -- Numéro du niveau
  bati_article_00.dpor as pbi_porte, -- Numéro de la porte
  
  bati_article_10.invar,
  concat(substring(bati_article_00.invar from 4),bati_article_00.cleinvar) as pbi_invariant,
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
    WHEN bati_article_10.cconlc='DE' THEN liste_cconad.cconad_signification -- nature de la dependance
    ELSE cconlc_signification                                  -- nature du local
  END as pbe_nature_local_signification,
  
  
  bati_article_21.dcapec as pbe_categorie, -- Categorie
  ltrim(bati_article_36.bipevlac, '0') as pbd_revenu_cadastral_control, -- Revenu_cadastral
  bati_article_10.gtauom as pbe_taux_om,
  
  bati_article_40.jannat as annee_achev,
  bati_article_40.dnbniv as nb_niveaux,
  cast(bati_article_21.dsupot as int) as superficie_pev,
  concat(ltrim(bati_article_40.dnudes),
         bati_article_50.dnudes,
         bati_article_60.dnudes
        ) as descriptif_numero,
  concat(
               CASE 
                 WHEN ltrim(bati_article_40.dnbpdc, '0') is null then ''
                 else  ltrim(bati_article_40.dnbpdc, '0')
               end,
               CASE 
                 WHEN ltrim(bati_article_40.dnbppr, '0') is null then ''
                 else concat(' = ', ltrim(bati_article_40.dnbppr, '0'))
               end,
               CASE 
                 WHEN (trim(ltrim(bati_article_40.dnbann, '0')) < '0' OR trim(ltrim(bati_article_40.dnbann, '0')) is null ) then ''
                 else concat(' + ',ltrim(bati_article_40.dnbann, '0'))
               end
               ) as nombre_pieces,
  cast(bati_article_40.dsupdc as int) as superficie_pieces,

  cast(bati_article_60.dsudep as int) as superficie_dependances,
  cast(bati_article_50.vsurzt as int) as superficie_professionnel,
  (
    cast(bati_article_40.dsueic1 as int) +
    cast(bati_article_40.dsueic2 as int) +
    cast(bati_article_40.dsueic3 as int) +
    cast(bati_article_40.dsueic4 as int)
  ) as superficie_elements_incorpores,
  ltrim(rtrim(concat(
         CASE 
           WHEN ei1.cconad_signification is null then ''
           else concat(ei1.cconad_signification,' (',ltrim(bati_article_40.dsueic1, '0'),')')
         END,
         CASE 
           WHEN ei2.cconad_signification is null then ''
           else concat(' ', ei2.cconad_signification,' (',ltrim(bati_article_40.dsueic2, '0'),')')
         END,
         CASE 
           WHEN ei3.cconad_signification is null then ''
           else concat(' ', ei3.cconad_signification,' (',ltrim(bati_article_40.dsueic3, '0'),')')
         END,
         CASE 
           WHEN ei4.cconad_signification is null then ''
           else concat(' ', ei4.cconad_signification,' (',ltrim(bati_article_40.dsueic4, '0'),')')
         END
         ))) as elements_incorpores--,
         

from bati_article_21
  join bati_article_00 on bati_article_21.invar = bati_article_00.invar
  join bati_article_10 on bati_article_21.invar = bati_article_10.invar
  join bati_article_36 on (bati_article_21.invar = bati_article_36.invar and bati_article_21.dnupev = bati_article_36.dnupev)
  left join bati_article_40 on (bati_article_21.invar = bati_article_40.invar and bati_article_21.dnupev = bati_article_40.dnupev)
  left join bati_article_50 on (bati_article_21.invar = bati_article_50.invar and bati_article_21.dnupev = bati_article_50.dnupev)
  left join bati_article_60 on (bati_article_21.invar = bati_article_60.invar and bati_article_21.dnupev = bati_article_60.dnupev)
  left join liste_ccoaff on bati_article_21.ccoaff = liste_ccoaff.ccoaff
  left join liste_cconlc on bati_article_10.cconlc = liste_cconlc.cconlc
  left join liste_cconad on bati_article_60.cconad = liste_cconad.cconad
  left join liste_cconad as ei1 on bati_article_40.cconad1 = ei1.cconad
  left join liste_cconad as ei2 on bati_article_40.cconad2 = ei2.cconad
  left join liste_cconad as ei3 on bati_article_40.cconad3 = ei3.cconad
  left join liste_cconad as ei4 on bati_article_40.cconad4 = ei4.cconad
--where bati_article_00.ccosec = 'CL'
  --and cast(ltrim(bati_article_00.dnupla, '0') as int) = 187
--where bati_article_10.dnupro = 'B07083'
order by
  pbd_section,
  pbd_numero,
  pbi_bat,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  pbe_pev
  ;

--ALTER TABLE cadastre_travail.bati_article
--  ADD CONSTRAINT pk_invar PRIMARY KEY(invar);
  
DROP INDEX if exists ba_invar;
CREATE INDEX ba_invar
  ON bati_article
  USING btree
  (invar COLLATE pg_catalog."default" );
DROP INDEX if exists ba_numero_communal;
CREATE INDEX ba_numero_communal
  ON bati_article
  USING btree
  (numero_communal COLLATE pg_catalog."default" );

--vacuum full analyse cadastre_travail.bati_article;

-- liason de la table dgfip avec les comptes communaux
DROP TABLE if exists cadastre_travail.dgfip_batiment;
CREATE table cadastre_travail.dgfip_batiment AS
select distinct
  bati_article.numero_communal,
  dgfip_compte_communal_membre.proprietaire,
  bati_article.pbd_section,
  pbd_numero,
  pbd_parcelle,
  pbi_bat,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  pbd_adresse_complete

from bati_article
  left join dgfip_compte_communal_membre on (bati_article.numero_communal = dgfip_compte_communal_membre.numero_communal)

--where pbd_parcelle = '300 CS 410'

order by
  pbd_section,
  pbd_numero,
  pbi_bat,
  pbd_adresse_complete,
  pbi_ent,
  pbi_niv,
  pbi_porte
;


DROP TABLE if exists cadastre_travail.dgfip_invar;
CREATE table cadastre_travail.dgfip_invar AS
select distinct
  bati_article.numero_communal,
  dgfip_compte_communal_membre.proprietaire,
  bati_article.pbd_section,
  pbd_numero,
  pbd_parcelle,
  pbi_bat,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  pbd_adresse_complete,
  invar

from bati_article
  left join dgfip_compte_communal_membre on (bati_article.numero_communal = dgfip_compte_communal_membre.numero_communal)

--where pbd_parcelle = '300 CS 410'

order by
  pbd_section,
  pbd_numero,
  pbi_bat,
  pbd_adresse_complete,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  invar
;

DROP TABLE if exists cadastre_travail.dgfip_pev;
CREATE table cadastre_travail.dgfip_pev AS
select distinct
  bati_article.numero_communal,
  dgfip_compte_communal_membre.proprietaire,
  bati_article.pbd_section,
  pbd_numero,
  pbd_parcelle,
  pbi_bat,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  pbd_adresse_complete,
  invar,
  pbe_pev,
  pbe_nature_local_signification,
  annee_achev,
  superficie_pev
from bati_article
  left join dgfip_compte_communal_membre on (bati_article.numero_communal = dgfip_compte_communal_membre.numero_communal)
--where pbd_parcelle = '300 CS 410'
order by
  pbd_section,
  pbd_numero,
  pbi_bat,
  pbd_adresse_complete,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  invar,
  pbe_pev
;


DROP TABLE if exists cadastre_travail.dgfip_desc;
CREATE table cadastre_travail.dgfip_desc AS
select distinct
  bati_article.numero_communal,
  dgfip_compte_communal_membre.proprietaire,
  bati_article.pbd_section,
  pbd_numero,
  pbd_parcelle,
  pbi_bat,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  pbd_adresse_complete,
  invar,
  pbe_pev,
  descriptif_numero,
  pbe_nature_local_signification,
  annee_achev,
  superficie_pev,
  nombre_pieces,
  superficie_pieces,
  superficie_dependances,
  superficie_professionnel,
  superficie_elements_incorpores,
  elements_incorpores
from bati_article
  left join dgfip_compte_communal_membre on (bati_article.numero_communal = dgfip_compte_communal_membre.numero_communal)
--where pbd_parcelle = '300 CS 410'
order by
  pbd_section,
  pbd_numero,
  pbi_bat,
  pbd_adresse_complete,
  pbi_ent,
  pbi_niv,
  pbi_porte,
  invar,
  pbe_pev,
  descriptif_numero
;
--select count(1)
--from bati_article_00
--left join nbat_article_10 on (bati_article_00.ccosec = nbat_article_10.ccosec and bati_article_00.dnupla = nbat_article_10.dnupla);





-- selection des parcelles bati de la rochelle
DROP TABLE if exists cadastre_travail.parcelle_desc_larochelle;
CREATE table cadastre_travail.parcelle_desc_larochelle AS
select
 * 
from parcelle_desc
where proprietaire like '%COMMUNE DE LA ROCHELLE%'
;

-- selection des parcelles non-bati de la Rochelle
DROP TABLE if exists cadastre_travail.parcelle_larochelle;
CREATE table cadastre_travail.parcelle_larochelle AS
select
 * 
from parcelle
where proprietaire like '%COMMUNE DE LA ROCHELLE%'
;
