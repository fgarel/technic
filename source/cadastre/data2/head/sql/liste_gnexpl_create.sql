-- Suppression de la table liste_gnexpl
DROP TABLE IF EXISTS liste_gnexpl;
-- Creation de la table liste_gnexpl
CREATE TABLE liste_gnexpl (
"gnexpl" CHARACTER VARYING(2) NOT NULL,
"gnexpl_signification" CHARACTER VARYING(150) NOT NULL);
-- Ajout des commentaires pour la table liste_gnexpl
COMMENT ON COLUMN liste_gnexpl."gnexpl" IS 'code';
COMMENT ON COLUMN liste_gnexpl."gnexpl_signification" IS 'libelle';
