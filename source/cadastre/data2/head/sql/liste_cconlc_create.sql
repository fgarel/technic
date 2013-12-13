-- Suppression de la table liste_cconlc
DROP TABLE IF EXISTS liste_cconlc;
-- Creation de la table liste_cconlc
CREATE TABLE liste_cconlc (
"cconlc" CHARACTER VARYING(2) NOT NULL,
"cconlc_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_cconlc
COMMENT ON COLUMN liste_cconlc."cconlc" IS 'code';
COMMENT ON COLUMN liste_cconlc."cconlc_signification" IS 'libelle';
