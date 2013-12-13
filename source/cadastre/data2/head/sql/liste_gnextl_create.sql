-- Suppression de la table liste_gnextl
DROP TABLE IF EXISTS liste_gnextl;
-- Creation de la table liste_gnextl
CREATE TABLE liste_gnextl (
"gnextl" CHARACTER VARYING(2) NOT NULL,
"gnextl_signification" CHARACTER VARYING(150) NOT NULL);
-- Ajout des commentaires pour la table liste_gnextl
COMMENT ON COLUMN liste_gnextl."gnextl" IS 'code';
COMMENT ON COLUMN liste_gnextl."gnextl_signification" IS 'libelle';
