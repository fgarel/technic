-- Suppression de la table liste_gtoper
DROP TABLE IF EXISTS liste_gtoper;
-- Creation de la table liste_gtoper
CREATE TABLE liste_gtoper (
"gtoper" CHARACTER VARYING(1) NOT NULL,
"gtoper_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_gtoper
COMMENT ON COLUMN liste_gtoper."gtoper" IS 'code';
COMMENT ON COLUMN liste_gtoper."gtoper_signification" IS 'libelle';
