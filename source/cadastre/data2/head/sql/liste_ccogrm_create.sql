-- Suppression de la table liste_ccogrm
DROP TABLE IF EXISTS liste_ccogrm;
-- Creation de la table liste_ccogrm
CREATE TABLE liste_ccogrm (
"ccogrm" CHARACTER VARYING(1) NOT NULL,
"ccogrm_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ccogrm
COMMENT ON COLUMN liste_ccogrm."ccogrm" IS 'code';
COMMENT ON COLUMN liste_ccogrm."ccogrm_signification" IS 'libelle';
