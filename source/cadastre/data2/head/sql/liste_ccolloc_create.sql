-- Suppression de la table liste_ccolloc
DROP TABLE IF EXISTS liste_ccolloc;
-- Creation de la table liste_ccolloc
CREATE TABLE liste_ccolloc (
"ccolloc" CHARACTER VARYING(2) NOT NULL,
"ccolloc_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ccolloc
COMMENT ON COLUMN liste_ccolloc."ccolloc" IS 'code';
COMMENT ON COLUMN liste_ccolloc."ccolloc_signification" IS 'libelle';
