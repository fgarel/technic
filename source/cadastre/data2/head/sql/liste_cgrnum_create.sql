-- Suppression de la table liste_cgrnum
DROP TABLE IF EXISTS liste_cgrnum;
-- Creation de la table liste_cgrnum
CREATE TABLE liste_cgrnum (
"cgrnum" CHARACTER VARYING(2) NOT NULL,
"cgrnum_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_cgrnum
COMMENT ON COLUMN liste_cgrnum."cgrnum" IS 'code';
COMMENT ON COLUMN liste_cgrnum."cgrnum_signification" IS 'libelle';
