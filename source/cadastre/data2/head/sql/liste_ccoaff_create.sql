-- Suppression de la table liste_ccoaff
DROP TABLE IF EXISTS liste_ccoaff;
-- Creation de la table liste_ccoaff
CREATE TABLE liste_ccoaff (
"ccoaff" CHARACTER VARYING(1) NOT NULL,
"ccoaff_signification" CHARACTER VARYING(100) NOT NULL);
-- Ajout des commentaires pour la table liste_ccoaff
COMMENT ON COLUMN liste_ccoaff."ccoaff" IS 'code';
COMMENT ON COLUMN liste_ccoaff."ccoaff_signification" IS 'libelle';
