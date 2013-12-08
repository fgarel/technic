
--DROP DATABASE if exists base_test;

--CREATE DATABASE base_test
--  WITH OWNER = opengeo
--       ENCODING = 'UTF8'
--       TABLESPACE = pg_default
--       LC_COLLATE = 'fr_FR.UTF-8'
--       LC_CTYPE = 'fr_FR.UTF-8'
--       CONNECTION LIMIT = -1;

-- --------------------
-- creation des schemas
-- --------------------
DROP SCHEMA IF EXISTS atal_production CASCADE;
CREATE SCHEMA atal_production AUTHORIZATION opengeo;
DROP SCHEMA IF EXISTS atal_test CASCADE;
CREATE SCHEMA atal_test AUTHORIZATION opengeo;
DROP SCHEMA IF EXISTS cadastre CASCADE;
CREATE SCHEMA cadastre AUTHORIZATION opengeo;
DROP SCHEMA IF EXISTS afi CASCADE;
CREATE SCHEMA afi AUTHORIZATION opengeo;
DROP SCHEMA IF EXISTS aj CASCADE;
CREATE SCHEMA aj AUTHORIZATION opengeo;

ALTER DATABASE base_test SET search_path TO
atal_production, atal_test, cadastre, afi, aj, public;

ALTER ROLE opengeo SET search_path TO
atal_production, atal_test, cadastre, afi, aj, public;
-- -------------------
-- creation des tables
-- -------------------
-- table_01
-- --------
DROP TABLE if exists atal_production.table_01;

CREATE TABLE atal_production.table_01
(
  id character varying,
  libelle1 character varying,
  libelle2 character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE atal_production.table_01
  OWNER TO opengeo;

-- --------
-- table_02
-- --------
DROP TABLE if exists cadastre.table_02;

CREATE TABLE cadastre.table_02
(
  id character varying,
  libelle1 character varying,
  libelle2 character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastre.table_02
  OWNER TO opengeo;
  
-- --------
-- table_03
-- --------
DROP TABLE if exists cadastre.table_03;

CREATE TABLE cadastre.table_03
(
  id character varying,
  libelle1 character varying,
  libelle2 character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastre.table_03
  OWNER TO opengeo;

-- --------
-- table_04
-- --------
DROP TABLE if exists aj.table_04;

CREATE TABLE aj.table_04
(
  id character varying,
  libelle1 character varying,
  libelle2 character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE aj.table_04
  OWNER TO opengeo;

-- --------
-- table_05
-- --------
DROP TABLE if exists cadastre.table_05;

CREATE TABLE cadastre.table_05
(
  id character varying,
  libelle1 character varying,
  libelle2 character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastre.table_05
  OWNER TO opengeo;

-- --------
-- table_06
-- --------
DROP TABLE if exists cadastre.table_06;

CREATE TABLE cadastre.table_06
(
  id character varying,
  libelle1 character varying,
  libelle2 character varying
)
WITH (
  OIDS=FALSE
);
ALTER TABLE cadastre.table_06
  OWNER TO opengeo;

  
-- ---------------------
-- insertion des données
-- ---------------------

--INSERT into table_01 values('01','01','01-a-A-I');
--INSERT into table_01 values('02','02','02-b-B-II');
--INSERT into table_01 values('03','03','03-c-C-III');
--INSERT into table_01 values('04','04','04-d-D-IV');
INSERT into table_01 values('05','05','05-e-E-V');
INSERT into table_01 values('06','06','06-f-F-VI');
INSERT into table_01 values('07','07','07-g-G-VII');
INSERT into table_01 values('08','08','08-h-H-VIII');
INSERT into table_01 values('09','09','09-i-I-IX');
INSERT into table_01 values('10','10','10-j-J-X');
INSERT into table_01 values('11','11','11-k-K-XI');
INSERT into table_01 values('12','12','12-l-L-XII');
INSERT into table_01 values('13','13','13-m-M-XIII');
INSERT into table_01 values('14','14','14-n-N-XIV');
INSERT into table_01 values('15','15','15-o-O-XV');
--INSERT into table_01 values('16','16','16-p-P-XVI');
--INSERT into table_01 values('17','17','17-q-Q-XVII');
--INSERT into table_01 values('18','18','18-r-R-XVIII');
--INSERT into table_01 values('19','19','19-s-S-XIX');
--INSERT into table_01 values('20','20','20-t-T-XX');
--INSERT into table_01 values('21','21','21-u-U-XXI');

--INSERT into table_02 values('01','a','01-a-A-I');
INSERT into table_02 values('02','b','02-b-B-II');
--INSERT into table_02 values('03','c','03-c-C-III');
INSERT into table_02 values('04','d','04-d-D-IV');
--INSERT into table_02 values('05','e','05-e-E-V');
INSERT into table_02 values('06','f','06-f-F-VI');
--INSERT into table_02 values('07','g','07-g-G-VII');
INSERT into table_02 values('08','h','08-h-H-VIII');
--INSERT into table_02 values('09','i','09-i-I-IX');
INSERT into table_02 values('10','j','10-j-J-X');
--INSERT into table_02 values('11','k','11-k-K-XI');
INSERT into table_02 values('12','l','12-l-L-XII');
--INSERT into table_02 values('13','m','13-m-M-XIII');
INSERT into table_02 values('14','n','14-n-N-XIV');
--INSERT into table_02 values('15','o','15-o-O-XV');
INSERT into table_02 values('16','p','16-p-P-XVI');
--INSERT into table_02 values('17','q','17-q-Q-XVII');
INSERT into table_02 values('18','r','18-r-R-XVIII');
--INSERT into table_02 values('19','s','19-s-S-XIX');
INSERT into table_02 values('20','t','20-t-T-XX');
--INSERT into table_02 values('21','u','21-u-U-XXI');

INSERT into table_03 values('01','A','01-a-A-I');
INSERT into table_03 values('02','B','02-b-B-II');
INSERT into table_03 values('03','C','03-c-C-III');
INSERT into table_03 values('04','D','04-d-D-IV');
INSERT into table_03 values('05','E','05-e-E-V');
INSERT into table_03 values('06','F','06-f-F-VI');
INSERT into table_03 values('07','G','07-g-G-VII');
INSERT into table_03 values('08','H','08-h-H-VIII');
INSERT into table_03 values('09','I','09-i-I-IX');
INSERT into table_03 values('10','J','10-j-J-X');
--INSERT into table_03 values('11','K','11-k-K-XI');
--INSERT into table_03 values('12','L','12-l-L-XII');
--INSERT into table_03 values('13','M','13-m-M-XIII');
--INSERT into table_03 values('14','N','14-n-N-XIV');
--INSERT into table_03 values('15','O','15-o-O-XV');
--INSERT into table_03 values('16','P','16-p-P-XVI');
--INSERT into table_03 values('17','Q','17-q-Q-XVII');
--INSERT into table_03 values('18','R','18-r-R-XVIII');
--INSERT into table_03 values('19','S','19-s-S-XIX');
--INSERT into table_03 values('20','T','20-t-T-XX');
--INSERT into table_03 values('21','U','21-u-U-XXI');

--INSERT into table_04 values('01','I','01-a-A-I');
--INSERT into table_04 values('02','II','02-b-B-II');
INSERT into table_04 values('03','III','03-c-C-III');
--INSERT into table_04 values('04','IV','04-d-D-IV');
--INSERT into table_04 values('05','V','05-e-E-V');
INSERT into table_04 values('06','VI','06-f-F-VI');
--INSERT into table_04 values('07','VII','07-g-G-VII');
--INSERT into table_04 values('08','VIII','08-h-H-VIII');
INSERT into table_04 values('09','IX','09-i-I-IX');
--INSERT into table_04 values('10','X','10-j-J-X');
--INSERT into table_04 values('11','XI','11-k-K-XI');
INSERT into table_04 values('12','XII','12-l-L-XII');
--INSERT into table_04 values('13','XII','13-m-M-XIII');
--INSERT into table_04 values('14','XIV','14-n-N-XIV');
INSERT into table_04 values('15','XV','15-o-O-XV');
--INSERT into table_04 values('16','XVI','16-p-P-XVI');
--INSERT into table_04 values('17','XVII','17-q-Q-XVII');
INSERT into table_04 values('18','XVIII','18-r-R-XVIII');
--INSERT into table_04 values('19','XIX','19-s-S-XIX');
--INSERT into table_04 values('20','XX','20-t-T-XX');
INSERT into table_04 values('21','XXI','21-u-U-XXI');

INSERT into table_05 values('01','a','annexe');
INSERT into table_05 values('02','b','brouette');
INSERT into table_05 values('03','c','chaton');
INSERT into table_05 values('04','d','dépot');
INSERT into table_05 values('05','e','été');
INSERT into table_05 values('06','f','final');
INSERT into table_05 values('07','g','groupe');
INSERT into table_05 values('08','h','herbe');
INSERT into table_05 values('09','i','issue');
INSERT into table_05 values('10','j','jambe');
INSERT into table_05 values('11','k','kaolin');
INSERT into table_05 values('12','l','luxe');
INSERT into table_05 values('13','m','mode');
INSERT into table_05 values('14','n','nouvelle');
INSERT into table_05 values('15','o','ordre');
INSERT into table_05 values('16','p','prose');
INSERT into table_05 values('17','q','qualité');
INSERT into table_05 values('18','r','route');
INSERT into table_05 values('19','s','surplomb');
INSERT into table_05 values('20','t','texte');
INSERT into table_05 values('21','u','unité');

INSERT into table_06 values('01','A','Adélaide');
INSERT into table_06 values('02','A','Adèle');
INSERT into table_06 values('03','A','Agnès');
INSERT into table_06 values('04','A','Aliénor');
INSERT into table_06 values('05','A','Anne');
INSERT into table_06 values('06','B','Berthe');
INSERT into table_06 values('07','B','Blanche');
INSERT into table_06 values('08','C','Catherine');
INSERT into table_06 values('09','C','Charlotte');
INSERT into table_06 values('10','C','Claude');
INSERT into table_06 values('11','C','Clémence');
INSERT into table_06 values('12','C','Constance');
INSERT into table_06 values('13','D','Denise');
INSERT into table_06 values('14','D','Dominique');
INSERT into table_06 values('15','E','Eléonore');
INSERT into table_06 values('16','E','Elisabeth');
INSERT into table_06 values('17','F','Félicie');
INSERT into table_06 values('18','G','Geneviève');
INSERT into table_06 values('19','H','Honorine');
INSERT into table_06 values('20','I','Isabeau');
INSERT into table_06 values('21','I','Isabelle');
INSERT into table_06 values('22','J','Jeanne');
INSERT into table_06 values('23','K','Katia');
INSERT into table_06 values('24','L','Louise');
INSERT into table_06 values('25','M','Marguerite');
INSERT into table_06 values('26','M','Marie');
INSERT into table_06 values('27','M','Mathilde');
INSERT into table_06 values('28','N','Noemi');
INSERT into table_06 values('29','O','Ophélie');
INSERT into table_06 values('30','P','Pauline');
INSERT into table_06 values('31','Q','Quintia');
INSERT into table_06 values('32','R','Rose');
INSERT into table_06 values('33','S','Salomée');
INSERT into table_06 values('34','S','Sidonie');
INSERT into table_06 values('35','S','Suzanne');
INSERT into table_06 values('36','T','Thérèse');
INSERT into table_06 values('37','U','Ursuline');

analyse;
--vacuum analyse;