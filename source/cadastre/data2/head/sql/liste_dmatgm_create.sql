-- Suppression de la table liste_dmatgm
DROP TABLE IF EXISTS liste_dmatgm;
-- Creation de la table liste_dmatgm
CREATE TABLE liste_dmatgm (
"dmatgm" CHARACTER VARYING(1) NOT NULL,
"dmatgm_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_dmatgm
COMMENT ON COLUMN liste_dmatgm."dmatgm" IS 'code';
COMMENT ON COLUMN liste_dmatgm."dmatgm_signification" IS 'libelle';
