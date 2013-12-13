-- Suppression de la table liste_ccodro
DROP TABLE IF EXISTS liste_ccodro;
-- Creation de la table liste_ccodro
CREATE TABLE liste_ccodro (
"ccodro" CHARACTER VARYING(1) NOT NULL,
"ccodro_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ccodro
COMMENT ON COLUMN liste_ccodro."ccodro" IS 'code';
COMMENT ON COLUMN liste_ccodro."ccodro_signification" IS 'libelle';
