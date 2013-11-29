
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
