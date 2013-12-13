-- Suppression de la table liste_dteloc
DROP TABLE IF EXISTS liste_dteloc;
-- Creation de la table liste_dteloc
CREATE TABLE liste_dteloc (
"dteloc" CHARACTER VARYING(1) NOT NULL,
"dteloc_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_dteloc
COMMENT ON COLUMN liste_dteloc."dteloc" IS 'code';
COMMENT ON COLUMN liste_dteloc."dteloc_signification" IS 'libelle';
