drop table case_00140_00100;
drop table batiment;
drop table bordure;
drop table affleurant;
drop table cloture;

CREATE TABLE case_00140_00100
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Polygon,3946)
);


CREATE TABLE batiment
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Polygon,3946)
);


CREATE TABLE bordure
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Linestring,3946)
);

CREATE TABLE affleurant
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Point,3946)
);

CREATE TABLE cloture
(
  id character varying(80),
  geometry_asewkt character varying(255),
  wkb_geometry geometry(Linestring,3946)
);



