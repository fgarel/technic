-- Suppression de la table liste_dmatto
DROP TABLE IF EXISTS liste_dmatto;
-- Creation de la table liste_dmatto
CREATE TABLE liste_dmatto (
"dmatto" CHARACTER VARYING(1) NOT NULL,
"dmatto_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_dmatto
COMMENT ON COLUMN liste_dmatto."dmatto" IS 'code';
COMMENT ON COLUMN liste_dmatto."dmatto_signification" IS 'libelle';
