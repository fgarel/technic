-- Suppression de la table liste_ctpdl
DROP TABLE IF EXISTS liste_ctpdl;
-- Creation de la table liste_ctpdl
CREATE TABLE liste_ctpdl (
"ctpdl" CHARACTER VARYING(3) NOT NULL,
"ctpdl_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ctpdl
COMMENT ON COLUMN liste_ctpdl."ctpdl" IS 'code';
COMMENT ON COLUMN liste_ctpdl."ctpdl_signification" IS 'libelle';
