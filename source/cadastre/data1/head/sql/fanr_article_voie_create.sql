-- Suppression de la table fanr_article_voie
DROP TABLE IF EXISTS fanr_article_voie;
-- Creation de la table fanr_article_voie
CREATE TABLE fanr_article_voie (
"ccode" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccoriv" CHARACTER VARYING(4) NOT NULL,
"cleriv" CHARACTER VARYING(1) NOT NULL,
"natvoi" CHARACTER VARYING(4) NOT NULL,
"libvoi" CHARACTER VARYING(26) NOT NULL,
"filler02" CHARACTER VARYING(1) NOT NULL,
"typcom" CHARACTER VARYING(1) NOT NULL,
"crur" CHARACTER VARYING(6) NOT NULL,
"carvoi" CHARACTER VARYING(1) NOT NULL,
"filler03" CHARACTER VARYING(9) NOT NULL,
"code1" CHARACTER VARYING(14) NOT NULL,
"filler04" CHARACTER VARYING(1) NOT NULL,
"code2" CHARACTER VARYING(14) NOT NULL);
-- Ajout des commentaires pour la table fanr_article_voie
COMMENT ON COLUMN fanr_article_voie."ccode" IS 'code département';
COMMENT ON COLUMN fanr_article_voie."ccodir" IS 'code direction';
COMMENT ON COLUMN fanr_article_voie."ccocom" IS 'code commune INSEE';
COMMENT ON COLUMN fanr_article_voie."ccoriv" IS 'Code Rivoli de la voie';
COMMENT ON COLUMN fanr_article_voie."cleriv" IS 'Clé Rivoli';
COMMENT ON COLUMN fanr_article_voie."natvoi" IS 'nature de la voie';
COMMENT ON COLUMN fanr_article_voie."libvoi" IS 'libelle de la voie';
COMMENT ON COLUMN fanr_article_voie."filler02" IS '';
COMMENT ON COLUMN fanr_article_voie."typcom" IS 'type de la commune';
COMMENT ON COLUMN fanr_article_voie."crur" IS 'caractère RUR';
COMMENT ON COLUMN fanr_article_voie."carvoi" IS 'caractère de voie';
COMMENT ON COLUMN fanr_article_voie."filler03" IS '';
COMMENT ON COLUMN fanr_article_voie."code1" IS 'caractère et date d`annulation ?';
COMMENT ON COLUMN fanr_article_voie."filler04" IS '';
COMMENT ON COLUMN fanr_article_voie."code2" IS 'date de création ?';
