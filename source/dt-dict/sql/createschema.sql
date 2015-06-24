-- 5. Creation des schemas a l'interieur de la base
--   Apres avoir créé la base, nous allons créer des schémas
--   nous aurons les schémas suivants :
--     cadastre_majic
--     cadatsre_travail
--     cadastre_public
CREATE SCHEMA cadastre_majic
       AUTHORIZATION contrib;

CREATE SCHEMA cadastre_travail
       AUTHORIZATION contrib;

CREATE SCHEMA cadastre_public
       AUTHORIZATION contrib;


-- Il faut ensuite faire en sorte que l'utilisateur contrib utilise un schema plutot qu'un autre

ALTER ROLE contrib
      SET search_path TO cadastre_majic, cadastre_travail, cadastre_public, public;
