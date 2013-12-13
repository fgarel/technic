-- Suppression de la table liste_ccoqua
DROP TABLE IF EXISTS liste_ccoqua;
-- Creation de la table liste_ccoqua
CREATE TABLE liste_ccoqua (
"ccoqua" CHARACTER VARYING(1) NOT NULL,
"ccoqua_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ccoqua
COMMENT ON COLUMN liste_ccoqua."ccoqua" IS 'code';
COMMENT ON COLUMN liste_ccoqua."ccoqua_signification" IS 'libelle';
