

--
-- adresses-cadastre-17.csv
--

CREATE TABLE "adresses-cadastre-17" (
	cle_interop VARCHAR, 
	uid_adresse BOOLEAN, 
	numero DECIMAL, 
	suffixe VARCHAR, 
	pseudo_numero BOOLEAN, 
	voie_nom VARCHAR, 
	voie_code VARCHAR, 
	code_postal DECIMAL, 
	libelle_acheminement VARCHAR, 
	destination_principale VARCHAR, 
	commune_code DECIMAL, 
	commune_nom VARCHAR, 
	source VARCHAR, 
	long DECIMAL, 
	lat DECIMAL, 
	x DECIMAL, 
	y DECIMAL, 
	position VARCHAR, 
	date_der_maj DATE
);


--
-- adresses-locales-17.csv
--

CREATE TABLE "adresses-locales-17" (
	id VARCHAR, 
	"codeCommune" DECIMAL, 
	"nomCommune" VARCHAR, 
	"codeVoie" DECIMAL, 
	"nomVoie" VARCHAR, 
	numero DECIMAL, 
	suffixe BOOLEAN, 
	lon DECIMAL, 
	lat DECIMAL, 
	licence VARCHAR
);


--
-- adresses-lo-17.csv
--

CREATE TABLE "adresses-lo-17" (
	id VARCHAR, 
	id_fantoir VARCHAR, 
	numero DECIMAL, 
	rep BOOLEAN, 
	nom_voie VARCHAR, 
	code_postal DECIMAL, 
	code_insee DECIMAL, 
	nom_commune VARCHAR, 
	code_insee_ancienne_commune BOOLEAN, 
	nom_ancienne_commune BOOLEAN, 
	x DECIMAL, 
	y DECIMAL, 
	lon DECIMAL, 
	lat DECIMAL, 
	alias BOOLEAN, 
	nom_ld BOOLEAN, 
	libelle_acheminement VARCHAR, 
	nom_afnor VARCHAR, 
	source_position VARCHAR, 
	source_nom_voie VARCHAR
);


--
-- adresses-odbl-17.csv
--

CREATE TABLE "adresses-odbl-17" (
	id VARCHAR, 
	id_fantoir VARCHAR, 
	numero DECIMAL, 
	rep BOOLEAN, 
	nom_voie VARCHAR, 
	code_postal DECIMAL, 
	code_insee DECIMAL, 
	nom_commune VARCHAR, 
	code_insee_ancienne_commune BOOLEAN, 
	nom_ancienne_commune BOOLEAN, 
	x DECIMAL, 
	y DECIMAL, 
	lon DECIMAL, 
	lat DECIMAL, 
	alias BOOLEAN, 
	nom_ld BOOLEAN, 
	libelle_acheminement VARCHAR, 
	nom_afnor VARCHAR, 
	source_position VARCHAR, 
	source_nom_voie VARCHAR
);


--
-- adresses-api-ban-17.csv
--

CREATE TABLE "adresses-api-ban-17" (
	id_ban_position VARCHAR, 
	id_ban_adresse VARCHAR, 
	cle_interop VARCHAR, 
	id_ban_group VARCHAR, 
	id_fantoir VARCHAR, 
	numero DECIMAL, 
	suffixe BOOLEAN, 
	nom_voie VARCHAR, 
	code_postal DECIMAL, 
	nom_commune VARCHAR, 
	code_insee DECIMAL, 
	nom_complementaire BOOLEAN, 
	x DECIMAL, 
	y DECIMAL, 
	lon DECIMAL, 
	lat DECIMAL, 
	typ_loc VARCHAR, 
	source VARCHAR, 
	date_der_maj DATE
);


--
-- adresses-api-groupign-17.csv
--

CREATE TABLE "adresses-api-groupign-17" (
	id_ban_group VARCHAR, 
	ign VARCHAR
);


--
-- adresses-api-housenumberign-17.csv
--

CREATE TABLE "adresses-api-housenumberign-17" (
	id_ban_adresse VARCHAR, 
	ign VARCHAR
);
