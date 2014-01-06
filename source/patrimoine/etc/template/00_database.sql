DROP DATABASE patrimoine;

CREATE DATABASE patrimoine
    WITH OWNER = contrib
         ENCODING = 'UTF8';

--create table liste_patrimoine (
--    id varchar(6),
--    nom varchar(50));

-- COPY liste_patrimoine(id, nom)
    --FROM '../../data/liste_patrimoine.txt'
COPY liste_patrimoine
    FROM '/home/fred/Travail/patrimoine/data/liste_patrimoine.txt'
    --FROM 'liste_patrimoine.txt'
    with DELIMITER ';';

