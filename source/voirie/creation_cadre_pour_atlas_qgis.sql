drop table if exists public.cadre;
CREATE TABLE public.cadre 
(
  text_original text,
  geometry_original geometry(Geometry,3946)
)
WITH (
  OIDS=TRUE
);
ALTER TABLE public.cadre
  OWNER TO "Fred";

INSERT INTO public.cadre(
            text_original, geometry_original)
    VALUES ('A', ST_GeomFromEWKT('SRID=3946;POLYGON((
      1377700 5224000,
      1378900 5224000,
      1378900 5225200,
      1377700 5225200,
      1377700 5224000))'));
