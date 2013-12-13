-- Suppression de la table liste_detent
DROP TABLE IF EXISTS liste_detent;
-- Creation de la table liste_detent
CREATE TABLE liste_detent (
"detent" CHARACTER VARYING(1) NOT NULL,
"detent_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_detent
COMMENT ON COLUMN liste_detent."detent" IS 'code';
COMMENT ON COLUMN liste_detent."detent_signification" IS 'libelle';
