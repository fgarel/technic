-- Suppression de la table bati_article_direction
DROP TABLE IF EXISTS bati_article_direction;
-- Creation de la table bati_article_direction
CREATE TABLE bati_article_direction (
"dep" CHARACTER VARYING(30) NOT NULL,
"parmdat" CHARACTER VARYING(2) NOT NULL,
"jdatparm" CHARACTER VARYING(8) NOT NULL,
"voterev" CHARACTER VARYING(2) NOT NULL,
"jandoc" CHARACTER VARYING(4) NOT NULL);
-- Ajout des commentaires pour la table bati_article_direction
COMMENT ON COLUMN bati_article_direction."dep" IS 'département';
COMMENT ON COLUMN bati_article_direction."parmdat" IS 'date de référence du Fichier';
COMMENT ON COLUMN bati_article_direction."jdatparm" IS 'date de création du fichier';
COMMENT ON COLUMN bati_article_direction."voterev" IS 'intégration ou non  de la révision';
COMMENT ON COLUMN bati_article_direction."jandoc" IS 'année de campagne';
