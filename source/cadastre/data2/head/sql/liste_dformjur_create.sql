-- Suppression de la table liste_dformjur
DROP TABLE IF EXISTS liste_dformjur;
-- Creation de la table liste_dformjur
CREATE TABLE liste_dformjur (
"dformjur" CHARACTER VARYING(4) NOT NULL,
"formjur" CHARACTER VARYING(4) NOT NULL,
"libformjur" CHARACTER VARYING(112) NOT NULL);
-- Ajout des commentaires pour la table liste_dformjur
COMMENT ON COLUMN liste_dformjur."dformjur" IS 'code';
COMMENT ON COLUMN liste_dformjur."formjur" IS 'forme juridique abregee';
COMMENT ON COLUMN liste_dformjur."libformjur" IS 'forme juridique de la personne morale';
