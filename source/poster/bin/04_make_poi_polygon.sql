-- Fichier sql qui contient des objets geographiques utiles
-- pour faire des tuiles :
--   - des polygones qui vont servir pour du découpage
--         sous qgis
--   - des points qui vont etre les
--         positions camera (simili - prises de vue aerienne)

-- Tables des polygones

-- Table qui contient les polygones pour l atlas sous qgis

DROP TABLE if exists poi_polygon;

CREATE TABLE poi_polygon (
  poi_idim INTEGER,
  poi_idhg INTEGER,
  poi_idx INTEGER,
  poi_idy INTEGER,
  poi_name VARCHAR,
  xcenter float,
  ycenter float,
  xoffset float,
  yoffset float,
  longitude float DEFAULT 0.0,
  latitude float DEFAULT 0.0,
  altitude float DEFAULT 2000.0,
  altitudemode VARCHAR DEFAULT 'relativeToGround',
  tilt float DEFAULT 0,
  roll float DEFAULT 0
);

SELECT AddGeometryColumn('poi_polygon', 'poi_geom',
                          3857, 'POLYGON', 2);


-- Tables des points

-- Table qui contient les coordonnees des centres PVA

DROP TABLE if exists poi_point;

CREATE TABLE poi_point (
  poi_idim INTEGER,
  poi_idhg INTEGER,
  poi_idx INTEGER,
  poi_idy INTEGER,
  poi_name VARCHAR,
  xcenter float,
  ycenter float,
  xoffset float,
  yoffset float,
  longitude float DEFAULT 0.0,
  latitude float DEFAULT 0.0,
  altitude float DEFAULT 2000.0,
  altitudemode VARCHAR DEFAULT 'relativeToGround',
  tilt float DEFAULT 0,
  roll float DEFAULT 0
);

SELECT AddGeometryColumn('poi_point', 'poi_geom', 3857, 'POINT', 2);

INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             73, 72, 1, 1,
                             '01_01',
                             -138122.11111111112, 5801167.888888889, 7111.111111111111, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5800529.0,
                                                   -137233.22222222225 5800529.0,
                                                   -137233.22222222225 5801806.777777778,
                                                   -139011.0 5801806.777777778,
                                                   -139011.0 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             73, 72, 1, 1,
                             '72',
                             -138122.11111111112, 5801167.888888889, 7111.111111111111, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             64, 71, 1, 2,
                             '02_01',
                             -138122.11111111112, 5802445.666666667, 7111.111111111111, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5801806.777777778,
                                                   -137233.22222222225 5801806.777777778,
                                                   -137233.22222222225 5803084.555555556,
                                                   -139011.0 5803084.555555556,
                                                   -139011.0 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             64, 71, 1, 2,
                             '71',
                             -138122.11111111112, 5802445.666666667, 7111.111111111111, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             55, 70, 1, 3,
                             '03_01',
                             -138122.11111111112, 5803723.444444445, 7111.111111111111, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5803084.555555556,
                                                   -137233.22222222225 5803084.555555556,
                                                   -137233.22222222225 5804362.333333334,
                                                   -139011.0 5804362.333333334,
                                                   -139011.0 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             55, 70, 1, 3,
                             '70',
                             -138122.11111111112, 5803723.444444445, 7111.111111111111, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             46, 69, 1, 4,
                             '04_01',
                             -138122.11111111112, 5805001.222222222, 7111.111111111111, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5804362.333333333,
                                                   -137233.22222222225 5804362.333333333,
                                                   -137233.22222222225 5805640.111111111,
                                                   -139011.0 5805640.111111111,
                                                   -139011.0 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             46, 69, 1, 4,
                             '69',
                             -138122.11111111112, 5805001.222222222, 7111.111111111111, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             37, 68, 1, 5,
                             '05_01',
                             -138122.11111111112, 5806279.0, 7111.111111111111, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5805640.111111111,
                                                   -137233.22222222225 5805640.111111111,
                                                   -137233.22222222225 5806917.888888889,
                                                   -139011.0 5806917.888888889,
                                                   -139011.0 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             37, 68, 1, 5,
                             '68',
                             -138122.11111111112, 5806279.0, 7111.111111111111, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             28, 67, 1, 6,
                             '06_01',
                             -138122.11111111112, 5807556.777777778, 7111.111111111111, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5806917.888888889,
                                                   -137233.22222222225 5806917.888888889,
                                                   -137233.22222222225 5808195.666666667,
                                                   -139011.0 5808195.666666667,
                                                   -139011.0 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             28, 67, 1, 6,
                             '67',
                             -138122.11111111112, 5807556.777777778, 7111.111111111111, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             19, 66, 1, 7,
                             '07_01',
                             -138122.11111111112, 5808834.555555556, 7111.111111111111, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5808195.666666667,
                                                   -137233.22222222225 5808195.666666667,
                                                   -137233.22222222225 5809473.444444445,
                                                   -139011.0 5809473.444444445,
                                                   -139011.0 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             19, 66, 1, 7,
                             '66',
                             -138122.11111111112, 5808834.555555556, 7111.111111111111, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             10, 65, 1, 8,
                             '08_01',
                             -138122.11111111112, 5810112.333333333, 7111.111111111111, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5809473.444444444,
                                                   -137233.22222222225 5809473.444444444,
                                                   -137233.22222222225 5810751.222222222,
                                                   -139011.0 5810751.222222222,
                                                   -139011.0 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             10, 65, 1, 8,
                             '65',
                             -138122.11111111112, 5810112.333333333, 7111.111111111111, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             1, 64, 1, 9,
                             '09_01',
                             -138122.11111111112, 5811390.111111111, 7111.111111111111, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-139011.0 5810751.222222222,
                                                   -137233.22222222225 5810751.222222222,
                                                   -137233.22222222225 5812029.0,
                                                   -139011.0 5812029.0,
                                                   -139011.0 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             1, 64, 1, 9,
                             '64',
                             -138122.11111111112, 5811390.111111111, 7111.111111111111, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-138122.11111111112 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             74, 73, 2, 1,
                             '01_02',
                             -136344.33333333334, 5801167.888888889, 5333.333333333334, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5800529.0,
                                                   -135455.44444444447 5800529.0,
                                                   -135455.44444444447 5801806.777777778,
                                                   -137233.22222222222 5801806.777777778,
                                                   -137233.22222222222 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             74, 73, 2, 1,
                             '73',
                             -136344.33333333334, 5801167.888888889, 5333.333333333334, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             65, 42, 2, 2,
                             '02_02',
                             -136344.33333333334, 5802445.666666667, 5333.333333333334, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5801806.777777778,
                                                   -135455.44444444447 5801806.777777778,
                                                   -135455.44444444447 5803084.555555556,
                                                   -137233.22222222222 5803084.555555556,
                                                   -137233.22222222222 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             65, 42, 2, 2,
                             '42',
                             -136344.33333333334, 5802445.666666667, 5333.333333333334, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             56, 41, 2, 3,
                             '03_02',
                             -136344.33333333334, 5803723.444444445, 5333.333333333334, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5803084.555555556,
                                                   -135455.44444444447 5803084.555555556,
                                                   -135455.44444444447 5804362.333333334,
                                                   -137233.22222222222 5804362.333333334,
                                                   -137233.22222222222 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             56, 41, 2, 3,
                             '41',
                             -136344.33333333334, 5803723.444444445, 5333.333333333334, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             47, 40, 2, 4,
                             '04_02',
                             -136344.33333333334, 5805001.222222222, 5333.333333333334, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5804362.333333333,
                                                   -135455.44444444447 5804362.333333333,
                                                   -135455.44444444447 5805640.111111111,
                                                   -137233.22222222222 5805640.111111111,
                                                   -137233.22222222222 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             47, 40, 2, 4,
                             '40',
                             -136344.33333333334, 5805001.222222222, 5333.333333333334, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             38, 39, 2, 5,
                             '05_02',
                             -136344.33333333334, 5806279.0, 5333.333333333334, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5805640.111111111,
                                                   -135455.44444444447 5805640.111111111,
                                                   -135455.44444444447 5806917.888888889,
                                                   -137233.22222222222 5806917.888888889,
                                                   -137233.22222222222 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             38, 39, 2, 5,
                             '39',
                             -136344.33333333334, 5806279.0, 5333.333333333334, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             29, 38, 2, 6,
                             '06_02',
                             -136344.33333333334, 5807556.777777778, 5333.333333333334, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5806917.888888889,
                                                   -135455.44444444447 5806917.888888889,
                                                   -135455.44444444447 5808195.666666667,
                                                   -137233.22222222222 5808195.666666667,
                                                   -137233.22222222222 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             29, 38, 2, 6,
                             '38',
                             -136344.33333333334, 5807556.777777778, 5333.333333333334, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             20, 37, 2, 7,
                             '07_02',
                             -136344.33333333334, 5808834.555555556, 5333.333333333334, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5808195.666666667,
                                                   -135455.44444444447 5808195.666666667,
                                                   -135455.44444444447 5809473.444444445,
                                                   -137233.22222222222 5809473.444444445,
                                                   -137233.22222222222 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             20, 37, 2, 7,
                             '37',
                             -136344.33333333334, 5808834.555555556, 5333.333333333334, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             11, 36, 2, 8,
                             '08_02',
                             -136344.33333333334, 5810112.333333333, 5333.333333333334, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5809473.444444444,
                                                   -135455.44444444447 5809473.444444444,
                                                   -135455.44444444447 5810751.222222222,
                                                   -137233.22222222222 5810751.222222222,
                                                   -137233.22222222222 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             11, 36, 2, 8,
                             '36',
                             -136344.33333333334, 5810112.333333333, 5333.333333333334, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             2, 63, 2, 9,
                             '09_02',
                             -136344.33333333334, 5811390.111111111, 5333.333333333334, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-137233.22222222222 5810751.222222222,
                                                   -135455.44444444447 5810751.222222222,
                                                   -135455.44444444447 5812029.0,
                                                   -137233.22222222222 5812029.0,
                                                   -137233.22222222222 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             2, 63, 2, 9,
                             '63',
                             -136344.33333333334, 5811390.111111111, 5333.333333333334, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-136344.33333333334 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             75, 74, 3, 1,
                             '01_03',
                             -134566.55555555556, 5801167.888888889, 3555.5555555555557, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5800529.0,
                                                   -133677.6666666667 5800529.0,
                                                   -133677.6666666667 5801806.777777778,
                                                   -135455.44444444444 5801806.777777778,
                                                   -135455.44444444444 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             75, 74, 3, 1,
                             '74',
                             -134566.55555555556, 5801167.888888889, 3555.5555555555557, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             66, 43, 3, 2,
                             '02_03',
                             -134566.55555555556, 5802445.666666667, 3555.5555555555557, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5801806.777777778,
                                                   -133677.6666666667 5801806.777777778,
                                                   -133677.6666666667 5803084.555555556,
                                                   -135455.44444444444 5803084.555555556,
                                                   -135455.44444444444 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             66, 43, 3, 2,
                             '43',
                             -134566.55555555556, 5802445.666666667, 3555.5555555555557, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             57, 20, 3, 3,
                             '03_03',
                             -134566.55555555556, 5803723.444444445, 3555.5555555555557, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5803084.555555556,
                                                   -133677.6666666667 5803084.555555556,
                                                   -133677.6666666667 5804362.333333334,
                                                   -135455.44444444444 5804362.333333334,
                                                   -135455.44444444444 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             57, 20, 3, 3,
                             '20',
                             -134566.55555555556, 5803723.444444445, 3555.5555555555557, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             48, 19, 3, 4,
                             '04_03',
                             -134566.55555555556, 5805001.222222222, 3555.5555555555557, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5804362.333333333,
                                                   -133677.6666666667 5804362.333333333,
                                                   -133677.6666666667 5805640.111111111,
                                                   -135455.44444444444 5805640.111111111,
                                                   -135455.44444444444 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             48, 19, 3, 4,
                             '19',
                             -134566.55555555556, 5805001.222222222, 3555.5555555555557, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             39, 18, 3, 5,
                             '05_03',
                             -134566.55555555556, 5806279.0, 3555.5555555555557, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5805640.111111111,
                                                   -133677.6666666667 5805640.111111111,
                                                   -133677.6666666667 5806917.888888889,
                                                   -135455.44444444444 5806917.888888889,
                                                   -135455.44444444444 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             39, 18, 3, 5,
                             '18',
                             -134566.55555555556, 5806279.0, 3555.5555555555557, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             30, 17, 3, 6,
                             '06_03',
                             -134566.55555555556, 5807556.777777778, 3555.5555555555557, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5806917.888888889,
                                                   -133677.6666666667 5806917.888888889,
                                                   -133677.6666666667 5808195.666666667,
                                                   -135455.44444444444 5808195.666666667,
                                                   -135455.44444444444 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             30, 17, 3, 6,
                             '17',
                             -134566.55555555556, 5807556.777777778, 3555.5555555555557, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             21, 16, 3, 7,
                             '07_03',
                             -134566.55555555556, 5808834.555555556, 3555.5555555555557, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5808195.666666667,
                                                   -133677.6666666667 5808195.666666667,
                                                   -133677.6666666667 5809473.444444445,
                                                   -135455.44444444444 5809473.444444445,
                                                   -135455.44444444444 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             21, 16, 3, 7,
                             '16',
                             -134566.55555555556, 5808834.555555556, 3555.5555555555557, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             12, 35, 3, 8,
                             '08_03',
                             -134566.55555555556, 5810112.333333333, 3555.5555555555557, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5809473.444444444,
                                                   -133677.6666666667 5809473.444444444,
                                                   -133677.6666666667 5810751.222222222,
                                                   -135455.44444444444 5810751.222222222,
                                                   -135455.44444444444 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             12, 35, 3, 8,
                             '35',
                             -134566.55555555556, 5810112.333333333, 3555.5555555555557, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             3, 62, 3, 9,
                             '09_03',
                             -134566.55555555556, 5811390.111111111, 3555.5555555555557, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-135455.44444444444 5810751.222222222,
                                                   -133677.6666666667 5810751.222222222,
                                                   -133677.6666666667 5812029.0,
                                                   -135455.44444444444 5812029.0,
                                                   -135455.44444444444 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             3, 62, 3, 9,
                             '62',
                             -134566.55555555556, 5811390.111111111, 3555.5555555555557, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-134566.55555555556 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             76, 75, 4, 1,
                             '01_04',
                             -132788.77777777778, 5801167.888888889, 1777.7777777777778, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5800529.0,
                                                   -131899.8888888889 5800529.0,
                                                   -131899.8888888889 5801806.777777778,
                                                   -133677.66666666666 5801806.777777778,
                                                   -133677.66666666666 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             76, 75, 4, 1,
                             '75',
                             -132788.77777777778, 5801167.888888889, 1777.7777777777778, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             67, 44, 4, 2,
                             '02_04',
                             -132788.77777777778, 5802445.666666667, 1777.7777777777778, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5801806.777777778,
                                                   -131899.8888888889 5801806.777777778,
                                                   -131899.8888888889 5803084.555555556,
                                                   -133677.66666666666 5803084.555555556,
                                                   -133677.66666666666 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             67, 44, 4, 2,
                             '44',
                             -132788.77777777778, 5802445.666666667, 1777.7777777777778, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             58, 21, 4, 3,
                             '03_04',
                             -132788.77777777778, 5803723.444444445, 1777.7777777777778, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5803084.555555556,
                                                   -131899.8888888889 5803084.555555556,
                                                   -131899.8888888889 5804362.333333334,
                                                   -133677.66666666666 5804362.333333334,
                                                   -133677.66666666666 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             58, 21, 4, 3,
                             '21',
                             -132788.77777777778, 5803723.444444445, 1777.7777777777778, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             49, 6, 4, 4,
                             '04_04',
                             -132788.77777777778, 5805001.222222222, 1777.7777777777778, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5804362.333333333,
                                                   -131899.8888888889 5804362.333333333,
                                                   -131899.8888888889 5805640.111111111,
                                                   -133677.66666666666 5805640.111111111,
                                                   -133677.66666666666 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             49, 6, 4, 4,
                             '6',
                             -132788.77777777778, 5805001.222222222, 1777.7777777777778, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             40, 5, 4, 5,
                             '05_04',
                             -132788.77777777778, 5806279.0, 1777.7777777777778, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5805640.111111111,
                                                   -131899.8888888889 5805640.111111111,
                                                   -131899.8888888889 5806917.888888889,
                                                   -133677.66666666666 5806917.888888889,
                                                   -133677.66666666666 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             40, 5, 4, 5,
                             '5',
                             -132788.77777777778, 5806279.0, 1777.7777777777778, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             31, 4, 4, 6,
                             '06_04',
                             -132788.77777777778, 5807556.777777778, 1777.7777777777778, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5806917.888888889,
                                                   -131899.8888888889 5806917.888888889,
                                                   -131899.8888888889 5808195.666666667,
                                                   -133677.66666666666 5808195.666666667,
                                                   -133677.66666666666 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             31, 4, 4, 6,
                             '4',
                             -132788.77777777778, 5807556.777777778, 1777.7777777777778, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             22, 15, 4, 7,
                             '07_04',
                             -132788.77777777778, 5808834.555555556, 1777.7777777777778, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5808195.666666667,
                                                   -131899.8888888889 5808195.666666667,
                                                   -131899.8888888889 5809473.444444445,
                                                   -133677.66666666666 5809473.444444445,
                                                   -133677.66666666666 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             22, 15, 4, 7,
                             '15',
                             -132788.77777777778, 5808834.555555556, 1777.7777777777778, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             13, 34, 4, 8,
                             '08_04',
                             -132788.77777777778, 5810112.333333333, 1777.7777777777778, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5809473.444444444,
                                                   -131899.8888888889 5809473.444444444,
                                                   -131899.8888888889 5810751.222222222,
                                                   -133677.66666666666 5810751.222222222,
                                                   -133677.66666666666 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             13, 34, 4, 8,
                             '34',
                             -132788.77777777778, 5810112.333333333, 1777.7777777777778, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             4, 61, 4, 9,
                             '09_04',
                             -132788.77777777778, 5811390.111111111, 1777.7777777777778, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-133677.66666666666 5810751.222222222,
                                                   -131899.8888888889 5810751.222222222,
                                                   -131899.8888888889 5812029.0,
                                                   -133677.66666666666 5812029.0,
                                                   -133677.66666666666 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             4, 61, 4, 9,
                             '61',
                             -132788.77777777778, 5811390.111111111, 1777.7777777777778, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-132788.77777777778 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             77, 76, 5, 1,
                             '01_05',
                             -131011.00000000001, 5801167.888888889, 0.0, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5800529.0,
                                                   -130122.11111111112 5800529.0,
                                                   -130122.11111111112 5801806.777777778,
                                                   -131899.8888888889 5801806.777777778,
                                                   -131899.8888888889 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             77, 76, 5, 1,
                             '76',
                             -131011.00000000001, 5801167.888888889, 0.0, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             68, 45, 5, 2,
                             '02_05',
                             -131011.00000000001, 5802445.666666667, 0.0, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5801806.777777778,
                                                   -130122.11111111112 5801806.777777778,
                                                   -130122.11111111112 5803084.555555556,
                                                   -131899.8888888889 5803084.555555556,
                                                   -131899.8888888889 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             68, 45, 5, 2,
                             '45',
                             -131011.00000000001, 5802445.666666667, 0.0, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             59, 22, 5, 3,
                             '03_05',
                             -131011.00000000001, 5803723.444444445, 0.0, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5803084.555555556,
                                                   -130122.11111111112 5803084.555555556,
                                                   -130122.11111111112 5804362.333333334,
                                                   -131899.8888888889 5804362.333333334,
                                                   -131899.8888888889 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             59, 22, 5, 3,
                             '22',
                             -131011.00000000001, 5803723.444444445, 0.0, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             50, 7, 5, 4,
                             '04_05',
                             -131011.00000000001, 5805001.222222222, 0.0, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5804362.333333333,
                                                   -130122.11111111112 5804362.333333333,
                                                   -130122.11111111112 5805640.111111111,
                                                   -131899.8888888889 5805640.111111111,
                                                   -131899.8888888889 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             50, 7, 5, 4,
                             '7',
                             -131011.00000000001, 5805001.222222222, 0.0, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             41, 0, 5, 5,
                             '05_05',
                             -131011.00000000001, 5806279.0, 0.0, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5805640.111111111,
                                                   -130122.11111111112 5805640.111111111,
                                                   -130122.11111111112 5806917.888888889,
                                                   -131899.8888888889 5806917.888888889,
                                                   -131899.8888888889 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             41, 0, 5, 5,
                             '0',
                             -131011.00000000001, 5806279.0, 0.0, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             32, 3, 5, 6,
                             '06_05',
                             -131011.00000000001, 5807556.777777778, 0.0, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5806917.888888889,
                                                   -130122.11111111112 5806917.888888889,
                                                   -130122.11111111112 5808195.666666667,
                                                   -131899.8888888889 5808195.666666667,
                                                   -131899.8888888889 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             32, 3, 5, 6,
                             '3',
                             -131011.00000000001, 5807556.777777778, 0.0, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             23, 14, 5, 7,
                             '07_05',
                             -131011.00000000001, 5808834.555555556, 0.0, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5808195.666666667,
                                                   -130122.11111111112 5808195.666666667,
                                                   -130122.11111111112 5809473.444444445,
                                                   -131899.8888888889 5809473.444444445,
                                                   -131899.8888888889 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             23, 14, 5, 7,
                             '14',
                             -131011.00000000001, 5808834.555555556, 0.0, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             14, 33, 5, 8,
                             '08_05',
                             -131011.00000000001, 5810112.333333333, 0.0, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5809473.444444444,
                                                   -130122.11111111112 5809473.444444444,
                                                   -130122.11111111112 5810751.222222222,
                                                   -131899.8888888889 5810751.222222222,
                                                   -131899.8888888889 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             14, 33, 5, 8,
                             '33',
                             -131011.00000000001, 5810112.333333333, 0.0, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             5, 60, 5, 9,
                             '09_05',
                             -131011.00000000001, 5811390.111111111, 0.0, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-131899.8888888889 5810751.222222222,
                                                   -130122.11111111112 5810751.222222222,
                                                   -130122.11111111112 5812029.0,
                                                   -131899.8888888889 5812029.0,
                                                   -131899.8888888889 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             5, 60, 5, 9,
                             '60',
                             -131011.00000000001, 5811390.111111111, 0.0, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-131011.00000000001 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             78, 77, 6, 1,
                             '01_06',
                             -129233.22222222223, 5801167.888888889, -1777.7777777777778, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5800529.0,
                                                   -128344.33333333334 5800529.0,
                                                   -128344.33333333334 5801806.777777778,
                                                   -130122.11111111112 5801806.777777778,
                                                   -130122.11111111112 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             78, 77, 6, 1,
                             '77',
                             -129233.22222222223, 5801167.888888889, -1777.7777777777778, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             69, 46, 6, 2,
                             '02_06',
                             -129233.22222222223, 5802445.666666667, -1777.7777777777778, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5801806.777777778,
                                                   -128344.33333333334 5801806.777777778,
                                                   -128344.33333333334 5803084.555555556,
                                                   -130122.11111111112 5803084.555555556,
                                                   -130122.11111111112 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             69, 46, 6, 2,
                             '46',
                             -129233.22222222223, 5802445.666666667, -1777.7777777777778, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             60, 23, 6, 3,
                             '03_06',
                             -129233.22222222223, 5803723.444444445, -1777.7777777777778, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5803084.555555556,
                                                   -128344.33333333334 5803084.555555556,
                                                   -128344.33333333334 5804362.333333334,
                                                   -130122.11111111112 5804362.333333334,
                                                   -130122.11111111112 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             60, 23, 6, 3,
                             '23',
                             -129233.22222222223, 5803723.444444445, -1777.7777777777778, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             51, 8, 6, 4,
                             '04_06',
                             -129233.22222222223, 5805001.222222222, -1777.7777777777778, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5804362.333333333,
                                                   -128344.33333333334 5804362.333333333,
                                                   -128344.33333333334 5805640.111111111,
                                                   -130122.11111111112 5805640.111111111,
                                                   -130122.11111111112 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             51, 8, 6, 4,
                             '8',
                             -129233.22222222223, 5805001.222222222, -1777.7777777777778, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             42, 1, 6, 5,
                             '05_06',
                             -129233.22222222223, 5806279.0, -1777.7777777777778, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5805640.111111111,
                                                   -128344.33333333334 5805640.111111111,
                                                   -128344.33333333334 5806917.888888889,
                                                   -130122.11111111112 5806917.888888889,
                                                   -130122.11111111112 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             42, 1, 6, 5,
                             '1',
                             -129233.22222222223, 5806279.0, -1777.7777777777778, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             33, 2, 6, 6,
                             '06_06',
                             -129233.22222222223, 5807556.777777778, -1777.7777777777778, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5806917.888888889,
                                                   -128344.33333333334 5806917.888888889,
                                                   -128344.33333333334 5808195.666666667,
                                                   -130122.11111111112 5808195.666666667,
                                                   -130122.11111111112 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             33, 2, 6, 6,
                             '2',
                             -129233.22222222223, 5807556.777777778, -1777.7777777777778, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             24, 13, 6, 7,
                             '07_06',
                             -129233.22222222223, 5808834.555555556, -1777.7777777777778, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5808195.666666667,
                                                   -128344.33333333334 5808195.666666667,
                                                   -128344.33333333334 5809473.444444445,
                                                   -130122.11111111112 5809473.444444445,
                                                   -130122.11111111112 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             24, 13, 6, 7,
                             '13',
                             -129233.22222222223, 5808834.555555556, -1777.7777777777778, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             15, 32, 6, 8,
                             '08_06',
                             -129233.22222222223, 5810112.333333333, -1777.7777777777778, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5809473.444444444,
                                                   -128344.33333333334 5809473.444444444,
                                                   -128344.33333333334 5810751.222222222,
                                                   -130122.11111111112 5810751.222222222,
                                                   -130122.11111111112 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             15, 32, 6, 8,
                             '32',
                             -129233.22222222223, 5810112.333333333, -1777.7777777777778, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             6, 59, 6, 9,
                             '09_06',
                             -129233.22222222223, 5811390.111111111, -1777.7777777777778, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-130122.11111111112 5810751.222222222,
                                                   -128344.33333333334 5810751.222222222,
                                                   -128344.33333333334 5812029.0,
                                                   -130122.11111111112 5812029.0,
                                                   -130122.11111111112 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             6, 59, 6, 9,
                             '59',
                             -129233.22222222223, 5811390.111111111, -1777.7777777777778, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-129233.22222222223 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             79, 78, 7, 1,
                             '01_07',
                             -127455.44444444445, 5801167.888888889, -3555.5555555555557, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5800529.0,
                                                   -126566.55555555556 5800529.0,
                                                   -126566.55555555556 5801806.777777778,
                                                   -128344.33333333334 5801806.777777778,
                                                   -128344.33333333334 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             79, 78, 7, 1,
                             '78',
                             -127455.44444444445, 5801167.888888889, -3555.5555555555557, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             70, 47, 7, 2,
                             '02_07',
                             -127455.44444444445, 5802445.666666667, -3555.5555555555557, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5801806.777777778,
                                                   -126566.55555555556 5801806.777777778,
                                                   -126566.55555555556 5803084.555555556,
                                                   -128344.33333333334 5803084.555555556,
                                                   -128344.33333333334 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             70, 47, 7, 2,
                             '47',
                             -127455.44444444445, 5802445.666666667, -3555.5555555555557, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             61, 24, 7, 3,
                             '03_07',
                             -127455.44444444445, 5803723.444444445, -3555.5555555555557, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5803084.555555556,
                                                   -126566.55555555556 5803084.555555556,
                                                   -126566.55555555556 5804362.333333334,
                                                   -128344.33333333334 5804362.333333334,
                                                   -128344.33333333334 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             61, 24, 7, 3,
                             '24',
                             -127455.44444444445, 5803723.444444445, -3555.5555555555557, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             52, 9, 7, 4,
                             '04_07',
                             -127455.44444444445, 5805001.222222222, -3555.5555555555557, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5804362.333333333,
                                                   -126566.55555555556 5804362.333333333,
                                                   -126566.55555555556 5805640.111111111,
                                                   -128344.33333333334 5805640.111111111,
                                                   -128344.33333333334 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             52, 9, 7, 4,
                             '9',
                             -127455.44444444445, 5805001.222222222, -3555.5555555555557, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             43, 10, 7, 5,
                             '05_07',
                             -127455.44444444445, 5806279.0, -3555.5555555555557, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5805640.111111111,
                                                   -126566.55555555556 5805640.111111111,
                                                   -126566.55555555556 5806917.888888889,
                                                   -128344.33333333334 5806917.888888889,
                                                   -128344.33333333334 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             43, 10, 7, 5,
                             '10',
                             -127455.44444444445, 5806279.0, -3555.5555555555557, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             34, 11, 7, 6,
                             '06_07',
                             -127455.44444444445, 5807556.777777778, -3555.5555555555557, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5806917.888888889,
                                                   -126566.55555555556 5806917.888888889,
                                                   -126566.55555555556 5808195.666666667,
                                                   -128344.33333333334 5808195.666666667,
                                                   -128344.33333333334 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             34, 11, 7, 6,
                             '11',
                             -127455.44444444445, 5807556.777777778, -3555.5555555555557, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             25, 12, 7, 7,
                             '07_07',
                             -127455.44444444445, 5808834.555555556, -3555.5555555555557, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5808195.666666667,
                                                   -126566.55555555556 5808195.666666667,
                                                   -126566.55555555556 5809473.444444445,
                                                   -128344.33333333334 5809473.444444445,
                                                   -128344.33333333334 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             25, 12, 7, 7,
                             '12',
                             -127455.44444444445, 5808834.555555556, -3555.5555555555557, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             16, 31, 7, 8,
                             '08_07',
                             -127455.44444444445, 5810112.333333333, -3555.5555555555557, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5809473.444444444,
                                                   -126566.55555555556 5809473.444444444,
                                                   -126566.55555555556 5810751.222222222,
                                                   -128344.33333333334 5810751.222222222,
                                                   -128344.33333333334 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             16, 31, 7, 8,
                             '31',
                             -127455.44444444445, 5810112.333333333, -3555.5555555555557, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             7, 58, 7, 9,
                             '09_07',
                             -127455.44444444445, 5811390.111111111, -3555.5555555555557, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-128344.33333333334 5810751.222222222,
                                                   -126566.55555555556 5810751.222222222,
                                                   -126566.55555555556 5812029.0,
                                                   -128344.33333333334 5812029.0,
                                                   -128344.33333333334 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             7, 58, 7, 9,
                             '58',
                             -127455.44444444445, 5811390.111111111, -3555.5555555555557, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-127455.44444444445 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             80, 79, 8, 1,
                             '01_08',
                             -125677.66666666669, 5801167.888888889, -5333.333333333334, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5800529.0,
                                                   -124788.7777777778 5800529.0,
                                                   -124788.7777777778 5801806.777777778,
                                                   -126566.55555555558 5801806.777777778,
                                                   -126566.55555555558 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             80, 79, 8, 1,
                             '79',
                             -125677.66666666669, 5801167.888888889, -5333.333333333334, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             71, 48, 8, 2,
                             '02_08',
                             -125677.66666666669, 5802445.666666667, -5333.333333333334, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5801806.777777778,
                                                   -124788.7777777778 5801806.777777778,
                                                   -124788.7777777778 5803084.555555556,
                                                   -126566.55555555558 5803084.555555556,
                                                   -126566.55555555558 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             71, 48, 8, 2,
                             '48',
                             -125677.66666666669, 5802445.666666667, -5333.333333333334, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             62, 25, 8, 3,
                             '03_08',
                             -125677.66666666669, 5803723.444444445, -5333.333333333334, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5803084.555555556,
                                                   -124788.7777777778 5803084.555555556,
                                                   -124788.7777777778 5804362.333333334,
                                                   -126566.55555555558 5804362.333333334,
                                                   -126566.55555555558 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             62, 25, 8, 3,
                             '25',
                             -125677.66666666669, 5803723.444444445, -5333.333333333334, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             53, 26, 8, 4,
                             '04_08',
                             -125677.66666666669, 5805001.222222222, -5333.333333333334, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5804362.333333333,
                                                   -124788.7777777778 5804362.333333333,
                                                   -124788.7777777778 5805640.111111111,
                                                   -126566.55555555558 5805640.111111111,
                                                   -126566.55555555558 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             53, 26, 8, 4,
                             '26',
                             -125677.66666666669, 5805001.222222222, -5333.333333333334, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             44, 27, 8, 5,
                             '05_08',
                             -125677.66666666669, 5806279.0, -5333.333333333334, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5805640.111111111,
                                                   -124788.7777777778 5805640.111111111,
                                                   -124788.7777777778 5806917.888888889,
                                                   -126566.55555555558 5806917.888888889,
                                                   -126566.55555555558 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             44, 27, 8, 5,
                             '27',
                             -125677.66666666669, 5806279.0, -5333.333333333334, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             35, 28, 8, 6,
                             '06_08',
                             -125677.66666666669, 5807556.777777778, -5333.333333333334, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5806917.888888889,
                                                   -124788.7777777778 5806917.888888889,
                                                   -124788.7777777778 5808195.666666667,
                                                   -126566.55555555558 5808195.666666667,
                                                   -126566.55555555558 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             35, 28, 8, 6,
                             '28',
                             -125677.66666666669, 5807556.777777778, -5333.333333333334, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             26, 29, 8, 7,
                             '07_08',
                             -125677.66666666669, 5808834.555555556, -5333.333333333334, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5808195.666666667,
                                                   -124788.7777777778 5808195.666666667,
                                                   -124788.7777777778 5809473.444444445,
                                                   -126566.55555555558 5809473.444444445,
                                                   -126566.55555555558 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             26, 29, 8, 7,
                             '29',
                             -125677.66666666669, 5808834.555555556, -5333.333333333334, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             17, 30, 8, 8,
                             '08_08',
                             -125677.66666666669, 5810112.333333333, -5333.333333333334, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5809473.444444444,
                                                   -124788.7777777778 5809473.444444444,
                                                   -124788.7777777778 5810751.222222222,
                                                   -126566.55555555558 5810751.222222222,
                                                   -126566.55555555558 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             17, 30, 8, 8,
                             '30',
                             -125677.66666666669, 5810112.333333333, -5333.333333333334, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             8, 57, 8, 9,
                             '09_08',
                             -125677.66666666669, 5811390.111111111, -5333.333333333334, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-126566.55555555558 5810751.222222222,
                                                   -124788.7777777778 5810751.222222222,
                                                   -124788.7777777778 5812029.0,
                                                   -126566.55555555558 5812029.0,
                                                   -126566.55555555558 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             8, 57, 8, 9,
                             '57',
                             -125677.66666666669, 5811390.111111111, -5333.333333333334, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-125677.66666666669 5811390.111111111)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             81, 80, 9, 1,
                             '01_09',
                             -123899.8888888889, 5801167.888888889, -7111.111111111111, -5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5800529.0,
                                                   -123011.00000000001 5800529.0,
                                                   -123011.00000000001 5801806.777777778,
                                                   -124788.7777777778 5801806.777777778,
                                                   -124788.7777777778 5800529.0))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             81, 80, 9, 1,
                             '80',
                             -123899.8888888889, 5801167.888888889, -7111.111111111111, -5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5801167.888888889)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             72, 49, 9, 2,
                             '02_09',
                             -123899.8888888889, 5802445.666666667, -7111.111111111111, -3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5801806.777777778,
                                                   -123011.00000000001 5801806.777777778,
                                                   -123011.00000000001 5803084.555555556,
                                                   -124788.7777777778 5803084.555555556,
                                                   -124788.7777777778 5801806.777777778))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             72, 49, 9, 2,
                             '49',
                             -123899.8888888889, 5802445.666666667, -7111.111111111111, -3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5802445.666666667)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             63, 50, 9, 3,
                             '03_09',
                             -123899.8888888889, 5803723.444444445, -7111.111111111111, -2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5803084.555555556,
                                                   -123011.00000000001 5803084.555555556,
                                                   -123011.00000000001 5804362.333333334,
                                                   -124788.7777777778 5804362.333333334,
                                                   -124788.7777777778 5803084.555555556))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             63, 50, 9, 3,
                             '50',
                             -123899.8888888889, 5803723.444444445, -7111.111111111111, -2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5803723.444444445)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             54, 51, 9, 4,
                             '04_09',
                             -123899.8888888889, 5805001.222222222, -7111.111111111111, -1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5804362.333333333,
                                                   -123011.00000000001 5804362.333333333,
                                                   -123011.00000000001 5805640.111111111,
                                                   -124788.7777777778 5805640.111111111,
                                                   -124788.7777777778 5804362.333333333))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             54, 51, 9, 4,
                             '51',
                             -123899.8888888889, 5805001.222222222, -7111.111111111111, -1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5805001.222222222)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             45, 52, 9, 5,
                             '05_09',
                             -123899.8888888889, 5806279.0, -7111.111111111111, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5805640.111111111,
                                                   -123011.00000000001 5805640.111111111,
                                                   -123011.00000000001 5806917.888888889,
                                                   -124788.7777777778 5806917.888888889,
                                                   -124788.7777777778 5805640.111111111))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             45, 52, 9, 5,
                             '52',
                             -123899.8888888889, 5806279.0, -7111.111111111111, 0.0,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5806279.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             36, 53, 9, 6,
                             '06_09',
                             -123899.8888888889, 5807556.777777778, -7111.111111111111, 1277.7777777777778,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5806917.888888889,
                                                   -123011.00000000001 5806917.888888889,
                                                   -123011.00000000001 5808195.666666667,
                                                   -124788.7777777778 5808195.666666667,
                                                   -124788.7777777778 5806917.888888889))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             36, 53, 9, 6,
                             '53',
                             -123899.8888888889, 5807556.777777778, -7111.111111111111, 1277.7777777777778,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5807556.777777778)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             27, 54, 9, 7,
                             '07_09',
                             -123899.8888888889, 5808834.555555556, -7111.111111111111, 2555.5555555555557,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5808195.666666667,
                                                   -123011.00000000001 5808195.666666667,
                                                   -123011.00000000001 5809473.444444445,
                                                   -124788.7777777778 5809473.444444445,
                                                   -124788.7777777778 5808195.666666667))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             27, 54, 9, 7,
                             '54',
                             -123899.8888888889, 5808834.555555556, -7111.111111111111, 2555.5555555555557,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5808834.555555556)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             18, 55, 9, 8,
                             '08_09',
                             -123899.8888888889, 5810112.333333333, -7111.111111111111, 3833.3333333333335,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5809473.444444444,
                                                   -123011.00000000001 5809473.444444444,
                                                   -123011.00000000001 5810751.222222222,
                                                   -124788.7777777778 5810751.222222222,
                                                   -124788.7777777778 5809473.444444444))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             18, 55, 9, 8,
                             '55',
                             -123899.8888888889, 5810112.333333333, -7111.111111111111, 3833.3333333333335,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5810112.333333333)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             9, 56, 9, 9,
                             '09_09',
                             -123899.8888888889, 5811390.111111111, -7111.111111111111, 5111.111111111111,
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON((-124788.7777777778 5810751.222222222,
                                                   -123011.00000000001 5810751.222222222,
                                                   -123011.00000000001 5812029.0,
                                                   -124788.7777777778 5812029.0,
                                                   -124788.7777777778 5810751.222222222))'));
                        
INSERT INTO poi_point 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     altitude,
     poi_geom)

                        VALUES (
                             9, 56, 9, 9,
                             '56',
                             -123899.8888888889, 5811390.111111111, -7111.111111111111, 5111.111111111111,
                             1800,
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT(-123899.8888888889 5811390.111111111)'));
                        

UPDATE poi_polygon
  SET
      longitude =
                 st_x(
                   st_transform(
                      st_centroid(poi_geom),
                      4326)),
      latitude =
                 st_y(
                   st_transform(
                      st_centroid(poi_geom),
                      4326));



UPDATE poi_point
  SET 
      longitude = 
                 st_x(
                   st_transform(
                      poi_geom,
                      4326)),
      latitude = 
                 st_y(
                   st_transform(
                      poi_geom,
                      4326));

