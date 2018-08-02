-- ---------------------------------
-- DROP
-- ---------------------------------
DROP TABLE if exists "EmprisePublicationPCRS" cascade;
DROP TABLE if exists "TronconVoiriePCRS" cascade;
DROP TABLE if exists "HabillagePCRS" cascade;
DROP TABLE if exists "SymboleHabillagePCRS" cascade;
DROP TABLE if exists "TexteHabillagePCRS" cascade;
DROP TABLE if exists "NomVoiriePCRS" cascade;
DROP TABLE if exists "NumeroVoiriePCRS" cascade;
DROP TABLE if exists "PointLevePCRS" cascade;
DROP TABLE if exists "ObjetGeneriquePCRS" cascade;
DROP TABLE if exists "PointCanevasPCRS" cascade;
DROP TABLE if exists "BordurePCRS" cascade;
DROP TABLE if exists "ChangementRevetementPCRS" cascade;
DROP TABLE if exists "MarcheEscalierPCRS" cascade;
DROP TABLE if exists "FacadePCRS" cascade;
DROP TABLE if exists "ProeminenceBatiPCRS" cascade;
DROP TABLE if exists "SeuilPCRS" cascade;
DROP TABLE if exists "MurPCRS" cascade;
DROP TABLE if exists "PilierRegulierPCRS" cascade;
DROP TABLE if exists "PilierParticulierPCRS" cascade;
DROP TABLE if exists "RailPCRS" cascade;
DROP TABLE if exists "HaieEspaceVertPCRS" cascade;
DROP TABLE if exists "ArbreAlignementPCRS" cascade;
DROP TABLE if exists "PilePontPCRS" cascade;
DROP TABLE if exists "AffleurantSymbolePCRS" cascade;
DROP TABLE if exists "AffleurantEnveloppePCRS" cascade;





-- ---------------------------------
-- Creation des tables "liste de valeurs / énumérations"
-- ---------------------------------

-- ---------------------------------
-- Classe : CalendrierPCRS
-- ---------------------------------

-- Table: CalendrierPCRS
DROP TABLE if exists "CalendrierPCRS";
CREATE TABLE "CalendrierPCRS"
(
  code character varying(2) unique,
  libelle character varying(24),
  CONSTRAINT "CalendrierPCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "CalendrierPCRS" (code, libelle) VALUES ('01', 'Livré, Mis A Disposition');
INSERT INTO "CalendrierPCRS" (code, libelle) VALUES ('02', 'Actualisation En Cours');
INSERT INTO "CalendrierPCRS" (code, libelle) VALUES ('03', 'En Projet, Planifié');
INSERT INTO "CalendrierPCRS" (code, libelle) VALUES ('04', 'Non Planifié');

-- ---------------------------------
-- Classe : ClassePrecisionPCRS
-- ---------------------------------

-- Table: ClassePrecisionPCRS
DROP TABLE if exists "ClassePrecisionPCRS";
CREATE TABLE "ClassePrecisionPCRS"
(
  code character varying(3) unique,
  libelle character varying(17),
  CONSTRAINT "ClassePrecisionPCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "ClassePrecisionPCRS" (code, libelle) VALUES ('002', 'moins de 2 cm');
INSERT INTO "ClassePrecisionPCRS" (code, libelle) VALUES ('005', 'de 2 à 5 cm');
INSERT INTO "ClassePrecisionPCRS" (code, libelle) VALUES ('010', 'de 5 à 10 cm');
INSERT INTO "ClassePrecisionPCRS" (code, libelle) VALUES ('040', 'de 10 à 40 cm');
INSERT INTO "ClassePrecisionPCRS" (code, libelle) VALUES ('150', 'de 40 à 150 cm');
INSERT INTO "ClassePrecisionPCRS" (code, libelle) VALUES ('999', 'au delà de 150 cm');


-- ---------------------------------
-- Classe : CodeCouleurAffleurant
-- ---------------------------------

-- Table: CodeCouleurAffleurant
DROP TABLE if exists "CodeCouleurAffleurant";
CREATE TABLE "CodeCouleurAffleurant"
(
  code character varying(6) unique,
  libelle character varying(80),
  CONSTRAINT "CodeCouleurAffleurant_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Rouge', 'Electricité BT, HTA ou HTB, éclairage, signalisation routière et feux tricolores');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Jaune', 'Gaz combustible (transport ou distribution) et Hydrocarbures');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Orange', 'Produits chimiques');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Bleu', 'Eau potable');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Marron', 'Assainissement et Pluvial');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Violet', 'Chauffage et Climatisation');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Vert', 'Communications électroniques et électricité TBT');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Rose', 'Emprise multi-réseaux');
INSERT INTO "CodeCouleurAffleurant" (code, libelle) VALUES ('Blanc', 'Non-défini');


-- ---------------------------------
-- Classe : CotationPCRS
-- ---------------------------------

-- Table: CotationPCRS
DROP TABLE if exists "CotationPCRS";
CREATE TABLE "CotationPCRS"
(
  code character varying(2) unique,
  libelle character varying(38),
  CONSTRAINT "CotationPCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "CotationPCRS" (code, libelle) VALUES ('01', 'Non Utilisable Pour Coter');
INSERT INTO "CotationPCRS" (code, libelle) VALUES ('02', 'Cotation Planimetrique Uniquement');
INSERT INTO "CotationPCRS" (code, libelle) VALUES ('03', 'Cotation Planimetrique Et Altimetrique');

-- ---------------------------------
-- Classe : EmprisePCRSType
-- ---------------------------------

-- Table: EmprisePCRSType
DROP TABLE if exists "EmprisePCRSType";
CREATE TABLE "EmprisePCRSType"
(
  code character varying(2) unique,
  libelle character varying(21),
  CONSTRAINT "EmprisePCRSType_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "EmprisePCRSType" (code, libelle) VALUES ('01', 'Couloir');
INSERT INTO "EmprisePCRSType" (code, libelle) VALUES ('02', 'Opération');
INSERT INTO "EmprisePCRSType" (code, libelle) VALUES ('03', 'Carreau');
INSERT INTO "EmprisePCRSType" (code, libelle) VALUES ('04', 'Limite Administrative');
INSERT INTO "EmprisePCRSType" (code, libelle) VALUES ('05', 'Raster');


-- ---------------------------------
-- Classe : Gestionnaire
-- ---------------------------------

-- Table: Gestionnaire
DROP TABLE if exists "Gestionnaire";
CREATE TABLE "Gestionnaire"
(
  gestionnaire character varying unique,
  CONSTRAINT "Gestionnaire_pkey" PRIMARY KEY (gestionnaire)
)
WITH (
  OIDS=FALSE
);


-- ---------------------------------
-- Classe : NatureAffleurant
-- ---------------------------------

-- Table: NatureAffleurant
DROP TABLE if exists "NatureAffleurant";
CREATE TABLE "NatureAffleurant"
(
  code character varying(2) unique,
  libelle character varying(23),
  CONSTRAINT "NatureAffleurant_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('00', 'Non défini');
INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('01', 'Avaloir');
INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('02', 'Boîte, Coffret, Armoire');
INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('03', 'Tampon');
INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('04', 'Bouche à clé');
INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('05', 'Bouche, Poteau incendie');
INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('06', 'Poteau');
INSERT INTO "NatureAffleurant" (code, libelle) VALUES ('07', 'Borne d éclairage');



-- ---------------------------------
-- Classe : PlacementPCRS
-- ---------------------------------

-- Table: PlacementPCRS
DROP TABLE if exists "PlacementPCRS";
CREATE TABLE "PlacementPCRS"
(
  code character varying(2) unique,
  libelle character varying(40),
  CONSTRAINT "PlacementPCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "PlacementPCRS" (code, libelle) VALUES ('00', 'Sans Repositionnement');
INSERT INTO "PlacementPCRS" (code, libelle) VALUES ('01', 'Repositionnement Gestionnaire de Réseaux');
INSERT INTO "PlacementPCRS" (code, libelle) VALUES ('02', 'Positionnement Axe Voirie');
INSERT INTO "PlacementPCRS" (code, libelle) VALUES ('03', 'Positionnement Limite Voirie');
INSERT INTO "PlacementPCRS" (code, libelle) VALUES ('04', 'Positionnement Hors Voirie');
INSERT INTO "PlacementPCRS" (code, libelle) VALUES ('05', 'Positionnement Parcelle');


-- ---------------------------------
-- Classe : ProprieteEspace
-- ---------------------------------

-- Table: ProprieteEspace
DROP TABLE if exists "ProprieteEspace";
CREATE TABLE "ProprieteEspace"
(
  code character varying(2) unique,
  libelle character varying(13),
  CONSTRAINT "ProprieteEspace_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "ProprieteEspace" (code, libelle) VALUES ('01', 'Espace Public');
INSERT INTO "ProprieteEspace" (code, libelle) VALUES ('02', 'Espace Privé');
INSERT INTO "ProprieteEspace" (code, libelle) VALUES ('03', 'Indéfini');

-- ---------------------------------
-- Classe : QualiteCategorisation
-- ---------------------------------

-- Table: QualiteCategorisation
DROP TABLE if exists "QualiteCategorisation";
CREATE TABLE "QualiteCategorisation"
(
  code character varying(2) unique,
  libelle character varying(29),
  CONSTRAINT "QualiteCategorisation_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "QualiteCategorisation" (code, libelle) VALUES ('01', 'Conforme PCRS');
INSERT INTO "QualiteCategorisation" (code, libelle) VALUES ('02', 'Import ERDF');
INSERT INTO "QualiteCategorisation" (code, libelle) VALUES ('03', 'Selon CCTP avant 2015 PVRC v1');


-- ---------------------------------
-- Classe : TexteJustification
-- ---------------------------------

-- Table: TexteJustification
DROP TABLE if exists "TexteJustification";
CREATE TABLE "TexteJustification"
(
  code character varying(1) unique,
  libelle character varying(6),
  CONSTRAINT "TexteJustification_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "TexteJustification" (code, libelle) VALUES ('G', 'Gauche');
INSERT INTO "TexteJustification" (code, libelle) VALUES ('C', 'Centre');
INSERT INTO "TexteJustification" (code, libelle) VALUES ('D', 'Droite');

-- ---------------------------------
-- Classe : ThematiquePCRS
-- ---------------------------------

-- Table: ThematiquePCRS
DROP TABLE if exists "ThematiquePCRS";
CREATE TABLE "ThematiquePCRS"
(
  code character varying(2) unique,
  libelle character varying(13),
  CONSTRAINT "ThematiquePCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('00', 'A déterminer');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('01', 'Topographie');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('02', 'Bâti');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('03', 'Voirie');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('04', 'Ferroviaire');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('05', 'Clôture');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('06', 'Végétal');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('07', 'Ouvrage d Art');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('08', 'Hydrographie');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('09', 'Orographie');
INSERT INTO "ThematiquePCRS" (code, libelle) VALUES ('99', 'Non définie');


-- ---------------------------------
-- Classe : TypeBordurePCRS
-- ---------------------------------

-- Table: TypeBordurePCRS
DROP TABLE if exists "TypeBordurePCRS";
CREATE TABLE "TypeBordurePCRS"
(
  code character varying(2) unique,
  libelle character varying(7),
  CONSTRAINT "TypeBordurePCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "TypeBordurePCRS" (code, libelle) VALUES ('01', 'Bordure');
INSERT INTO "TypeBordurePCRS" (code, libelle) VALUES ('02', 'Quai');


-- ---------------------------------
-- Classe : TypeMurPCRS
-- ---------------------------------

-- Table: TypeMurPCRS
DROP TABLE if exists "TypeMurPCRS";
CREATE TABLE "TypeMurPCRS"
(
  code character varying(2) unique,
  libelle character varying(22),
  CONSTRAINT "TypeMurPCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "TypeMurPCRS" (code, libelle) VALUES ('01', 'Mur');
INSERT INTO "TypeMurPCRS" (code, libelle) VALUES ('02', 'Mur de soutènement');
INSERT INTO "TypeMurPCRS" (code, libelle) VALUES ('03', 'Mur bahut');
INSERT INTO "TypeMurPCRS" (code, libelle) VALUES ('04', 'Mur bahut avec clôture');
INSERT INTO "TypeMurPCRS" (code, libelle) VALUES ('05', 'Parapet');


-- ---------------------------------
-- Classe : TypePilierPCRS
-- ---------------------------------

-- Table: TypePilierPCRS
DROP TABLE if exists "TypePilierPCRS";
CREATE TABLE "TypePilierPCRS"
(
  code character varying(2) unique,
  libelle character varying(31),
  CONSTRAINT "TypePilierPCRS_pkey" PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);

INSERT INTO "TypePilierPCRS" (code, libelle) VALUES ('01', 'Pilier carré');
INSERT INTO "TypePilierPCRS" (code, libelle) VALUES ('02', 'Pilier rectangulaire');
INSERT INTO "TypePilierPCRS" (code, libelle) VALUES ('03', 'Pilier circulaire');
INSERT INTO "TypePilierPCRS" (code, libelle) VALUES ('04', 'Pilier à autre forme de section');
INSERT INTO "TypePilierPCRS" (code, libelle) VALUES ('99', 'Pilier à autre forme de section');



-- ---------------------------------
-- Creation des tables "objets géographiques du PCRS"
-- ---------------------------------

-- ---------------------------------
-- Classe : EmprisePublicationPCRS
-- ---------------------------------

-- Sequence: EmprisePublicationPCRS_idEmprise_seq
--DROP INDEX if exists "EmprisePublicationPCRS_geometrie_geomidx";
--DROP TABLE if exists "EmprisePublicationPCRS";
DROP SEQUENCE if exists "EmprisePublicationPCRS_idEmprise_seq";

CREATE SEQUENCE "EmprisePublicationPCRS_idEmprise_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: EmprisePublicationPCRS
--DROP TABLE if exists "EmprisePublicationPCRS";
CREATE TABLE "EmprisePublicationPCRS"
(
  geometrie geometry(Polygon,3946) NOT NULL,
  "idEmprise" character varying UNIQUE NOT NULL DEFAULT nextval('"EmprisePublicationPCRS_idEmprise_seq"'::regclass),
  gestionnaire character varying NOT NULL REFERENCES "Gestionnaire",
  calendrier character varying(2) REFERENCES "CalendrierPCRS" (code),
  "datePublication" date NOT NULL,
  "typeEmprise" character varying(2) NOT NULL REFERENCES "EmprisePCRSType" (code),
  complement character varying,
  raster character varying,
  "gabaritPrecision" character varying(2),
  CONSTRAINT "EmprisePublicationPCRS_pkey" PRIMARY KEY ("idEmprise")
)
WITH (
  OIDS=FALSE
);

-- Index: EmprisePublicationPCRS_geometrie_geomidx
--DROP INDEX if exists "EmprisePublicationPCRS_geometrie_geomidx";
CREATE INDEX "EmprisePublicationPCRS_geometrie_geomidx"
  ON "EmprisePublicationPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : TronconVoiriePCRS
-- ---------------------------------

-- Sequence: TronconVoiriePCRS_reference_seq
--DROP INDEX if exists "TronconVoiriePCRS_geometrie_geomidx";
--DROP TABLE if exists "TronconVoiriePCRS";
DROP SEQUENCE if exists "TronconVoiriePCRS_reference_seq";

CREATE SEQUENCE "TronconVoiriePCRS_reference_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: TronconVoiriePCRS
--DROP TABLE if exists "TronconVoiriePCRS";
CREATE TABLE "TronconVoiriePCRS"
(
  geometrie geometry(LineString,3946) NOT NULL,
  source character varying NOT NULL,
  "reference" character varying UNIQUE NOT NULL DEFAULT nextval('"TronconVoiriePCRS_reference_seq"'::regclass),
  propriete character varying(2) REFERENCES "ProprieteEspace" (code),
  CONSTRAINT "TronconVoiriePCRS_pkey" PRIMARY KEY ("reference")
)
WITH (
  OIDS=FALSE
);

-- Index: TronconVoiriePCRS_geometrie_geomidx
--DROP INDEX if exists "TronconVoiriePCRS_geometrie_geomidx";
CREATE INDEX "TronconVoiriePCRS_geometrie_geomidx"
  ON "TronconVoiriePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : HabillagePCRS
-- ---------------------------------

-- Sequence: HabillagePCRS_idHabillage_seq
--DROP INDEX if exists "HabillagePCRS_geometrie_geomidx";
--DROP TABLE if exists "HabillagePCRS";
DROP SEQUENCE if exists "HabillagePCRS_idHabillage_seq";

CREATE SEQUENCE "HabillagePCRS_idHabillage_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: HabillagePCRS
--DROP TABLE if exists "HabillagePCRS";
CREATE TABLE "HabillagePCRS"
(
  geometrie geometry(Geometry,3946) NOT NULL,
  "idHabillage" character varying UNIQUE NOT NULL DEFAULT nextval('"HabillagePCRS_idHabillage_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "positionnement" character varying(2) REFERENCES "PlacementPCRS" (code),
  CONSTRAINT "HabillagePCRS_pkey" PRIMARY KEY ("idHabillage")
)
WITH (
  OIDS=FALSE
);

-- Index: HabillagePCRS_geometrie_geomidx
--DROP INDEX if exists "HabillagePCRS_geometrie_geomidx";
CREATE INDEX "HabillagePCRS_geometrie_geomidx"
  ON "HabillagePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : SymboleHabillagePCRS
-- ---------------------------------

-- Sequence: SymboleHabillagePCRS_idHabillage_seq
--DROP INDEX if exists "SymboleHabillagePCRS_geometrie_geomidx";
--DROP TABLE if exists "SymboleHabillagePCRS";
DROP SEQUENCE if exists "SymboleHabillagePCRS_idHabillage_seq";

CREATE SEQUENCE "SymboleHabillagePCRS_idHabillage_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: SymboleHabillagePCRS
--DROP TABLE if exists "SymboleHabillagePCRS";
CREATE TABLE "SymboleHabillagePCRS"
(
  geometrie geometry(Point,3946) NOT NULL,
  "idHabillage" character varying UNIQUE NOT NULL DEFAULT nextval('"SymboleHabillagePCRS_idHabillage_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "positionnement" character varying(2) REFERENCES "PlacementPCRS" (code),
  "reference" character varying NOT NULL,
  "angleRotation" decimal NOT NULL CHECK ("angleRotation" >= 0 AND "angleRotation" < 360),
  longueur decimal NOT NULL,
  largeur decimal NOT NULL,
  CONSTRAINT "SymboleHabillagePCRS_pkey" PRIMARY KEY ("idHabillage")
)
WITH (
  OIDS=FALSE
);

-- Index: SymboleHabillagePCRS_geometrie_geomidx
--DROP INDEX if exists "SymboleHabillagePCRS_geometrie_geomidx";
CREATE INDEX "SymboleHabillagePCRS_geometrie_geomidx"
  ON "SymboleHabillagePCRS"
  USING gist
  (geometrie);

-- ---------------------------------
-- Classe : TexteHabillagePCRS
-- ---------------------------------

-- Sequence: TexteHabillagePCRS_idHabillage_seq
--DROP INDEX if exists "TexteHabillagePCRS_geometrie_geomidx";
--DROP TABLE if exists "TexteHabillagePCRS";
DROP SEQUENCE if exists "TexteHabillagePCRS_idHabillage_seq";

CREATE SEQUENCE "TexteHabillagePCRS_idHabillage_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: TexteHabillagePCRS
--DROP TABLE if exists "TexteHabillagePCRS";
CREATE TABLE "TexteHabillagePCRS"
(
  geometrie geometry(Point,3946) NOT NULL,
  "idHabillage" character varying UNIQUE NOT NULL DEFAULT nextval('"TexteHabillagePCRS_idHabillage_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "positionnement" character varying(2) REFERENCES "PlacementPCRS" (code),
  "libelle" character varying NOT NULL,
  "angleRotation" decimal NOT NULL CHECK ("angleRotation" >= 0 AND "angleRotation" < 360),
  justification character varying(1) NOT NULL REFERENCES "TexteJustification" (code),
  taille decimal NOT NULL,
  CONSTRAINT "TexteHabillagePCRS_pkey" PRIMARY KEY ("idHabillage")
)
WITH (
  OIDS=FALSE
);

-- Index: TexteHabillagePCRS_geometrie_geomidx
--DROP INDEX if exists "TexteHabillagePCRS_geometrie_geomidx";
CREATE INDEX "TexteHabillagePCRS_geometrie_geomidx"
  ON "TexteHabillagePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : NomVoiriePCRS
-- ---------------------------------

-- Sequence: NomVoiriePCRS_idHabillage_seq
--DROP INDEX if exists "NomVoiriePCRS_geometrie_geomidx";
--DROP TABLE if exists "NomVoiriePCRS";
DROP SEQUENCE if exists "NomVoiriePCRS_idHabillage_seq";

CREATE SEQUENCE "NomVoiriePCRS_idHabillage_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: NomVoiriePCRS
--DROP TABLE if exists "NomVoiriePCRS";
CREATE TABLE "NomVoiriePCRS"
(
  geometrie geometry(Point,3946) NOT NULL,
  "idHabillage" character varying UNIQUE NOT NULL DEFAULT nextval('"NomVoiriePCRS_idHabillage_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "positionnement" character varying(2) REFERENCES "PlacementPCRS" (code),
  "libelle" character varying NOT NULL,
  "angleRotation" decimal NOT NULL CHECK ("angleRotation" >= 0 AND "angleRotation" < 360),
  justification character varying(1) NOT NULL REFERENCES "TexteJustification" (code),
  taille decimal NOT NULL,
  "idNomVoirie" character varying UNIQUE NOT NULL,
  CONSTRAINT "NomVoiriePCRS_pkey" PRIMARY KEY ("idHabillage")
)
WITH (
  OIDS=FALSE
);

-- Index: NomVoiriePCRS_geometrie_geomidx
--DROP INDEX if exists "NomVoiriePCRS_geometrie_geomidx";
CREATE INDEX "NomVoiriePCRS_geometrie_geomidx"
  ON "NomVoiriePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : NumeroVoiriePCRS
-- ---------------------------------

-- Sequence: NumeroVoiriePCRS_idHabillage_seq
--DROP INDEX if exists "NumeroVoiriePCRS_geometrie_geomidx";
--DROP TABLE if exists "NumeroVoiriePCRS";
DROP SEQUENCE if exists "NumeroVoiriePCRS_idHabillage_seq";

CREATE SEQUENCE "NumeroVoiriePCRS_idHabillage_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: NumeroVoiriePCRS
--DROP TABLE if exists "NumeroVoiriePCRS";
CREATE TABLE "NumeroVoiriePCRS"
(
  geometrie geometry(Point,3946) NOT NULL,
  "idHabillage" character varying UNIQUE NOT NULL DEFAULT nextval('"NumeroVoiriePCRS_idHabillage_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "positionnement" character varying(2) REFERENCES "PlacementPCRS" (code),
  "libelle" character varying NOT NULL,
  "angleRotation" decimal NOT NULL CHECK ("angleRotation" >= 0 AND "angleRotation" < 360),
  justification character varying(1) NOT NULL REFERENCES "TexteJustification" (code),
  taille decimal NOT NULL,
  "idNumeroVoirie" character varying UNIQUE NOT NULL,
  CONSTRAINT "NumeroVoiriePCRS_pkey" PRIMARY KEY ("idHabillage")
)
WITH (
  OIDS=FALSE
);

-- Index: NumeroVoiriePCRS_geometrie_geomidx
--DROP INDEX if exists "NumeroVoiriePCRS_geometrie_geomidx";
CREATE INDEX "NumeroVoiriePCRS_geometrie_geomidx"
  ON "NumeroVoiriePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : PointLevePCRS
-- ---------------------------------


-- Table: PointLevePCRS
--DROP TABLE if exists "PointLevePCRS";
CREATE TABLE "PointLevePCRS"
(
  geometrie geometry(Point,3946) NOT NULL,
  "numeroPoint" character varying NOT NULL,
  "precisionXY" integer NOT NULL,
  "precisionZ" integer,
  horodatage date
)
WITH (
  OIDS=FALSE
);

-- Index: PointLevePCRS_geometrie_geomidx
--DROP INDEX if exists "PointLevePCRS_geometrie_geomidx";
CREATE INDEX "PointLevePCRS_geometrie_geomidx"
  ON "PointLevePCRS"
  USING gist
  (geometrie);

-- ---------------------------------
-- Classe : PointCanevasPCRS
-- ---------------------------------

-- Sequence: PointCanevasPCRS_idObjet_seq
--DROP INDEX if exists "PointCanevasPCRS_geometrie_geomidx";
--DROP TABLE if exists "PointCanevasPCRS";
DROP SEQUENCE if exists "PointCanevasPCRS_idObjet_seq";

CREATE SEQUENCE "PointCanevasPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: PointCanevasPCRS
--DROP TABLE if exists "PointCanevasPCRS";
CREATE TABLE "PointCanevasPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"PointCanevasPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Point,3946) NOT NULL,
  canevas character varying,
  "precisionXY" integer,
  "precisionZ" integer,
  immatriculation character varying,
  "dateCreation" date,
  fiche character varying,
  CONSTRAINT "PointCanevasPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: PointCanevasPCRS_geometrie_geomidx
--DROP INDEX if exists "PointCanevasPCRS_geometrie_geomidx";
CREATE INDEX "PointCanevasPCRS_geometrie_geomidx"
  ON "PointCanevasPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : ObjetGeneriquePCRS
-- ---------------------------------

-- Sequence: ObjetGeneriquePCRS_idObjet_seq
--DROP INDEX if exists "ObjetGeneriquePCRS_geometrie_geomidx";
--DROP TABLE if exists "ObjetGeneriquePCRS";
DROP SEQUENCE if exists "ObjetGeneriquePCRS_idObjet_seq";

CREATE SEQUENCE "ObjetGeneriquePCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: ObjetGeneriquePCRS
--DROP TABLE if exists "ObjetGeneriquePCRS";
CREATE TABLE "ObjetGeneriquePCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"ObjetGeneriquePCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Geometry,3946) NOT NULL,
  identification character varying,
  CONSTRAINT "ObjetGeneriquePCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: ObjetGeneriquePCRS_geometrie_geomidx
--DROP INDEX if exists "ObjetGeneriquePCRS_geometrie_geomidx";
CREATE INDEX "ObjetGeneriquePCRS_geometrie_geomidx"
  ON "ObjetGeneriquePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : BordurePCRS
-- ---------------------------------

-- Sequence: BordurePCRS_idObjet_seq
--DROP INDEX if exists "BordurePCRS_geometrie_geomidx";
--DROP TABLE if exists "BordurePCRS";
DROP SEQUENCE if exists "BordurePCRS_idObjet_seq";

CREATE SEQUENCE "BordurePCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: BordurePCRS
--DROP TABLE if exists "BordurePCRS";
CREATE TABLE "BordurePCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"BordurePCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  nature character varying(2) REFERENCES "TypeBordurePCRS" (code),
  CONSTRAINT "BordurePCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: BordurePCRS_geometrie_geomidx
--DROP INDEX if exists "BordurePCRS_geometrie_geomidx";
CREATE INDEX "BordurePCRS_geometrie_geomidx"
  ON "BordurePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : ChangementRevetementPCRS
-- ---------------------------------

-- Sequence: ChangementRevetementPCRS_idObjet_seq
--DROP INDEX if exists "ChangementRevetementPCRS_geometrie_geomidx";
--DROP TABLE if exists "ChangementRevetementPCRS";
DROP SEQUENCE if exists "ChangementRevetementPCRS_idObjet_seq";

CREATE SEQUENCE "ChangementRevetementPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: ChangementRevetementPCRS
--DROP TABLE if exists "ChangementRevetementPCRS";
CREATE TABLE "ChangementRevetementPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"ChangementRevetementPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  CONSTRAINT "ChangementRevetementPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: ChangementRevetementPCRS_geometrie_geomidx
--DROP INDEX if exists "ChangementRevetementPCRS_geometrie_geomidx";
CREATE INDEX "ChangementRevetementPCRS_geometrie_geomidx"
  ON "ChangementRevetementPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : MarcheEscalierPCRS
-- ---------------------------------

-- Sequence: MarcheEscalierPCRS_idObjet_seq
--DROP INDEX if exists "MarcheEscalierPCRS_geometrie_geomidx";
--DROP TABLE if exists "MarcheEscalierPCRS";
DROP SEQUENCE if exists "MarcheEscalierPCRS_idObjet_seq";

CREATE SEQUENCE "MarcheEscalierPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: MarcheEscalierPCRS
--DROP TABLE if exists "MarcheEscalierPCRS";
CREATE TABLE "MarcheEscalierPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"MarcheEscalierPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Polygon,3946) NOT NULL,
  CONSTRAINT "MarcheEscalierPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: MarcheEscalierPCRS_geometrie_geomidx
--DROP INDEX if exists "MarcheEscalierPCRS_geometrie_geomidx";
CREATE INDEX "MarcheEscalierPCRS_geometrie_geomidx"
  ON "MarcheEscalierPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : FacadePCRS
-- ---------------------------------

-- Sequence: FacadePCRS_idObjet_seq
--DROP INDEX if exists "FacadePCRS_geometrie_geomidx";
--DROP TABLE if exists "FacadePCRS";
DROP SEQUENCE if exists "FacadePCRS_idObjet_seq";

CREATE SEQUENCE "FacadePCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: FacadePCRS
--DROP TABLE if exists "FacadePCRS";
CREATE TABLE "FacadePCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"FacadePCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  CONSTRAINT "FacadePCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: FacadePCRS_geometrie_geomidx
--DROP INDEX if exists "FacadePCRS_geometrie_geomidx";
CREATE INDEX "FacadePCRS_geometrie_geomidx"
  ON "FacadePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : ProeminenceBatiPCRS
-- ---------------------------------

-- Sequence: ProeminenceBatiPCRS_idObjet_seq
--DROP INDEX if exists "ProeminenceBatiPCRS_geometrie_geomidx";
--DROP TABLE if exists "ProeminenceBatiPCRS";
DROP SEQUENCE if exists "ProeminenceBatiPCRS_idObjet_seq";

CREATE SEQUENCE "ProeminenceBatiPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: ProeminenceBatiPCRS
--DROP TABLE if exists "ProeminenceBatiPCRS";
CREATE TABLE "ProeminenceBatiPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"ProeminenceBatiPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  CONSTRAINT "ProeminenceBatiPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: ProeminenceBatiPCRS_geometrie_geomidx
--DROP INDEX if exists "ProeminenceBatiPCRS_geometrie_geomidx";
CREATE INDEX "ProeminenceBatiPCRS_geometrie_geomidx"
  ON "ProeminenceBatiPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : SeuilPCRS
-- ---------------------------------

-- Sequence: SeuilPCRS_idObjet_seq
--DROP INDEX if exists "SeuilPCRS_geometrie_geomidx";
--DROP TABLE if exists "SeuilPCRS";
DROP SEQUENCE if exists "SeuilPCRS_idObjet_seq";

CREATE SEQUENCE "SeuilPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: SeuilPCRS
--DROP TABLE if exists "SeuilPCRS";
CREATE TABLE "SeuilPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"SeuilPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Point,3946) NOT NULL,
  CONSTRAINT "SeuilPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: SeuilPCRS_geometrie_geomidx
--DROP INDEX if exists "SeuilPCRS_geometrie_geomidx";
CREATE INDEX "SeuilPCRS_geometrie_geomidx"
  ON "SeuilPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : MurPCRS
-- ---------------------------------

-- Sequence: MurPCRS_idObjet_seq
--DROP INDEX if exists "MurPCRS_geometrie_geomidx";
--DROP TABLE if exists "MurPCRS";
DROP SEQUENCE if exists "MurPCRS_idObjet_seq";

CREATE SEQUENCE "MurPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: MurPCRS
--DROP TABLE if exists "MurPCRS";
CREATE TABLE "MurPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"MurPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  "typeMur" character varying(2) REFERENCES "TypeMurPCRS" (code),
  CONSTRAINT "MurPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: MurPCRS_geometrie_geomidx
--DROP INDEX if exists "MurPCRS_geometrie_geomidx";
CREATE INDEX "MurPCRS_geometrie_geomidx"
  ON "MurPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : PilierRegulierPCRS
-- ---------------------------------

-- Sequence: PilierRegulierPCRS_idObjet_seq
--DROP INDEX if exists "PilierRegulierPCRS_geometrie_geomidx";
--DROP TABLE if exists "PilierRegulierPCRS";
DROP SEQUENCE if exists "PilierRegulierPCRS_idObjet_seq";

CREATE SEQUENCE "PilierRegulierPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: PilierRegulierPCRS
--DROP TABLE if exists "PilierRegulierPCRS";
CREATE TABLE "PilierRegulierPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"PilierRegulierPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  section character varying(2) NOT NULL REFERENCES "TypePilierPCRS" (code),
  geometrie geometry(Point,3946) NOT NULL,
  "angleRotation" decimal NOT NULL CHECK ("angleRotation" >= 0 AND "angleRotation" < 360),
  longueur decimal NOT NULL,
  largeur decimal NOT NULL,
  CONSTRAINT "PilierRegulierPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: PilierRegulierPCRS_geometrie_geomidx
--DROP INDEX if exists "PilierRegulierPCRS_geometrie_geomidx";
CREATE INDEX "PilierRegulierPCRS_geometrie_geomidx"
  ON "PilierRegulierPCRS"
  USING gist
  (geometrie);



-- ---------------------------------
-- Classe : PilierParticulierPCRS
-- ---------------------------------

-- Sequence: PilierParticulierPCRS_idObjet_seq
--DROP INDEX if exists "PilierParticulierPCRS_geometrie_geomidx";
--DROP TABLE if exists "PilierParticulierPCRS";
DROP SEQUENCE if exists "PilierParticulierPCRS_idObjet_seq";

CREATE SEQUENCE "PilierParticulierPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: PilierParticulierPCRS
--DROP TABLE if exists "PilierParticulierPCRS";
CREATE TABLE "PilierParticulierPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"PilierParticulierPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Polygon,3946) NOT NULL,
  CONSTRAINT "PilierParticulierPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: PilierParticulierPCRS_geometrie_geomidx
--DROP INDEX if exists "PilierParticulierPCRS_geometrie_geomidx";
CREATE INDEX "PilierParticulierPCRS_geometrie_geomidx"
  ON "PilierParticulierPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : RailPCRS
-- ---------------------------------

-- Sequence: RailPCRS_idObjet_seq
--DROP INDEX if exists "RailPCRS_geometrie_geomidx";
--DROP TABLE if exists "RailPCRS";
DROP SEQUENCE if exists "RailPCRS_idObjet_seq";

CREATE SEQUENCE "RailPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: RailPCRS
--DROP TABLE if exists "RailPCRS";
CREATE TABLE "RailPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"RailPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  CONSTRAINT "RailPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: RailPCRS_geometrie_geomidx
--DROP INDEX if exists "RailPCRS_geometrie_geomidx";
CREATE INDEX "RailPCRS_geometrie_geomidx"
  ON "RailPCRS"
  USING gist
  (geometrie);

-- ---------------------------------
-- Classe : HaieEspaceVertPCRS
-- ---------------------------------

-- Sequence: HaieEspaceVertPCRS_idObjet_seq
--DROP INDEX if exists "HaieEspaceVertPCRS_geometrie_geomidx";
--DROP TABLE if exists "HaieEspaceVertPCRS";
DROP SEQUENCE if exists "HaieEspaceVertPCRS_idObjet_seq";

CREATE SEQUENCE "HaieEspaceVertPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: HaieEspaceVertPCRS
--DROP TABLE if exists "HaieEspaceVertPCRS";
CREATE TABLE "HaieEspaceVertPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"HaieEspaceVertPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  CONSTRAINT "HaieEspaceVertPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: HaieEspaceVertPCRS_geometrie_geomidx
--DROP INDEX if exists "HaieEspaceVertPCRS_geometrie_geomidx";
CREATE INDEX "HaieEspaceVertPCRS_geometrie_geomidx"
  ON "HaieEspaceVertPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : ArbreAlignementPCRS
-- ---------------------------------

-- Sequence: ArbreAlignementPCRS_idObjet_seq
--DROP INDEX if exists "ArbreAlignementPCRS_geometrie_geomidx";
--DROP TABLE if exists "ArbreAlignementPCRS";
DROP SEQUENCE if exists "ArbreAlignementPCRS_idObjet_seq";

CREATE SEQUENCE "ArbreAlignementPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: ArbreAlignementPCRS
--DROP TABLE if exists "ArbreAlignementPCRS";
CREATE TABLE "ArbreAlignementPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"ArbreAlignementPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Point,3946) NOT NULL,
  "reference" character varying NOT NULL,
  CONSTRAINT "ArbreAlignementPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: ArbreAlignementPCRS_geometrie_geomidx
--DROP INDEX if exists "ArbreAlignementPCRS_geometrie_geomidx";
CREATE INDEX "ArbreAlignementPCRS_geometrie_geomidx"
  ON "ArbreAlignementPCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : PilePontPCRS
-- ---------------------------------

-- Sequence: PilePontPCRS_idObjet_seq
--DROP INDEX if exists "PilePontPCRS_geometrie_geomidx";
--DROP TABLE if exists "PilePontPCRS";
DROP SEQUENCE if exists "PilePontPCRS_idObjet_seq";

CREATE SEQUENCE "PilePontPCRS_idObjet_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: PilePontPCRS
--DROP TABLE if exists "PilePontPCRS";
CREATE TABLE "PilePontPCRS"
(
  "idObjet" character varying UNIQUE NOT NULL DEFAULT nextval('"PilePontPCRS_idObjet_seq"'::regclass),
  thematique character varying(2) NOT NULL,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(LineString,3946) NOT NULL,
  CONSTRAINT "PilePontPCRS_pkey" PRIMARY KEY ("idObjet")
)
WITH (
  OIDS=FALSE
);

-- Index: PilePontPCRS_geometrie_geomidx
--DROP INDEX if exists "PilePontPCRS_geometrie_geomidx";
CREATE INDEX "PilePontPCRS_geometrie_geomidx"
  ON "PilePontPCRS"
  USING gist
  (geometrie);



-- ---------------------------------
-- Classe : AffleurantSymbolePCRS
-- ---------------------------------

-- Sequence: AffleurantSymbolePCRS_idAffleurant_seq
--DROP INDEX if exists "AffleurantSymbolePCRS_geometrie_geomidx";
--DROP TABLE if exists "AffleurantSymbolePCRS";
DROP SEQUENCE if exists "AffleurantSymbolePCRS_idAffleurant_seq";

CREATE SEQUENCE "AffleurantSymbolePCRS_idAffleurant_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: AffleurantSymbolePCRS
--DROP TABLE if exists "AffleurantSymbolePCRS";
CREATE TABLE "AffleurantSymbolePCRS"
(
  "idAffleurant" character varying UNIQUE NOT NULL DEFAULT nextval('"AffleurantSymbolePCRS_idAffleurant_seq"'::regclass),
  gestionnaire character varying REFERENCES "Gestionnaire",
  nature character varying(2) NOT NULL REFERENCES "NatureAffleurant" (code),
  "codeCouleur" character varying(6) NOT NULL REFERENCES "CodeCouleurAffleurant" (code),
  source character varying,
  "idSource" character varying,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Point,3946) NOT NULL,
  "reference" character varying NOT NULL,
  "angleRotation" decimal NOT NULL CHECK ("angleRotation" >= 0 AND "angleRotation" < 360),
  longueur decimal NOT NULL,
  largeur decimal NOT NULL,
  CONSTRAINT "AffleurantSymbolePCRS_pkey" PRIMARY KEY ("idAffleurant")
)
WITH (
  OIDS=FALSE
);

-- Index: AffleurantSymbolePCRS_geometrie_geomidx
--DROP INDEX if exists "AffleurantSymbolePCRS_geometrie_geomidx";
CREATE INDEX "AffleurantSymbolePCRS_geometrie_geomidx"
  ON "AffleurantSymbolePCRS"
  USING gist
  (geometrie);


-- ---------------------------------
-- Classe : AffleurantEnveloppePCRS
-- ---------------------------------

-- Sequence: AffleurantEnveloppePCRS_idAffleurant_seq
--DROP INDEX if exists "AffleurantEnveloppePCRS_geometrie_geomidx";
--DROP TABLE if exists "AffleurantEnveloppePCRS";
DROP SEQUENCE if exists "AffleurantEnveloppePCRS_idAffleurant_seq";

CREATE SEQUENCE "AffleurantEnveloppePCRS_idAffleurant_seq"
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1586
  CACHE 1;

-- Table: AffleurantEnveloppePCRS
--DROP TABLE if exists "AffleurantEnveloppePCRS";
CREATE TABLE "AffleurantEnveloppePCRS"
(
  "idAffleurant" character varying UNIQUE NOT NULL DEFAULT nextval('"AffleurantEnveloppePCRS_idAffleurant_seq"'::regclass),
  gestionnaire character varying REFERENCES "Gestionnaire",
  nature character varying(2) NOT NULL REFERENCES "NatureAffleurant" (code),
  "codeCouleur" character varying(6) NOT NULL REFERENCES "CodeCouleurAffleurant" (code),
  source character varying,
  "idSource" character varying,
  calque character varying NOT NULL,
  "qualiteCategorisation" character varying(2) NOT NULL REFERENCES "QualiteCategorisation" (code),
  "precisionPlanimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "precisionAltimetrique" character varying(3) NOT NULL REFERENCES "ClassePrecisionPCRS" (code),
  "utilisableCotation" character varying(2) NOT NULL REFERENCES "CotationPCRS" (code),
  geometrie geometry(Polygon,3946) NOT NULL,
  CONSTRAINT "AffleurantEnveloppePCRS_pkey" PRIMARY KEY ("idAffleurant")
)
WITH (
  OIDS=FALSE
);

-- Index: AffleurantEnveloppePCRS_geometrie_geomidx
--DROP INDEX if exists "AffleurantEnveloppePCRS_geometrie_geomidx";
CREATE INDEX "AffleurantEnveloppePCRS_geometrie_geomidx"
  ON "AffleurantEnveloppePCRS"
  USING gist
  (geometrie);
