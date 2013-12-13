-- Suppression de la table liste_gpdl
DROP TABLE IF EXISTS liste_gpdl;
-- Creation de la table liste_gpdl
CREATE TABLE liste_gpdl (
"gpdl" CHARACTER VARYING(1) NOT NULL,
"gpdl_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_gpdl
COMMENT ON COLUMN liste_gpdl."gpdl" IS 'code';
COMMENT ON COLUMN liste_gpdl."gpdl_signification" IS 'libelle';
