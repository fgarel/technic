-- Suppression de la table liste_dnatlc
DROP TABLE IF EXISTS liste_dnatlc;
-- Creation de la table liste_dnatlc
CREATE TABLE liste_dnatlc (
"dnatlc" CHARACTER VARYING(1) NOT NULL,
"dnatlc_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_dnatlc
COMMENT ON COLUMN liste_dnatlc."dnatlc" IS 'code';
COMMENT ON COLUMN liste_dnatlc."dnatlc_signification" IS 'libelle';
