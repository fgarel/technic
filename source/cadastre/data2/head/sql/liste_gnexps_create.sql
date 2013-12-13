-- Suppression de la table liste_gnexps
DROP TABLE IF EXISTS liste_gnexps;
-- Creation de la table liste_gnexps
CREATE TABLE liste_gnexps (
"gnexps" CHARACTER VARYING(2) NOT NULL,
"gnexps_signification" CHARACTER VARYING(150) NOT NULL);
-- Ajout des commentaires pour la table liste_gnexps
COMMENT ON COLUMN liste_gnexps."gnexps" IS 'code';
COMMENT ON COLUMN liste_gnexps."gnexps_signification" IS 'libelle';
