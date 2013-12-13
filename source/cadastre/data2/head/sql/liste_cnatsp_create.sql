-- Suppression de la table liste_cnatsp
DROP TABLE IF EXISTS liste_cnatsp;
-- Creation de la table liste_cnatsp
CREATE TABLE liste_cnatsp (
"cnatsp" CHARACTER VARYING(5) NOT NULL,
"cnatsp_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_cnatsp
COMMENT ON COLUMN liste_cnatsp."cnatsp" IS 'code';
COMMENT ON COLUMN liste_cnatsp."cnatsp_signification" IS 'libelle';
