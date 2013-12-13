-- Suppression de la table liste_gparbat
DROP TABLE IF EXISTS liste_gparbat;
-- Creation de la table liste_gparbat
CREATE TABLE liste_gparbat (
"gparbat" CHARACTER VARYING(1) NOT NULL,
"gparbat_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_gparbat
COMMENT ON COLUMN liste_gparbat."gparbat" IS 'code';
COMMENT ON COLUMN liste_gparbat."gparbat_signification" IS 'libelle';
