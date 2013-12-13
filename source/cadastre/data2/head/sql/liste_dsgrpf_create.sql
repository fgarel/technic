-- Suppression de la table liste_dsgrpf
DROP TABLE IF EXISTS liste_dsgrpf;
-- Creation de la table liste_dsgrpf
CREATE TABLE liste_dsgrpf (
"dsgrpf" CHARACTER VARYING(2) NOT NULL,
"dsgrpf_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_dsgrpf
COMMENT ON COLUMN liste_dsgrpf."dsgrpf" IS 'code';
COMMENT ON COLUMN liste_dsgrpf."dsgrpf_signification" IS 'libelle';
