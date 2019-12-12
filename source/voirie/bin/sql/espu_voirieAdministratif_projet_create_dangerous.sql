-- ce script est dangereux : il efface les informations des tables
-- numvoie
-- et alignement_croquis

-- Après effacement, il est possible de remplir les infos à partir de
-- - a_voirie.vo_adresse
-- - et a_voirie.vo_voie,
-- mais les modifs récentes seront définitivement perdues

-- connexion a la base espu
-- identifiant : fred
-- password : fgpass


-- Il y a deux parties dans ce traitement
-- Partie 1 :
--     il s'agit d'initier la base de données avec une struture adéquate :
--     une table numvoie
--     une table alignement_croquis
-- Partie 2 :
--     cette seconde partie concerne la mise à jour de la table tarcelle_tab

ALTER ROLE fred
  SET search_path = "$user", voirie_administratif, public;


-- ----------- --
-- 1ere partie --
-- ----------- --

-- Attention, dans cette premiere partie, il y a des choses à faire une et une seule fois,
-- et il y a aussi des choses à faire quand il faut changer de mot de passe windows

-- Creation de :
-- - table ""alignement_croquis""
-- - table ""numvoie""
-- - la table distante ""demande"" est une table etrangere : fichier num_align-demande.csv
-- - la table distante ""parcelle"" est une table etrangère : fichier num_align-parcelle.csv
-- - la table distante ""demande_gspreadsheet"" est une table etrangere : google drive gspreadsheet
-- - la table distante ""numvoie_ban"" est une table etrangere : fichier adresse_opendata.csv
-- - la vue numvoie_vue est lien vers la base sig du server 172.17.150.6
-- - la vue parcelle_vue est lien vers la base sig du server 172.17.150.6



-- ------------------ --
-- alignement_croquis --
-- ------------------ --

-- Sequence: voirie_administratif.alignement_croquis_id_seq

-- DROP SEQUENCE if exists voirie_administratif.alignement_croquis_id_seq;
DROP SEQUENCE if exists voirie_administratif.alignement_croquis_id_seq;
CREATE SEQUENCE voirie_administratif.alignement_croquis_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.alignement_croquis_id_seq
  OWNER TO fred;

-- Table: voirie_administratif.alignement_croquis

-- DROP TABLE if exists voirie_administratif.alignement_croquis;
DROP TABLE if exists voirie_administratif.alignement_croquis;
CREATE TABLE voirie_administratif.alignement_croquis
(
  --id integer NOT NULL DEFAULT nextval('voirie_administratif.alignement_croquis_id_seq'::regclass), -- Identifiant
  id integer NOT NULL, -- Identifiant
  shape geometry, -- Geometrie
  CONSTRAINT id_alignement_croquis_pk PRIMARY KEY (id),
  CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'LINESTRING'::text OR shape IS NULL),
  CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
--ALTER TABLE voirie_administratif.alignement_croquis
--  ADD constraint id_alignement_croquis_pk PRIMARY KEY (id);
ALTER TABLE voirie_administratif.alignement_croquis
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif.alignement_croquis
  IS 'Alignement de fait.';
COMMENT ON COLUMN voirie_administratif.alignement_croquis.id IS 'Identifiant';
COMMENT ON COLUMN voirie_administratif.alignement_croquis.shape IS 'Geometrie';


-- ------- --
-- numvoie --
-- ------- --

-- Sequence: voirie_administratif.numvoie_id_seq

-- DROP SEQUENCE if exists voirie_administratif.numvoie_id_seq;
DROP SEQUENCE if exists voirie_administratif.numvoie_id_seq;
CREATE SEQUENCE voirie_administratif.numvoie_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER SEQUENCE voirie_administratif.numvoie_id_seq
  OWNER TO fred;

-- DROP TABLE if exists voirie_administratif.numvoie;
DROP TABLE if exists voirie_administratif."numvoie";
CREATE TABLE voirie_administratif."numvoie"
(
  --id serial NOT NULL DEFAULT nextval('voirie_administratif.numvoie_id_seq'::regclass), -- Identifiant
  id serial NOT NULL, -- Identifiant
  id_vo_adresse character varying, -- identifiant a_voirie.vo_adresse
  id_cleabs character varying, -- identifiant numvoie_ban
  code_demande character varying, -- code_demande
  numvoie character varying, -- Numéro + complément
  numvoie_num numeric, -- Numéro
  numvoie_complement character varying, -- Complément
  nomvoie character varying, -- Nom de la voie
  batiment character varying, -- Nom du batiment eventuel
  angle numeric, -- Angle utilisé uniquement pour l'orientation
  shape geometry,
  CONSTRAINT id_numvoie_pk PRIMARY KEY (id),
  --CONSTRAINT enforce_dims_geom CHECK (st_ndims(shape) = 2),
  CONSTRAINT enforce_geotype_geom CHECK (geometrytype(shape) = 'POINT'::text OR shape IS NULL),
  CONSTRAINT enforce_srid_geom CHECK (st_srid(shape) = 3946)
)
WITH (
  OIDS=FALSE
);
--ALTER TABLE voirie_administratif.numvoie
--  ADD constraint id_numvoie_pk PRIMARY KEY (id);
ALTER TABLE voirie_administratif."numvoie"
  OWNER TO fred;
COMMENT ON TABLE voirie_administratif."numvoie"
  IS 'Numéro correspondant à l''adresse postale de la parcelle.';
COMMENT ON COLUMN voirie_administratif.numvoie.id IS 'Identifiant';
COMMENT ON COLUMN voirie_administratif.numvoie.code_demande IS 'code_demande';
COMMENT ON COLUMN voirie_administratif.numvoie.angle IS 'Angle Orientation du texte';
COMMENT ON COLUMN voirie_administratif.numvoie.shape IS 'Geometrie';


-- Ensemble d'instructions pour ajouter une colonne a la table numvoie

--select * from numvoie limit 100;

alter table numvoie
drop column if exists position;

alter table numvoie
add column position varchar;

-- les différentes valeurs possibles sont
--   - delivrance postale
--   - entrée
--   - batiment
--   - cage d'escalier
--   - logement
--   - parcelle
--   - segment
--   - service technique
alter table numvoie
alter column position set default 'entrée';

select * from numvoie
where position is null;

update numvoie
set position = 'entrée'
where position is null;

alter table numvoie
alter column position set not null;

alter table numvoie
ADD CONSTRAINT numvoie_position_check CHECK (
 position in ('délivrance postale',
			   'entrée',
			   'bâtiment',
			   'cage d''escalier',
			   'logement',
			   'parcelle',
			   'segment',
			   'service technique'
			   )
);

--select * from numvoie limit 100;

COMMENT ON COLUMN voirie_administratif.numvoie.position IS 'type d''adresse';
