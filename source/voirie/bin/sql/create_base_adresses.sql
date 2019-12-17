-- Database: espu

-- DROP DATABASE espu;

CREATE DATABASE espu
    WITH
    OWNER = fred
    ENCODING = 'UTF8'
    LC_COLLATE = 'fr_FR.UTF-8'
    LC_CTYPE = 'fr_FR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

ALTER DATABASE espu
    SET search_path TO "$user", public, topology;

GRANT TEMPORARY, CONNECT ON DATABASE espu TO PUBLIC;

GRANT ALL ON DATABASE espu TO fred;

GRANT ALL ON DATABASE espu TO voirie_administratif;

GRANT ALL ON DATABASE espu TO michel;

GRANT ALL ON DATABASE espu TO voirie_travaux;

GRANT ALL ON DATABASE espu TO voirie_topographie;

GRANT ALL ON DATABASE espu TO pascal;

GRANT ALL ON DATABASE espu TO voirie_deplacement;

GRANT ALL ON DATABASE espu TO francois;




CREATE EXTENSION if not exists adminpack ;
CREATE EXTENSION if not exists dblink ;
CREATE EXTENSION if not exists fuzzystrmatch ;
CREATE EXTENSION if not exists hstore ;
CREATE EXTENSION if not exists multicorn ;
CREATE EXTENSION if not exists ogr_fdw ;
CREATE EXTENSION if not exists plpgsql ;
CREATE EXTENSION if not exists plpython3u ;
CREATE EXTENSION if not exists postgis ;
CREATE EXTENSION if not exists postgis_raster ;
CREATE EXTENSION if not exists postgis_sfcgal ;
CREATE EXTENSION if not exists postgis_tiger_geocoder ;
CREATE EXTENSION if not exists postgis_topology ;
CREATE EXTENSION if not exists unaccent ;
CREATE EXTENSION if not exists {} ;
