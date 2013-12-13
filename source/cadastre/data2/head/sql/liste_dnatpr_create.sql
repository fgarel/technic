-- Suppression de la table liste_dnatpr
DROP TABLE IF EXISTS liste_dnatpr;
-- Creation de la table liste_dnatpr
CREATE TABLE liste_dnatpr (
"dnatpr" CHARACTER VARYING(3) NOT NULL,
"dnatpr_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_dnatpr
COMMENT ON COLUMN liste_dnatpr."dnatpr" IS 'code';
COMMENT ON COLUMN liste_dnatpr."dnatpr_signification" IS 'libelle';
