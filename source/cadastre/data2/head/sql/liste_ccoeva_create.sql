-- Suppression de la table liste_ccoeva
DROP TABLE IF EXISTS liste_ccoeva;
-- Creation de la table liste_ccoeva
CREATE TABLE liste_ccoeva (
"ccoeva" CHARACTER VARYING(1) NOT NULL,
"ccoeva_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ccoeva
COMMENT ON COLUMN liste_ccoeva."ccoeva" IS 'code';
COMMENT ON COLUMN liste_ccoeva."ccoeva_signification" IS 'libelle';
