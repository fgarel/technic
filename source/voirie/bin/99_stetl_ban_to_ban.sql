
-- Initialisation_1 :

-- Au depart on a deux tables avec des données brutes
-- on fabrique deux tables intermédiaires (table_01 et table_02)
-- qui auront une structure identique et qui seront ainsi
-- plus facile à comparer

-- Ces tables intermediaires, contiennent chacune 3 colonnes :
--  - champ original
--  - champ automatique
--  - champ manuel



-- ---------------------------------- --
-- Table param_type_voie_administratif --
-- ---------------------------------- --

DROP table if exists voirie_administratif."param_type_voie_administratif" cascade;
CREATE table voirie_administratif."param_type_voie_administratif"
(
  "codeTypeVoieAdministratif" text,
  "boolVoieCommunale" boolean,
  "boolVoieCommunaleTableauClassement" boolean,
  "boolUsageOuvertAuPublic" boolean,
  "libelleTypeVoieAdministratif" text,
  "couleur" text
)
with (oids=True);

insert into voirie_administratif."param_type_voie_administratif" values ('VNAT', False, False, True, 'Voie Nationale', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VDEP', False, False, True, 'Voie Départementale', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VMAR', False, False, True, 'Domaine Maritime', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VCVC', True, True, True, 'Voie Communale "à caractère de chemin", en général hors agglomération', 'Vert');
insert into voirie_administratif."param_type_voie_administratif" values ('VCVU', True, True, True, 'Voie Communale "à caractère de rue"', 'Rouge "Fushia"');
insert into voirie_administratif."param_type_voie_administratif" values ('VCVP', True, True, True, 'Voie Communale "Voie Piétonne"', 'Bleu "Cyan"');
insert into voirie_administratif."param_type_voie_administratif" values ('VCPC', True, True, True, 'Voie Communale "Piste Cyclable"', 'Bleu "Marine"');
insert into voirie_administratif."param_type_voie_administratif" values ('VCPP', True, True, True, 'Voie Communale "Place Publique"', 'Orange');
insert into voirie_administratif."param_type_voie_administratif" values ('VCCR', True, False, True, 'Voie Communale "Chemin Rural"', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VCCV', True, False, True, 'Voie Communale "Chemin Vicinal"', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCV', False, False, False, 'Voie Privée "Chemin de Voisinage ou de Quartier", Indivis entre les propriétaires privés, non ouvert au public', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCT', False, False, False, 'Voie Privée "Chemin de Terre", plus large qu un sentier, non affecté à la circulation', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCE', False, False, False, 'Voie Privée "Chemin et Sentier d Exploitation", plusieurs copropriétaires, il peut etre interdit au public', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCO', False, False, True, 'Voie Privée "Chemin et Sentier d Exploitation", plusieurs copropriétaires, ouvert au public', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCD', False, False, False, 'Voie Privée "Chemin de Desserte, de Culture, d Aisance", un seul propriétaire, non ouvert au public', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCP', False, False, True, 'Voie Privée "Chemin de Passage", un seul propriétaire, il peut etre ouvert à la circulation du public', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCH', False, False, True, 'Voie Privée "Chemin de Halage", dépendance du domaine public fluvial, il peut etre affecté à la circulation du public', '');
insert into voirie_administratif."param_type_voie_administratif" values ('VPCC', False, False, False, 'Voie Privée "Chemin de Halage", dépendance du domaine public fluvial, non affecté à la circulation du public', '');



  -- ---------------------------------- --
  -- Table param_type_voie_semantique --
  -- ---------------------------------- --

  DROP table if exists voirie_administratif."param_type_voie_semantique" cascade;
  CREATE table voirie_administratif."param_type_voie_semantique"
  (
    "codeTypeVoieSemantiqueOSM" text,
    "codeTypeVoieSemantiqueBAN" text,
    "codeTypeVoieSemantiqueJUR" text,
    "libelleTypeVoieAdministratif" text
  )
  with (oids=True);

insert into voirie_administratif."param_type_voie_semantique" values ('Allée', 'ALL', 'ALLEE', 'Voie bordée d arbres, de haies ou de plate-bandes.');
insert into voirie_administratif."param_type_voie_semantique" values ('Avenue', 'AV', 'AVENUE', 'Grande voie urbaine plantée d arbres, le plus souvent radiale.');
insert into voirie_administratif."param_type_voie_semantique" values ('Boulevard', 'BD', 'BOULEVARD', 'Voie de communication plus large qu une rue faisant le tour de ville, à l origine à l emplacement d anciens remparts.');
insert into voirie_administratif."param_type_voie_semantique" values ('Chemin', 'CHE', 'CHEMIN', 'Voie de terre préparée pour aller d un lieu à un autre');
insert into voirie_administratif."param_type_voie_semantique" values ('Chaussée', 'CHS', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Cité', 'CITE', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Cour', 'COUR', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Cours', 'CRS', 'COURS', 'Promenade publique plantée d arbres');
insert into voirie_administratif."param_type_voie_semantique" values ('Digue', 'DIG', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Esplanade', 'ESP', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Fief', 'FIEF', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Giratoire', '', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Ilot', 'ILOT', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Impasse', 'IMP', 'IMPASSE', 'Voie à une seule entrée');
insert into voirie_administratif."param_type_voie_semantique" values ('Lotissement', '', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Mail', 'MAIL', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Parking', '', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Passage', 'PAS', 'PASSAGE', 'Galerie couverte et réservée aux piétons, qui sert au dégagement des rues voisines');
insert into voirie_administratif."param_type_voie_semantique" values ('Passerelle', '', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Rocade', '', 'PERIPHERIQUE', 'Autoroute urbaine qui fait le tour de ville');
insert into voirie_administratif."param_type_voie_semantique" values ('Place', 'PL', '', 'Espace découvert auquel aboutissent plusieurs rues');
insert into voirie_administratif."param_type_voie_semantique" values ('Pont', 'PONT', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Promenade', 'PROM', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Porte', 'PTE', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Petite Rue', 'PTR', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Quai', 'QU', 'QUAI', 'Voie publique entre une surface d eau et des habitations');
insert into voirie_administratif."param_type_voie_semantique" values ('Résidence', 'RES', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Rond-Point', 'RPT', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Route', 'RTE', 'ROUTE', 'Voie carrossable, aménagée pour aller d un lieu à un autre');
insert into voirie_administratif."param_type_voie_semantique" values ('Rue', 'R', 'RUE', 'Voie de circulation aménagée dans une ville, entre les habitations et les propriétés closes');
insert into voirie_administratif."param_type_voie_semantique" values ('Ruelle', '', 'RUELLE', 'Petite rue étroite');
insert into voirie_administratif."param_type_voie_semantique" values ('Square', 'SQ', 'SQUARE', 'Jardin public');
insert into voirie_administratif."param_type_voie_semantique" values ('Venelle', 'VEN', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Villa', 'VLA', '', '');
insert into voirie_administratif."param_type_voie_semantique" values ('Voie Communale', 'VC', '', '');


-- ---------------------------------- --
-- Table param_manytomany_vlr_archive_directeur_voie --
-- ---------------------------------- --

DROP table if exists voirie_administratif."param_manytomany_vlr_archive_directeur_voie" cascade;
CREATE table voirie_administratif."param_manytomany_vlr_archive_directeur_voie"
(
  "vlrArchiveDirecteur" text,
  "vlrArchiveVoie" text
)
with (oids=True);

-- ---------------------------------- --
-- Table param_manytomany_vlr_archive_directeur_theme --
-- ---------------------------------- --

DROP table if exists voirie_administratif."param_manytomany_vlr_archive_directeur_theme" cascade;
CREATE table voirie_administratif."param_manytomany_vlr_archive_directeur_theme"
(
  "vlrArchiveDirecteur" text,
  "vlrArchiveTheme" text
)
with (oids=True);


-- ---------------------------------- --
-- Table param_single_vlr_archive_theme --
-- ---------------------------------- --

DROP table if exists voirie_administratif."param_single_vlr_archive_theme" cascade;
CREATE table voirie_administratif."param_single_vlr_archive_theme"
(
  "vlrArchiveTheme" text,
  "vlrArchiveThemeLibelle" text
)
with (oids=True);


-- ---------------------------------- --
-- Table param_single_vlr_archive_directeur --
-- ---------------------------------- --

DROP table if exists voirie_administratif."param_single_vlr_archive_directeur" cascade;
CREATE table voirie_administratif."param_single_vlr_archive_directeur"
(
  "vlrArchiveDirecteur" text,
  "vlrArchiveDirecteurLettre" text
)
with (oids=True);

-- ---------------------------------- --
-- Table param_single_vlr_archive_voie --
-- ---------------------------------- --

DROP table if exists voirie_administratif."param_single_vlr_archive_voie" cascade;
CREATE table voirie_administratif."param_single_vlr_archive_voie"
(
  "vlrArchiveVoieOriginal" text,
  "vlrArchiveVoieAutomatique" text,
  "vlrArchiveVoieManuel" text
)
with (oids=True);


-- ---------------------------------- --
-- Table param_onetoone_vlr_archive_voie_attribut --
-- ---------------------------------- --

DROP table if exists voirie_administratif."param_onetoone_vlr_archive_voie_attribut" cascade;
CREATE table voirie_administratif."param_onetoone_vlr_archive_voie_attribut"
(
  "vlrArchiveVoie" text,
  "vlrArchiveAttribut1" text
)
with (oids=True);

-- ---------------------------------- --
-- Table extraction_ban_adresse_opendata --
-- ---------------------------------- --

-- create
DROP TABLE if exists voirie_administratif."extraction_ban_adresse_opendata" cascade;

CREATE TABLE voirie_administratif."extraction_ban_adresse_opendata"
(
  cleabs text,
  numero int,
  indice_de_repetition text,
  nom_voie text,
  nom_lieu_dit text,
  alias text,
  insee_commune bigint,
  code_postal bigint,
  geometry_3857 text--,
  --geometry_3857_original geometry(Geometry,3857),
  --geometry_3946_automatique geometry(Geometry,3946),
  --geometry_3946_manuel geometry(Geometry,3946)
)
WITH (
  OIDS=TRUE
);

--ALTER TABLE voirie_administratif."extraction_ban_adresse_opendata"
--  OWNER TO "osmuser";

COPY voirie_administratif."extraction_ban_adresse_opendata" FROM '/home/fred/Documents/technic/source/voirie/data/extraction_ban_csv/adresse_opendata.csv' DELIMITERS ',' CSV HEADER;

select Addgeometrycolumn('voirie_administratif', 'extraction_ban_adresse_opendata', 'geometry_3857_original', 3857, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_adresse_opendata', 'geometry_3946_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_adresse_opendata', 'geometry_3946_manuel', 3946, 'GEOMETRY', 2);


-- ---------------------------------- --
-- Table extraction_ban_commune --
-- ---------------------------------- --

DROP TABLE if exists voirie_administratif."extraction_ban_commune" cascade;

CREATE TABLE voirie_administratif."extraction_ban_commune"
(
  lien_vers_commune text,
  geometrie_3857 text,
  altitude_maximum_cdc int,
  altitude_minimum_cdc int,
  article_cdc text,
  article_de_l_arrondissement_cdc text,
  article_de_la_region_cdc text,
  article_du_canton_rural_cdc text,
  article_du_departement_cdc text,
  id_bdadmin_cdc bigint,
  code_insee_cdc bigint,
  code_insee_de_l_arrondissement_cdc bigint,
  code_insee_de_la_region_cdc bigint,
  code_insee_du_canton_rural_cdc bigint,
  code_insee_du_departement_cdc bigint,
  date_du_decret_de_creation_cdc date,
  date_du_decret_de_fin_de_validite_cdc date,
  date_du_recensement_cdc date,
  surface_en_ha_cdc bigint,
  lien_vers_chef_lieu_cdc text,
  nom_de_l_arrondissement_cdc text,
  nom_de_la_region_cdc text,
  nom_du_canton_rural_cdc text,
  nom_du_departement_cdc text,
  nom_normalise_cdc text,
  nom_officiel_cdc text,
  origine_du_nom_officiel_cdc text,
  population_cdc bigint,
  organisme_recenseur_cdc text,
  genre_de_l_entite_cdc text,
  id_bdcarto_commune_cdc text,
  id_bdcarto_canton_cdc text,
  id_bdcarto_arrondissement_cdc text,
  id_bdcarto_departement_cdc text,
  id_bdcarto_region_cdc text,
  x_centroide_departement_cdc text,
  y_centroide_departement_cdc text,
  x_centroide_region_cdc text,
  y_centroide_region_cdc text,
  etat_de_l_objet text,
  cleabs text,
  numrec text,
  nom text,
  metadonnees_communales_cdc text,
  code_postal_cdc bigint,
  detruit boolean,
  ordrefinevol bigint,
  daterec date,
  geometrie text,
  empreinte text--,
  --geometry_original geometry(Geometry),
  --geometry_automatique geometry(Geometry,3946),
  --geometry_manuel geometry(Geometry,3946)
)
WITH (
  OIDS=TRUE
);

--ALTER TABLE voirie_administratif."extraction_ban_commune"
--  OWNER TO "osmuser";

COPY voirie_administratif."extraction_ban_commune" FROM '/home/fred/Documents/technic/source/voirie/data/extraction_ban_csv/commune.csv' DELIMITERS ',' CSV HEADER;

select Addgeometrycolumn('voirie_administratif', 'extraction_ban_commune', 'geometry_3857_original', 3857, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_commune', 'geometry_3946_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_commune', 'geometry_3946_manuel', 3946, 'GEOMETRY', 2);


-- ---------------------------------- --
-- Table extraction_ban_troncon_de_route --
-- ---------------------------------- --

DROP TABLE if exists voirie_administratif."extraction_ban_troncon_de_route" cascade;


CREATE TABLE voirie_administratif."extraction_ban_troncon_de_route"
(
  geometrie_3857 text,
  source_du_z text,
  nature text,
  importance text,
  fictif text,
  position_par_rapport_au_sol text,
  nombre_de_voies text,
  liens_vers_route_nommee text,
  sens_de_circulation text,
  acces text,
  itineraire_vert text,
  restriction_de_hauteur text,
  restriction_de_poids text,
  nom_rue_gauche text,
  nom_rue_droite text,
  borne_debut_droite text,
  borne_debut_gauche text,
  borne_fin_droite text,
  borne_fin_gauche text,
  type_d_adressage text,
  date_de_mise_en_service date,
  insee_commune_gauche text,
  insee_commune_droite text,
  bornes_debut_interpolees text,
  bornes_fin_interpolees text,
  fermeture_saisonniere text,
  identifiant_fpb_voie_droite text,
  identifiant_fpb_voie_gauche text,
  largeur_de_chaussee real,
  toponyme_infrastructure text,
  type_appariement text,
  urbain text,
  commentaire text,
  affichagerue text,
  etat_de_l_objet text,
  cleabs text,
  numrec text,
  nom text,
  reserve_aux_bus text,
  cdb_bretelle_autoroutiere text,
  nom_rue_gauche_valide text,
  nom_rue_droite_valide text,
  adressage_valide text,
  alias_gauche text,
  alias_droit text,
  nom_lieu_dit_gauche text,
  nom_lieu_dit_droit text,
  code_postal_gauche text,
  code_postal_droit text,
  cdb_commentaire text,
  source_restitution text,
  prive text,
  confirmation_terrain text,
  detruit text,
  ordrefinevol text,
  daterec text,
  geometrie text,
  empreinte text
--,
--geometry_original geometry(Geometry),
--geometry_automatique geometry(Geometry,3946),
--geometry_manuel geometry(Geometry,3946)
)
WITH (
OIDS=TRUE
);

--ALTER TABLE voirie_administratif."extraction_ban_troncon_de_route"
--  OWNER TO "osmuser";

COPY voirie_administratif."extraction_ban_troncon_de_route" FROM '/home/fred/Documents/technic/source/voirie/data/extraction_ban_csv/troncon_de_route.csv' DELIMITERS ',' CSV HEADER;

select Addgeometrycolumn('voirie_administratif', 'extraction_ban_troncon_de_route', 'geometry_3857_original', 3857, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_troncon_de_route', 'geometry_3946_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_troncon_de_route', 'geometry_3946_manuel', 3946, 'GEOMETRY', 2);


-- ---------------------------------- --
-- Table extraction_ban_voie --
-- ---------------------------------- --

DROP TABLE if exists voirie_administratif."extraction_ban_voie" cascade;


CREATE TABLE voirie_administratif."extraction_ban_voie"
(
  geometrie_3857 text,
  id_pseudo_fpb text,
  nom_minuscule text,
  nom_initial_troncon text,
  qualite_passage_maj_min text,
  nom_local text,
  alias_minuscule text,
  alias_initial_troncon text,
  type_d_adressage text,
  mot_directeur text,
  type_voie text,
  type_liaison text,
  validite text,
  fiabilite text,
  lien_vers_pai text,
  code_insee text,
  code_postal text,
  etat_de_l_objet text,
  cleabs text,
  numrec text,
  detruit text,
  ordrefinevol text,
  daterec date,
  geometrie text,
  empreinte text
--,
--geometry_original geometry(Geometry),
--geometry_automatique geometry(Geometry,3946),
--geometry_manuel geometry(Geometry,3946)
)
WITH (
OIDS=TRUE
);

--ALTER TABLE voirie_administratif."extraction_ban_voie"
--  OWNER TO "osmuser";

COPY voirie_administratif."extraction_ban_voie" FROM '/home/fred/Documents/technic/source/voirie/data/extraction_ban_csv/voie.csv' DELIMITERS ',' CSV HEADER;

select Addgeometrycolumn('voirie_administratif', 'extraction_ban_voie', 'geometry_3857_original', 3857, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_voie', 'geometry_3946_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_ban_voie', 'geometry_3946_manuel', 3946, 'GEOMETRY', 2);


-- ---------------------------------- --
-- Table extraction_osm_charente_maritime --
-- ---------------------------------- --

DROP TABLE if exists voirie_administratif."extraction_osm_charente_maritime" cascade;


CREATE TABLE voirie_administratif."extraction_osm_charente_maritime"
(
  LON real,
  LAT real,
  NUMBER bigint,
  STREET text,
  UNIT int,
  CITY text,
  DISTRICT int,
  REGION int,
  POSTCODE bigint,
  ID int,
  HASH text
--,
--geometry_original geometry(Geometry),
--geometry_automatique geometry(Geometry,3946),
--geometry_manuel geometry(Geometry,3946)
)
WITH (
OIDS=TRUE
);

--ALTER TABLE voirie_administratif."extraction_osm_charente_maritime"
--  OWNER TO "osmuser";

COPY voirie_administratif."extraction_osm_charente_maritime" FROM '/home/fred/Documents/technic/source/voirie/data/extraction_osm_csv/charente_maritime.csv' DELIMITERS ',' CSV HEADER;


select Addgeometrycolumn('voirie_administratif', 'extraction_osm_charente_maritime', 'geometry_3857_original', 3857, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_osm_charente_maritime', 'geometry_3946_automatique', 3946, 'GEOMETRY', 2);
select Addgeometrycolumn('voirie_administratif', 'extraction_osm_charente_maritime', 'geometry_3946_manuel', 3946, 'GEOMETRY', 2);


-- ---------------------------------- --
-- Table a_transferer_ban_Adresses --
-- ---------------------------------- --

DROP TABLE if exists voirie_administratif."a_transferer_ban_Adresses" cascade;


CREATE TABLE voirie_administratif."a_transferer_ban_Adresses"
(
  insee bigint,
  id_externe_adresse text,
  numero int,
  indice text,
  parcelle text,
  id_externe_voie text,
  x real,
  y real
--,
--geometry_original geometry(Geometry),
--geometry_automatique geometry(Geometry,3946),
--geometry_manuel geometry(Geometry,3946)
)
WITH (
OIDS=TRUE
);


--ALTER TABLE voirie_administratif."a_transferer_ban_Adresses"
--  OWNER TO "osmuser";

-- ---------------------------------- --
-- Table a_transferer_ban_VoiesLieuxDits --
-- ---------------------------------- --

DROP TABLE if exists voirie_administratif."a_transferer_ban_VoiesLieuxDits" cascade;


CREATE TABLE voirie_administratif."a_transferer_ban_VoiesLieuxDits"
(
  identifiant_externe text,
  libelle text,
  insee_commune bigint,
  code_rivoli text,
  code_postal bigint
--,
--geometry_original geometry(Geometry),
--geometry_automatique geometry(Geometry,3946),
--geometry_manuel geometry(Geometry,3946)
)
WITH (
OIDS=TRUE
);


--ALTER TABLE voirie_administratif."a_transferer_ban_VoiesLieuxDits"
--  OWNER TO "osmuser";


-- ---------------------------------- --
-- Table a_transferer_tableauClassement_VoieChemin --
-- ---------------------------------- --

DROP TABLE if exists voirie_administratif."a_transferer_tableauClassement_VoieChemin" cascade;


CREATE TABLE voirie_administratif."a_transferer_tableauClassement_VoieChemin"
(
  numero_d_ordre text,
  appellation_de_la_voie text,
  designation_point_origine text,
  designation_principaux_lieux_traverses_ou_repere text,
  designation_point_extremite text,
  longueur real,
  largeur_moyenne real,
  date_de_classement date,
  rappel_classement_categorie text,
  rappel_classement_numero text,
  rappel_classement_date date,
  rappel_ancienne_appellation text,
  rappel_longueur real,
  observations text
--,
--geometry_original geometry(Geometry),
--geometry_automatique geometry(Geometry,3946),
--geometry_manuel geometry(Geometry,3946)
)
WITH (
OIDS=TRUE
);


--ALTER TABLE voirie_administratif."a_transferer_tableauClassement_VoieChemin"
--  OWNER TO "osmuser";



-- ---------------------------------- --
-- remplissage de la table a_transferer_tableauClassement_VoieChemin --
-- ---------------------------------- --

insert into voirie_administratif."a_transferer_tableauClassement_VoieChemin"
select
  cleabs || '_' || oid as numero_d_ordre,
  nom_rue_gauche as appellation_de_la_voie,
  '' as designation_point_origine,
  '' as designation_principaux_lieux_traverses_ou_repere,
  '' as designation_point_extremite,
  ST_Length(ST_GeomFromText(geometrie_3857)) as longueur,
  largeur_de_chaussee as largeur_moyenne,
  '1899-12-31'::date as date_de_classement,
  nature as rappel_classement_categorie,
  importance as rappel_classement_numero,
  '1799-12-31'::date as rappel_classement_date,
  '' as rappel_ancienne_appellation,
  ST_Length(ST_GeomFromText(geometrie_3857)) as rappel_longueur,
  '' as observations
from
  voirie_administratif."extraction_ban_troncon_de_route"
