-- Suppression de la table liste_gdesip
DROP TABLE IF EXISTS liste_gdesip;
-- Creation de la table liste_gdesip
CREATE TABLE liste_gdesip (
"gdesip" CHARACTER VARYING(1) NOT NULL,
"gdesip_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_gdesip
COMMENT ON COLUMN liste_gdesip."gdesip" IS 'code';
COMMENT ON COLUMN liste_gdesip."gdesip_signification" IS 'libelle';
