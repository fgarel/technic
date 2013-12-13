-- Suppression de la table liste_ccodem
DROP TABLE IF EXISTS liste_ccodem;
-- Creation de la table liste_ccodem
CREATE TABLE liste_ccodem (
"ccodem" CHARACTER VARYING(1) NOT NULL,
"ccodem_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ccodem
COMMENT ON COLUMN liste_ccodem."ccodem" IS 'code';
COMMENT ON COLUMN liste_ccodem."ccodem_signification" IS 'libelle';
