-- Suppression de la table liste_dnatcg
DROP TABLE IF EXISTS liste_dnatcg;
-- Creation de la table liste_dnatcg
CREATE TABLE liste_dnatcg (
"dnatcg" CHARACTER VARYING(2) NOT NULL,
"dnatcg_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_dnatcg
COMMENT ON COLUMN liste_dnatcg."dnatcg" IS 'code';
COMMENT ON COLUMN liste_dnatcg."dnatcg_signification" IS 'libelle';
