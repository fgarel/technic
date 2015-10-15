drop table case_00140_00100;

CREATE TABLE case_00140_00100
(
  case_id character varying(80),
  case_geometry_asewkt character varying(255),
  wkb_geometry geometry(Polygon,3946)
);


INSERT INTO case_00140_00100(
    case_id,
    case_geometry_asewkt)
  VALUES (
    'M31',
    'SRID=3946;POLYGON((1379640 5226000,1379500 5226000,1379500 5226100,1379640 5226100,1379640 5226000))');

update case_00140_00100 set wkb_geometry = st_geometryfromtext(case_geometry_asewkt);

select
  case_id,
  case_geometry_asewkt,
  st_asewkt(wkb_geometry)
from case_00140_00100;
