-- Suppression de la table liste_cgroup
DROP TABLE IF EXISTS liste_cgroup;
-- Creation de la table liste_cgroup
CREATE TABLE liste_cgroup (
"cgroup" CHARACTER VARYING(1) NOT NULL,
"cgroup_signification" CHARACTER VARYING(255) NOT NULL);
-- Ajout des commentaires pour la table liste_cgroup
COMMENT ON COLUMN liste_cgroup."cgroup" IS 'code';
COMMENT ON COLUMN liste_cgroup."cgroup_signification" IS 'libelle';
