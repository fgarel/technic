-- Suppression de la table liste_ccoplc
DROP TABLE IF EXISTS liste_ccoplc;
-- Creation de la table liste_ccoplc
CREATE TABLE liste_ccoplc (
"ccoplc" CHARACTER VARYING(1) NOT NULL,
"ccoplc_signification" CHARACTER VARYING(150) NOT NULL);
-- Ajout des commentaires pour la table liste_ccoplc
COMMENT ON COLUMN liste_ccoplc."ccoplc" IS 'code';
COMMENT ON COLUMN liste_ccoplc."ccoplc_signification" IS 'libelle';
