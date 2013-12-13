-- Suppression de la table nbat_article_10
DROP TABLE IF EXISTS nbat_article_10;
-- Creation de la table nbat_article_10
CREATE TABLE nbat_article_10 (
"ccodep" CHARACTER VARYING(2) NOT NULL,
"ccodir" CHARACTER VARYING(1) NOT NULL,
"ccocom" CHARACTER VARYING(3) NOT NULL,
"ccopre" CHARACTER VARYING(3) NOT NULL,
"ccosec" CHARACTER VARYING(2) NOT NULL,
"dnupla" CHARACTER VARYING(4) NOT NULL,
"filler01" CHARACTER VARYING(4) NOT NULL,
"cenr" CHARACTER VARYING(2) NOT NULL,
"dcntpa" CHARACTER VARYING(9) NOT NULL,
"dsrpar" CHARACTER VARYING(1) NOT NULL,
"dnupro" CHARACTER VARYING(6) NOT NULL,
"jdatat" CHARACTER VARYING(8) NOT NULL,
"dreflf" CHARACTER VARYING(5) NOT NULL,
"gpdl" CHARACTER VARYING(1) NOT NULL,
"cprsecr" CHARACTER VARYING(3) NOT NULL,
"ccosecr" CHARACTER VARYING(2) NOT NULL,
"dnuplar" CHARACTER VARYING(4) NOT NULL,
"dnupdl" CHARACTER VARYING(3) NOT NULL,
"gurbpa" CHARACTER VARYING(1) NOT NULL,
"dparpi" CHARACTER VARYING(4) NOT NULL,
"ccoarp" CHARACTER VARYING(1) NOT NULL,
"gparnf" CHARACTER VARYING(1) NOT NULL,
"gparbat" CHARACTER VARYING(1) NOT NULL,
"parrev" CHARACTER VARYING(12) NOT NULL,
"gpardp" CHARACTER VARYING(1) NOT NULL,
"fviti" CHARACTER VARYING(1) NOT NULL,
"dnvoiri" CHARACTER VARYING(4) NOT NULL,
"dindic" CHARACTER VARYING(1) NOT NULL,
"ccovoi" CHARACTER VARYING(5) NOT NULL,
"ccoriv" CHARACTER VARYING(4) NOT NULL,
"ccocif" CHARACTER VARYING(4) NOT NULL,
"gpafpd" CHARACTER VARYING(1) NOT NULL,
"filler02" CHARACTER VARYING(46) NOT NULL);
-- Ajout des commentaires pour la table nbat_article_10
COMMENT ON COLUMN nbat_article_10."ccodep" IS 'code département';
COMMENT ON COLUMN nbat_article_10."ccodir" IS 'code direction';
COMMENT ON COLUMN nbat_article_10."ccocom" IS 'code commune INSEE ou DGI d’arrondissement';
COMMENT ON COLUMN nbat_article_10."ccopre" IS 'Préfixe de section ou quartier servi pour les communes associées';
COMMENT ON COLUMN nbat_article_10."ccosec" IS 'Section cadastrale';
COMMENT ON COLUMN nbat_article_10."dnupla" IS 'Numéro de plan';
COMMENT ON COLUMN nbat_article_10."filler01" IS '';
COMMENT ON COLUMN nbat_article_10."cenr" IS 'code enregistrement';
COMMENT ON COLUMN nbat_article_10."dcntpa" IS 'Contenance de la parcelle';
COMMENT ON COLUMN nbat_article_10."dsrpar" IS 'Lettre de série-role';
COMMENT ON COLUMN nbat_article_10."dnupro" IS 'Compte communal du propriétaire de la parcelle';
COMMENT ON COLUMN nbat_article_10."jdatat" IS 'Date de l acte';
COMMENT ON COLUMN nbat_article_10."dreflf" IS 'Référence au Livre Foncier en Alsace-Moselle';
COMMENT ON COLUMN nbat_article_10."gpdl" IS 'Indicateur d’appartenance à pdl ou Identifiant de la pdl si gpdl=2';
COMMENT ON COLUMN nbat_article_10."cprsecr" IS 'Préfixe de la parcelle de référence';
COMMENT ON COLUMN nbat_article_10."ccosecr" IS 'Section de la parcelle de référence';
COMMENT ON COLUMN nbat_article_10."dnuplar" IS 'N° de plan de la parcelle de référence';
COMMENT ON COLUMN nbat_article_10."dnupdl" IS 'Numéro d’ordre de la pdl';
COMMENT ON COLUMN nbat_article_10."gurbpa" IS 'Caractère Urbain de la parcelle';
COMMENT ON COLUMN nbat_article_10."dparpi" IS 'Numéro de parcelle primitive';
COMMENT ON COLUMN nbat_article_10."ccoarp" IS 'Indicateur d’arpentage';
COMMENT ON COLUMN nbat_article_10."gparnf" IS 'Indicateur de parcelle non figurée au plan';
COMMENT ON COLUMN nbat_article_10."gparbat" IS 'Indicateur de parcelle référençant un bâtiment';
COMMENT ON COLUMN nbat_article_10."parrev" IS 'Info de la révision';
COMMENT ON COLUMN nbat_article_10."gpardp" IS 'parcelle n appartenant pas au domaine public';
COMMENT ON COLUMN nbat_article_10."fviti" IS 'parcelle au casier viticole';
COMMENT ON COLUMN nbat_article_10."dnvoiri" IS 'Numéro de voirie';
COMMENT ON COLUMN nbat_article_10."dindic" IS 'Indice de répétition';
COMMENT ON COLUMN nbat_article_10."ccovoi" IS 'Code Majic2 de la voie';
COMMENT ON COLUMN nbat_article_10."ccoriv" IS 'Code Rivoli de la voie';
COMMENT ON COLUMN nbat_article_10."ccocif" IS 'Code du cdif (code topad)';
COMMENT ON COLUMN nbat_article_10."gpafpd" IS 'Domanialité, représentation au plan';
COMMENT ON COLUMN nbat_article_10."filler02" IS '';
