
-- vu dans le magazine linux identity :

-- pour une gestion propre du serveur postgres
-- 1. creation d'un utilisateur linux qui pourra administrer postgresql
--    sudo useradd -m -N -g postgres -s /bin/bash administrator
--    sudo passwd administrator
-- 2. création d'un utilisateur dans postgres
--    $ su
--    # su - postgres
--    postgres$ createuser -d -r -s administrator
--    postgres$ psql -d postgres -c "ALTER USER administrator WITH PASSWORD '12....';"
--    postgres$ exit
--    # exit
--    $
-- 3. Creation d'un tablespace
--    Avant de créer la base de données, nous allons créer un tablespace,
--    c'est a dire un espace dans lequel sera "enfermée" la base de données.
--    Un autre intérêt du tablespace est que l'espace disque occupé par notre base
--    est placé là ou nous le voulons.
--    au lieu de mettre les données dans /var/lib/postgresql
--    nous allons placer l'espace dans /home/pgdata/tps_patrimoine

-- 3.1. sur le serveur postgresql,
--      creation du repertoire /home/pgdata à faire en root
--        sudo mkdir /home/pgdata
--        sudo chown -R postgres:postgres /home/pgdata
--        sudo chmod -R 770 /home/pgdata
--      creation du sous-repertoire tbs_patrimoine à faire en administrator
--        su - administrator
--        mkdir /home/pgdata/tbs_patrimoine
--      creation du tablespace
--        psql -d postgres
--             -c "CREATE TABLESPACE tps_patrimoine
--                        OWNER contrib
--                        LOCATION '/home/pgdata';"
-- 3.2. utilisation de cet tablespace
--      Au moment de la creation de la base de données patrimoine
--      il suffit de préciser que le tablespace à utiliser est tbs_patrimoine
-- 4. Creation de la base de données utilisant le tablespace
CREATE DATABASE patrimoine
  WITH OWNER = contrib
       TEMPLATE = templatepostgis
       ENCODING = 'UTF8'
       TABLESPACE = tbs_patrimoine
       LC_COLLATE = 'fr_FR.UTF-8'
       LC_CTYPE = 'fr_FR.UTF-8'
       CONNECTION LIMIT = -1;

-- 5. Creation des schemas a l'interieur de la base
--   Apres avoir créé la base, nous allons créer des schémas
--   nous aurons les schémas suivants :
--     cadastre_majic
--     cadatsre_travail
--     cadastre_public

