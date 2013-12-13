-- Suppression de la table liste_cconlo
DROP TABLE IF EXISTS liste_cconlo;
-- Creation de la table liste_cconlo
CREATE TABLE liste_cconlo (
"cconlo" CHARACTER VARYING(1) NOT NULL,
"cconlo_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_cconlo
COMMENT ON COLUMN liste_cconlo."cconlo" IS 'code';
COMMENT ON COLUMN liste_cconlo."cconlo_signification" IS 'libelle';
