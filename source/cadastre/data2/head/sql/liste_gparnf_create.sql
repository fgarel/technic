-- Suppression de la table liste_gparnf
DROP TABLE IF EXISTS liste_gparnf;
-- Creation de la table liste_gparnf
CREATE TABLE liste_gparnf (
"gparnf" CHARACTER VARYING(1) NOT NULL,
"gparnf_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_gparnf
COMMENT ON COLUMN liste_gparnf."gparnf" IS 'code';
COMMENT ON COLUMN liste_gparnf."gparnf_signification" IS 'libelle';
