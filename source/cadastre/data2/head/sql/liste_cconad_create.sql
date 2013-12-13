-- Suppression de la table liste_cconad
DROP TABLE IF EXISTS liste_cconad;
-- Creation de la table liste_cconad
CREATE TABLE liste_cconad (
"cconad" CHARACTER VARYING(2) NOT NULL,
"cconad_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_cconad
COMMENT ON COLUMN liste_cconad."cconad" IS 'code';
COMMENT ON COLUMN liste_cconad."cconad_signification" IS 'libelle';
