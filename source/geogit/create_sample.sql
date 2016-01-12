
drop table "case_00140_00100";
drop table "AffleurantSymbole";
drop table "Arbre";
drop table "Bordure";
drop table "Emprise";
drop table "Facade";
drop table "Haie";
drop table "Mur";
drop table "PointCanevas";

CREATE TABLE "case_00140_00100"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Polygon,3946)
);

CREATE TABLE "AffleurantSymbole"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Point,3946),
  orientation real
);

CREATE TABLE "Arbre"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Point,3946),
  orientation real
);

CREATE TABLE "Bordure"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Linestring,3946)
);

CREATE TABLE "Emprise"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Polygon,3946)
);

CREATE TABLE "Facade"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Polygon,3946)
);

CREATE TABLE "Haie"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Linestring,3946)
);

CREATE TABLE "Mur"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Linestring,3946)
);

CREATE TABLE "PointCanevas"
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Point,3946),
  orientation real
);

