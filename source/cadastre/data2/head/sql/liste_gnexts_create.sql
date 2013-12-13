-- Suppression de la table liste_gnexts
DROP TABLE IF EXISTS liste_gnexts;
-- Creation de la table liste_gnexts
CREATE TABLE liste_gnexts (
"gnexts" CHARACTER VARYING(2) NOT NULL,
"gnexts_signification" CHARACTER VARYING(255) NOT NULL);
-- Ajout des commentaires pour la table liste_gnexts
COMMENT ON COLUMN liste_gnexts."gnexts" IS 'code';
COMMENT ON COLUMN liste_gnexts."gnexts_signification" IS 'libelle';
