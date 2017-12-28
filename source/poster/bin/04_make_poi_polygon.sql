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
                          3946, 'POLYGON', 2);


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

SELECT AddGeometryColumn('poi_point', 'poi_geom', 3946, 'POINT', 2);

INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             421, 420, 1, 1,
                             '01_01',
                             1379698.5714285714, 5226078.571428572, 71.42857142857143, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226075.0,
                                                   1379702.1428571427 5226075.0,
                                                   1379702.1428571427 5226082.142857144,
                                                   1379695.0 5226082.142857144,
                                                   1379695.0 5226075.0))'));
                        
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
                             421, 420, 1, 1,
                             '420',
                             1379698.5714285714, 5226078.571428572, 71.42857142857143, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             400, 419, 1, 2,
                             '02_01',
                             1379698.5714285714, 5226085.714285715, 71.42857142857143, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226082.142857143,
                                                   1379702.1428571427 5226082.142857143,
                                                   1379702.1428571427 5226089.285714286,
                                                   1379695.0 5226089.285714286,
                                                   1379695.0 5226082.142857143))'));
                        
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
                             400, 419, 1, 2,
                             '419',
                             1379698.5714285714, 5226085.714285715, 71.42857142857143, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             379, 418, 1, 3,
                             '03_01',
                             1379698.5714285714, 5226092.857142857, 71.42857142857143, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226089.285714285,
                                                   1379702.1428571427 5226089.285714285,
                                                   1379702.1428571427 5226096.428571429,
                                                   1379695.0 5226096.428571429,
                                                   1379695.0 5226089.285714285))'));
                        
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
                             379, 418, 1, 3,
                             '418',
                             1379698.5714285714, 5226092.857142857, 71.42857142857143, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             358, 417, 1, 4,
                             '04_01',
                             1379698.5714285714, 5226100.0, 71.42857142857143, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226096.428571428,
                                                   1379702.1428571427 5226096.428571428,
                                                   1379702.1428571427 5226103.571428572,
                                                   1379695.0 5226103.571428572,
                                                   1379695.0 5226096.428571428))'));
                        
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
                             358, 417, 1, 4,
                             '417',
                             1379698.5714285714, 5226100.0, 71.42857142857143, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             337, 416, 1, 5,
                             '05_01',
                             1379698.5714285714, 5226107.142857144, 71.42857142857143, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226103.571428572,
                                                   1379702.1428571427 5226103.571428572,
                                                   1379702.1428571427 5226110.7142857155,
                                                   1379695.0 5226110.7142857155,
                                                   1379695.0 5226103.571428572))'));
                        
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
                             337, 416, 1, 5,
                             '416',
                             1379698.5714285714, 5226107.142857144, 71.42857142857143, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             316, 415, 1, 6,
                             '06_01',
                             1379698.5714285714, 5226114.285714286, 71.42857142857143, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226110.714285715,
                                                   1379702.1428571427 5226110.714285715,
                                                   1379702.1428571427 5226117.857142858,
                                                   1379695.0 5226117.857142858,
                                                   1379695.0 5226110.714285715))'));
                        
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
                             316, 415, 1, 6,
                             '415',
                             1379698.5714285714, 5226114.285714286, 71.42857142857143, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             295, 414, 1, 7,
                             '07_01',
                             1379698.5714285714, 5226121.428571429, 71.42857142857143, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226117.857142857,
                                                   1379702.1428571427 5226117.857142857,
                                                   1379702.1428571427 5226125.000000001,
                                                   1379695.0 5226125.000000001,
                                                   1379695.0 5226117.857142857))'));
                        
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
                             295, 414, 1, 7,
                             '414',
                             1379698.5714285714, 5226121.428571429, 71.42857142857143, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             274, 413, 1, 8,
                             '08_01',
                             1379698.5714285714, 5226128.571428572, 71.42857142857143, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226125.0,
                                                   1379702.1428571427 5226125.0,
                                                   1379702.1428571427 5226132.142857144,
                                                   1379695.0 5226132.142857144,
                                                   1379695.0 5226125.0))'));
                        
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
                             274, 413, 1, 8,
                             '413',
                             1379698.5714285714, 5226128.571428572, 71.42857142857143, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             253, 412, 1, 9,
                             '09_01',
                             1379698.5714285714, 5226135.714285715, 71.42857142857143, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226132.142857143,
                                                   1379702.1428571427 5226132.142857143,
                                                   1379702.1428571427 5226139.285714286,
                                                   1379695.0 5226139.285714286,
                                                   1379695.0 5226132.142857143))'));
                        
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
                             253, 412, 1, 9,
                             '412',
                             1379698.5714285714, 5226135.714285715, 71.42857142857143, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             232, 411, 1, 10,
                             '10_01',
                             1379698.5714285714, 5226142.857142857, 71.42857142857143, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226139.285714285,
                                                   1379702.1428571427 5226139.285714285,
                                                   1379702.1428571427 5226146.428571429,
                                                   1379695.0 5226146.428571429,
                                                   1379695.0 5226139.285714285))'));
                        
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
                             232, 411, 1, 10,
                             '411',
                             1379698.5714285714, 5226142.857142857, 71.42857142857143, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             211, 410, 1, 11,
                             '11_01',
                             1379698.5714285714, 5226150.0, 71.42857142857143, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226146.428571428,
                                                   1379702.1428571427 5226146.428571428,
                                                   1379702.1428571427 5226153.571428572,
                                                   1379695.0 5226153.571428572,
                                                   1379695.0 5226146.428571428))'));
                        
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
                             211, 410, 1, 11,
                             '410',
                             1379698.5714285714, 5226150.0, 71.42857142857143, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             190, 409, 1, 12,
                             '12_01',
                             1379698.5714285714, 5226157.142857144, 71.42857142857143, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226153.571428572,
                                                   1379702.1428571427 5226153.571428572,
                                                   1379702.1428571427 5226160.7142857155,
                                                   1379695.0 5226160.7142857155,
                                                   1379695.0 5226153.571428572))'));
                        
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
                             190, 409, 1, 12,
                             '409',
                             1379698.5714285714, 5226157.142857144, 71.42857142857143, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             169, 408, 1, 13,
                             '13_01',
                             1379698.5714285714, 5226164.285714286, 71.42857142857143, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226160.714285715,
                                                   1379702.1428571427 5226160.714285715,
                                                   1379702.1428571427 5226167.857142858,
                                                   1379695.0 5226167.857142858,
                                                   1379695.0 5226160.714285715))'));
                        
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
                             169, 408, 1, 13,
                             '408',
                             1379698.5714285714, 5226164.285714286, 71.42857142857143, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             148, 407, 1, 14,
                             '14_01',
                             1379698.5714285714, 5226171.428571429, 71.42857142857143, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226167.857142857,
                                                   1379702.1428571427 5226167.857142857,
                                                   1379702.1428571427 5226175.000000001,
                                                   1379695.0 5226175.000000001,
                                                   1379695.0 5226167.857142857))'));
                        
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
                             148, 407, 1, 14,
                             '407',
                             1379698.5714285714, 5226171.428571429, 71.42857142857143, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             127, 406, 1, 15,
                             '15_01',
                             1379698.5714285714, 5226178.571428572, 71.42857142857143, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226175.0,
                                                   1379702.1428571427 5226175.0,
                                                   1379702.1428571427 5226182.142857144,
                                                   1379695.0 5226182.142857144,
                                                   1379695.0 5226175.0))'));
                        
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
                             127, 406, 1, 15,
                             '406',
                             1379698.5714285714, 5226178.571428572, 71.42857142857143, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             106, 405, 1, 16,
                             '16_01',
                             1379698.5714285714, 5226185.714285715, 71.42857142857143, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226182.142857143,
                                                   1379702.1428571427 5226182.142857143,
                                                   1379702.1428571427 5226189.285714286,
                                                   1379695.0 5226189.285714286,
                                                   1379695.0 5226182.142857143))'));
                        
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
                             106, 405, 1, 16,
                             '405',
                             1379698.5714285714, 5226185.714285715, 71.42857142857143, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             85, 404, 1, 17,
                             '17_01',
                             1379698.5714285714, 5226192.857142857, 71.42857142857143, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226189.285714285,
                                                   1379702.1428571427 5226189.285714285,
                                                   1379702.1428571427 5226196.428571429,
                                                   1379695.0 5226196.428571429,
                                                   1379695.0 5226189.285714285))'));
                        
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
                             85, 404, 1, 17,
                             '404',
                             1379698.5714285714, 5226192.857142857, 71.42857142857143, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             64, 403, 1, 18,
                             '18_01',
                             1379698.5714285714, 5226200.0, 71.42857142857143, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226196.428571428,
                                                   1379702.1428571427 5226196.428571428,
                                                   1379702.1428571427 5226203.571428572,
                                                   1379695.0 5226203.571428572,
                                                   1379695.0 5226196.428571428))'));
                        
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
                             64, 403, 1, 18,
                             '403',
                             1379698.5714285714, 5226200.0, 71.42857142857143, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             43, 402, 1, 19,
                             '19_01',
                             1379698.5714285714, 5226207.142857144, 71.42857142857143, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226203.571428572,
                                                   1379702.1428571427 5226203.571428572,
                                                   1379702.1428571427 5226210.7142857155,
                                                   1379695.0 5226210.7142857155,
                                                   1379695.0 5226203.571428572))'));
                        
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
                             43, 402, 1, 19,
                             '402',
                             1379698.5714285714, 5226207.142857144, 71.42857142857143, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             22, 401, 1, 20,
                             '20_01',
                             1379698.5714285714, 5226214.285714286, 71.42857142857143, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226210.714285715,
                                                   1379702.1428571427 5226210.714285715,
                                                   1379702.1428571427 5226217.857142858,
                                                   1379695.0 5226217.857142858,
                                                   1379695.0 5226210.714285715))'));
                        
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
                             22, 401, 1, 20,
                             '401',
                             1379698.5714285714, 5226214.285714286, 71.42857142857143, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             1, 400, 1, 21,
                             '21_01',
                             1379698.5714285714, 5226221.428571429, 71.42857142857143, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379695.0 5226217.857142857,
                                                   1379702.1428571427 5226217.857142857,
                                                   1379702.1428571427 5226225.000000001,
                                                   1379695.0 5226225.000000001,
                                                   1379695.0 5226217.857142857))'));
                        
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
                             1, 400, 1, 21,
                             '400',
                             1379698.5714285714, 5226221.428571429, 71.42857142857143, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379698.5714285714 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             422, 421, 2, 1,
                             '01_02',
                             1379705.7142857143, 5226078.571428572, 64.28571428571429, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226075.0,
                                                   1379709.2857142857 5226075.0,
                                                   1379709.2857142857 5226082.142857144,
                                                   1379702.142857143 5226082.142857144,
                                                   1379702.142857143 5226075.0))'));
                        
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
                             422, 421, 2, 1,
                             '421',
                             1379705.7142857143, 5226078.571428572, 64.28571428571429, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             401, 342, 2, 2,
                             '02_02',
                             1379705.7142857143, 5226085.714285715, 64.28571428571429, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226082.142857143,
                                                   1379709.2857142857 5226082.142857143,
                                                   1379709.2857142857 5226089.285714286,
                                                   1379702.142857143 5226089.285714286,
                                                   1379702.142857143 5226082.142857143))'));
                        
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
                             401, 342, 2, 2,
                             '342',
                             1379705.7142857143, 5226085.714285715, 64.28571428571429, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             380, 341, 2, 3,
                             '03_02',
                             1379705.7142857143, 5226092.857142857, 64.28571428571429, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226089.285714285,
                                                   1379709.2857142857 5226089.285714285,
                                                   1379709.2857142857 5226096.428571429,
                                                   1379702.142857143 5226096.428571429,
                                                   1379702.142857143 5226089.285714285))'));
                        
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
                             380, 341, 2, 3,
                             '341',
                             1379705.7142857143, 5226092.857142857, 64.28571428571429, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             359, 340, 2, 4,
                             '04_02',
                             1379705.7142857143, 5226100.0, 64.28571428571429, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226096.428571428,
                                                   1379709.2857142857 5226096.428571428,
                                                   1379709.2857142857 5226103.571428572,
                                                   1379702.142857143 5226103.571428572,
                                                   1379702.142857143 5226096.428571428))'));
                        
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
                             359, 340, 2, 4,
                             '340',
                             1379705.7142857143, 5226100.0, 64.28571428571429, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             338, 339, 2, 5,
                             '05_02',
                             1379705.7142857143, 5226107.142857144, 64.28571428571429, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226103.571428572,
                                                   1379709.2857142857 5226103.571428572,
                                                   1379709.2857142857 5226110.7142857155,
                                                   1379702.142857143 5226110.7142857155,
                                                   1379702.142857143 5226103.571428572))'));
                        
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
                             338, 339, 2, 5,
                             '339',
                             1379705.7142857143, 5226107.142857144, 64.28571428571429, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             317, 338, 2, 6,
                             '06_02',
                             1379705.7142857143, 5226114.285714286, 64.28571428571429, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226110.714285715,
                                                   1379709.2857142857 5226110.714285715,
                                                   1379709.2857142857 5226117.857142858,
                                                   1379702.142857143 5226117.857142858,
                                                   1379702.142857143 5226110.714285715))'));
                        
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
                             317, 338, 2, 6,
                             '338',
                             1379705.7142857143, 5226114.285714286, 64.28571428571429, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             296, 337, 2, 7,
                             '07_02',
                             1379705.7142857143, 5226121.428571429, 64.28571428571429, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226117.857142857,
                                                   1379709.2857142857 5226117.857142857,
                                                   1379709.2857142857 5226125.000000001,
                                                   1379702.142857143 5226125.000000001,
                                                   1379702.142857143 5226117.857142857))'));
                        
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
                             296, 337, 2, 7,
                             '337',
                             1379705.7142857143, 5226121.428571429, 64.28571428571429, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             275, 336, 2, 8,
                             '08_02',
                             1379705.7142857143, 5226128.571428572, 64.28571428571429, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226125.0,
                                                   1379709.2857142857 5226125.0,
                                                   1379709.2857142857 5226132.142857144,
                                                   1379702.142857143 5226132.142857144,
                                                   1379702.142857143 5226125.0))'));
                        
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
                             275, 336, 2, 8,
                             '336',
                             1379705.7142857143, 5226128.571428572, 64.28571428571429, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             254, 335, 2, 9,
                             '09_02',
                             1379705.7142857143, 5226135.714285715, 64.28571428571429, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226132.142857143,
                                                   1379709.2857142857 5226132.142857143,
                                                   1379709.2857142857 5226139.285714286,
                                                   1379702.142857143 5226139.285714286,
                                                   1379702.142857143 5226132.142857143))'));
                        
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
                             254, 335, 2, 9,
                             '335',
                             1379705.7142857143, 5226135.714285715, 64.28571428571429, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             233, 334, 2, 10,
                             '10_02',
                             1379705.7142857143, 5226142.857142857, 64.28571428571429, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226139.285714285,
                                                   1379709.2857142857 5226139.285714285,
                                                   1379709.2857142857 5226146.428571429,
                                                   1379702.142857143 5226146.428571429,
                                                   1379702.142857143 5226139.285714285))'));
                        
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
                             233, 334, 2, 10,
                             '334',
                             1379705.7142857143, 5226142.857142857, 64.28571428571429, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             212, 333, 2, 11,
                             '11_02',
                             1379705.7142857143, 5226150.0, 64.28571428571429, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226146.428571428,
                                                   1379709.2857142857 5226146.428571428,
                                                   1379709.2857142857 5226153.571428572,
                                                   1379702.142857143 5226153.571428572,
                                                   1379702.142857143 5226146.428571428))'));
                        
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
                             212, 333, 2, 11,
                             '333',
                             1379705.7142857143, 5226150.0, 64.28571428571429, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             191, 332, 2, 12,
                             '12_02',
                             1379705.7142857143, 5226157.142857144, 64.28571428571429, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226153.571428572,
                                                   1379709.2857142857 5226153.571428572,
                                                   1379709.2857142857 5226160.7142857155,
                                                   1379702.142857143 5226160.7142857155,
                                                   1379702.142857143 5226153.571428572))'));
                        
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
                             191, 332, 2, 12,
                             '332',
                             1379705.7142857143, 5226157.142857144, 64.28571428571429, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             170, 331, 2, 13,
                             '13_02',
                             1379705.7142857143, 5226164.285714286, 64.28571428571429, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226160.714285715,
                                                   1379709.2857142857 5226160.714285715,
                                                   1379709.2857142857 5226167.857142858,
                                                   1379702.142857143 5226167.857142858,
                                                   1379702.142857143 5226160.714285715))'));
                        
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
                             170, 331, 2, 13,
                             '331',
                             1379705.7142857143, 5226164.285714286, 64.28571428571429, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             149, 330, 2, 14,
                             '14_02',
                             1379705.7142857143, 5226171.428571429, 64.28571428571429, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226167.857142857,
                                                   1379709.2857142857 5226167.857142857,
                                                   1379709.2857142857 5226175.000000001,
                                                   1379702.142857143 5226175.000000001,
                                                   1379702.142857143 5226167.857142857))'));
                        
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
                             149, 330, 2, 14,
                             '330',
                             1379705.7142857143, 5226171.428571429, 64.28571428571429, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             128, 329, 2, 15,
                             '15_02',
                             1379705.7142857143, 5226178.571428572, 64.28571428571429, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226175.0,
                                                   1379709.2857142857 5226175.0,
                                                   1379709.2857142857 5226182.142857144,
                                                   1379702.142857143 5226182.142857144,
                                                   1379702.142857143 5226175.0))'));
                        
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
                             128, 329, 2, 15,
                             '329',
                             1379705.7142857143, 5226178.571428572, 64.28571428571429, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             107, 328, 2, 16,
                             '16_02',
                             1379705.7142857143, 5226185.714285715, 64.28571428571429, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226182.142857143,
                                                   1379709.2857142857 5226182.142857143,
                                                   1379709.2857142857 5226189.285714286,
                                                   1379702.142857143 5226189.285714286,
                                                   1379702.142857143 5226182.142857143))'));
                        
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
                             107, 328, 2, 16,
                             '328',
                             1379705.7142857143, 5226185.714285715, 64.28571428571429, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             86, 327, 2, 17,
                             '17_02',
                             1379705.7142857143, 5226192.857142857, 64.28571428571429, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226189.285714285,
                                                   1379709.2857142857 5226189.285714285,
                                                   1379709.2857142857 5226196.428571429,
                                                   1379702.142857143 5226196.428571429,
                                                   1379702.142857143 5226189.285714285))'));
                        
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
                             86, 327, 2, 17,
                             '327',
                             1379705.7142857143, 5226192.857142857, 64.28571428571429, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             65, 326, 2, 18,
                             '18_02',
                             1379705.7142857143, 5226200.0, 64.28571428571429, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226196.428571428,
                                                   1379709.2857142857 5226196.428571428,
                                                   1379709.2857142857 5226203.571428572,
                                                   1379702.142857143 5226203.571428572,
                                                   1379702.142857143 5226196.428571428))'));
                        
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
                             65, 326, 2, 18,
                             '326',
                             1379705.7142857143, 5226200.0, 64.28571428571429, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             44, 325, 2, 19,
                             '19_02',
                             1379705.7142857143, 5226207.142857144, 64.28571428571429, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226203.571428572,
                                                   1379709.2857142857 5226203.571428572,
                                                   1379709.2857142857 5226210.7142857155,
                                                   1379702.142857143 5226210.7142857155,
                                                   1379702.142857143 5226203.571428572))'));
                        
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
                             44, 325, 2, 19,
                             '325',
                             1379705.7142857143, 5226207.142857144, 64.28571428571429, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             23, 324, 2, 20,
                             '20_02',
                             1379705.7142857143, 5226214.285714286, 64.28571428571429, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226210.714285715,
                                                   1379709.2857142857 5226210.714285715,
                                                   1379709.2857142857 5226217.857142858,
                                                   1379702.142857143 5226217.857142858,
                                                   1379702.142857143 5226210.714285715))'));
                        
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
                             23, 324, 2, 20,
                             '324',
                             1379705.7142857143, 5226214.285714286, 64.28571428571429, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             2, 399, 2, 21,
                             '21_02',
                             1379705.7142857143, 5226221.428571429, 64.28571428571429, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379702.142857143 5226217.857142857,
                                                   1379709.2857142857 5226217.857142857,
                                                   1379709.2857142857 5226225.000000001,
                                                   1379702.142857143 5226225.000000001,
                                                   1379702.142857143 5226217.857142857))'));
                        
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
                             2, 399, 2, 21,
                             '399',
                             1379705.7142857143, 5226221.428571429, 64.28571428571429, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379705.7142857143 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             423, 422, 3, 1,
                             '01_03',
                             1379712.857142857, 5226078.571428572, 57.142857142857146, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226075.0,
                                                   1379716.4285714284 5226075.0,
                                                   1379716.4285714284 5226082.142857144,
                                                   1379709.2857142857 5226082.142857144,
                                                   1379709.2857142857 5226075.0))'));
                        
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
                             423, 422, 3, 1,
                             '422',
                             1379712.857142857, 5226078.571428572, 57.142857142857146, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             402, 343, 3, 2,
                             '02_03',
                             1379712.857142857, 5226085.714285715, 57.142857142857146, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226082.142857143,
                                                   1379716.4285714284 5226082.142857143,
                                                   1379716.4285714284 5226089.285714286,
                                                   1379709.2857142857 5226089.285714286,
                                                   1379709.2857142857 5226082.142857143))'));
                        
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
                             402, 343, 3, 2,
                             '343',
                             1379712.857142857, 5226085.714285715, 57.142857142857146, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             381, 272, 3, 3,
                             '03_03',
                             1379712.857142857, 5226092.857142857, 57.142857142857146, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226089.285714285,
                                                   1379716.4285714284 5226089.285714285,
                                                   1379716.4285714284 5226096.428571429,
                                                   1379709.2857142857 5226096.428571429,
                                                   1379709.2857142857 5226089.285714285))'));
                        
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
                             381, 272, 3, 3,
                             '272',
                             1379712.857142857, 5226092.857142857, 57.142857142857146, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             360, 271, 3, 4,
                             '04_03',
                             1379712.857142857, 5226100.0, 57.142857142857146, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226096.428571428,
                                                   1379716.4285714284 5226096.428571428,
                                                   1379716.4285714284 5226103.571428572,
                                                   1379709.2857142857 5226103.571428572,
                                                   1379709.2857142857 5226096.428571428))'));
                        
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
                             360, 271, 3, 4,
                             '271',
                             1379712.857142857, 5226100.0, 57.142857142857146, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             339, 270, 3, 5,
                             '05_03',
                             1379712.857142857, 5226107.142857144, 57.142857142857146, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226103.571428572,
                                                   1379716.4285714284 5226103.571428572,
                                                   1379716.4285714284 5226110.7142857155,
                                                   1379709.2857142857 5226110.7142857155,
                                                   1379709.2857142857 5226103.571428572))'));
                        
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
                             339, 270, 3, 5,
                             '270',
                             1379712.857142857, 5226107.142857144, 57.142857142857146, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             318, 269, 3, 6,
                             '06_03',
                             1379712.857142857, 5226114.285714286, 57.142857142857146, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226110.714285715,
                                                   1379716.4285714284 5226110.714285715,
                                                   1379716.4285714284 5226117.857142858,
                                                   1379709.2857142857 5226117.857142858,
                                                   1379709.2857142857 5226110.714285715))'));
                        
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
                             318, 269, 3, 6,
                             '269',
                             1379712.857142857, 5226114.285714286, 57.142857142857146, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             297, 268, 3, 7,
                             '07_03',
                             1379712.857142857, 5226121.428571429, 57.142857142857146, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226117.857142857,
                                                   1379716.4285714284 5226117.857142857,
                                                   1379716.4285714284 5226125.000000001,
                                                   1379709.2857142857 5226125.000000001,
                                                   1379709.2857142857 5226117.857142857))'));
                        
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
                             297, 268, 3, 7,
                             '268',
                             1379712.857142857, 5226121.428571429, 57.142857142857146, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             276, 267, 3, 8,
                             '08_03',
                             1379712.857142857, 5226128.571428572, 57.142857142857146, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226125.0,
                                                   1379716.4285714284 5226125.0,
                                                   1379716.4285714284 5226132.142857144,
                                                   1379709.2857142857 5226132.142857144,
                                                   1379709.2857142857 5226125.0))'));
                        
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
                             276, 267, 3, 8,
                             '267',
                             1379712.857142857, 5226128.571428572, 57.142857142857146, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             255, 266, 3, 9,
                             '09_03',
                             1379712.857142857, 5226135.714285715, 57.142857142857146, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226132.142857143,
                                                   1379716.4285714284 5226132.142857143,
                                                   1379716.4285714284 5226139.285714286,
                                                   1379709.2857142857 5226139.285714286,
                                                   1379709.2857142857 5226132.142857143))'));
                        
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
                             255, 266, 3, 9,
                             '266',
                             1379712.857142857, 5226135.714285715, 57.142857142857146, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             234, 265, 3, 10,
                             '10_03',
                             1379712.857142857, 5226142.857142857, 57.142857142857146, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226139.285714285,
                                                   1379716.4285714284 5226139.285714285,
                                                   1379716.4285714284 5226146.428571429,
                                                   1379709.2857142857 5226146.428571429,
                                                   1379709.2857142857 5226139.285714285))'));
                        
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
                             234, 265, 3, 10,
                             '265',
                             1379712.857142857, 5226142.857142857, 57.142857142857146, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             213, 264, 3, 11,
                             '11_03',
                             1379712.857142857, 5226150.0, 57.142857142857146, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226146.428571428,
                                                   1379716.4285714284 5226146.428571428,
                                                   1379716.4285714284 5226153.571428572,
                                                   1379709.2857142857 5226153.571428572,
                                                   1379709.2857142857 5226146.428571428))'));
                        
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
                             213, 264, 3, 11,
                             '264',
                             1379712.857142857, 5226150.0, 57.142857142857146, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             192, 263, 3, 12,
                             '12_03',
                             1379712.857142857, 5226157.142857144, 57.142857142857146, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226153.571428572,
                                                   1379716.4285714284 5226153.571428572,
                                                   1379716.4285714284 5226160.7142857155,
                                                   1379709.2857142857 5226160.7142857155,
                                                   1379709.2857142857 5226153.571428572))'));
                        
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
                             192, 263, 3, 12,
                             '263',
                             1379712.857142857, 5226157.142857144, 57.142857142857146, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             171, 262, 3, 13,
                             '13_03',
                             1379712.857142857, 5226164.285714286, 57.142857142857146, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226160.714285715,
                                                   1379716.4285714284 5226160.714285715,
                                                   1379716.4285714284 5226167.857142858,
                                                   1379709.2857142857 5226167.857142858,
                                                   1379709.2857142857 5226160.714285715))'));
                        
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
                             171, 262, 3, 13,
                             '262',
                             1379712.857142857, 5226164.285714286, 57.142857142857146, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             150, 261, 3, 14,
                             '14_03',
                             1379712.857142857, 5226171.428571429, 57.142857142857146, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226167.857142857,
                                                   1379716.4285714284 5226167.857142857,
                                                   1379716.4285714284 5226175.000000001,
                                                   1379709.2857142857 5226175.000000001,
                                                   1379709.2857142857 5226167.857142857))'));
                        
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
                             150, 261, 3, 14,
                             '261',
                             1379712.857142857, 5226171.428571429, 57.142857142857146, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             129, 260, 3, 15,
                             '15_03',
                             1379712.857142857, 5226178.571428572, 57.142857142857146, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226175.0,
                                                   1379716.4285714284 5226175.0,
                                                   1379716.4285714284 5226182.142857144,
                                                   1379709.2857142857 5226182.142857144,
                                                   1379709.2857142857 5226175.0))'));
                        
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
                             129, 260, 3, 15,
                             '260',
                             1379712.857142857, 5226178.571428572, 57.142857142857146, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             108, 259, 3, 16,
                             '16_03',
                             1379712.857142857, 5226185.714285715, 57.142857142857146, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226182.142857143,
                                                   1379716.4285714284 5226182.142857143,
                                                   1379716.4285714284 5226189.285714286,
                                                   1379709.2857142857 5226189.285714286,
                                                   1379709.2857142857 5226182.142857143))'));
                        
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
                             108, 259, 3, 16,
                             '259',
                             1379712.857142857, 5226185.714285715, 57.142857142857146, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             87, 258, 3, 17,
                             '17_03',
                             1379712.857142857, 5226192.857142857, 57.142857142857146, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226189.285714285,
                                                   1379716.4285714284 5226189.285714285,
                                                   1379716.4285714284 5226196.428571429,
                                                   1379709.2857142857 5226196.428571429,
                                                   1379709.2857142857 5226189.285714285))'));
                        
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
                             87, 258, 3, 17,
                             '258',
                             1379712.857142857, 5226192.857142857, 57.142857142857146, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             66, 257, 3, 18,
                             '18_03',
                             1379712.857142857, 5226200.0, 57.142857142857146, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226196.428571428,
                                                   1379716.4285714284 5226196.428571428,
                                                   1379716.4285714284 5226203.571428572,
                                                   1379709.2857142857 5226203.571428572,
                                                   1379709.2857142857 5226196.428571428))'));
                        
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
                             66, 257, 3, 18,
                             '257',
                             1379712.857142857, 5226200.0, 57.142857142857146, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             45, 256, 3, 19,
                             '19_03',
                             1379712.857142857, 5226207.142857144, 57.142857142857146, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226203.571428572,
                                                   1379716.4285714284 5226203.571428572,
                                                   1379716.4285714284 5226210.7142857155,
                                                   1379709.2857142857 5226210.7142857155,
                                                   1379709.2857142857 5226203.571428572))'));
                        
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
                             45, 256, 3, 19,
                             '256',
                             1379712.857142857, 5226207.142857144, 57.142857142857146, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             24, 323, 3, 20,
                             '20_03',
                             1379712.857142857, 5226214.285714286, 57.142857142857146, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226210.714285715,
                                                   1379716.4285714284 5226210.714285715,
                                                   1379716.4285714284 5226217.857142858,
                                                   1379709.2857142857 5226217.857142858,
                                                   1379709.2857142857 5226210.714285715))'));
                        
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
                             24, 323, 3, 20,
                             '323',
                             1379712.857142857, 5226214.285714286, 57.142857142857146, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             3, 398, 3, 21,
                             '21_03',
                             1379712.857142857, 5226221.428571429, 57.142857142857146, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379709.2857142857 5226217.857142857,
                                                   1379716.4285714284 5226217.857142857,
                                                   1379716.4285714284 5226225.000000001,
                                                   1379709.2857142857 5226225.000000001,
                                                   1379709.2857142857 5226217.857142857))'));
                        
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
                             3, 398, 3, 21,
                             '398',
                             1379712.857142857, 5226221.428571429, 57.142857142857146, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379712.857142857 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             424, 423, 4, 1,
                             '01_04',
                             1379720.0, 5226078.571428572, 50.0, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226075.0,
                                                   1379723.5714285714 5226075.0,
                                                   1379723.5714285714 5226082.142857144,
                                                   1379716.4285714286 5226082.142857144,
                                                   1379716.4285714286 5226075.0))'));
                        
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
                             424, 423, 4, 1,
                             '423',
                             1379720.0, 5226078.571428572, 50.0, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             403, 344, 4, 2,
                             '02_04',
                             1379720.0, 5226085.714285715, 50.0, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226082.142857143,
                                                   1379723.5714285714 5226082.142857143,
                                                   1379723.5714285714 5226089.285714286,
                                                   1379716.4285714286 5226089.285714286,
                                                   1379716.4285714286 5226082.142857143))'));
                        
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
                             403, 344, 4, 2,
                             '344',
                             1379720.0, 5226085.714285715, 50.0, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             382, 273, 4, 3,
                             '03_04',
                             1379720.0, 5226092.857142857, 50.0, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226089.285714285,
                                                   1379723.5714285714 5226089.285714285,
                                                   1379723.5714285714 5226096.428571429,
                                                   1379716.4285714286 5226096.428571429,
                                                   1379716.4285714286 5226089.285714285))'));
                        
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
                             382, 273, 4, 3,
                             '273',
                             1379720.0, 5226092.857142857, 50.0, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             361, 210, 4, 4,
                             '04_04',
                             1379720.0, 5226100.0, 50.0, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226096.428571428,
                                                   1379723.5714285714 5226096.428571428,
                                                   1379723.5714285714 5226103.571428572,
                                                   1379716.4285714286 5226103.571428572,
                                                   1379716.4285714286 5226096.428571428))'));
                        
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
                             361, 210, 4, 4,
                             '210',
                             1379720.0, 5226100.0, 50.0, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             340, 209, 4, 5,
                             '05_04',
                             1379720.0, 5226107.142857144, 50.0, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226103.571428572,
                                                   1379723.5714285714 5226103.571428572,
                                                   1379723.5714285714 5226110.7142857155,
                                                   1379716.4285714286 5226110.7142857155,
                                                   1379716.4285714286 5226103.571428572))'));
                        
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
                             340, 209, 4, 5,
                             '209',
                             1379720.0, 5226107.142857144, 50.0, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             319, 208, 4, 6,
                             '06_04',
                             1379720.0, 5226114.285714286, 50.0, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226110.714285715,
                                                   1379723.5714285714 5226110.714285715,
                                                   1379723.5714285714 5226117.857142858,
                                                   1379716.4285714286 5226117.857142858,
                                                   1379716.4285714286 5226110.714285715))'));
                        
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
                             319, 208, 4, 6,
                             '208',
                             1379720.0, 5226114.285714286, 50.0, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             298, 207, 4, 7,
                             '07_04',
                             1379720.0, 5226121.428571429, 50.0, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226117.857142857,
                                                   1379723.5714285714 5226117.857142857,
                                                   1379723.5714285714 5226125.000000001,
                                                   1379716.4285714286 5226125.000000001,
                                                   1379716.4285714286 5226117.857142857))'));
                        
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
                             298, 207, 4, 7,
                             '207',
                             1379720.0, 5226121.428571429, 50.0, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             277, 206, 4, 8,
                             '08_04',
                             1379720.0, 5226128.571428572, 50.0, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226125.0,
                                                   1379723.5714285714 5226125.0,
                                                   1379723.5714285714 5226132.142857144,
                                                   1379716.4285714286 5226132.142857144,
                                                   1379716.4285714286 5226125.0))'));
                        
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
                             277, 206, 4, 8,
                             '206',
                             1379720.0, 5226128.571428572, 50.0, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             256, 205, 4, 9,
                             '09_04',
                             1379720.0, 5226135.714285715, 50.0, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226132.142857143,
                                                   1379723.5714285714 5226132.142857143,
                                                   1379723.5714285714 5226139.285714286,
                                                   1379716.4285714286 5226139.285714286,
                                                   1379716.4285714286 5226132.142857143))'));
                        
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
                             256, 205, 4, 9,
                             '205',
                             1379720.0, 5226135.714285715, 50.0, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             235, 204, 4, 10,
                             '10_04',
                             1379720.0, 5226142.857142857, 50.0, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226139.285714285,
                                                   1379723.5714285714 5226139.285714285,
                                                   1379723.5714285714 5226146.428571429,
                                                   1379716.4285714286 5226146.428571429,
                                                   1379716.4285714286 5226139.285714285))'));
                        
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
                             235, 204, 4, 10,
                             '204',
                             1379720.0, 5226142.857142857, 50.0, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             214, 203, 4, 11,
                             '11_04',
                             1379720.0, 5226150.0, 50.0, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226146.428571428,
                                                   1379723.5714285714 5226146.428571428,
                                                   1379723.5714285714 5226153.571428572,
                                                   1379716.4285714286 5226153.571428572,
                                                   1379716.4285714286 5226146.428571428))'));
                        
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
                             214, 203, 4, 11,
                             '203',
                             1379720.0, 5226150.0, 50.0, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             193, 202, 4, 12,
                             '12_04',
                             1379720.0, 5226157.142857144, 50.0, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226153.571428572,
                                                   1379723.5714285714 5226153.571428572,
                                                   1379723.5714285714 5226160.7142857155,
                                                   1379716.4285714286 5226160.7142857155,
                                                   1379716.4285714286 5226153.571428572))'));
                        
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
                             193, 202, 4, 12,
                             '202',
                             1379720.0, 5226157.142857144, 50.0, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             172, 201, 4, 13,
                             '13_04',
                             1379720.0, 5226164.285714286, 50.0, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226160.714285715,
                                                   1379723.5714285714 5226160.714285715,
                                                   1379723.5714285714 5226167.857142858,
                                                   1379716.4285714286 5226167.857142858,
                                                   1379716.4285714286 5226160.714285715))'));
                        
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
                             172, 201, 4, 13,
                             '201',
                             1379720.0, 5226164.285714286, 50.0, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             151, 200, 4, 14,
                             '14_04',
                             1379720.0, 5226171.428571429, 50.0, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226167.857142857,
                                                   1379723.5714285714 5226167.857142857,
                                                   1379723.5714285714 5226175.000000001,
                                                   1379716.4285714286 5226175.000000001,
                                                   1379716.4285714286 5226167.857142857))'));
                        
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
                             151, 200, 4, 14,
                             '200',
                             1379720.0, 5226171.428571429, 50.0, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             130, 199, 4, 15,
                             '15_04',
                             1379720.0, 5226178.571428572, 50.0, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226175.0,
                                                   1379723.5714285714 5226175.0,
                                                   1379723.5714285714 5226182.142857144,
                                                   1379716.4285714286 5226182.142857144,
                                                   1379716.4285714286 5226175.0))'));
                        
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
                             130, 199, 4, 15,
                             '199',
                             1379720.0, 5226178.571428572, 50.0, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             109, 198, 4, 16,
                             '16_04',
                             1379720.0, 5226185.714285715, 50.0, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226182.142857143,
                                                   1379723.5714285714 5226182.142857143,
                                                   1379723.5714285714 5226189.285714286,
                                                   1379716.4285714286 5226189.285714286,
                                                   1379716.4285714286 5226182.142857143))'));
                        
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
                             109, 198, 4, 16,
                             '198',
                             1379720.0, 5226185.714285715, 50.0, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             88, 197, 4, 17,
                             '17_04',
                             1379720.0, 5226192.857142857, 50.0, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226189.285714285,
                                                   1379723.5714285714 5226189.285714285,
                                                   1379723.5714285714 5226196.428571429,
                                                   1379716.4285714286 5226196.428571429,
                                                   1379716.4285714286 5226189.285714285))'));
                        
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
                             88, 197, 4, 17,
                             '197',
                             1379720.0, 5226192.857142857, 50.0, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             67, 196, 4, 18,
                             '18_04',
                             1379720.0, 5226200.0, 50.0, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226196.428571428,
                                                   1379723.5714285714 5226196.428571428,
                                                   1379723.5714285714 5226203.571428572,
                                                   1379716.4285714286 5226203.571428572,
                                                   1379716.4285714286 5226196.428571428))'));
                        
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
                             67, 196, 4, 18,
                             '196',
                             1379720.0, 5226200.0, 50.0, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             46, 255, 4, 19,
                             '19_04',
                             1379720.0, 5226207.142857144, 50.0, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226203.571428572,
                                                   1379723.5714285714 5226203.571428572,
                                                   1379723.5714285714 5226210.7142857155,
                                                   1379716.4285714286 5226210.7142857155,
                                                   1379716.4285714286 5226203.571428572))'));
                        
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
                             46, 255, 4, 19,
                             '255',
                             1379720.0, 5226207.142857144, 50.0, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             25, 322, 4, 20,
                             '20_04',
                             1379720.0, 5226214.285714286, 50.0, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226210.714285715,
                                                   1379723.5714285714 5226210.714285715,
                                                   1379723.5714285714 5226217.857142858,
                                                   1379716.4285714286 5226217.857142858,
                                                   1379716.4285714286 5226210.714285715))'));
                        
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
                             25, 322, 4, 20,
                             '322',
                             1379720.0, 5226214.285714286, 50.0, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             4, 397, 4, 21,
                             '21_04',
                             1379720.0, 5226221.428571429, 50.0, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379716.4285714286 5226217.857142857,
                                                   1379723.5714285714 5226217.857142857,
                                                   1379723.5714285714 5226225.000000001,
                                                   1379716.4285714286 5226225.000000001,
                                                   1379716.4285714286 5226217.857142857))'));
                        
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
                             4, 397, 4, 21,
                             '397',
                             1379720.0, 5226221.428571429, 50.0, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379720.0 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             425, 424, 5, 1,
                             '01_05',
                             1379727.1428571427, 5226078.571428572, 42.85714285714286, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226075.0,
                                                   1379730.714285714 5226075.0,
                                                   1379730.714285714 5226082.142857144,
                                                   1379723.5714285714 5226082.142857144,
                                                   1379723.5714285714 5226075.0))'));
                        
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
                             425, 424, 5, 1,
                             '424',
                             1379727.1428571427, 5226078.571428572, 42.85714285714286, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             404, 345, 5, 2,
                             '02_05',
                             1379727.1428571427, 5226085.714285715, 42.85714285714286, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226082.142857143,
                                                   1379730.714285714 5226082.142857143,
                                                   1379730.714285714 5226089.285714286,
                                                   1379723.5714285714 5226089.285714286,
                                                   1379723.5714285714 5226082.142857143))'));
                        
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
                             404, 345, 5, 2,
                             '345',
                             1379727.1428571427, 5226085.714285715, 42.85714285714286, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             383, 274, 5, 3,
                             '03_05',
                             1379727.1428571427, 5226092.857142857, 42.85714285714286, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226089.285714285,
                                                   1379730.714285714 5226089.285714285,
                                                   1379730.714285714 5226096.428571429,
                                                   1379723.5714285714 5226096.428571429,
                                                   1379723.5714285714 5226089.285714285))'));
                        
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
                             383, 274, 5, 3,
                             '274',
                             1379727.1428571427, 5226092.857142857, 42.85714285714286, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             362, 211, 5, 4,
                             '04_05',
                             1379727.1428571427, 5226100.0, 42.85714285714286, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226096.428571428,
                                                   1379730.714285714 5226096.428571428,
                                                   1379730.714285714 5226103.571428572,
                                                   1379723.5714285714 5226103.571428572,
                                                   1379723.5714285714 5226096.428571428))'));
                        
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
                             362, 211, 5, 4,
                             '211',
                             1379727.1428571427, 5226100.0, 42.85714285714286, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             341, 156, 5, 5,
                             '05_05',
                             1379727.1428571427, 5226107.142857144, 42.85714285714286, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226103.571428572,
                                                   1379730.714285714 5226103.571428572,
                                                   1379730.714285714 5226110.7142857155,
                                                   1379723.5714285714 5226110.7142857155,
                                                   1379723.5714285714 5226103.571428572))'));
                        
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
                             341, 156, 5, 5,
                             '156',
                             1379727.1428571427, 5226107.142857144, 42.85714285714286, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             320, 155, 5, 6,
                             '06_05',
                             1379727.1428571427, 5226114.285714286, 42.85714285714286, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226110.714285715,
                                                   1379730.714285714 5226110.714285715,
                                                   1379730.714285714 5226117.857142858,
                                                   1379723.5714285714 5226117.857142858,
                                                   1379723.5714285714 5226110.714285715))'));
                        
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
                             320, 155, 5, 6,
                             '155',
                             1379727.1428571427, 5226114.285714286, 42.85714285714286, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             299, 154, 5, 7,
                             '07_05',
                             1379727.1428571427, 5226121.428571429, 42.85714285714286, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226117.857142857,
                                                   1379730.714285714 5226117.857142857,
                                                   1379730.714285714 5226125.000000001,
                                                   1379723.5714285714 5226125.000000001,
                                                   1379723.5714285714 5226117.857142857))'));
                        
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
                             299, 154, 5, 7,
                             '154',
                             1379727.1428571427, 5226121.428571429, 42.85714285714286, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             278, 153, 5, 8,
                             '08_05',
                             1379727.1428571427, 5226128.571428572, 42.85714285714286, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226125.0,
                                                   1379730.714285714 5226125.0,
                                                   1379730.714285714 5226132.142857144,
                                                   1379723.5714285714 5226132.142857144,
                                                   1379723.5714285714 5226125.0))'));
                        
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
                             278, 153, 5, 8,
                             '153',
                             1379727.1428571427, 5226128.571428572, 42.85714285714286, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             257, 152, 5, 9,
                             '09_05',
                             1379727.1428571427, 5226135.714285715, 42.85714285714286, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226132.142857143,
                                                   1379730.714285714 5226132.142857143,
                                                   1379730.714285714 5226139.285714286,
                                                   1379723.5714285714 5226139.285714286,
                                                   1379723.5714285714 5226132.142857143))'));
                        
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
                             257, 152, 5, 9,
                             '152',
                             1379727.1428571427, 5226135.714285715, 42.85714285714286, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             236, 151, 5, 10,
                             '10_05',
                             1379727.1428571427, 5226142.857142857, 42.85714285714286, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226139.285714285,
                                                   1379730.714285714 5226139.285714285,
                                                   1379730.714285714 5226146.428571429,
                                                   1379723.5714285714 5226146.428571429,
                                                   1379723.5714285714 5226139.285714285))'));
                        
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
                             236, 151, 5, 10,
                             '151',
                             1379727.1428571427, 5226142.857142857, 42.85714285714286, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             215, 150, 5, 11,
                             '11_05',
                             1379727.1428571427, 5226150.0, 42.85714285714286, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226146.428571428,
                                                   1379730.714285714 5226146.428571428,
                                                   1379730.714285714 5226153.571428572,
                                                   1379723.5714285714 5226153.571428572,
                                                   1379723.5714285714 5226146.428571428))'));
                        
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
                             215, 150, 5, 11,
                             '150',
                             1379727.1428571427, 5226150.0, 42.85714285714286, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             194, 149, 5, 12,
                             '12_05',
                             1379727.1428571427, 5226157.142857144, 42.85714285714286, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226153.571428572,
                                                   1379730.714285714 5226153.571428572,
                                                   1379730.714285714 5226160.7142857155,
                                                   1379723.5714285714 5226160.7142857155,
                                                   1379723.5714285714 5226153.571428572))'));
                        
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
                             194, 149, 5, 12,
                             '149',
                             1379727.1428571427, 5226157.142857144, 42.85714285714286, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             173, 148, 5, 13,
                             '13_05',
                             1379727.1428571427, 5226164.285714286, 42.85714285714286, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226160.714285715,
                                                   1379730.714285714 5226160.714285715,
                                                   1379730.714285714 5226167.857142858,
                                                   1379723.5714285714 5226167.857142858,
                                                   1379723.5714285714 5226160.714285715))'));
                        
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
                             173, 148, 5, 13,
                             '148',
                             1379727.1428571427, 5226164.285714286, 42.85714285714286, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             152, 147, 5, 14,
                             '14_05',
                             1379727.1428571427, 5226171.428571429, 42.85714285714286, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226167.857142857,
                                                   1379730.714285714 5226167.857142857,
                                                   1379730.714285714 5226175.000000001,
                                                   1379723.5714285714 5226175.000000001,
                                                   1379723.5714285714 5226167.857142857))'));
                        
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
                             152, 147, 5, 14,
                             '147',
                             1379727.1428571427, 5226171.428571429, 42.85714285714286, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             131, 146, 5, 15,
                             '15_05',
                             1379727.1428571427, 5226178.571428572, 42.85714285714286, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226175.0,
                                                   1379730.714285714 5226175.0,
                                                   1379730.714285714 5226182.142857144,
                                                   1379723.5714285714 5226182.142857144,
                                                   1379723.5714285714 5226175.0))'));
                        
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
                             131, 146, 5, 15,
                             '146',
                             1379727.1428571427, 5226178.571428572, 42.85714285714286, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             110, 145, 5, 16,
                             '16_05',
                             1379727.1428571427, 5226185.714285715, 42.85714285714286, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226182.142857143,
                                                   1379730.714285714 5226182.142857143,
                                                   1379730.714285714 5226189.285714286,
                                                   1379723.5714285714 5226189.285714286,
                                                   1379723.5714285714 5226182.142857143))'));
                        
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
                             110, 145, 5, 16,
                             '145',
                             1379727.1428571427, 5226185.714285715, 42.85714285714286, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             89, 144, 5, 17,
                             '17_05',
                             1379727.1428571427, 5226192.857142857, 42.85714285714286, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226189.285714285,
                                                   1379730.714285714 5226189.285714285,
                                                   1379730.714285714 5226196.428571429,
                                                   1379723.5714285714 5226196.428571429,
                                                   1379723.5714285714 5226189.285714285))'));
                        
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
                             89, 144, 5, 17,
                             '144',
                             1379727.1428571427, 5226192.857142857, 42.85714285714286, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             68, 195, 5, 18,
                             '18_05',
                             1379727.1428571427, 5226200.0, 42.85714285714286, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226196.428571428,
                                                   1379730.714285714 5226196.428571428,
                                                   1379730.714285714 5226203.571428572,
                                                   1379723.5714285714 5226203.571428572,
                                                   1379723.5714285714 5226196.428571428))'));
                        
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
                             68, 195, 5, 18,
                             '195',
                             1379727.1428571427, 5226200.0, 42.85714285714286, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             47, 254, 5, 19,
                             '19_05',
                             1379727.1428571427, 5226207.142857144, 42.85714285714286, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226203.571428572,
                                                   1379730.714285714 5226203.571428572,
                                                   1379730.714285714 5226210.7142857155,
                                                   1379723.5714285714 5226210.7142857155,
                                                   1379723.5714285714 5226203.571428572))'));
                        
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
                             47, 254, 5, 19,
                             '254',
                             1379727.1428571427, 5226207.142857144, 42.85714285714286, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             26, 321, 5, 20,
                             '20_05',
                             1379727.1428571427, 5226214.285714286, 42.85714285714286, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226210.714285715,
                                                   1379730.714285714 5226210.714285715,
                                                   1379730.714285714 5226217.857142858,
                                                   1379723.5714285714 5226217.857142858,
                                                   1379723.5714285714 5226210.714285715))'));
                        
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
                             26, 321, 5, 20,
                             '321',
                             1379727.1428571427, 5226214.285714286, 42.85714285714286, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             5, 396, 5, 21,
                             '21_05',
                             1379727.1428571427, 5226221.428571429, 42.85714285714286, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379723.5714285714 5226217.857142857,
                                                   1379730.714285714 5226217.857142857,
                                                   1379730.714285714 5226225.000000001,
                                                   1379723.5714285714 5226225.000000001,
                                                   1379723.5714285714 5226217.857142857))'));
                        
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
                             5, 396, 5, 21,
                             '396',
                             1379727.1428571427, 5226221.428571429, 42.85714285714286, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379727.1428571427 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             426, 425, 6, 1,
                             '01_06',
                             1379734.2857142857, 5226078.571428572, 35.714285714285715, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226075.0,
                                                   1379737.857142857 5226075.0,
                                                   1379737.857142857 5226082.142857144,
                                                   1379730.7142857143 5226082.142857144,
                                                   1379730.7142857143 5226075.0))'));
                        
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
                             426, 425, 6, 1,
                             '425',
                             1379734.2857142857, 5226078.571428572, 35.714285714285715, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             405, 346, 6, 2,
                             '02_06',
                             1379734.2857142857, 5226085.714285715, 35.714285714285715, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226082.142857143,
                                                   1379737.857142857 5226082.142857143,
                                                   1379737.857142857 5226089.285714286,
                                                   1379730.7142857143 5226089.285714286,
                                                   1379730.7142857143 5226082.142857143))'));
                        
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
                             405, 346, 6, 2,
                             '346',
                             1379734.2857142857, 5226085.714285715, 35.714285714285715, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             384, 275, 6, 3,
                             '03_06',
                             1379734.2857142857, 5226092.857142857, 35.714285714285715, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226089.285714285,
                                                   1379737.857142857 5226089.285714285,
                                                   1379737.857142857 5226096.428571429,
                                                   1379730.7142857143 5226096.428571429,
                                                   1379730.7142857143 5226089.285714285))'));
                        
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
                             384, 275, 6, 3,
                             '275',
                             1379734.2857142857, 5226092.857142857, 35.714285714285715, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             363, 212, 6, 4,
                             '04_06',
                             1379734.2857142857, 5226100.0, 35.714285714285715, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226096.428571428,
                                                   1379737.857142857 5226096.428571428,
                                                   1379737.857142857 5226103.571428572,
                                                   1379730.7142857143 5226103.571428572,
                                                   1379730.7142857143 5226096.428571428))'));
                        
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
                             363, 212, 6, 4,
                             '212',
                             1379734.2857142857, 5226100.0, 35.714285714285715, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             342, 157, 6, 5,
                             '05_06',
                             1379734.2857142857, 5226107.142857144, 35.714285714285715, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226103.571428572,
                                                   1379737.857142857 5226103.571428572,
                                                   1379737.857142857 5226110.7142857155,
                                                   1379730.7142857143 5226110.7142857155,
                                                   1379730.7142857143 5226103.571428572))'));
                        
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
                             342, 157, 6, 5,
                             '157',
                             1379734.2857142857, 5226107.142857144, 35.714285714285715, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             321, 110, 6, 6,
                             '06_06',
                             1379734.2857142857, 5226114.285714286, 35.714285714285715, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226110.714285715,
                                                   1379737.857142857 5226110.714285715,
                                                   1379737.857142857 5226117.857142858,
                                                   1379730.7142857143 5226117.857142858,
                                                   1379730.7142857143 5226110.714285715))'));
                        
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
                             321, 110, 6, 6,
                             '110',
                             1379734.2857142857, 5226114.285714286, 35.714285714285715, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             300, 109, 6, 7,
                             '07_06',
                             1379734.2857142857, 5226121.428571429, 35.714285714285715, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226117.857142857,
                                                   1379737.857142857 5226117.857142857,
                                                   1379737.857142857 5226125.000000001,
                                                   1379730.7142857143 5226125.000000001,
                                                   1379730.7142857143 5226117.857142857))'));
                        
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
                             300, 109, 6, 7,
                             '109',
                             1379734.2857142857, 5226121.428571429, 35.714285714285715, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             279, 108, 6, 8,
                             '08_06',
                             1379734.2857142857, 5226128.571428572, 35.714285714285715, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226125.0,
                                                   1379737.857142857 5226125.0,
                                                   1379737.857142857 5226132.142857144,
                                                   1379730.7142857143 5226132.142857144,
                                                   1379730.7142857143 5226125.0))'));
                        
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
                             279, 108, 6, 8,
                             '108',
                             1379734.2857142857, 5226128.571428572, 35.714285714285715, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             258, 107, 6, 9,
                             '09_06',
                             1379734.2857142857, 5226135.714285715, 35.714285714285715, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226132.142857143,
                                                   1379737.857142857 5226132.142857143,
                                                   1379737.857142857 5226139.285714286,
                                                   1379730.7142857143 5226139.285714286,
                                                   1379730.7142857143 5226132.142857143))'));
                        
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
                             258, 107, 6, 9,
                             '107',
                             1379734.2857142857, 5226135.714285715, 35.714285714285715, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             237, 106, 6, 10,
                             '10_06',
                             1379734.2857142857, 5226142.857142857, 35.714285714285715, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226139.285714285,
                                                   1379737.857142857 5226139.285714285,
                                                   1379737.857142857 5226146.428571429,
                                                   1379730.7142857143 5226146.428571429,
                                                   1379730.7142857143 5226139.285714285))'));
                        
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
                             237, 106, 6, 10,
                             '106',
                             1379734.2857142857, 5226142.857142857, 35.714285714285715, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             216, 105, 6, 11,
                             '11_06',
                             1379734.2857142857, 5226150.0, 35.714285714285715, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226146.428571428,
                                                   1379737.857142857 5226146.428571428,
                                                   1379737.857142857 5226153.571428572,
                                                   1379730.7142857143 5226153.571428572,
                                                   1379730.7142857143 5226146.428571428))'));
                        
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
                             216, 105, 6, 11,
                             '105',
                             1379734.2857142857, 5226150.0, 35.714285714285715, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             195, 104, 6, 12,
                             '12_06',
                             1379734.2857142857, 5226157.142857144, 35.714285714285715, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226153.571428572,
                                                   1379737.857142857 5226153.571428572,
                                                   1379737.857142857 5226160.7142857155,
                                                   1379730.7142857143 5226160.7142857155,
                                                   1379730.7142857143 5226153.571428572))'));
                        
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
                             195, 104, 6, 12,
                             '104',
                             1379734.2857142857, 5226157.142857144, 35.714285714285715, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             174, 103, 6, 13,
                             '13_06',
                             1379734.2857142857, 5226164.285714286, 35.714285714285715, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226160.714285715,
                                                   1379737.857142857 5226160.714285715,
                                                   1379737.857142857 5226167.857142858,
                                                   1379730.7142857143 5226167.857142858,
                                                   1379730.7142857143 5226160.714285715))'));
                        
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
                             174, 103, 6, 13,
                             '103',
                             1379734.2857142857, 5226164.285714286, 35.714285714285715, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             153, 102, 6, 14,
                             '14_06',
                             1379734.2857142857, 5226171.428571429, 35.714285714285715, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226167.857142857,
                                                   1379737.857142857 5226167.857142857,
                                                   1379737.857142857 5226175.000000001,
                                                   1379730.7142857143 5226175.000000001,
                                                   1379730.7142857143 5226167.857142857))'));
                        
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
                             153, 102, 6, 14,
                             '102',
                             1379734.2857142857, 5226171.428571429, 35.714285714285715, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             132, 101, 6, 15,
                             '15_06',
                             1379734.2857142857, 5226178.571428572, 35.714285714285715, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226175.0,
                                                   1379737.857142857 5226175.0,
                                                   1379737.857142857 5226182.142857144,
                                                   1379730.7142857143 5226182.142857144,
                                                   1379730.7142857143 5226175.0))'));
                        
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
                             132, 101, 6, 15,
                             '101',
                             1379734.2857142857, 5226178.571428572, 35.714285714285715, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             111, 100, 6, 16,
                             '16_06',
                             1379734.2857142857, 5226185.714285715, 35.714285714285715, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226182.142857143,
                                                   1379737.857142857 5226182.142857143,
                                                   1379737.857142857 5226189.285714286,
                                                   1379730.7142857143 5226189.285714286,
                                                   1379730.7142857143 5226182.142857143))'));
                        
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
                             111, 100, 6, 16,
                             '100',
                             1379734.2857142857, 5226185.714285715, 35.714285714285715, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             90, 143, 6, 17,
                             '17_06',
                             1379734.2857142857, 5226192.857142857, 35.714285714285715, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226189.285714285,
                                                   1379737.857142857 5226189.285714285,
                                                   1379737.857142857 5226196.428571429,
                                                   1379730.7142857143 5226196.428571429,
                                                   1379730.7142857143 5226189.285714285))'));
                        
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
                             90, 143, 6, 17,
                             '143',
                             1379734.2857142857, 5226192.857142857, 35.714285714285715, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             69, 194, 6, 18,
                             '18_06',
                             1379734.2857142857, 5226200.0, 35.714285714285715, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226196.428571428,
                                                   1379737.857142857 5226196.428571428,
                                                   1379737.857142857 5226203.571428572,
                                                   1379730.7142857143 5226203.571428572,
                                                   1379730.7142857143 5226196.428571428))'));
                        
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
                             69, 194, 6, 18,
                             '194',
                             1379734.2857142857, 5226200.0, 35.714285714285715, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             48, 253, 6, 19,
                             '19_06',
                             1379734.2857142857, 5226207.142857144, 35.714285714285715, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226203.571428572,
                                                   1379737.857142857 5226203.571428572,
                                                   1379737.857142857 5226210.7142857155,
                                                   1379730.7142857143 5226210.7142857155,
                                                   1379730.7142857143 5226203.571428572))'));
                        
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
                             48, 253, 6, 19,
                             '253',
                             1379734.2857142857, 5226207.142857144, 35.714285714285715, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             27, 320, 6, 20,
                             '20_06',
                             1379734.2857142857, 5226214.285714286, 35.714285714285715, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226210.714285715,
                                                   1379737.857142857 5226210.714285715,
                                                   1379737.857142857 5226217.857142858,
                                                   1379730.7142857143 5226217.857142858,
                                                   1379730.7142857143 5226210.714285715))'));
                        
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
                             27, 320, 6, 20,
                             '320',
                             1379734.2857142857, 5226214.285714286, 35.714285714285715, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             6, 395, 6, 21,
                             '21_06',
                             1379734.2857142857, 5226221.428571429, 35.714285714285715, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379730.7142857143 5226217.857142857,
                                                   1379737.857142857 5226217.857142857,
                                                   1379737.857142857 5226225.000000001,
                                                   1379730.7142857143 5226225.000000001,
                                                   1379730.7142857143 5226217.857142857))'));
                        
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
                             6, 395, 6, 21,
                             '395',
                             1379734.2857142857, 5226221.428571429, 35.714285714285715, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379734.2857142857 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             427, 426, 7, 1,
                             '01_07',
                             1379741.4285714284, 5226078.571428572, 28.571428571428573, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226075.0,
                                                   1379744.9999999998 5226075.0,
                                                   1379744.9999999998 5226082.142857144,
                                                   1379737.857142857 5226082.142857144,
                                                   1379737.857142857 5226075.0))'));
                        
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
                             427, 426, 7, 1,
                             '426',
                             1379741.4285714284, 5226078.571428572, 28.571428571428573, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             406, 347, 7, 2,
                             '02_07',
                             1379741.4285714284, 5226085.714285715, 28.571428571428573, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226082.142857143,
                                                   1379744.9999999998 5226082.142857143,
                                                   1379744.9999999998 5226089.285714286,
                                                   1379737.857142857 5226089.285714286,
                                                   1379737.857142857 5226082.142857143))'));
                        
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
                             406, 347, 7, 2,
                             '347',
                             1379741.4285714284, 5226085.714285715, 28.571428571428573, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             385, 276, 7, 3,
                             '03_07',
                             1379741.4285714284, 5226092.857142857, 28.571428571428573, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226089.285714285,
                                                   1379744.9999999998 5226089.285714285,
                                                   1379744.9999999998 5226096.428571429,
                                                   1379737.857142857 5226096.428571429,
                                                   1379737.857142857 5226089.285714285))'));
                        
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
                             385, 276, 7, 3,
                             '276',
                             1379741.4285714284, 5226092.857142857, 28.571428571428573, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             364, 213, 7, 4,
                             '04_07',
                             1379741.4285714284, 5226100.0, 28.571428571428573, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226096.428571428,
                                                   1379744.9999999998 5226096.428571428,
                                                   1379744.9999999998 5226103.571428572,
                                                   1379737.857142857 5226103.571428572,
                                                   1379737.857142857 5226096.428571428))'));
                        
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
                             364, 213, 7, 4,
                             '213',
                             1379741.4285714284, 5226100.0, 28.571428571428573, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             343, 158, 7, 5,
                             '05_07',
                             1379741.4285714284, 5226107.142857144, 28.571428571428573, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226103.571428572,
                                                   1379744.9999999998 5226103.571428572,
                                                   1379744.9999999998 5226110.7142857155,
                                                   1379737.857142857 5226110.7142857155,
                                                   1379737.857142857 5226103.571428572))'));
                        
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
                             343, 158, 7, 5,
                             '158',
                             1379741.4285714284, 5226107.142857144, 28.571428571428573, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             322, 111, 7, 6,
                             '06_07',
                             1379741.4285714284, 5226114.285714286, 28.571428571428573, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226110.714285715,
                                                   1379744.9999999998 5226110.714285715,
                                                   1379744.9999999998 5226117.857142858,
                                                   1379737.857142857 5226117.857142858,
                                                   1379737.857142857 5226110.714285715))'));
                        
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
                             322, 111, 7, 6,
                             '111',
                             1379741.4285714284, 5226114.285714286, 28.571428571428573, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             301, 72, 7, 7,
                             '07_07',
                             1379741.4285714284, 5226121.428571429, 28.571428571428573, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226117.857142857,
                                                   1379744.9999999998 5226117.857142857,
                                                   1379744.9999999998 5226125.000000001,
                                                   1379737.857142857 5226125.000000001,
                                                   1379737.857142857 5226117.857142857))'));
                        
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
                             301, 72, 7, 7,
                             '72',
                             1379741.4285714284, 5226121.428571429, 28.571428571428573, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             280, 71, 7, 8,
                             '08_07',
                             1379741.4285714284, 5226128.571428572, 28.571428571428573, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226125.0,
                                                   1379744.9999999998 5226125.0,
                                                   1379744.9999999998 5226132.142857144,
                                                   1379737.857142857 5226132.142857144,
                                                   1379737.857142857 5226125.0))'));
                        
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
                             280, 71, 7, 8,
                             '71',
                             1379741.4285714284, 5226128.571428572, 28.571428571428573, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             259, 70, 7, 9,
                             '09_07',
                             1379741.4285714284, 5226135.714285715, 28.571428571428573, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226132.142857143,
                                                   1379744.9999999998 5226132.142857143,
                                                   1379744.9999999998 5226139.285714286,
                                                   1379737.857142857 5226139.285714286,
                                                   1379737.857142857 5226132.142857143))'));
                        
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
                             259, 70, 7, 9,
                             '70',
                             1379741.4285714284, 5226135.714285715, 28.571428571428573, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             238, 69, 7, 10,
                             '10_07',
                             1379741.4285714284, 5226142.857142857, 28.571428571428573, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226139.285714285,
                                                   1379744.9999999998 5226139.285714285,
                                                   1379744.9999999998 5226146.428571429,
                                                   1379737.857142857 5226146.428571429,
                                                   1379737.857142857 5226139.285714285))'));
                        
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
                             238, 69, 7, 10,
                             '69',
                             1379741.4285714284, 5226142.857142857, 28.571428571428573, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             217, 68, 7, 11,
                             '11_07',
                             1379741.4285714284, 5226150.0, 28.571428571428573, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226146.428571428,
                                                   1379744.9999999998 5226146.428571428,
                                                   1379744.9999999998 5226153.571428572,
                                                   1379737.857142857 5226153.571428572,
                                                   1379737.857142857 5226146.428571428))'));
                        
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
                             217, 68, 7, 11,
                             '68',
                             1379741.4285714284, 5226150.0, 28.571428571428573, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             196, 67, 7, 12,
                             '12_07',
                             1379741.4285714284, 5226157.142857144, 28.571428571428573, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226153.571428572,
                                                   1379744.9999999998 5226153.571428572,
                                                   1379744.9999999998 5226160.7142857155,
                                                   1379737.857142857 5226160.7142857155,
                                                   1379737.857142857 5226153.571428572))'));
                        
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
                             196, 67, 7, 12,
                             '67',
                             1379741.4285714284, 5226157.142857144, 28.571428571428573, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             175, 66, 7, 13,
                             '13_07',
                             1379741.4285714284, 5226164.285714286, 28.571428571428573, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226160.714285715,
                                                   1379744.9999999998 5226160.714285715,
                                                   1379744.9999999998 5226167.857142858,
                                                   1379737.857142857 5226167.857142858,
                                                   1379737.857142857 5226160.714285715))'));
                        
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
                             175, 66, 7, 13,
                             '66',
                             1379741.4285714284, 5226164.285714286, 28.571428571428573, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             154, 65, 7, 14,
                             '14_07',
                             1379741.4285714284, 5226171.428571429, 28.571428571428573, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226167.857142857,
                                                   1379744.9999999998 5226167.857142857,
                                                   1379744.9999999998 5226175.000000001,
                                                   1379737.857142857 5226175.000000001,
                                                   1379737.857142857 5226167.857142857))'));
                        
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
                             154, 65, 7, 14,
                             '65',
                             1379741.4285714284, 5226171.428571429, 28.571428571428573, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             133, 64, 7, 15,
                             '15_07',
                             1379741.4285714284, 5226178.571428572, 28.571428571428573, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226175.0,
                                                   1379744.9999999998 5226175.0,
                                                   1379744.9999999998 5226182.142857144,
                                                   1379737.857142857 5226182.142857144,
                                                   1379737.857142857 5226175.0))'));
                        
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
                             133, 64, 7, 15,
                             '64',
                             1379741.4285714284, 5226178.571428572, 28.571428571428573, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             112, 99, 7, 16,
                             '16_07',
                             1379741.4285714284, 5226185.714285715, 28.571428571428573, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226182.142857143,
                                                   1379744.9999999998 5226182.142857143,
                                                   1379744.9999999998 5226189.285714286,
                                                   1379737.857142857 5226189.285714286,
                                                   1379737.857142857 5226182.142857143))'));
                        
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
                             112, 99, 7, 16,
                             '99',
                             1379741.4285714284, 5226185.714285715, 28.571428571428573, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             91, 142, 7, 17,
                             '17_07',
                             1379741.4285714284, 5226192.857142857, 28.571428571428573, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226189.285714285,
                                                   1379744.9999999998 5226189.285714285,
                                                   1379744.9999999998 5226196.428571429,
                                                   1379737.857142857 5226196.428571429,
                                                   1379737.857142857 5226189.285714285))'));
                        
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
                             91, 142, 7, 17,
                             '142',
                             1379741.4285714284, 5226192.857142857, 28.571428571428573, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             70, 193, 7, 18,
                             '18_07',
                             1379741.4285714284, 5226200.0, 28.571428571428573, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226196.428571428,
                                                   1379744.9999999998 5226196.428571428,
                                                   1379744.9999999998 5226203.571428572,
                                                   1379737.857142857 5226203.571428572,
                                                   1379737.857142857 5226196.428571428))'));
                        
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
                             70, 193, 7, 18,
                             '193',
                             1379741.4285714284, 5226200.0, 28.571428571428573, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             49, 252, 7, 19,
                             '19_07',
                             1379741.4285714284, 5226207.142857144, 28.571428571428573, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226203.571428572,
                                                   1379744.9999999998 5226203.571428572,
                                                   1379744.9999999998 5226210.7142857155,
                                                   1379737.857142857 5226210.7142857155,
                                                   1379737.857142857 5226203.571428572))'));
                        
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
                             49, 252, 7, 19,
                             '252',
                             1379741.4285714284, 5226207.142857144, 28.571428571428573, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             28, 319, 7, 20,
                             '20_07',
                             1379741.4285714284, 5226214.285714286, 28.571428571428573, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226210.714285715,
                                                   1379744.9999999998 5226210.714285715,
                                                   1379744.9999999998 5226217.857142858,
                                                   1379737.857142857 5226217.857142858,
                                                   1379737.857142857 5226210.714285715))'));
                        
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
                             28, 319, 7, 20,
                             '319',
                             1379741.4285714284, 5226214.285714286, 28.571428571428573, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             7, 394, 7, 21,
                             '21_07',
                             1379741.4285714284, 5226221.428571429, 28.571428571428573, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379737.857142857 5226217.857142857,
                                                   1379744.9999999998 5226217.857142857,
                                                   1379744.9999999998 5226225.000000001,
                                                   1379737.857142857 5226225.000000001,
                                                   1379737.857142857 5226217.857142857))'));
                        
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
                             7, 394, 7, 21,
                             '394',
                             1379741.4285714284, 5226221.428571429, 28.571428571428573, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379741.4285714284 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             428, 427, 8, 1,
                             '01_08',
                             1379748.5714285714, 5226078.571428572, 21.42857142857143, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226075.0,
                                                   1379752.1428571427 5226075.0,
                                                   1379752.1428571427 5226082.142857144,
                                                   1379745.0 5226082.142857144,
                                                   1379745.0 5226075.0))'));
                        
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
                             428, 427, 8, 1,
                             '427',
                             1379748.5714285714, 5226078.571428572, 21.42857142857143, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             407, 348, 8, 2,
                             '02_08',
                             1379748.5714285714, 5226085.714285715, 21.42857142857143, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226082.142857143,
                                                   1379752.1428571427 5226082.142857143,
                                                   1379752.1428571427 5226089.285714286,
                                                   1379745.0 5226089.285714286,
                                                   1379745.0 5226082.142857143))'));
                        
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
                             407, 348, 8, 2,
                             '348',
                             1379748.5714285714, 5226085.714285715, 21.42857142857143, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             386, 277, 8, 3,
                             '03_08',
                             1379748.5714285714, 5226092.857142857, 21.42857142857143, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226089.285714285,
                                                   1379752.1428571427 5226089.285714285,
                                                   1379752.1428571427 5226096.428571429,
                                                   1379745.0 5226096.428571429,
                                                   1379745.0 5226089.285714285))'));
                        
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
                             386, 277, 8, 3,
                             '277',
                             1379748.5714285714, 5226092.857142857, 21.42857142857143, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             365, 214, 8, 4,
                             '04_08',
                             1379748.5714285714, 5226100.0, 21.42857142857143, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226096.428571428,
                                                   1379752.1428571427 5226096.428571428,
                                                   1379752.1428571427 5226103.571428572,
                                                   1379745.0 5226103.571428572,
                                                   1379745.0 5226096.428571428))'));
                        
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
                             365, 214, 8, 4,
                             '214',
                             1379748.5714285714, 5226100.0, 21.42857142857143, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             344, 159, 8, 5,
                             '05_08',
                             1379748.5714285714, 5226107.142857144, 21.42857142857143, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226103.571428572,
                                                   1379752.1428571427 5226103.571428572,
                                                   1379752.1428571427 5226110.7142857155,
                                                   1379745.0 5226110.7142857155,
                                                   1379745.0 5226103.571428572))'));
                        
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
                             344, 159, 8, 5,
                             '159',
                             1379748.5714285714, 5226107.142857144, 21.42857142857143, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             323, 112, 8, 6,
                             '06_08',
                             1379748.5714285714, 5226114.285714286, 21.42857142857143, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226110.714285715,
                                                   1379752.1428571427 5226110.714285715,
                                                   1379752.1428571427 5226117.857142858,
                                                   1379745.0 5226117.857142858,
                                                   1379745.0 5226110.714285715))'));
                        
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
                             323, 112, 8, 6,
                             '112',
                             1379748.5714285714, 5226114.285714286, 21.42857142857143, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             302, 73, 8, 7,
                             '07_08',
                             1379748.5714285714, 5226121.428571429, 21.42857142857143, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226117.857142857,
                                                   1379752.1428571427 5226117.857142857,
                                                   1379752.1428571427 5226125.000000001,
                                                   1379745.0 5226125.000000001,
                                                   1379745.0 5226117.857142857))'));
                        
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
                             302, 73, 8, 7,
                             '73',
                             1379748.5714285714, 5226121.428571429, 21.42857142857143, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             281, 42, 8, 8,
                             '08_08',
                             1379748.5714285714, 5226128.571428572, 21.42857142857143, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226125.0,
                                                   1379752.1428571427 5226125.0,
                                                   1379752.1428571427 5226132.142857144,
                                                   1379745.0 5226132.142857144,
                                                   1379745.0 5226125.0))'));
                        
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
                             281, 42, 8, 8,
                             '42',
                             1379748.5714285714, 5226128.571428572, 21.42857142857143, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             260, 41, 8, 9,
                             '09_08',
                             1379748.5714285714, 5226135.714285715, 21.42857142857143, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226132.142857143,
                                                   1379752.1428571427 5226132.142857143,
                                                   1379752.1428571427 5226139.285714286,
                                                   1379745.0 5226139.285714286,
                                                   1379745.0 5226132.142857143))'));
                        
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
                             260, 41, 8, 9,
                             '41',
                             1379748.5714285714, 5226135.714285715, 21.42857142857143, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             239, 40, 8, 10,
                             '10_08',
                             1379748.5714285714, 5226142.857142857, 21.42857142857143, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226139.285714285,
                                                   1379752.1428571427 5226139.285714285,
                                                   1379752.1428571427 5226146.428571429,
                                                   1379745.0 5226146.428571429,
                                                   1379745.0 5226139.285714285))'));
                        
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
                             239, 40, 8, 10,
                             '40',
                             1379748.5714285714, 5226142.857142857, 21.42857142857143, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             218, 39, 8, 11,
                             '11_08',
                             1379748.5714285714, 5226150.0, 21.42857142857143, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226146.428571428,
                                                   1379752.1428571427 5226146.428571428,
                                                   1379752.1428571427 5226153.571428572,
                                                   1379745.0 5226153.571428572,
                                                   1379745.0 5226146.428571428))'));
                        
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
                             218, 39, 8, 11,
                             '39',
                             1379748.5714285714, 5226150.0, 21.42857142857143, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             197, 38, 8, 12,
                             '12_08',
                             1379748.5714285714, 5226157.142857144, 21.42857142857143, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226153.571428572,
                                                   1379752.1428571427 5226153.571428572,
                                                   1379752.1428571427 5226160.7142857155,
                                                   1379745.0 5226160.7142857155,
                                                   1379745.0 5226153.571428572))'));
                        
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
                             197, 38, 8, 12,
                             '38',
                             1379748.5714285714, 5226157.142857144, 21.42857142857143, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             176, 37, 8, 13,
                             '13_08',
                             1379748.5714285714, 5226164.285714286, 21.42857142857143, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226160.714285715,
                                                   1379752.1428571427 5226160.714285715,
                                                   1379752.1428571427 5226167.857142858,
                                                   1379745.0 5226167.857142858,
                                                   1379745.0 5226160.714285715))'));
                        
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
                             176, 37, 8, 13,
                             '37',
                             1379748.5714285714, 5226164.285714286, 21.42857142857143, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             155, 36, 8, 14,
                             '14_08',
                             1379748.5714285714, 5226171.428571429, 21.42857142857143, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226167.857142857,
                                                   1379752.1428571427 5226167.857142857,
                                                   1379752.1428571427 5226175.000000001,
                                                   1379745.0 5226175.000000001,
                                                   1379745.0 5226167.857142857))'));
                        
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
                             155, 36, 8, 14,
                             '36',
                             1379748.5714285714, 5226171.428571429, 21.42857142857143, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             134, 63, 8, 15,
                             '15_08',
                             1379748.5714285714, 5226178.571428572, 21.42857142857143, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226175.0,
                                                   1379752.1428571427 5226175.0,
                                                   1379752.1428571427 5226182.142857144,
                                                   1379745.0 5226182.142857144,
                                                   1379745.0 5226175.0))'));
                        
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
                             134, 63, 8, 15,
                             '63',
                             1379748.5714285714, 5226178.571428572, 21.42857142857143, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             113, 98, 8, 16,
                             '16_08',
                             1379748.5714285714, 5226185.714285715, 21.42857142857143, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226182.142857143,
                                                   1379752.1428571427 5226182.142857143,
                                                   1379752.1428571427 5226189.285714286,
                                                   1379745.0 5226189.285714286,
                                                   1379745.0 5226182.142857143))'));
                        
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
                             113, 98, 8, 16,
                             '98',
                             1379748.5714285714, 5226185.714285715, 21.42857142857143, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             92, 141, 8, 17,
                             '17_08',
                             1379748.5714285714, 5226192.857142857, 21.42857142857143, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226189.285714285,
                                                   1379752.1428571427 5226189.285714285,
                                                   1379752.1428571427 5226196.428571429,
                                                   1379745.0 5226196.428571429,
                                                   1379745.0 5226189.285714285))'));
                        
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
                             92, 141, 8, 17,
                             '141',
                             1379748.5714285714, 5226192.857142857, 21.42857142857143, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             71, 192, 8, 18,
                             '18_08',
                             1379748.5714285714, 5226200.0, 21.42857142857143, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226196.428571428,
                                                   1379752.1428571427 5226196.428571428,
                                                   1379752.1428571427 5226203.571428572,
                                                   1379745.0 5226203.571428572,
                                                   1379745.0 5226196.428571428))'));
                        
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
                             71, 192, 8, 18,
                             '192',
                             1379748.5714285714, 5226200.0, 21.42857142857143, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             50, 251, 8, 19,
                             '19_08',
                             1379748.5714285714, 5226207.142857144, 21.42857142857143, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226203.571428572,
                                                   1379752.1428571427 5226203.571428572,
                                                   1379752.1428571427 5226210.7142857155,
                                                   1379745.0 5226210.7142857155,
                                                   1379745.0 5226203.571428572))'));
                        
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
                             50, 251, 8, 19,
                             '251',
                             1379748.5714285714, 5226207.142857144, 21.42857142857143, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             29, 318, 8, 20,
                             '20_08',
                             1379748.5714285714, 5226214.285714286, 21.42857142857143, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226210.714285715,
                                                   1379752.1428571427 5226210.714285715,
                                                   1379752.1428571427 5226217.857142858,
                                                   1379745.0 5226217.857142858,
                                                   1379745.0 5226210.714285715))'));
                        
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
                             29, 318, 8, 20,
                             '318',
                             1379748.5714285714, 5226214.285714286, 21.42857142857143, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             8, 393, 8, 21,
                             '21_08',
                             1379748.5714285714, 5226221.428571429, 21.42857142857143, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379745.0 5226217.857142857,
                                                   1379752.1428571427 5226217.857142857,
                                                   1379752.1428571427 5226225.000000001,
                                                   1379745.0 5226225.000000001,
                                                   1379745.0 5226217.857142857))'));
                        
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
                             8, 393, 8, 21,
                             '393',
                             1379748.5714285714, 5226221.428571429, 21.42857142857143, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379748.5714285714 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             429, 428, 9, 1,
                             '01_09',
                             1379755.7142857143, 5226078.571428572, 14.285714285714286, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226075.0,
                                                   1379759.2857142857 5226075.0,
                                                   1379759.2857142857 5226082.142857144,
                                                   1379752.142857143 5226082.142857144,
                                                   1379752.142857143 5226075.0))'));
                        
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
                             429, 428, 9, 1,
                             '428',
                             1379755.7142857143, 5226078.571428572, 14.285714285714286, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             408, 349, 9, 2,
                             '02_09',
                             1379755.7142857143, 5226085.714285715, 14.285714285714286, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226082.142857143,
                                                   1379759.2857142857 5226082.142857143,
                                                   1379759.2857142857 5226089.285714286,
                                                   1379752.142857143 5226089.285714286,
                                                   1379752.142857143 5226082.142857143))'));
                        
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
                             408, 349, 9, 2,
                             '349',
                             1379755.7142857143, 5226085.714285715, 14.285714285714286, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             387, 278, 9, 3,
                             '03_09',
                             1379755.7142857143, 5226092.857142857, 14.285714285714286, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226089.285714285,
                                                   1379759.2857142857 5226089.285714285,
                                                   1379759.2857142857 5226096.428571429,
                                                   1379752.142857143 5226096.428571429,
                                                   1379752.142857143 5226089.285714285))'));
                        
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
                             387, 278, 9, 3,
                             '278',
                             1379755.7142857143, 5226092.857142857, 14.285714285714286, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             366, 215, 9, 4,
                             '04_09',
                             1379755.7142857143, 5226100.0, 14.285714285714286, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226096.428571428,
                                                   1379759.2857142857 5226096.428571428,
                                                   1379759.2857142857 5226103.571428572,
                                                   1379752.142857143 5226103.571428572,
                                                   1379752.142857143 5226096.428571428))'));
                        
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
                             366, 215, 9, 4,
                             '215',
                             1379755.7142857143, 5226100.0, 14.285714285714286, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             345, 160, 9, 5,
                             '05_09',
                             1379755.7142857143, 5226107.142857144, 14.285714285714286, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226103.571428572,
                                                   1379759.2857142857 5226103.571428572,
                                                   1379759.2857142857 5226110.7142857155,
                                                   1379752.142857143 5226110.7142857155,
                                                   1379752.142857143 5226103.571428572))'));
                        
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
                             345, 160, 9, 5,
                             '160',
                             1379755.7142857143, 5226107.142857144, 14.285714285714286, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             324, 113, 9, 6,
                             '06_09',
                             1379755.7142857143, 5226114.285714286, 14.285714285714286, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226110.714285715,
                                                   1379759.2857142857 5226110.714285715,
                                                   1379759.2857142857 5226117.857142858,
                                                   1379752.142857143 5226117.857142858,
                                                   1379752.142857143 5226110.714285715))'));
                        
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
                             324, 113, 9, 6,
                             '113',
                             1379755.7142857143, 5226114.285714286, 14.285714285714286, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             303, 74, 9, 7,
                             '07_09',
                             1379755.7142857143, 5226121.428571429, 14.285714285714286, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226117.857142857,
                                                   1379759.2857142857 5226117.857142857,
                                                   1379759.2857142857 5226125.000000001,
                                                   1379752.142857143 5226125.000000001,
                                                   1379752.142857143 5226117.857142857))'));
                        
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
                             303, 74, 9, 7,
                             '74',
                             1379755.7142857143, 5226121.428571429, 14.285714285714286, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             282, 43, 9, 8,
                             '08_09',
                             1379755.7142857143, 5226128.571428572, 14.285714285714286, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226125.0,
                                                   1379759.2857142857 5226125.0,
                                                   1379759.2857142857 5226132.142857144,
                                                   1379752.142857143 5226132.142857144,
                                                   1379752.142857143 5226125.0))'));
                        
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
                             282, 43, 9, 8,
                             '43',
                             1379755.7142857143, 5226128.571428572, 14.285714285714286, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             261, 20, 9, 9,
                             '09_09',
                             1379755.7142857143, 5226135.714285715, 14.285714285714286, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226132.142857143,
                                                   1379759.2857142857 5226132.142857143,
                                                   1379759.2857142857 5226139.285714286,
                                                   1379752.142857143 5226139.285714286,
                                                   1379752.142857143 5226132.142857143))'));
                        
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
                             261, 20, 9, 9,
                             '20',
                             1379755.7142857143, 5226135.714285715, 14.285714285714286, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             240, 19, 9, 10,
                             '10_09',
                             1379755.7142857143, 5226142.857142857, 14.285714285714286, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226139.285714285,
                                                   1379759.2857142857 5226139.285714285,
                                                   1379759.2857142857 5226146.428571429,
                                                   1379752.142857143 5226146.428571429,
                                                   1379752.142857143 5226139.285714285))'));
                        
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
                             240, 19, 9, 10,
                             '19',
                             1379755.7142857143, 5226142.857142857, 14.285714285714286, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             219, 18, 9, 11,
                             '11_09',
                             1379755.7142857143, 5226150.0, 14.285714285714286, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226146.428571428,
                                                   1379759.2857142857 5226146.428571428,
                                                   1379759.2857142857 5226153.571428572,
                                                   1379752.142857143 5226153.571428572,
                                                   1379752.142857143 5226146.428571428))'));
                        
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
                             219, 18, 9, 11,
                             '18',
                             1379755.7142857143, 5226150.0, 14.285714285714286, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             198, 17, 9, 12,
                             '12_09',
                             1379755.7142857143, 5226157.142857144, 14.285714285714286, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226153.571428572,
                                                   1379759.2857142857 5226153.571428572,
                                                   1379759.2857142857 5226160.7142857155,
                                                   1379752.142857143 5226160.7142857155,
                                                   1379752.142857143 5226153.571428572))'));
                        
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
                             198, 17, 9, 12,
                             '17',
                             1379755.7142857143, 5226157.142857144, 14.285714285714286, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             177, 16, 9, 13,
                             '13_09',
                             1379755.7142857143, 5226164.285714286, 14.285714285714286, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226160.714285715,
                                                   1379759.2857142857 5226160.714285715,
                                                   1379759.2857142857 5226167.857142858,
                                                   1379752.142857143 5226167.857142858,
                                                   1379752.142857143 5226160.714285715))'));
                        
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
                             177, 16, 9, 13,
                             '16',
                             1379755.7142857143, 5226164.285714286, 14.285714285714286, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             156, 35, 9, 14,
                             '14_09',
                             1379755.7142857143, 5226171.428571429, 14.285714285714286, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226167.857142857,
                                                   1379759.2857142857 5226167.857142857,
                                                   1379759.2857142857 5226175.000000001,
                                                   1379752.142857143 5226175.000000001,
                                                   1379752.142857143 5226167.857142857))'));
                        
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
                             156, 35, 9, 14,
                             '35',
                             1379755.7142857143, 5226171.428571429, 14.285714285714286, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             135, 62, 9, 15,
                             '15_09',
                             1379755.7142857143, 5226178.571428572, 14.285714285714286, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226175.0,
                                                   1379759.2857142857 5226175.0,
                                                   1379759.2857142857 5226182.142857144,
                                                   1379752.142857143 5226182.142857144,
                                                   1379752.142857143 5226175.0))'));
                        
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
                             135, 62, 9, 15,
                             '62',
                             1379755.7142857143, 5226178.571428572, 14.285714285714286, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             114, 97, 9, 16,
                             '16_09',
                             1379755.7142857143, 5226185.714285715, 14.285714285714286, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226182.142857143,
                                                   1379759.2857142857 5226182.142857143,
                                                   1379759.2857142857 5226189.285714286,
                                                   1379752.142857143 5226189.285714286,
                                                   1379752.142857143 5226182.142857143))'));
                        
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
                             114, 97, 9, 16,
                             '97',
                             1379755.7142857143, 5226185.714285715, 14.285714285714286, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             93, 140, 9, 17,
                             '17_09',
                             1379755.7142857143, 5226192.857142857, 14.285714285714286, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226189.285714285,
                                                   1379759.2857142857 5226189.285714285,
                                                   1379759.2857142857 5226196.428571429,
                                                   1379752.142857143 5226196.428571429,
                                                   1379752.142857143 5226189.285714285))'));
                        
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
                             93, 140, 9, 17,
                             '140',
                             1379755.7142857143, 5226192.857142857, 14.285714285714286, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             72, 191, 9, 18,
                             '18_09',
                             1379755.7142857143, 5226200.0, 14.285714285714286, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226196.428571428,
                                                   1379759.2857142857 5226196.428571428,
                                                   1379759.2857142857 5226203.571428572,
                                                   1379752.142857143 5226203.571428572,
                                                   1379752.142857143 5226196.428571428))'));
                        
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
                             72, 191, 9, 18,
                             '191',
                             1379755.7142857143, 5226200.0, 14.285714285714286, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             51, 250, 9, 19,
                             '19_09',
                             1379755.7142857143, 5226207.142857144, 14.285714285714286, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226203.571428572,
                                                   1379759.2857142857 5226203.571428572,
                                                   1379759.2857142857 5226210.7142857155,
                                                   1379752.142857143 5226210.7142857155,
                                                   1379752.142857143 5226203.571428572))'));
                        
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
                             51, 250, 9, 19,
                             '250',
                             1379755.7142857143, 5226207.142857144, 14.285714285714286, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             30, 317, 9, 20,
                             '20_09',
                             1379755.7142857143, 5226214.285714286, 14.285714285714286, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226210.714285715,
                                                   1379759.2857142857 5226210.714285715,
                                                   1379759.2857142857 5226217.857142858,
                                                   1379752.142857143 5226217.857142858,
                                                   1379752.142857143 5226210.714285715))'));
                        
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
                             30, 317, 9, 20,
                             '317',
                             1379755.7142857143, 5226214.285714286, 14.285714285714286, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             9, 392, 9, 21,
                             '21_09',
                             1379755.7142857143, 5226221.428571429, 14.285714285714286, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379752.142857143 5226217.857142857,
                                                   1379759.2857142857 5226217.857142857,
                                                   1379759.2857142857 5226225.000000001,
                                                   1379752.142857143 5226225.000000001,
                                                   1379752.142857143 5226217.857142857))'));
                        
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
                             9, 392, 9, 21,
                             '392',
                             1379755.7142857143, 5226221.428571429, 14.285714285714286, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379755.7142857143 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             430, 429, 10, 1,
                             '01_10',
                             1379762.857142857, 5226078.571428572, 7.142857142857143, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226075.0,
                                                   1379766.4285714284 5226075.0,
                                                   1379766.4285714284 5226082.142857144,
                                                   1379759.2857142857 5226082.142857144,
                                                   1379759.2857142857 5226075.0))'));
                        
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
                             430, 429, 10, 1,
                             '429',
                             1379762.857142857, 5226078.571428572, 7.142857142857143, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             409, 350, 10, 2,
                             '02_10',
                             1379762.857142857, 5226085.714285715, 7.142857142857143, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226082.142857143,
                                                   1379766.4285714284 5226082.142857143,
                                                   1379766.4285714284 5226089.285714286,
                                                   1379759.2857142857 5226089.285714286,
                                                   1379759.2857142857 5226082.142857143))'));
                        
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
                             409, 350, 10, 2,
                             '350',
                             1379762.857142857, 5226085.714285715, 7.142857142857143, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             388, 279, 10, 3,
                             '03_10',
                             1379762.857142857, 5226092.857142857, 7.142857142857143, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226089.285714285,
                                                   1379766.4285714284 5226089.285714285,
                                                   1379766.4285714284 5226096.428571429,
                                                   1379759.2857142857 5226096.428571429,
                                                   1379759.2857142857 5226089.285714285))'));
                        
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
                             388, 279, 10, 3,
                             '279',
                             1379762.857142857, 5226092.857142857, 7.142857142857143, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             367, 216, 10, 4,
                             '04_10',
                             1379762.857142857, 5226100.0, 7.142857142857143, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226096.428571428,
                                                   1379766.4285714284 5226096.428571428,
                                                   1379766.4285714284 5226103.571428572,
                                                   1379759.2857142857 5226103.571428572,
                                                   1379759.2857142857 5226096.428571428))'));
                        
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
                             367, 216, 10, 4,
                             '216',
                             1379762.857142857, 5226100.0, 7.142857142857143, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             346, 161, 10, 5,
                             '05_10',
                             1379762.857142857, 5226107.142857144, 7.142857142857143, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226103.571428572,
                                                   1379766.4285714284 5226103.571428572,
                                                   1379766.4285714284 5226110.7142857155,
                                                   1379759.2857142857 5226110.7142857155,
                                                   1379759.2857142857 5226103.571428572))'));
                        
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
                             346, 161, 10, 5,
                             '161',
                             1379762.857142857, 5226107.142857144, 7.142857142857143, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             325, 114, 10, 6,
                             '06_10',
                             1379762.857142857, 5226114.285714286, 7.142857142857143, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226110.714285715,
                                                   1379766.4285714284 5226110.714285715,
                                                   1379766.4285714284 5226117.857142858,
                                                   1379759.2857142857 5226117.857142858,
                                                   1379759.2857142857 5226110.714285715))'));
                        
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
                             325, 114, 10, 6,
                             '114',
                             1379762.857142857, 5226114.285714286, 7.142857142857143, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             304, 75, 10, 7,
                             '07_10',
                             1379762.857142857, 5226121.428571429, 7.142857142857143, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226117.857142857,
                                                   1379766.4285714284 5226117.857142857,
                                                   1379766.4285714284 5226125.000000001,
                                                   1379759.2857142857 5226125.000000001,
                                                   1379759.2857142857 5226117.857142857))'));
                        
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
                             304, 75, 10, 7,
                             '75',
                             1379762.857142857, 5226121.428571429, 7.142857142857143, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             283, 44, 10, 8,
                             '08_10',
                             1379762.857142857, 5226128.571428572, 7.142857142857143, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226125.0,
                                                   1379766.4285714284 5226125.0,
                                                   1379766.4285714284 5226132.142857144,
                                                   1379759.2857142857 5226132.142857144,
                                                   1379759.2857142857 5226125.0))'));
                        
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
                             283, 44, 10, 8,
                             '44',
                             1379762.857142857, 5226128.571428572, 7.142857142857143, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             262, 21, 10, 9,
                             '09_10',
                             1379762.857142857, 5226135.714285715, 7.142857142857143, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226132.142857143,
                                                   1379766.4285714284 5226132.142857143,
                                                   1379766.4285714284 5226139.285714286,
                                                   1379759.2857142857 5226139.285714286,
                                                   1379759.2857142857 5226132.142857143))'));
                        
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
                             262, 21, 10, 9,
                             '21',
                             1379762.857142857, 5226135.714285715, 7.142857142857143, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             241, 6, 10, 10,
                             '10_10',
                             1379762.857142857, 5226142.857142857, 7.142857142857143, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226139.285714285,
                                                   1379766.4285714284 5226139.285714285,
                                                   1379766.4285714284 5226146.428571429,
                                                   1379759.2857142857 5226146.428571429,
                                                   1379759.2857142857 5226139.285714285))'));
                        
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
                             241, 6, 10, 10,
                             '6',
                             1379762.857142857, 5226142.857142857, 7.142857142857143, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             220, 5, 10, 11,
                             '11_10',
                             1379762.857142857, 5226150.0, 7.142857142857143, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226146.428571428,
                                                   1379766.4285714284 5226146.428571428,
                                                   1379766.4285714284 5226153.571428572,
                                                   1379759.2857142857 5226153.571428572,
                                                   1379759.2857142857 5226146.428571428))'));
                        
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
                             220, 5, 10, 11,
                             '5',
                             1379762.857142857, 5226150.0, 7.142857142857143, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             199, 4, 10, 12,
                             '12_10',
                             1379762.857142857, 5226157.142857144, 7.142857142857143, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226153.571428572,
                                                   1379766.4285714284 5226153.571428572,
                                                   1379766.4285714284 5226160.7142857155,
                                                   1379759.2857142857 5226160.7142857155,
                                                   1379759.2857142857 5226153.571428572))'));
                        
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
                             199, 4, 10, 12,
                             '4',
                             1379762.857142857, 5226157.142857144, 7.142857142857143, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             178, 15, 10, 13,
                             '13_10',
                             1379762.857142857, 5226164.285714286, 7.142857142857143, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226160.714285715,
                                                   1379766.4285714284 5226160.714285715,
                                                   1379766.4285714284 5226167.857142858,
                                                   1379759.2857142857 5226167.857142858,
                                                   1379759.2857142857 5226160.714285715))'));
                        
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
                             178, 15, 10, 13,
                             '15',
                             1379762.857142857, 5226164.285714286, 7.142857142857143, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             157, 34, 10, 14,
                             '14_10',
                             1379762.857142857, 5226171.428571429, 7.142857142857143, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226167.857142857,
                                                   1379766.4285714284 5226167.857142857,
                                                   1379766.4285714284 5226175.000000001,
                                                   1379759.2857142857 5226175.000000001,
                                                   1379759.2857142857 5226167.857142857))'));
                        
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
                             157, 34, 10, 14,
                             '34',
                             1379762.857142857, 5226171.428571429, 7.142857142857143, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             136, 61, 10, 15,
                             '15_10',
                             1379762.857142857, 5226178.571428572, 7.142857142857143, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226175.0,
                                                   1379766.4285714284 5226175.0,
                                                   1379766.4285714284 5226182.142857144,
                                                   1379759.2857142857 5226182.142857144,
                                                   1379759.2857142857 5226175.0))'));
                        
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
                             136, 61, 10, 15,
                             '61',
                             1379762.857142857, 5226178.571428572, 7.142857142857143, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             115, 96, 10, 16,
                             '16_10',
                             1379762.857142857, 5226185.714285715, 7.142857142857143, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226182.142857143,
                                                   1379766.4285714284 5226182.142857143,
                                                   1379766.4285714284 5226189.285714286,
                                                   1379759.2857142857 5226189.285714286,
                                                   1379759.2857142857 5226182.142857143))'));
                        
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
                             115, 96, 10, 16,
                             '96',
                             1379762.857142857, 5226185.714285715, 7.142857142857143, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             94, 139, 10, 17,
                             '17_10',
                             1379762.857142857, 5226192.857142857, 7.142857142857143, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226189.285714285,
                                                   1379766.4285714284 5226189.285714285,
                                                   1379766.4285714284 5226196.428571429,
                                                   1379759.2857142857 5226196.428571429,
                                                   1379759.2857142857 5226189.285714285))'));
                        
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
                             94, 139, 10, 17,
                             '139',
                             1379762.857142857, 5226192.857142857, 7.142857142857143, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             73, 190, 10, 18,
                             '18_10',
                             1379762.857142857, 5226200.0, 7.142857142857143, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226196.428571428,
                                                   1379766.4285714284 5226196.428571428,
                                                   1379766.4285714284 5226203.571428572,
                                                   1379759.2857142857 5226203.571428572,
                                                   1379759.2857142857 5226196.428571428))'));
                        
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
                             73, 190, 10, 18,
                             '190',
                             1379762.857142857, 5226200.0, 7.142857142857143, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             52, 249, 10, 19,
                             '19_10',
                             1379762.857142857, 5226207.142857144, 7.142857142857143, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226203.571428572,
                                                   1379766.4285714284 5226203.571428572,
                                                   1379766.4285714284 5226210.7142857155,
                                                   1379759.2857142857 5226210.7142857155,
                                                   1379759.2857142857 5226203.571428572))'));
                        
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
                             52, 249, 10, 19,
                             '249',
                             1379762.857142857, 5226207.142857144, 7.142857142857143, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             31, 316, 10, 20,
                             '20_10',
                             1379762.857142857, 5226214.285714286, 7.142857142857143, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226210.714285715,
                                                   1379766.4285714284 5226210.714285715,
                                                   1379766.4285714284 5226217.857142858,
                                                   1379759.2857142857 5226217.857142858,
                                                   1379759.2857142857 5226210.714285715))'));
                        
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
                             31, 316, 10, 20,
                             '316',
                             1379762.857142857, 5226214.285714286, 7.142857142857143, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             10, 391, 10, 21,
                             '21_10',
                             1379762.857142857, 5226221.428571429, 7.142857142857143, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379759.2857142857 5226217.857142857,
                                                   1379766.4285714284 5226217.857142857,
                                                   1379766.4285714284 5226225.000000001,
                                                   1379759.2857142857 5226225.000000001,
                                                   1379759.2857142857 5226217.857142857))'));
                        
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
                             10, 391, 10, 21,
                             '391',
                             1379762.857142857, 5226221.428571429, 7.142857142857143, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379762.857142857 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             431, 430, 11, 1,
                             '01_11',
                             1379770.0, 5226078.571428572, 0.0, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226075.0,
                                                   1379773.5714285714 5226075.0,
                                                   1379773.5714285714 5226082.142857144,
                                                   1379766.4285714286 5226082.142857144,
                                                   1379766.4285714286 5226075.0))'));
                        
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
                             431, 430, 11, 1,
                             '430',
                             1379770.0, 5226078.571428572, 0.0, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             410, 351, 11, 2,
                             '02_11',
                             1379770.0, 5226085.714285715, 0.0, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226082.142857143,
                                                   1379773.5714285714 5226082.142857143,
                                                   1379773.5714285714 5226089.285714286,
                                                   1379766.4285714286 5226089.285714286,
                                                   1379766.4285714286 5226082.142857143))'));
                        
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
                             410, 351, 11, 2,
                             '351',
                             1379770.0, 5226085.714285715, 0.0, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             389, 280, 11, 3,
                             '03_11',
                             1379770.0, 5226092.857142857, 0.0, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226089.285714285,
                                                   1379773.5714285714 5226089.285714285,
                                                   1379773.5714285714 5226096.428571429,
                                                   1379766.4285714286 5226096.428571429,
                                                   1379766.4285714286 5226089.285714285))'));
                        
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
                             389, 280, 11, 3,
                             '280',
                             1379770.0, 5226092.857142857, 0.0, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             368, 217, 11, 4,
                             '04_11',
                             1379770.0, 5226100.0, 0.0, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226096.428571428,
                                                   1379773.5714285714 5226096.428571428,
                                                   1379773.5714285714 5226103.571428572,
                                                   1379766.4285714286 5226103.571428572,
                                                   1379766.4285714286 5226096.428571428))'));
                        
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
                             368, 217, 11, 4,
                             '217',
                             1379770.0, 5226100.0, 0.0, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             347, 162, 11, 5,
                             '05_11',
                             1379770.0, 5226107.142857144, 0.0, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226103.571428572,
                                                   1379773.5714285714 5226103.571428572,
                                                   1379773.5714285714 5226110.7142857155,
                                                   1379766.4285714286 5226110.7142857155,
                                                   1379766.4285714286 5226103.571428572))'));
                        
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
                             347, 162, 11, 5,
                             '162',
                             1379770.0, 5226107.142857144, 0.0, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             326, 115, 11, 6,
                             '06_11',
                             1379770.0, 5226114.285714286, 0.0, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226110.714285715,
                                                   1379773.5714285714 5226110.714285715,
                                                   1379773.5714285714 5226117.857142858,
                                                   1379766.4285714286 5226117.857142858,
                                                   1379766.4285714286 5226110.714285715))'));
                        
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
                             326, 115, 11, 6,
                             '115',
                             1379770.0, 5226114.285714286, 0.0, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             305, 76, 11, 7,
                             '07_11',
                             1379770.0, 5226121.428571429, 0.0, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226117.857142857,
                                                   1379773.5714285714 5226117.857142857,
                                                   1379773.5714285714 5226125.000000001,
                                                   1379766.4285714286 5226125.000000001,
                                                   1379766.4285714286 5226117.857142857))'));
                        
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
                             305, 76, 11, 7,
                             '76',
                             1379770.0, 5226121.428571429, 0.0, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             284, 45, 11, 8,
                             '08_11',
                             1379770.0, 5226128.571428572, 0.0, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226125.0,
                                                   1379773.5714285714 5226125.0,
                                                   1379773.5714285714 5226132.142857144,
                                                   1379766.4285714286 5226132.142857144,
                                                   1379766.4285714286 5226125.0))'));
                        
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
                             284, 45, 11, 8,
                             '45',
                             1379770.0, 5226128.571428572, 0.0, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             263, 22, 11, 9,
                             '09_11',
                             1379770.0, 5226135.714285715, 0.0, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226132.142857143,
                                                   1379773.5714285714 5226132.142857143,
                                                   1379773.5714285714 5226139.285714286,
                                                   1379766.4285714286 5226139.285714286,
                                                   1379766.4285714286 5226132.142857143))'));
                        
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
                             263, 22, 11, 9,
                             '22',
                             1379770.0, 5226135.714285715, 0.0, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             242, 7, 11, 10,
                             '10_11',
                             1379770.0, 5226142.857142857, 0.0, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226139.285714285,
                                                   1379773.5714285714 5226139.285714285,
                                                   1379773.5714285714 5226146.428571429,
                                                   1379766.4285714286 5226146.428571429,
                                                   1379766.4285714286 5226139.285714285))'));
                        
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
                             242, 7, 11, 10,
                             '7',
                             1379770.0, 5226142.857142857, 0.0, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             221, 0, 11, 11,
                             '11_11',
                             1379770.0, 5226150.0, 0.0, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226146.428571428,
                                                   1379773.5714285714 5226146.428571428,
                                                   1379773.5714285714 5226153.571428572,
                                                   1379766.4285714286 5226153.571428572,
                                                   1379766.4285714286 5226146.428571428))'));
                        
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
                             221, 0, 11, 11,
                             '0',
                             1379770.0, 5226150.0, 0.0, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             200, 3, 11, 12,
                             '12_11',
                             1379770.0, 5226157.142857144, 0.0, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226153.571428572,
                                                   1379773.5714285714 5226153.571428572,
                                                   1379773.5714285714 5226160.7142857155,
                                                   1379766.4285714286 5226160.7142857155,
                                                   1379766.4285714286 5226153.571428572))'));
                        
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
                             200, 3, 11, 12,
                             '3',
                             1379770.0, 5226157.142857144, 0.0, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             179, 14, 11, 13,
                             '13_11',
                             1379770.0, 5226164.285714286, 0.0, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226160.714285715,
                                                   1379773.5714285714 5226160.714285715,
                                                   1379773.5714285714 5226167.857142858,
                                                   1379766.4285714286 5226167.857142858,
                                                   1379766.4285714286 5226160.714285715))'));
                        
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
                             179, 14, 11, 13,
                             '14',
                             1379770.0, 5226164.285714286, 0.0, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             158, 33, 11, 14,
                             '14_11',
                             1379770.0, 5226171.428571429, 0.0, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226167.857142857,
                                                   1379773.5714285714 5226167.857142857,
                                                   1379773.5714285714 5226175.000000001,
                                                   1379766.4285714286 5226175.000000001,
                                                   1379766.4285714286 5226167.857142857))'));
                        
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
                             158, 33, 11, 14,
                             '33',
                             1379770.0, 5226171.428571429, 0.0, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             137, 60, 11, 15,
                             '15_11',
                             1379770.0, 5226178.571428572, 0.0, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226175.0,
                                                   1379773.5714285714 5226175.0,
                                                   1379773.5714285714 5226182.142857144,
                                                   1379766.4285714286 5226182.142857144,
                                                   1379766.4285714286 5226175.0))'));
                        
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
                             137, 60, 11, 15,
                             '60',
                             1379770.0, 5226178.571428572, 0.0, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             116, 95, 11, 16,
                             '16_11',
                             1379770.0, 5226185.714285715, 0.0, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226182.142857143,
                                                   1379773.5714285714 5226182.142857143,
                                                   1379773.5714285714 5226189.285714286,
                                                   1379766.4285714286 5226189.285714286,
                                                   1379766.4285714286 5226182.142857143))'));
                        
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
                             116, 95, 11, 16,
                             '95',
                             1379770.0, 5226185.714285715, 0.0, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             95, 138, 11, 17,
                             '17_11',
                             1379770.0, 5226192.857142857, 0.0, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226189.285714285,
                                                   1379773.5714285714 5226189.285714285,
                                                   1379773.5714285714 5226196.428571429,
                                                   1379766.4285714286 5226196.428571429,
                                                   1379766.4285714286 5226189.285714285))'));
                        
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
                             95, 138, 11, 17,
                             '138',
                             1379770.0, 5226192.857142857, 0.0, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             74, 189, 11, 18,
                             '18_11',
                             1379770.0, 5226200.0, 0.0, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226196.428571428,
                                                   1379773.5714285714 5226196.428571428,
                                                   1379773.5714285714 5226203.571428572,
                                                   1379766.4285714286 5226203.571428572,
                                                   1379766.4285714286 5226196.428571428))'));
                        
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
                             74, 189, 11, 18,
                             '189',
                             1379770.0, 5226200.0, 0.0, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             53, 248, 11, 19,
                             '19_11',
                             1379770.0, 5226207.142857144, 0.0, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226203.571428572,
                                                   1379773.5714285714 5226203.571428572,
                                                   1379773.5714285714 5226210.7142857155,
                                                   1379766.4285714286 5226210.7142857155,
                                                   1379766.4285714286 5226203.571428572))'));
                        
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
                             53, 248, 11, 19,
                             '248',
                             1379770.0, 5226207.142857144, 0.0, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             32, 315, 11, 20,
                             '20_11',
                             1379770.0, 5226214.285714286, 0.0, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226210.714285715,
                                                   1379773.5714285714 5226210.714285715,
                                                   1379773.5714285714 5226217.857142858,
                                                   1379766.4285714286 5226217.857142858,
                                                   1379766.4285714286 5226210.714285715))'));
                        
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
                             32, 315, 11, 20,
                             '315',
                             1379770.0, 5226214.285714286, 0.0, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             11, 390, 11, 21,
                             '21_11',
                             1379770.0, 5226221.428571429, 0.0, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379766.4285714286 5226217.857142857,
                                                   1379773.5714285714 5226217.857142857,
                                                   1379773.5714285714 5226225.000000001,
                                                   1379766.4285714286 5226225.000000001,
                                                   1379766.4285714286 5226217.857142857))'));
                        
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
                             11, 390, 11, 21,
                             '390',
                             1379770.0, 5226221.428571429, 0.0, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379770.0 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             432, 431, 12, 1,
                             '01_12',
                             1379777.1428571427, 5226078.571428572, -7.142857142857143, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226075.0,
                                                   1379780.714285714 5226075.0,
                                                   1379780.714285714 5226082.142857144,
                                                   1379773.5714285714 5226082.142857144,
                                                   1379773.5714285714 5226075.0))'));
                        
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
                             432, 431, 12, 1,
                             '431',
                             1379777.1428571427, 5226078.571428572, -7.142857142857143, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             411, 352, 12, 2,
                             '02_12',
                             1379777.1428571427, 5226085.714285715, -7.142857142857143, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226082.142857143,
                                                   1379780.714285714 5226082.142857143,
                                                   1379780.714285714 5226089.285714286,
                                                   1379773.5714285714 5226089.285714286,
                                                   1379773.5714285714 5226082.142857143))'));
                        
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
                             411, 352, 12, 2,
                             '352',
                             1379777.1428571427, 5226085.714285715, -7.142857142857143, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             390, 281, 12, 3,
                             '03_12',
                             1379777.1428571427, 5226092.857142857, -7.142857142857143, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226089.285714285,
                                                   1379780.714285714 5226089.285714285,
                                                   1379780.714285714 5226096.428571429,
                                                   1379773.5714285714 5226096.428571429,
                                                   1379773.5714285714 5226089.285714285))'));
                        
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
                             390, 281, 12, 3,
                             '281',
                             1379777.1428571427, 5226092.857142857, -7.142857142857143, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             369, 218, 12, 4,
                             '04_12',
                             1379777.1428571427, 5226100.0, -7.142857142857143, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226096.428571428,
                                                   1379780.714285714 5226096.428571428,
                                                   1379780.714285714 5226103.571428572,
                                                   1379773.5714285714 5226103.571428572,
                                                   1379773.5714285714 5226096.428571428))'));
                        
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
                             369, 218, 12, 4,
                             '218',
                             1379777.1428571427, 5226100.0, -7.142857142857143, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             348, 163, 12, 5,
                             '05_12',
                             1379777.1428571427, 5226107.142857144, -7.142857142857143, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226103.571428572,
                                                   1379780.714285714 5226103.571428572,
                                                   1379780.714285714 5226110.7142857155,
                                                   1379773.5714285714 5226110.7142857155,
                                                   1379773.5714285714 5226103.571428572))'));
                        
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
                             348, 163, 12, 5,
                             '163',
                             1379777.1428571427, 5226107.142857144, -7.142857142857143, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             327, 116, 12, 6,
                             '06_12',
                             1379777.1428571427, 5226114.285714286, -7.142857142857143, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226110.714285715,
                                                   1379780.714285714 5226110.714285715,
                                                   1379780.714285714 5226117.857142858,
                                                   1379773.5714285714 5226117.857142858,
                                                   1379773.5714285714 5226110.714285715))'));
                        
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
                             327, 116, 12, 6,
                             '116',
                             1379777.1428571427, 5226114.285714286, -7.142857142857143, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             306, 77, 12, 7,
                             '07_12',
                             1379777.1428571427, 5226121.428571429, -7.142857142857143, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226117.857142857,
                                                   1379780.714285714 5226117.857142857,
                                                   1379780.714285714 5226125.000000001,
                                                   1379773.5714285714 5226125.000000001,
                                                   1379773.5714285714 5226117.857142857))'));
                        
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
                             306, 77, 12, 7,
                             '77',
                             1379777.1428571427, 5226121.428571429, -7.142857142857143, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             285, 46, 12, 8,
                             '08_12',
                             1379777.1428571427, 5226128.571428572, -7.142857142857143, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226125.0,
                                                   1379780.714285714 5226125.0,
                                                   1379780.714285714 5226132.142857144,
                                                   1379773.5714285714 5226132.142857144,
                                                   1379773.5714285714 5226125.0))'));
                        
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
                             285, 46, 12, 8,
                             '46',
                             1379777.1428571427, 5226128.571428572, -7.142857142857143, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             264, 23, 12, 9,
                             '09_12',
                             1379777.1428571427, 5226135.714285715, -7.142857142857143, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226132.142857143,
                                                   1379780.714285714 5226132.142857143,
                                                   1379780.714285714 5226139.285714286,
                                                   1379773.5714285714 5226139.285714286,
                                                   1379773.5714285714 5226132.142857143))'));
                        
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
                             264, 23, 12, 9,
                             '23',
                             1379777.1428571427, 5226135.714285715, -7.142857142857143, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             243, 8, 12, 10,
                             '10_12',
                             1379777.1428571427, 5226142.857142857, -7.142857142857143, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226139.285714285,
                                                   1379780.714285714 5226139.285714285,
                                                   1379780.714285714 5226146.428571429,
                                                   1379773.5714285714 5226146.428571429,
                                                   1379773.5714285714 5226139.285714285))'));
                        
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
                             243, 8, 12, 10,
                             '8',
                             1379777.1428571427, 5226142.857142857, -7.142857142857143, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             222, 1, 12, 11,
                             '11_12',
                             1379777.1428571427, 5226150.0, -7.142857142857143, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226146.428571428,
                                                   1379780.714285714 5226146.428571428,
                                                   1379780.714285714 5226153.571428572,
                                                   1379773.5714285714 5226153.571428572,
                                                   1379773.5714285714 5226146.428571428))'));
                        
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
                             222, 1, 12, 11,
                             '1',
                             1379777.1428571427, 5226150.0, -7.142857142857143, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             201, 2, 12, 12,
                             '12_12',
                             1379777.1428571427, 5226157.142857144, -7.142857142857143, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226153.571428572,
                                                   1379780.714285714 5226153.571428572,
                                                   1379780.714285714 5226160.7142857155,
                                                   1379773.5714285714 5226160.7142857155,
                                                   1379773.5714285714 5226153.571428572))'));
                        
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
                             201, 2, 12, 12,
                             '2',
                             1379777.1428571427, 5226157.142857144, -7.142857142857143, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             180, 13, 12, 13,
                             '13_12',
                             1379777.1428571427, 5226164.285714286, -7.142857142857143, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226160.714285715,
                                                   1379780.714285714 5226160.714285715,
                                                   1379780.714285714 5226167.857142858,
                                                   1379773.5714285714 5226167.857142858,
                                                   1379773.5714285714 5226160.714285715))'));
                        
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
                             180, 13, 12, 13,
                             '13',
                             1379777.1428571427, 5226164.285714286, -7.142857142857143, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             159, 32, 12, 14,
                             '14_12',
                             1379777.1428571427, 5226171.428571429, -7.142857142857143, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226167.857142857,
                                                   1379780.714285714 5226167.857142857,
                                                   1379780.714285714 5226175.000000001,
                                                   1379773.5714285714 5226175.000000001,
                                                   1379773.5714285714 5226167.857142857))'));
                        
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
                             159, 32, 12, 14,
                             '32',
                             1379777.1428571427, 5226171.428571429, -7.142857142857143, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             138, 59, 12, 15,
                             '15_12',
                             1379777.1428571427, 5226178.571428572, -7.142857142857143, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226175.0,
                                                   1379780.714285714 5226175.0,
                                                   1379780.714285714 5226182.142857144,
                                                   1379773.5714285714 5226182.142857144,
                                                   1379773.5714285714 5226175.0))'));
                        
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
                             138, 59, 12, 15,
                             '59',
                             1379777.1428571427, 5226178.571428572, -7.142857142857143, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             117, 94, 12, 16,
                             '16_12',
                             1379777.1428571427, 5226185.714285715, -7.142857142857143, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226182.142857143,
                                                   1379780.714285714 5226182.142857143,
                                                   1379780.714285714 5226189.285714286,
                                                   1379773.5714285714 5226189.285714286,
                                                   1379773.5714285714 5226182.142857143))'));
                        
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
                             117, 94, 12, 16,
                             '94',
                             1379777.1428571427, 5226185.714285715, -7.142857142857143, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             96, 137, 12, 17,
                             '17_12',
                             1379777.1428571427, 5226192.857142857, -7.142857142857143, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226189.285714285,
                                                   1379780.714285714 5226189.285714285,
                                                   1379780.714285714 5226196.428571429,
                                                   1379773.5714285714 5226196.428571429,
                                                   1379773.5714285714 5226189.285714285))'));
                        
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
                             96, 137, 12, 17,
                             '137',
                             1379777.1428571427, 5226192.857142857, -7.142857142857143, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             75, 188, 12, 18,
                             '18_12',
                             1379777.1428571427, 5226200.0, -7.142857142857143, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226196.428571428,
                                                   1379780.714285714 5226196.428571428,
                                                   1379780.714285714 5226203.571428572,
                                                   1379773.5714285714 5226203.571428572,
                                                   1379773.5714285714 5226196.428571428))'));
                        
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
                             75, 188, 12, 18,
                             '188',
                             1379777.1428571427, 5226200.0, -7.142857142857143, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             54, 247, 12, 19,
                             '19_12',
                             1379777.1428571427, 5226207.142857144, -7.142857142857143, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226203.571428572,
                                                   1379780.714285714 5226203.571428572,
                                                   1379780.714285714 5226210.7142857155,
                                                   1379773.5714285714 5226210.7142857155,
                                                   1379773.5714285714 5226203.571428572))'));
                        
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
                             54, 247, 12, 19,
                             '247',
                             1379777.1428571427, 5226207.142857144, -7.142857142857143, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             33, 314, 12, 20,
                             '20_12',
                             1379777.1428571427, 5226214.285714286, -7.142857142857143, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226210.714285715,
                                                   1379780.714285714 5226210.714285715,
                                                   1379780.714285714 5226217.857142858,
                                                   1379773.5714285714 5226217.857142858,
                                                   1379773.5714285714 5226210.714285715))'));
                        
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
                             33, 314, 12, 20,
                             '314',
                             1379777.1428571427, 5226214.285714286, -7.142857142857143, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             12, 389, 12, 21,
                             '21_12',
                             1379777.1428571427, 5226221.428571429, -7.142857142857143, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379773.5714285714 5226217.857142857,
                                                   1379780.714285714 5226217.857142857,
                                                   1379780.714285714 5226225.000000001,
                                                   1379773.5714285714 5226225.000000001,
                                                   1379773.5714285714 5226217.857142857))'));
                        
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
                             12, 389, 12, 21,
                             '389',
                             1379777.1428571427, 5226221.428571429, -7.142857142857143, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379777.1428571427 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             433, 432, 13, 1,
                             '01_13',
                             1379784.2857142857, 5226078.571428572, -14.285714285714286, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226075.0,
                                                   1379787.857142857 5226075.0,
                                                   1379787.857142857 5226082.142857144,
                                                   1379780.7142857143 5226082.142857144,
                                                   1379780.7142857143 5226075.0))'));
                        
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
                             433, 432, 13, 1,
                             '432',
                             1379784.2857142857, 5226078.571428572, -14.285714285714286, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             412, 353, 13, 2,
                             '02_13',
                             1379784.2857142857, 5226085.714285715, -14.285714285714286, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226082.142857143,
                                                   1379787.857142857 5226082.142857143,
                                                   1379787.857142857 5226089.285714286,
                                                   1379780.7142857143 5226089.285714286,
                                                   1379780.7142857143 5226082.142857143))'));
                        
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
                             412, 353, 13, 2,
                             '353',
                             1379784.2857142857, 5226085.714285715, -14.285714285714286, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             391, 282, 13, 3,
                             '03_13',
                             1379784.2857142857, 5226092.857142857, -14.285714285714286, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226089.285714285,
                                                   1379787.857142857 5226089.285714285,
                                                   1379787.857142857 5226096.428571429,
                                                   1379780.7142857143 5226096.428571429,
                                                   1379780.7142857143 5226089.285714285))'));
                        
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
                             391, 282, 13, 3,
                             '282',
                             1379784.2857142857, 5226092.857142857, -14.285714285714286, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             370, 219, 13, 4,
                             '04_13',
                             1379784.2857142857, 5226100.0, -14.285714285714286, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226096.428571428,
                                                   1379787.857142857 5226096.428571428,
                                                   1379787.857142857 5226103.571428572,
                                                   1379780.7142857143 5226103.571428572,
                                                   1379780.7142857143 5226096.428571428))'));
                        
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
                             370, 219, 13, 4,
                             '219',
                             1379784.2857142857, 5226100.0, -14.285714285714286, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             349, 164, 13, 5,
                             '05_13',
                             1379784.2857142857, 5226107.142857144, -14.285714285714286, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226103.571428572,
                                                   1379787.857142857 5226103.571428572,
                                                   1379787.857142857 5226110.7142857155,
                                                   1379780.7142857143 5226110.7142857155,
                                                   1379780.7142857143 5226103.571428572))'));
                        
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
                             349, 164, 13, 5,
                             '164',
                             1379784.2857142857, 5226107.142857144, -14.285714285714286, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             328, 117, 13, 6,
                             '06_13',
                             1379784.2857142857, 5226114.285714286, -14.285714285714286, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226110.714285715,
                                                   1379787.857142857 5226110.714285715,
                                                   1379787.857142857 5226117.857142858,
                                                   1379780.7142857143 5226117.857142858,
                                                   1379780.7142857143 5226110.714285715))'));
                        
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
                             328, 117, 13, 6,
                             '117',
                             1379784.2857142857, 5226114.285714286, -14.285714285714286, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             307, 78, 13, 7,
                             '07_13',
                             1379784.2857142857, 5226121.428571429, -14.285714285714286, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226117.857142857,
                                                   1379787.857142857 5226117.857142857,
                                                   1379787.857142857 5226125.000000001,
                                                   1379780.7142857143 5226125.000000001,
                                                   1379780.7142857143 5226117.857142857))'));
                        
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
                             307, 78, 13, 7,
                             '78',
                             1379784.2857142857, 5226121.428571429, -14.285714285714286, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             286, 47, 13, 8,
                             '08_13',
                             1379784.2857142857, 5226128.571428572, -14.285714285714286, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226125.0,
                                                   1379787.857142857 5226125.0,
                                                   1379787.857142857 5226132.142857144,
                                                   1379780.7142857143 5226132.142857144,
                                                   1379780.7142857143 5226125.0))'));
                        
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
                             286, 47, 13, 8,
                             '47',
                             1379784.2857142857, 5226128.571428572, -14.285714285714286, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             265, 24, 13, 9,
                             '09_13',
                             1379784.2857142857, 5226135.714285715, -14.285714285714286, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226132.142857143,
                                                   1379787.857142857 5226132.142857143,
                                                   1379787.857142857 5226139.285714286,
                                                   1379780.7142857143 5226139.285714286,
                                                   1379780.7142857143 5226132.142857143))'));
                        
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
                             265, 24, 13, 9,
                             '24',
                             1379784.2857142857, 5226135.714285715, -14.285714285714286, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             244, 9, 13, 10,
                             '10_13',
                             1379784.2857142857, 5226142.857142857, -14.285714285714286, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226139.285714285,
                                                   1379787.857142857 5226139.285714285,
                                                   1379787.857142857 5226146.428571429,
                                                   1379780.7142857143 5226146.428571429,
                                                   1379780.7142857143 5226139.285714285))'));
                        
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
                             244, 9, 13, 10,
                             '9',
                             1379784.2857142857, 5226142.857142857, -14.285714285714286, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             223, 10, 13, 11,
                             '11_13',
                             1379784.2857142857, 5226150.0, -14.285714285714286, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226146.428571428,
                                                   1379787.857142857 5226146.428571428,
                                                   1379787.857142857 5226153.571428572,
                                                   1379780.7142857143 5226153.571428572,
                                                   1379780.7142857143 5226146.428571428))'));
                        
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
                             223, 10, 13, 11,
                             '10',
                             1379784.2857142857, 5226150.0, -14.285714285714286, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             202, 11, 13, 12,
                             '12_13',
                             1379784.2857142857, 5226157.142857144, -14.285714285714286, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226153.571428572,
                                                   1379787.857142857 5226153.571428572,
                                                   1379787.857142857 5226160.7142857155,
                                                   1379780.7142857143 5226160.7142857155,
                                                   1379780.7142857143 5226153.571428572))'));
                        
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
                             202, 11, 13, 12,
                             '11',
                             1379784.2857142857, 5226157.142857144, -14.285714285714286, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             181, 12, 13, 13,
                             '13_13',
                             1379784.2857142857, 5226164.285714286, -14.285714285714286, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226160.714285715,
                                                   1379787.857142857 5226160.714285715,
                                                   1379787.857142857 5226167.857142858,
                                                   1379780.7142857143 5226167.857142858,
                                                   1379780.7142857143 5226160.714285715))'));
                        
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
                             181, 12, 13, 13,
                             '12',
                             1379784.2857142857, 5226164.285714286, -14.285714285714286, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             160, 31, 13, 14,
                             '14_13',
                             1379784.2857142857, 5226171.428571429, -14.285714285714286, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226167.857142857,
                                                   1379787.857142857 5226167.857142857,
                                                   1379787.857142857 5226175.000000001,
                                                   1379780.7142857143 5226175.000000001,
                                                   1379780.7142857143 5226167.857142857))'));
                        
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
                             160, 31, 13, 14,
                             '31',
                             1379784.2857142857, 5226171.428571429, -14.285714285714286, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             139, 58, 13, 15,
                             '15_13',
                             1379784.2857142857, 5226178.571428572, -14.285714285714286, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226175.0,
                                                   1379787.857142857 5226175.0,
                                                   1379787.857142857 5226182.142857144,
                                                   1379780.7142857143 5226182.142857144,
                                                   1379780.7142857143 5226175.0))'));
                        
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
                             139, 58, 13, 15,
                             '58',
                             1379784.2857142857, 5226178.571428572, -14.285714285714286, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             118, 93, 13, 16,
                             '16_13',
                             1379784.2857142857, 5226185.714285715, -14.285714285714286, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226182.142857143,
                                                   1379787.857142857 5226182.142857143,
                                                   1379787.857142857 5226189.285714286,
                                                   1379780.7142857143 5226189.285714286,
                                                   1379780.7142857143 5226182.142857143))'));
                        
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
                             118, 93, 13, 16,
                             '93',
                             1379784.2857142857, 5226185.714285715, -14.285714285714286, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             97, 136, 13, 17,
                             '17_13',
                             1379784.2857142857, 5226192.857142857, -14.285714285714286, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226189.285714285,
                                                   1379787.857142857 5226189.285714285,
                                                   1379787.857142857 5226196.428571429,
                                                   1379780.7142857143 5226196.428571429,
                                                   1379780.7142857143 5226189.285714285))'));
                        
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
                             97, 136, 13, 17,
                             '136',
                             1379784.2857142857, 5226192.857142857, -14.285714285714286, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             76, 187, 13, 18,
                             '18_13',
                             1379784.2857142857, 5226200.0, -14.285714285714286, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226196.428571428,
                                                   1379787.857142857 5226196.428571428,
                                                   1379787.857142857 5226203.571428572,
                                                   1379780.7142857143 5226203.571428572,
                                                   1379780.7142857143 5226196.428571428))'));
                        
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
                             76, 187, 13, 18,
                             '187',
                             1379784.2857142857, 5226200.0, -14.285714285714286, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             55, 246, 13, 19,
                             '19_13',
                             1379784.2857142857, 5226207.142857144, -14.285714285714286, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226203.571428572,
                                                   1379787.857142857 5226203.571428572,
                                                   1379787.857142857 5226210.7142857155,
                                                   1379780.7142857143 5226210.7142857155,
                                                   1379780.7142857143 5226203.571428572))'));
                        
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
                             55, 246, 13, 19,
                             '246',
                             1379784.2857142857, 5226207.142857144, -14.285714285714286, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             34, 313, 13, 20,
                             '20_13',
                             1379784.2857142857, 5226214.285714286, -14.285714285714286, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226210.714285715,
                                                   1379787.857142857 5226210.714285715,
                                                   1379787.857142857 5226217.857142858,
                                                   1379780.7142857143 5226217.857142858,
                                                   1379780.7142857143 5226210.714285715))'));
                        
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
                             34, 313, 13, 20,
                             '313',
                             1379784.2857142857, 5226214.285714286, -14.285714285714286, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             13, 388, 13, 21,
                             '21_13',
                             1379784.2857142857, 5226221.428571429, -14.285714285714286, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379780.7142857143 5226217.857142857,
                                                   1379787.857142857 5226217.857142857,
                                                   1379787.857142857 5226225.000000001,
                                                   1379780.7142857143 5226225.000000001,
                                                   1379780.7142857143 5226217.857142857))'));
                        
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
                             13, 388, 13, 21,
                             '388',
                             1379784.2857142857, 5226221.428571429, -14.285714285714286, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379784.2857142857 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             434, 433, 14, 1,
                             '01_14',
                             1379791.4285714284, 5226078.571428572, -21.42857142857143, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226075.0,
                                                   1379794.9999999998 5226075.0,
                                                   1379794.9999999998 5226082.142857144,
                                                   1379787.857142857 5226082.142857144,
                                                   1379787.857142857 5226075.0))'));
                        
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
                             434, 433, 14, 1,
                             '433',
                             1379791.4285714284, 5226078.571428572, -21.42857142857143, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             413, 354, 14, 2,
                             '02_14',
                             1379791.4285714284, 5226085.714285715, -21.42857142857143, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226082.142857143,
                                                   1379794.9999999998 5226082.142857143,
                                                   1379794.9999999998 5226089.285714286,
                                                   1379787.857142857 5226089.285714286,
                                                   1379787.857142857 5226082.142857143))'));
                        
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
                             413, 354, 14, 2,
                             '354',
                             1379791.4285714284, 5226085.714285715, -21.42857142857143, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             392, 283, 14, 3,
                             '03_14',
                             1379791.4285714284, 5226092.857142857, -21.42857142857143, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226089.285714285,
                                                   1379794.9999999998 5226089.285714285,
                                                   1379794.9999999998 5226096.428571429,
                                                   1379787.857142857 5226096.428571429,
                                                   1379787.857142857 5226089.285714285))'));
                        
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
                             392, 283, 14, 3,
                             '283',
                             1379791.4285714284, 5226092.857142857, -21.42857142857143, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             371, 220, 14, 4,
                             '04_14',
                             1379791.4285714284, 5226100.0, -21.42857142857143, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226096.428571428,
                                                   1379794.9999999998 5226096.428571428,
                                                   1379794.9999999998 5226103.571428572,
                                                   1379787.857142857 5226103.571428572,
                                                   1379787.857142857 5226096.428571428))'));
                        
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
                             371, 220, 14, 4,
                             '220',
                             1379791.4285714284, 5226100.0, -21.42857142857143, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             350, 165, 14, 5,
                             '05_14',
                             1379791.4285714284, 5226107.142857144, -21.42857142857143, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226103.571428572,
                                                   1379794.9999999998 5226103.571428572,
                                                   1379794.9999999998 5226110.7142857155,
                                                   1379787.857142857 5226110.7142857155,
                                                   1379787.857142857 5226103.571428572))'));
                        
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
                             350, 165, 14, 5,
                             '165',
                             1379791.4285714284, 5226107.142857144, -21.42857142857143, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             329, 118, 14, 6,
                             '06_14',
                             1379791.4285714284, 5226114.285714286, -21.42857142857143, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226110.714285715,
                                                   1379794.9999999998 5226110.714285715,
                                                   1379794.9999999998 5226117.857142858,
                                                   1379787.857142857 5226117.857142858,
                                                   1379787.857142857 5226110.714285715))'));
                        
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
                             329, 118, 14, 6,
                             '118',
                             1379791.4285714284, 5226114.285714286, -21.42857142857143, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             308, 79, 14, 7,
                             '07_14',
                             1379791.4285714284, 5226121.428571429, -21.42857142857143, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226117.857142857,
                                                   1379794.9999999998 5226117.857142857,
                                                   1379794.9999999998 5226125.000000001,
                                                   1379787.857142857 5226125.000000001,
                                                   1379787.857142857 5226117.857142857))'));
                        
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
                             308, 79, 14, 7,
                             '79',
                             1379791.4285714284, 5226121.428571429, -21.42857142857143, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             287, 48, 14, 8,
                             '08_14',
                             1379791.4285714284, 5226128.571428572, -21.42857142857143, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226125.0,
                                                   1379794.9999999998 5226125.0,
                                                   1379794.9999999998 5226132.142857144,
                                                   1379787.857142857 5226132.142857144,
                                                   1379787.857142857 5226125.0))'));
                        
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
                             287, 48, 14, 8,
                             '48',
                             1379791.4285714284, 5226128.571428572, -21.42857142857143, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             266, 25, 14, 9,
                             '09_14',
                             1379791.4285714284, 5226135.714285715, -21.42857142857143, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226132.142857143,
                                                   1379794.9999999998 5226132.142857143,
                                                   1379794.9999999998 5226139.285714286,
                                                   1379787.857142857 5226139.285714286,
                                                   1379787.857142857 5226132.142857143))'));
                        
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
                             266, 25, 14, 9,
                             '25',
                             1379791.4285714284, 5226135.714285715, -21.42857142857143, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             245, 26, 14, 10,
                             '10_14',
                             1379791.4285714284, 5226142.857142857, -21.42857142857143, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226139.285714285,
                                                   1379794.9999999998 5226139.285714285,
                                                   1379794.9999999998 5226146.428571429,
                                                   1379787.857142857 5226146.428571429,
                                                   1379787.857142857 5226139.285714285))'));
                        
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
                             245, 26, 14, 10,
                             '26',
                             1379791.4285714284, 5226142.857142857, -21.42857142857143, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             224, 27, 14, 11,
                             '11_14',
                             1379791.4285714284, 5226150.0, -21.42857142857143, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226146.428571428,
                                                   1379794.9999999998 5226146.428571428,
                                                   1379794.9999999998 5226153.571428572,
                                                   1379787.857142857 5226153.571428572,
                                                   1379787.857142857 5226146.428571428))'));
                        
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
                             224, 27, 14, 11,
                             '27',
                             1379791.4285714284, 5226150.0, -21.42857142857143, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             203, 28, 14, 12,
                             '12_14',
                             1379791.4285714284, 5226157.142857144, -21.42857142857143, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226153.571428572,
                                                   1379794.9999999998 5226153.571428572,
                                                   1379794.9999999998 5226160.7142857155,
                                                   1379787.857142857 5226160.7142857155,
                                                   1379787.857142857 5226153.571428572))'));
                        
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
                             203, 28, 14, 12,
                             '28',
                             1379791.4285714284, 5226157.142857144, -21.42857142857143, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             182, 29, 14, 13,
                             '13_14',
                             1379791.4285714284, 5226164.285714286, -21.42857142857143, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226160.714285715,
                                                   1379794.9999999998 5226160.714285715,
                                                   1379794.9999999998 5226167.857142858,
                                                   1379787.857142857 5226167.857142858,
                                                   1379787.857142857 5226160.714285715))'));
                        
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
                             182, 29, 14, 13,
                             '29',
                             1379791.4285714284, 5226164.285714286, -21.42857142857143, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             161, 30, 14, 14,
                             '14_14',
                             1379791.4285714284, 5226171.428571429, -21.42857142857143, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226167.857142857,
                                                   1379794.9999999998 5226167.857142857,
                                                   1379794.9999999998 5226175.000000001,
                                                   1379787.857142857 5226175.000000001,
                                                   1379787.857142857 5226167.857142857))'));
                        
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
                             161, 30, 14, 14,
                             '30',
                             1379791.4285714284, 5226171.428571429, -21.42857142857143, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             140, 57, 14, 15,
                             '15_14',
                             1379791.4285714284, 5226178.571428572, -21.42857142857143, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226175.0,
                                                   1379794.9999999998 5226175.0,
                                                   1379794.9999999998 5226182.142857144,
                                                   1379787.857142857 5226182.142857144,
                                                   1379787.857142857 5226175.0))'));
                        
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
                             140, 57, 14, 15,
                             '57',
                             1379791.4285714284, 5226178.571428572, -21.42857142857143, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             119, 92, 14, 16,
                             '16_14',
                             1379791.4285714284, 5226185.714285715, -21.42857142857143, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226182.142857143,
                                                   1379794.9999999998 5226182.142857143,
                                                   1379794.9999999998 5226189.285714286,
                                                   1379787.857142857 5226189.285714286,
                                                   1379787.857142857 5226182.142857143))'));
                        
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
                             119, 92, 14, 16,
                             '92',
                             1379791.4285714284, 5226185.714285715, -21.42857142857143, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             98, 135, 14, 17,
                             '17_14',
                             1379791.4285714284, 5226192.857142857, -21.42857142857143, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226189.285714285,
                                                   1379794.9999999998 5226189.285714285,
                                                   1379794.9999999998 5226196.428571429,
                                                   1379787.857142857 5226196.428571429,
                                                   1379787.857142857 5226189.285714285))'));
                        
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
                             98, 135, 14, 17,
                             '135',
                             1379791.4285714284, 5226192.857142857, -21.42857142857143, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             77, 186, 14, 18,
                             '18_14',
                             1379791.4285714284, 5226200.0, -21.42857142857143, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226196.428571428,
                                                   1379794.9999999998 5226196.428571428,
                                                   1379794.9999999998 5226203.571428572,
                                                   1379787.857142857 5226203.571428572,
                                                   1379787.857142857 5226196.428571428))'));
                        
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
                             77, 186, 14, 18,
                             '186',
                             1379791.4285714284, 5226200.0, -21.42857142857143, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             56, 245, 14, 19,
                             '19_14',
                             1379791.4285714284, 5226207.142857144, -21.42857142857143, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226203.571428572,
                                                   1379794.9999999998 5226203.571428572,
                                                   1379794.9999999998 5226210.7142857155,
                                                   1379787.857142857 5226210.7142857155,
                                                   1379787.857142857 5226203.571428572))'));
                        
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
                             56, 245, 14, 19,
                             '245',
                             1379791.4285714284, 5226207.142857144, -21.42857142857143, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             35, 312, 14, 20,
                             '20_14',
                             1379791.4285714284, 5226214.285714286, -21.42857142857143, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226210.714285715,
                                                   1379794.9999999998 5226210.714285715,
                                                   1379794.9999999998 5226217.857142858,
                                                   1379787.857142857 5226217.857142858,
                                                   1379787.857142857 5226210.714285715))'));
                        
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
                             35, 312, 14, 20,
                             '312',
                             1379791.4285714284, 5226214.285714286, -21.42857142857143, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             14, 387, 14, 21,
                             '21_14',
                             1379791.4285714284, 5226221.428571429, -21.42857142857143, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379787.857142857 5226217.857142857,
                                                   1379794.9999999998 5226217.857142857,
                                                   1379794.9999999998 5226225.000000001,
                                                   1379787.857142857 5226225.000000001,
                                                   1379787.857142857 5226217.857142857))'));
                        
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
                             14, 387, 14, 21,
                             '387',
                             1379791.4285714284, 5226221.428571429, -21.42857142857143, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379791.4285714284 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             435, 434, 15, 1,
                             '01_15',
                             1379798.5714285714, 5226078.571428572, -28.571428571428573, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226075.0,
                                                   1379802.1428571427 5226075.0,
                                                   1379802.1428571427 5226082.142857144,
                                                   1379795.0 5226082.142857144,
                                                   1379795.0 5226075.0))'));
                        
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
                             435, 434, 15, 1,
                             '434',
                             1379798.5714285714, 5226078.571428572, -28.571428571428573, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             414, 355, 15, 2,
                             '02_15',
                             1379798.5714285714, 5226085.714285715, -28.571428571428573, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226082.142857143,
                                                   1379802.1428571427 5226082.142857143,
                                                   1379802.1428571427 5226089.285714286,
                                                   1379795.0 5226089.285714286,
                                                   1379795.0 5226082.142857143))'));
                        
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
                             414, 355, 15, 2,
                             '355',
                             1379798.5714285714, 5226085.714285715, -28.571428571428573, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             393, 284, 15, 3,
                             '03_15',
                             1379798.5714285714, 5226092.857142857, -28.571428571428573, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226089.285714285,
                                                   1379802.1428571427 5226089.285714285,
                                                   1379802.1428571427 5226096.428571429,
                                                   1379795.0 5226096.428571429,
                                                   1379795.0 5226089.285714285))'));
                        
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
                             393, 284, 15, 3,
                             '284',
                             1379798.5714285714, 5226092.857142857, -28.571428571428573, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             372, 221, 15, 4,
                             '04_15',
                             1379798.5714285714, 5226100.0, -28.571428571428573, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226096.428571428,
                                                   1379802.1428571427 5226096.428571428,
                                                   1379802.1428571427 5226103.571428572,
                                                   1379795.0 5226103.571428572,
                                                   1379795.0 5226096.428571428))'));
                        
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
                             372, 221, 15, 4,
                             '221',
                             1379798.5714285714, 5226100.0, -28.571428571428573, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             351, 166, 15, 5,
                             '05_15',
                             1379798.5714285714, 5226107.142857144, -28.571428571428573, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226103.571428572,
                                                   1379802.1428571427 5226103.571428572,
                                                   1379802.1428571427 5226110.7142857155,
                                                   1379795.0 5226110.7142857155,
                                                   1379795.0 5226103.571428572))'));
                        
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
                             351, 166, 15, 5,
                             '166',
                             1379798.5714285714, 5226107.142857144, -28.571428571428573, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             330, 119, 15, 6,
                             '06_15',
                             1379798.5714285714, 5226114.285714286, -28.571428571428573, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226110.714285715,
                                                   1379802.1428571427 5226110.714285715,
                                                   1379802.1428571427 5226117.857142858,
                                                   1379795.0 5226117.857142858,
                                                   1379795.0 5226110.714285715))'));
                        
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
                             330, 119, 15, 6,
                             '119',
                             1379798.5714285714, 5226114.285714286, -28.571428571428573, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             309, 80, 15, 7,
                             '07_15',
                             1379798.5714285714, 5226121.428571429, -28.571428571428573, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226117.857142857,
                                                   1379802.1428571427 5226117.857142857,
                                                   1379802.1428571427 5226125.000000001,
                                                   1379795.0 5226125.000000001,
                                                   1379795.0 5226117.857142857))'));
                        
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
                             309, 80, 15, 7,
                             '80',
                             1379798.5714285714, 5226121.428571429, -28.571428571428573, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             288, 49, 15, 8,
                             '08_15',
                             1379798.5714285714, 5226128.571428572, -28.571428571428573, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226125.0,
                                                   1379802.1428571427 5226125.0,
                                                   1379802.1428571427 5226132.142857144,
                                                   1379795.0 5226132.142857144,
                                                   1379795.0 5226125.0))'));
                        
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
                             288, 49, 15, 8,
                             '49',
                             1379798.5714285714, 5226128.571428572, -28.571428571428573, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             267, 50, 15, 9,
                             '09_15',
                             1379798.5714285714, 5226135.714285715, -28.571428571428573, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226132.142857143,
                                                   1379802.1428571427 5226132.142857143,
                                                   1379802.1428571427 5226139.285714286,
                                                   1379795.0 5226139.285714286,
                                                   1379795.0 5226132.142857143))'));
                        
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
                             267, 50, 15, 9,
                             '50',
                             1379798.5714285714, 5226135.714285715, -28.571428571428573, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             246, 51, 15, 10,
                             '10_15',
                             1379798.5714285714, 5226142.857142857, -28.571428571428573, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226139.285714285,
                                                   1379802.1428571427 5226139.285714285,
                                                   1379802.1428571427 5226146.428571429,
                                                   1379795.0 5226146.428571429,
                                                   1379795.0 5226139.285714285))'));
                        
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
                             246, 51, 15, 10,
                             '51',
                             1379798.5714285714, 5226142.857142857, -28.571428571428573, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             225, 52, 15, 11,
                             '11_15',
                             1379798.5714285714, 5226150.0, -28.571428571428573, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226146.428571428,
                                                   1379802.1428571427 5226146.428571428,
                                                   1379802.1428571427 5226153.571428572,
                                                   1379795.0 5226153.571428572,
                                                   1379795.0 5226146.428571428))'));
                        
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
                             225, 52, 15, 11,
                             '52',
                             1379798.5714285714, 5226150.0, -28.571428571428573, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             204, 53, 15, 12,
                             '12_15',
                             1379798.5714285714, 5226157.142857144, -28.571428571428573, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226153.571428572,
                                                   1379802.1428571427 5226153.571428572,
                                                   1379802.1428571427 5226160.7142857155,
                                                   1379795.0 5226160.7142857155,
                                                   1379795.0 5226153.571428572))'));
                        
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
                             204, 53, 15, 12,
                             '53',
                             1379798.5714285714, 5226157.142857144, -28.571428571428573, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             183, 54, 15, 13,
                             '13_15',
                             1379798.5714285714, 5226164.285714286, -28.571428571428573, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226160.714285715,
                                                   1379802.1428571427 5226160.714285715,
                                                   1379802.1428571427 5226167.857142858,
                                                   1379795.0 5226167.857142858,
                                                   1379795.0 5226160.714285715))'));
                        
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
                             183, 54, 15, 13,
                             '54',
                             1379798.5714285714, 5226164.285714286, -28.571428571428573, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             162, 55, 15, 14,
                             '14_15',
                             1379798.5714285714, 5226171.428571429, -28.571428571428573, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226167.857142857,
                                                   1379802.1428571427 5226167.857142857,
                                                   1379802.1428571427 5226175.000000001,
                                                   1379795.0 5226175.000000001,
                                                   1379795.0 5226167.857142857))'));
                        
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
                             162, 55, 15, 14,
                             '55',
                             1379798.5714285714, 5226171.428571429, -28.571428571428573, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             141, 56, 15, 15,
                             '15_15',
                             1379798.5714285714, 5226178.571428572, -28.571428571428573, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226175.0,
                                                   1379802.1428571427 5226175.0,
                                                   1379802.1428571427 5226182.142857144,
                                                   1379795.0 5226182.142857144,
                                                   1379795.0 5226175.0))'));
                        
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
                             141, 56, 15, 15,
                             '56',
                             1379798.5714285714, 5226178.571428572, -28.571428571428573, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             120, 91, 15, 16,
                             '16_15',
                             1379798.5714285714, 5226185.714285715, -28.571428571428573, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226182.142857143,
                                                   1379802.1428571427 5226182.142857143,
                                                   1379802.1428571427 5226189.285714286,
                                                   1379795.0 5226189.285714286,
                                                   1379795.0 5226182.142857143))'));
                        
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
                             120, 91, 15, 16,
                             '91',
                             1379798.5714285714, 5226185.714285715, -28.571428571428573, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             99, 134, 15, 17,
                             '17_15',
                             1379798.5714285714, 5226192.857142857, -28.571428571428573, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226189.285714285,
                                                   1379802.1428571427 5226189.285714285,
                                                   1379802.1428571427 5226196.428571429,
                                                   1379795.0 5226196.428571429,
                                                   1379795.0 5226189.285714285))'));
                        
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
                             99, 134, 15, 17,
                             '134',
                             1379798.5714285714, 5226192.857142857, -28.571428571428573, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             78, 185, 15, 18,
                             '18_15',
                             1379798.5714285714, 5226200.0, -28.571428571428573, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226196.428571428,
                                                   1379802.1428571427 5226196.428571428,
                                                   1379802.1428571427 5226203.571428572,
                                                   1379795.0 5226203.571428572,
                                                   1379795.0 5226196.428571428))'));
                        
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
                             78, 185, 15, 18,
                             '185',
                             1379798.5714285714, 5226200.0, -28.571428571428573, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             57, 244, 15, 19,
                             '19_15',
                             1379798.5714285714, 5226207.142857144, -28.571428571428573, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226203.571428572,
                                                   1379802.1428571427 5226203.571428572,
                                                   1379802.1428571427 5226210.7142857155,
                                                   1379795.0 5226210.7142857155,
                                                   1379795.0 5226203.571428572))'));
                        
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
                             57, 244, 15, 19,
                             '244',
                             1379798.5714285714, 5226207.142857144, -28.571428571428573, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             36, 311, 15, 20,
                             '20_15',
                             1379798.5714285714, 5226214.285714286, -28.571428571428573, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226210.714285715,
                                                   1379802.1428571427 5226210.714285715,
                                                   1379802.1428571427 5226217.857142858,
                                                   1379795.0 5226217.857142858,
                                                   1379795.0 5226210.714285715))'));
                        
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
                             36, 311, 15, 20,
                             '311',
                             1379798.5714285714, 5226214.285714286, -28.571428571428573, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             15, 386, 15, 21,
                             '21_15',
                             1379798.5714285714, 5226221.428571429, -28.571428571428573, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379795.0 5226217.857142857,
                                                   1379802.1428571427 5226217.857142857,
                                                   1379802.1428571427 5226225.000000001,
                                                   1379795.0 5226225.000000001,
                                                   1379795.0 5226217.857142857))'));
                        
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
                             15, 386, 15, 21,
                             '386',
                             1379798.5714285714, 5226221.428571429, -28.571428571428573, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379798.5714285714 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             436, 435, 16, 1,
                             '01_16',
                             1379805.7142857143, 5226078.571428572, -35.714285714285715, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226075.0,
                                                   1379809.2857142857 5226075.0,
                                                   1379809.2857142857 5226082.142857144,
                                                   1379802.142857143 5226082.142857144,
                                                   1379802.142857143 5226075.0))'));
                        
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
                             436, 435, 16, 1,
                             '435',
                             1379805.7142857143, 5226078.571428572, -35.714285714285715, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             415, 356, 16, 2,
                             '02_16',
                             1379805.7142857143, 5226085.714285715, -35.714285714285715, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226082.142857143,
                                                   1379809.2857142857 5226082.142857143,
                                                   1379809.2857142857 5226089.285714286,
                                                   1379802.142857143 5226089.285714286,
                                                   1379802.142857143 5226082.142857143))'));
                        
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
                             415, 356, 16, 2,
                             '356',
                             1379805.7142857143, 5226085.714285715, -35.714285714285715, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             394, 285, 16, 3,
                             '03_16',
                             1379805.7142857143, 5226092.857142857, -35.714285714285715, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226089.285714285,
                                                   1379809.2857142857 5226089.285714285,
                                                   1379809.2857142857 5226096.428571429,
                                                   1379802.142857143 5226096.428571429,
                                                   1379802.142857143 5226089.285714285))'));
                        
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
                             394, 285, 16, 3,
                             '285',
                             1379805.7142857143, 5226092.857142857, -35.714285714285715, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             373, 222, 16, 4,
                             '04_16',
                             1379805.7142857143, 5226100.0, -35.714285714285715, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226096.428571428,
                                                   1379809.2857142857 5226096.428571428,
                                                   1379809.2857142857 5226103.571428572,
                                                   1379802.142857143 5226103.571428572,
                                                   1379802.142857143 5226096.428571428))'));
                        
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
                             373, 222, 16, 4,
                             '222',
                             1379805.7142857143, 5226100.0, -35.714285714285715, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             352, 167, 16, 5,
                             '05_16',
                             1379805.7142857143, 5226107.142857144, -35.714285714285715, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226103.571428572,
                                                   1379809.2857142857 5226103.571428572,
                                                   1379809.2857142857 5226110.7142857155,
                                                   1379802.142857143 5226110.7142857155,
                                                   1379802.142857143 5226103.571428572))'));
                        
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
                             352, 167, 16, 5,
                             '167',
                             1379805.7142857143, 5226107.142857144, -35.714285714285715, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             331, 120, 16, 6,
                             '06_16',
                             1379805.7142857143, 5226114.285714286, -35.714285714285715, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226110.714285715,
                                                   1379809.2857142857 5226110.714285715,
                                                   1379809.2857142857 5226117.857142858,
                                                   1379802.142857143 5226117.857142858,
                                                   1379802.142857143 5226110.714285715))'));
                        
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
                             331, 120, 16, 6,
                             '120',
                             1379805.7142857143, 5226114.285714286, -35.714285714285715, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             310, 81, 16, 7,
                             '07_16',
                             1379805.7142857143, 5226121.428571429, -35.714285714285715, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226117.857142857,
                                                   1379809.2857142857 5226117.857142857,
                                                   1379809.2857142857 5226125.000000001,
                                                   1379802.142857143 5226125.000000001,
                                                   1379802.142857143 5226117.857142857))'));
                        
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
                             310, 81, 16, 7,
                             '81',
                             1379805.7142857143, 5226121.428571429, -35.714285714285715, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             289, 82, 16, 8,
                             '08_16',
                             1379805.7142857143, 5226128.571428572, -35.714285714285715, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226125.0,
                                                   1379809.2857142857 5226125.0,
                                                   1379809.2857142857 5226132.142857144,
                                                   1379802.142857143 5226132.142857144,
                                                   1379802.142857143 5226125.0))'));
                        
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
                             289, 82, 16, 8,
                             '82',
                             1379805.7142857143, 5226128.571428572, -35.714285714285715, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             268, 83, 16, 9,
                             '09_16',
                             1379805.7142857143, 5226135.714285715, -35.714285714285715, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226132.142857143,
                                                   1379809.2857142857 5226132.142857143,
                                                   1379809.2857142857 5226139.285714286,
                                                   1379802.142857143 5226139.285714286,
                                                   1379802.142857143 5226132.142857143))'));
                        
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
                             268, 83, 16, 9,
                             '83',
                             1379805.7142857143, 5226135.714285715, -35.714285714285715, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             247, 84, 16, 10,
                             '10_16',
                             1379805.7142857143, 5226142.857142857, -35.714285714285715, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226139.285714285,
                                                   1379809.2857142857 5226139.285714285,
                                                   1379809.2857142857 5226146.428571429,
                                                   1379802.142857143 5226146.428571429,
                                                   1379802.142857143 5226139.285714285))'));
                        
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
                             247, 84, 16, 10,
                             '84',
                             1379805.7142857143, 5226142.857142857, -35.714285714285715, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             226, 85, 16, 11,
                             '11_16',
                             1379805.7142857143, 5226150.0, -35.714285714285715, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226146.428571428,
                                                   1379809.2857142857 5226146.428571428,
                                                   1379809.2857142857 5226153.571428572,
                                                   1379802.142857143 5226153.571428572,
                                                   1379802.142857143 5226146.428571428))'));
                        
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
                             226, 85, 16, 11,
                             '85',
                             1379805.7142857143, 5226150.0, -35.714285714285715, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             205, 86, 16, 12,
                             '12_16',
                             1379805.7142857143, 5226157.142857144, -35.714285714285715, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226153.571428572,
                                                   1379809.2857142857 5226153.571428572,
                                                   1379809.2857142857 5226160.7142857155,
                                                   1379802.142857143 5226160.7142857155,
                                                   1379802.142857143 5226153.571428572))'));
                        
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
                             205, 86, 16, 12,
                             '86',
                             1379805.7142857143, 5226157.142857144, -35.714285714285715, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             184, 87, 16, 13,
                             '13_16',
                             1379805.7142857143, 5226164.285714286, -35.714285714285715, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226160.714285715,
                                                   1379809.2857142857 5226160.714285715,
                                                   1379809.2857142857 5226167.857142858,
                                                   1379802.142857143 5226167.857142858,
                                                   1379802.142857143 5226160.714285715))'));
                        
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
                             184, 87, 16, 13,
                             '87',
                             1379805.7142857143, 5226164.285714286, -35.714285714285715, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             163, 88, 16, 14,
                             '14_16',
                             1379805.7142857143, 5226171.428571429, -35.714285714285715, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226167.857142857,
                                                   1379809.2857142857 5226167.857142857,
                                                   1379809.2857142857 5226175.000000001,
                                                   1379802.142857143 5226175.000000001,
                                                   1379802.142857143 5226167.857142857))'));
                        
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
                             163, 88, 16, 14,
                             '88',
                             1379805.7142857143, 5226171.428571429, -35.714285714285715, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             142, 89, 16, 15,
                             '15_16',
                             1379805.7142857143, 5226178.571428572, -35.714285714285715, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226175.0,
                                                   1379809.2857142857 5226175.0,
                                                   1379809.2857142857 5226182.142857144,
                                                   1379802.142857143 5226182.142857144,
                                                   1379802.142857143 5226175.0))'));
                        
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
                             142, 89, 16, 15,
                             '89',
                             1379805.7142857143, 5226178.571428572, -35.714285714285715, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             121, 90, 16, 16,
                             '16_16',
                             1379805.7142857143, 5226185.714285715, -35.714285714285715, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226182.142857143,
                                                   1379809.2857142857 5226182.142857143,
                                                   1379809.2857142857 5226189.285714286,
                                                   1379802.142857143 5226189.285714286,
                                                   1379802.142857143 5226182.142857143))'));
                        
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
                             121, 90, 16, 16,
                             '90',
                             1379805.7142857143, 5226185.714285715, -35.714285714285715, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             100, 133, 16, 17,
                             '17_16',
                             1379805.7142857143, 5226192.857142857, -35.714285714285715, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226189.285714285,
                                                   1379809.2857142857 5226189.285714285,
                                                   1379809.2857142857 5226196.428571429,
                                                   1379802.142857143 5226196.428571429,
                                                   1379802.142857143 5226189.285714285))'));
                        
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
                             100, 133, 16, 17,
                             '133',
                             1379805.7142857143, 5226192.857142857, -35.714285714285715, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             79, 184, 16, 18,
                             '18_16',
                             1379805.7142857143, 5226200.0, -35.714285714285715, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226196.428571428,
                                                   1379809.2857142857 5226196.428571428,
                                                   1379809.2857142857 5226203.571428572,
                                                   1379802.142857143 5226203.571428572,
                                                   1379802.142857143 5226196.428571428))'));
                        
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
                             79, 184, 16, 18,
                             '184',
                             1379805.7142857143, 5226200.0, -35.714285714285715, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             58, 243, 16, 19,
                             '19_16',
                             1379805.7142857143, 5226207.142857144, -35.714285714285715, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226203.571428572,
                                                   1379809.2857142857 5226203.571428572,
                                                   1379809.2857142857 5226210.7142857155,
                                                   1379802.142857143 5226210.7142857155,
                                                   1379802.142857143 5226203.571428572))'));
                        
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
                             58, 243, 16, 19,
                             '243',
                             1379805.7142857143, 5226207.142857144, -35.714285714285715, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             37, 310, 16, 20,
                             '20_16',
                             1379805.7142857143, 5226214.285714286, -35.714285714285715, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226210.714285715,
                                                   1379809.2857142857 5226210.714285715,
                                                   1379809.2857142857 5226217.857142858,
                                                   1379802.142857143 5226217.857142858,
                                                   1379802.142857143 5226210.714285715))'));
                        
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
                             37, 310, 16, 20,
                             '310',
                             1379805.7142857143, 5226214.285714286, -35.714285714285715, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             16, 385, 16, 21,
                             '21_16',
                             1379805.7142857143, 5226221.428571429, -35.714285714285715, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379802.142857143 5226217.857142857,
                                                   1379809.2857142857 5226217.857142857,
                                                   1379809.2857142857 5226225.000000001,
                                                   1379802.142857143 5226225.000000001,
                                                   1379802.142857143 5226217.857142857))'));
                        
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
                             16, 385, 16, 21,
                             '385',
                             1379805.7142857143, 5226221.428571429, -35.714285714285715, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379805.7142857143 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             437, 436, 17, 1,
                             '01_17',
                             1379812.857142857, 5226078.571428572, -42.85714285714286, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226075.0,
                                                   1379816.4285714284 5226075.0,
                                                   1379816.4285714284 5226082.142857144,
                                                   1379809.2857142857 5226082.142857144,
                                                   1379809.2857142857 5226075.0))'));
                        
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
                             437, 436, 17, 1,
                             '436',
                             1379812.857142857, 5226078.571428572, -42.85714285714286, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             416, 357, 17, 2,
                             '02_17',
                             1379812.857142857, 5226085.714285715, -42.85714285714286, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226082.142857143,
                                                   1379816.4285714284 5226082.142857143,
                                                   1379816.4285714284 5226089.285714286,
                                                   1379809.2857142857 5226089.285714286,
                                                   1379809.2857142857 5226082.142857143))'));
                        
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
                             416, 357, 17, 2,
                             '357',
                             1379812.857142857, 5226085.714285715, -42.85714285714286, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             395, 286, 17, 3,
                             '03_17',
                             1379812.857142857, 5226092.857142857, -42.85714285714286, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226089.285714285,
                                                   1379816.4285714284 5226089.285714285,
                                                   1379816.4285714284 5226096.428571429,
                                                   1379809.2857142857 5226096.428571429,
                                                   1379809.2857142857 5226089.285714285))'));
                        
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
                             395, 286, 17, 3,
                             '286',
                             1379812.857142857, 5226092.857142857, -42.85714285714286, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             374, 223, 17, 4,
                             '04_17',
                             1379812.857142857, 5226100.0, -42.85714285714286, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226096.428571428,
                                                   1379816.4285714284 5226096.428571428,
                                                   1379816.4285714284 5226103.571428572,
                                                   1379809.2857142857 5226103.571428572,
                                                   1379809.2857142857 5226096.428571428))'));
                        
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
                             374, 223, 17, 4,
                             '223',
                             1379812.857142857, 5226100.0, -42.85714285714286, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             353, 168, 17, 5,
                             '05_17',
                             1379812.857142857, 5226107.142857144, -42.85714285714286, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226103.571428572,
                                                   1379816.4285714284 5226103.571428572,
                                                   1379816.4285714284 5226110.7142857155,
                                                   1379809.2857142857 5226110.7142857155,
                                                   1379809.2857142857 5226103.571428572))'));
                        
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
                             353, 168, 17, 5,
                             '168',
                             1379812.857142857, 5226107.142857144, -42.85714285714286, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             332, 121, 17, 6,
                             '06_17',
                             1379812.857142857, 5226114.285714286, -42.85714285714286, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226110.714285715,
                                                   1379816.4285714284 5226110.714285715,
                                                   1379816.4285714284 5226117.857142858,
                                                   1379809.2857142857 5226117.857142858,
                                                   1379809.2857142857 5226110.714285715))'));
                        
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
                             332, 121, 17, 6,
                             '121',
                             1379812.857142857, 5226114.285714286, -42.85714285714286, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             311, 122, 17, 7,
                             '07_17',
                             1379812.857142857, 5226121.428571429, -42.85714285714286, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226117.857142857,
                                                   1379816.4285714284 5226117.857142857,
                                                   1379816.4285714284 5226125.000000001,
                                                   1379809.2857142857 5226125.000000001,
                                                   1379809.2857142857 5226117.857142857))'));
                        
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
                             311, 122, 17, 7,
                             '122',
                             1379812.857142857, 5226121.428571429, -42.85714285714286, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             290, 123, 17, 8,
                             '08_17',
                             1379812.857142857, 5226128.571428572, -42.85714285714286, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226125.0,
                                                   1379816.4285714284 5226125.0,
                                                   1379816.4285714284 5226132.142857144,
                                                   1379809.2857142857 5226132.142857144,
                                                   1379809.2857142857 5226125.0))'));
                        
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
                             290, 123, 17, 8,
                             '123',
                             1379812.857142857, 5226128.571428572, -42.85714285714286, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             269, 124, 17, 9,
                             '09_17',
                             1379812.857142857, 5226135.714285715, -42.85714285714286, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226132.142857143,
                                                   1379816.4285714284 5226132.142857143,
                                                   1379816.4285714284 5226139.285714286,
                                                   1379809.2857142857 5226139.285714286,
                                                   1379809.2857142857 5226132.142857143))'));
                        
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
                             269, 124, 17, 9,
                             '124',
                             1379812.857142857, 5226135.714285715, -42.85714285714286, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             248, 125, 17, 10,
                             '10_17',
                             1379812.857142857, 5226142.857142857, -42.85714285714286, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226139.285714285,
                                                   1379816.4285714284 5226139.285714285,
                                                   1379816.4285714284 5226146.428571429,
                                                   1379809.2857142857 5226146.428571429,
                                                   1379809.2857142857 5226139.285714285))'));
                        
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
                             248, 125, 17, 10,
                             '125',
                             1379812.857142857, 5226142.857142857, -42.85714285714286, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             227, 126, 17, 11,
                             '11_17',
                             1379812.857142857, 5226150.0, -42.85714285714286, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226146.428571428,
                                                   1379816.4285714284 5226146.428571428,
                                                   1379816.4285714284 5226153.571428572,
                                                   1379809.2857142857 5226153.571428572,
                                                   1379809.2857142857 5226146.428571428))'));
                        
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
                             227, 126, 17, 11,
                             '126',
                             1379812.857142857, 5226150.0, -42.85714285714286, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             206, 127, 17, 12,
                             '12_17',
                             1379812.857142857, 5226157.142857144, -42.85714285714286, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226153.571428572,
                                                   1379816.4285714284 5226153.571428572,
                                                   1379816.4285714284 5226160.7142857155,
                                                   1379809.2857142857 5226160.7142857155,
                                                   1379809.2857142857 5226153.571428572))'));
                        
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
                             206, 127, 17, 12,
                             '127',
                             1379812.857142857, 5226157.142857144, -42.85714285714286, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             185, 128, 17, 13,
                             '13_17',
                             1379812.857142857, 5226164.285714286, -42.85714285714286, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226160.714285715,
                                                   1379816.4285714284 5226160.714285715,
                                                   1379816.4285714284 5226167.857142858,
                                                   1379809.2857142857 5226167.857142858,
                                                   1379809.2857142857 5226160.714285715))'));
                        
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
                             185, 128, 17, 13,
                             '128',
                             1379812.857142857, 5226164.285714286, -42.85714285714286, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             164, 129, 17, 14,
                             '14_17',
                             1379812.857142857, 5226171.428571429, -42.85714285714286, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226167.857142857,
                                                   1379816.4285714284 5226167.857142857,
                                                   1379816.4285714284 5226175.000000001,
                                                   1379809.2857142857 5226175.000000001,
                                                   1379809.2857142857 5226167.857142857))'));
                        
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
                             164, 129, 17, 14,
                             '129',
                             1379812.857142857, 5226171.428571429, -42.85714285714286, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             143, 130, 17, 15,
                             '15_17',
                             1379812.857142857, 5226178.571428572, -42.85714285714286, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226175.0,
                                                   1379816.4285714284 5226175.0,
                                                   1379816.4285714284 5226182.142857144,
                                                   1379809.2857142857 5226182.142857144,
                                                   1379809.2857142857 5226175.0))'));
                        
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
                             143, 130, 17, 15,
                             '130',
                             1379812.857142857, 5226178.571428572, -42.85714285714286, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             122, 131, 17, 16,
                             '16_17',
                             1379812.857142857, 5226185.714285715, -42.85714285714286, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226182.142857143,
                                                   1379816.4285714284 5226182.142857143,
                                                   1379816.4285714284 5226189.285714286,
                                                   1379809.2857142857 5226189.285714286,
                                                   1379809.2857142857 5226182.142857143))'));
                        
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
                             122, 131, 17, 16,
                             '131',
                             1379812.857142857, 5226185.714285715, -42.85714285714286, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             101, 132, 17, 17,
                             '17_17',
                             1379812.857142857, 5226192.857142857, -42.85714285714286, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226189.285714285,
                                                   1379816.4285714284 5226189.285714285,
                                                   1379816.4285714284 5226196.428571429,
                                                   1379809.2857142857 5226196.428571429,
                                                   1379809.2857142857 5226189.285714285))'));
                        
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
                             101, 132, 17, 17,
                             '132',
                             1379812.857142857, 5226192.857142857, -42.85714285714286, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             80, 183, 17, 18,
                             '18_17',
                             1379812.857142857, 5226200.0, -42.85714285714286, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226196.428571428,
                                                   1379816.4285714284 5226196.428571428,
                                                   1379816.4285714284 5226203.571428572,
                                                   1379809.2857142857 5226203.571428572,
                                                   1379809.2857142857 5226196.428571428))'));
                        
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
                             80, 183, 17, 18,
                             '183',
                             1379812.857142857, 5226200.0, -42.85714285714286, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             59, 242, 17, 19,
                             '19_17',
                             1379812.857142857, 5226207.142857144, -42.85714285714286, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226203.571428572,
                                                   1379816.4285714284 5226203.571428572,
                                                   1379816.4285714284 5226210.7142857155,
                                                   1379809.2857142857 5226210.7142857155,
                                                   1379809.2857142857 5226203.571428572))'));
                        
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
                             59, 242, 17, 19,
                             '242',
                             1379812.857142857, 5226207.142857144, -42.85714285714286, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             38, 309, 17, 20,
                             '20_17',
                             1379812.857142857, 5226214.285714286, -42.85714285714286, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226210.714285715,
                                                   1379816.4285714284 5226210.714285715,
                                                   1379816.4285714284 5226217.857142858,
                                                   1379809.2857142857 5226217.857142858,
                                                   1379809.2857142857 5226210.714285715))'));
                        
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
                             38, 309, 17, 20,
                             '309',
                             1379812.857142857, 5226214.285714286, -42.85714285714286, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             17, 384, 17, 21,
                             '21_17',
                             1379812.857142857, 5226221.428571429, -42.85714285714286, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379809.2857142857 5226217.857142857,
                                                   1379816.4285714284 5226217.857142857,
                                                   1379816.4285714284 5226225.000000001,
                                                   1379809.2857142857 5226225.000000001,
                                                   1379809.2857142857 5226217.857142857))'));
                        
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
                             17, 384, 17, 21,
                             '384',
                             1379812.857142857, 5226221.428571429, -42.85714285714286, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379812.857142857 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             438, 437, 18, 1,
                             '01_18',
                             1379820.0, 5226078.571428572, -50.0, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226075.0,
                                                   1379823.5714285714 5226075.0,
                                                   1379823.5714285714 5226082.142857144,
                                                   1379816.4285714286 5226082.142857144,
                                                   1379816.4285714286 5226075.0))'));
                        
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
                             438, 437, 18, 1,
                             '437',
                             1379820.0, 5226078.571428572, -50.0, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             417, 358, 18, 2,
                             '02_18',
                             1379820.0, 5226085.714285715, -50.0, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226082.142857143,
                                                   1379823.5714285714 5226082.142857143,
                                                   1379823.5714285714 5226089.285714286,
                                                   1379816.4285714286 5226089.285714286,
                                                   1379816.4285714286 5226082.142857143))'));
                        
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
                             417, 358, 18, 2,
                             '358',
                             1379820.0, 5226085.714285715, -50.0, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             396, 287, 18, 3,
                             '03_18',
                             1379820.0, 5226092.857142857, -50.0, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226089.285714285,
                                                   1379823.5714285714 5226089.285714285,
                                                   1379823.5714285714 5226096.428571429,
                                                   1379816.4285714286 5226096.428571429,
                                                   1379816.4285714286 5226089.285714285))'));
                        
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
                             396, 287, 18, 3,
                             '287',
                             1379820.0, 5226092.857142857, -50.0, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             375, 224, 18, 4,
                             '04_18',
                             1379820.0, 5226100.0, -50.0, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226096.428571428,
                                                   1379823.5714285714 5226096.428571428,
                                                   1379823.5714285714 5226103.571428572,
                                                   1379816.4285714286 5226103.571428572,
                                                   1379816.4285714286 5226096.428571428))'));
                        
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
                             375, 224, 18, 4,
                             '224',
                             1379820.0, 5226100.0, -50.0, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             354, 169, 18, 5,
                             '05_18',
                             1379820.0, 5226107.142857144, -50.0, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226103.571428572,
                                                   1379823.5714285714 5226103.571428572,
                                                   1379823.5714285714 5226110.7142857155,
                                                   1379816.4285714286 5226110.7142857155,
                                                   1379816.4285714286 5226103.571428572))'));
                        
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
                             354, 169, 18, 5,
                             '169',
                             1379820.0, 5226107.142857144, -50.0, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             333, 170, 18, 6,
                             '06_18',
                             1379820.0, 5226114.285714286, -50.0, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226110.714285715,
                                                   1379823.5714285714 5226110.714285715,
                                                   1379823.5714285714 5226117.857142858,
                                                   1379816.4285714286 5226117.857142858,
                                                   1379816.4285714286 5226110.714285715))'));
                        
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
                             333, 170, 18, 6,
                             '170',
                             1379820.0, 5226114.285714286, -50.0, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             312, 171, 18, 7,
                             '07_18',
                             1379820.0, 5226121.428571429, -50.0, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226117.857142857,
                                                   1379823.5714285714 5226117.857142857,
                                                   1379823.5714285714 5226125.000000001,
                                                   1379816.4285714286 5226125.000000001,
                                                   1379816.4285714286 5226117.857142857))'));
                        
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
                             312, 171, 18, 7,
                             '171',
                             1379820.0, 5226121.428571429, -50.0, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             291, 172, 18, 8,
                             '08_18',
                             1379820.0, 5226128.571428572, -50.0, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226125.0,
                                                   1379823.5714285714 5226125.0,
                                                   1379823.5714285714 5226132.142857144,
                                                   1379816.4285714286 5226132.142857144,
                                                   1379816.4285714286 5226125.0))'));
                        
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
                             291, 172, 18, 8,
                             '172',
                             1379820.0, 5226128.571428572, -50.0, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             270, 173, 18, 9,
                             '09_18',
                             1379820.0, 5226135.714285715, -50.0, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226132.142857143,
                                                   1379823.5714285714 5226132.142857143,
                                                   1379823.5714285714 5226139.285714286,
                                                   1379816.4285714286 5226139.285714286,
                                                   1379816.4285714286 5226132.142857143))'));
                        
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
                             270, 173, 18, 9,
                             '173',
                             1379820.0, 5226135.714285715, -50.0, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             249, 174, 18, 10,
                             '10_18',
                             1379820.0, 5226142.857142857, -50.0, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226139.285714285,
                                                   1379823.5714285714 5226139.285714285,
                                                   1379823.5714285714 5226146.428571429,
                                                   1379816.4285714286 5226146.428571429,
                                                   1379816.4285714286 5226139.285714285))'));
                        
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
                             249, 174, 18, 10,
                             '174',
                             1379820.0, 5226142.857142857, -50.0, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             228, 175, 18, 11,
                             '11_18',
                             1379820.0, 5226150.0, -50.0, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226146.428571428,
                                                   1379823.5714285714 5226146.428571428,
                                                   1379823.5714285714 5226153.571428572,
                                                   1379816.4285714286 5226153.571428572,
                                                   1379816.4285714286 5226146.428571428))'));
                        
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
                             228, 175, 18, 11,
                             '175',
                             1379820.0, 5226150.0, -50.0, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             207, 176, 18, 12,
                             '12_18',
                             1379820.0, 5226157.142857144, -50.0, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226153.571428572,
                                                   1379823.5714285714 5226153.571428572,
                                                   1379823.5714285714 5226160.7142857155,
                                                   1379816.4285714286 5226160.7142857155,
                                                   1379816.4285714286 5226153.571428572))'));
                        
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
                             207, 176, 18, 12,
                             '176',
                             1379820.0, 5226157.142857144, -50.0, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             186, 177, 18, 13,
                             '13_18',
                             1379820.0, 5226164.285714286, -50.0, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226160.714285715,
                                                   1379823.5714285714 5226160.714285715,
                                                   1379823.5714285714 5226167.857142858,
                                                   1379816.4285714286 5226167.857142858,
                                                   1379816.4285714286 5226160.714285715))'));
                        
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
                             186, 177, 18, 13,
                             '177',
                             1379820.0, 5226164.285714286, -50.0, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             165, 178, 18, 14,
                             '14_18',
                             1379820.0, 5226171.428571429, -50.0, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226167.857142857,
                                                   1379823.5714285714 5226167.857142857,
                                                   1379823.5714285714 5226175.000000001,
                                                   1379816.4285714286 5226175.000000001,
                                                   1379816.4285714286 5226167.857142857))'));
                        
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
                             165, 178, 18, 14,
                             '178',
                             1379820.0, 5226171.428571429, -50.0, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             144, 179, 18, 15,
                             '15_18',
                             1379820.0, 5226178.571428572, -50.0, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226175.0,
                                                   1379823.5714285714 5226175.0,
                                                   1379823.5714285714 5226182.142857144,
                                                   1379816.4285714286 5226182.142857144,
                                                   1379816.4285714286 5226175.0))'));
                        
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
                             144, 179, 18, 15,
                             '179',
                             1379820.0, 5226178.571428572, -50.0, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             123, 180, 18, 16,
                             '16_18',
                             1379820.0, 5226185.714285715, -50.0, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226182.142857143,
                                                   1379823.5714285714 5226182.142857143,
                                                   1379823.5714285714 5226189.285714286,
                                                   1379816.4285714286 5226189.285714286,
                                                   1379816.4285714286 5226182.142857143))'));
                        
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
                             123, 180, 18, 16,
                             '180',
                             1379820.0, 5226185.714285715, -50.0, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             102, 181, 18, 17,
                             '17_18',
                             1379820.0, 5226192.857142857, -50.0, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226189.285714285,
                                                   1379823.5714285714 5226189.285714285,
                                                   1379823.5714285714 5226196.428571429,
                                                   1379816.4285714286 5226196.428571429,
                                                   1379816.4285714286 5226189.285714285))'));
                        
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
                             102, 181, 18, 17,
                             '181',
                             1379820.0, 5226192.857142857, -50.0, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             81, 182, 18, 18,
                             '18_18',
                             1379820.0, 5226200.0, -50.0, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226196.428571428,
                                                   1379823.5714285714 5226196.428571428,
                                                   1379823.5714285714 5226203.571428572,
                                                   1379816.4285714286 5226203.571428572,
                                                   1379816.4285714286 5226196.428571428))'));
                        
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
                             81, 182, 18, 18,
                             '182',
                             1379820.0, 5226200.0, -50.0, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             60, 241, 18, 19,
                             '19_18',
                             1379820.0, 5226207.142857144, -50.0, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226203.571428572,
                                                   1379823.5714285714 5226203.571428572,
                                                   1379823.5714285714 5226210.7142857155,
                                                   1379816.4285714286 5226210.7142857155,
                                                   1379816.4285714286 5226203.571428572))'));
                        
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
                             60, 241, 18, 19,
                             '241',
                             1379820.0, 5226207.142857144, -50.0, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             39, 308, 18, 20,
                             '20_18',
                             1379820.0, 5226214.285714286, -50.0, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226210.714285715,
                                                   1379823.5714285714 5226210.714285715,
                                                   1379823.5714285714 5226217.857142858,
                                                   1379816.4285714286 5226217.857142858,
                                                   1379816.4285714286 5226210.714285715))'));
                        
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
                             39, 308, 18, 20,
                             '308',
                             1379820.0, 5226214.285714286, -50.0, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             18, 383, 18, 21,
                             '21_18',
                             1379820.0, 5226221.428571429, -50.0, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379816.4285714286 5226217.857142857,
                                                   1379823.5714285714 5226217.857142857,
                                                   1379823.5714285714 5226225.000000001,
                                                   1379816.4285714286 5226225.000000001,
                                                   1379816.4285714286 5226217.857142857))'));
                        
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
                             18, 383, 18, 21,
                             '383',
                             1379820.0, 5226221.428571429, -50.0, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379820.0 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             439, 438, 19, 1,
                             '01_19',
                             1379827.1428571427, 5226078.571428572, -57.142857142857146, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226075.0,
                                                   1379830.714285714 5226075.0,
                                                   1379830.714285714 5226082.142857144,
                                                   1379823.5714285714 5226082.142857144,
                                                   1379823.5714285714 5226075.0))'));
                        
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
                             439, 438, 19, 1,
                             '438',
                             1379827.1428571427, 5226078.571428572, -57.142857142857146, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             418, 359, 19, 2,
                             '02_19',
                             1379827.1428571427, 5226085.714285715, -57.142857142857146, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226082.142857143,
                                                   1379830.714285714 5226082.142857143,
                                                   1379830.714285714 5226089.285714286,
                                                   1379823.5714285714 5226089.285714286,
                                                   1379823.5714285714 5226082.142857143))'));
                        
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
                             418, 359, 19, 2,
                             '359',
                             1379827.1428571427, 5226085.714285715, -57.142857142857146, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             397, 288, 19, 3,
                             '03_19',
                             1379827.1428571427, 5226092.857142857, -57.142857142857146, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226089.285714285,
                                                   1379830.714285714 5226089.285714285,
                                                   1379830.714285714 5226096.428571429,
                                                   1379823.5714285714 5226096.428571429,
                                                   1379823.5714285714 5226089.285714285))'));
                        
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
                             397, 288, 19, 3,
                             '288',
                             1379827.1428571427, 5226092.857142857, -57.142857142857146, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             376, 225, 19, 4,
                             '04_19',
                             1379827.1428571427, 5226100.0, -57.142857142857146, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226096.428571428,
                                                   1379830.714285714 5226096.428571428,
                                                   1379830.714285714 5226103.571428572,
                                                   1379823.5714285714 5226103.571428572,
                                                   1379823.5714285714 5226096.428571428))'));
                        
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
                             376, 225, 19, 4,
                             '225',
                             1379827.1428571427, 5226100.0, -57.142857142857146, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             355, 226, 19, 5,
                             '05_19',
                             1379827.1428571427, 5226107.142857144, -57.142857142857146, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226103.571428572,
                                                   1379830.714285714 5226103.571428572,
                                                   1379830.714285714 5226110.7142857155,
                                                   1379823.5714285714 5226110.7142857155,
                                                   1379823.5714285714 5226103.571428572))'));
                        
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
                             355, 226, 19, 5,
                             '226',
                             1379827.1428571427, 5226107.142857144, -57.142857142857146, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             334, 227, 19, 6,
                             '06_19',
                             1379827.1428571427, 5226114.285714286, -57.142857142857146, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226110.714285715,
                                                   1379830.714285714 5226110.714285715,
                                                   1379830.714285714 5226117.857142858,
                                                   1379823.5714285714 5226117.857142858,
                                                   1379823.5714285714 5226110.714285715))'));
                        
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
                             334, 227, 19, 6,
                             '227',
                             1379827.1428571427, 5226114.285714286, -57.142857142857146, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             313, 228, 19, 7,
                             '07_19',
                             1379827.1428571427, 5226121.428571429, -57.142857142857146, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226117.857142857,
                                                   1379830.714285714 5226117.857142857,
                                                   1379830.714285714 5226125.000000001,
                                                   1379823.5714285714 5226125.000000001,
                                                   1379823.5714285714 5226117.857142857))'));
                        
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
                             313, 228, 19, 7,
                             '228',
                             1379827.1428571427, 5226121.428571429, -57.142857142857146, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             292, 229, 19, 8,
                             '08_19',
                             1379827.1428571427, 5226128.571428572, -57.142857142857146, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226125.0,
                                                   1379830.714285714 5226125.0,
                                                   1379830.714285714 5226132.142857144,
                                                   1379823.5714285714 5226132.142857144,
                                                   1379823.5714285714 5226125.0))'));
                        
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
                             292, 229, 19, 8,
                             '229',
                             1379827.1428571427, 5226128.571428572, -57.142857142857146, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             271, 230, 19, 9,
                             '09_19',
                             1379827.1428571427, 5226135.714285715, -57.142857142857146, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226132.142857143,
                                                   1379830.714285714 5226132.142857143,
                                                   1379830.714285714 5226139.285714286,
                                                   1379823.5714285714 5226139.285714286,
                                                   1379823.5714285714 5226132.142857143))'));
                        
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
                             271, 230, 19, 9,
                             '230',
                             1379827.1428571427, 5226135.714285715, -57.142857142857146, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             250, 231, 19, 10,
                             '10_19',
                             1379827.1428571427, 5226142.857142857, -57.142857142857146, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226139.285714285,
                                                   1379830.714285714 5226139.285714285,
                                                   1379830.714285714 5226146.428571429,
                                                   1379823.5714285714 5226146.428571429,
                                                   1379823.5714285714 5226139.285714285))'));
                        
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
                             250, 231, 19, 10,
                             '231',
                             1379827.1428571427, 5226142.857142857, -57.142857142857146, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             229, 232, 19, 11,
                             '11_19',
                             1379827.1428571427, 5226150.0, -57.142857142857146, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226146.428571428,
                                                   1379830.714285714 5226146.428571428,
                                                   1379830.714285714 5226153.571428572,
                                                   1379823.5714285714 5226153.571428572,
                                                   1379823.5714285714 5226146.428571428))'));
                        
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
                             229, 232, 19, 11,
                             '232',
                             1379827.1428571427, 5226150.0, -57.142857142857146, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             208, 233, 19, 12,
                             '12_19',
                             1379827.1428571427, 5226157.142857144, -57.142857142857146, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226153.571428572,
                                                   1379830.714285714 5226153.571428572,
                                                   1379830.714285714 5226160.7142857155,
                                                   1379823.5714285714 5226160.7142857155,
                                                   1379823.5714285714 5226153.571428572))'));
                        
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
                             208, 233, 19, 12,
                             '233',
                             1379827.1428571427, 5226157.142857144, -57.142857142857146, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             187, 234, 19, 13,
                             '13_19',
                             1379827.1428571427, 5226164.285714286, -57.142857142857146, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226160.714285715,
                                                   1379830.714285714 5226160.714285715,
                                                   1379830.714285714 5226167.857142858,
                                                   1379823.5714285714 5226167.857142858,
                                                   1379823.5714285714 5226160.714285715))'));
                        
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
                             187, 234, 19, 13,
                             '234',
                             1379827.1428571427, 5226164.285714286, -57.142857142857146, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             166, 235, 19, 14,
                             '14_19',
                             1379827.1428571427, 5226171.428571429, -57.142857142857146, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226167.857142857,
                                                   1379830.714285714 5226167.857142857,
                                                   1379830.714285714 5226175.000000001,
                                                   1379823.5714285714 5226175.000000001,
                                                   1379823.5714285714 5226167.857142857))'));
                        
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
                             166, 235, 19, 14,
                             '235',
                             1379827.1428571427, 5226171.428571429, -57.142857142857146, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             145, 236, 19, 15,
                             '15_19',
                             1379827.1428571427, 5226178.571428572, -57.142857142857146, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226175.0,
                                                   1379830.714285714 5226175.0,
                                                   1379830.714285714 5226182.142857144,
                                                   1379823.5714285714 5226182.142857144,
                                                   1379823.5714285714 5226175.0))'));
                        
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
                             145, 236, 19, 15,
                             '236',
                             1379827.1428571427, 5226178.571428572, -57.142857142857146, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             124, 237, 19, 16,
                             '16_19',
                             1379827.1428571427, 5226185.714285715, -57.142857142857146, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226182.142857143,
                                                   1379830.714285714 5226182.142857143,
                                                   1379830.714285714 5226189.285714286,
                                                   1379823.5714285714 5226189.285714286,
                                                   1379823.5714285714 5226182.142857143))'));
                        
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
                             124, 237, 19, 16,
                             '237',
                             1379827.1428571427, 5226185.714285715, -57.142857142857146, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             103, 238, 19, 17,
                             '17_19',
                             1379827.1428571427, 5226192.857142857, -57.142857142857146, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226189.285714285,
                                                   1379830.714285714 5226189.285714285,
                                                   1379830.714285714 5226196.428571429,
                                                   1379823.5714285714 5226196.428571429,
                                                   1379823.5714285714 5226189.285714285))'));
                        
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
                             103, 238, 19, 17,
                             '238',
                             1379827.1428571427, 5226192.857142857, -57.142857142857146, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             82, 239, 19, 18,
                             '18_19',
                             1379827.1428571427, 5226200.0, -57.142857142857146, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226196.428571428,
                                                   1379830.714285714 5226196.428571428,
                                                   1379830.714285714 5226203.571428572,
                                                   1379823.5714285714 5226203.571428572,
                                                   1379823.5714285714 5226196.428571428))'));
                        
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
                             82, 239, 19, 18,
                             '239',
                             1379827.1428571427, 5226200.0, -57.142857142857146, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             61, 240, 19, 19,
                             '19_19',
                             1379827.1428571427, 5226207.142857144, -57.142857142857146, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226203.571428572,
                                                   1379830.714285714 5226203.571428572,
                                                   1379830.714285714 5226210.7142857155,
                                                   1379823.5714285714 5226210.7142857155,
                                                   1379823.5714285714 5226203.571428572))'));
                        
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
                             61, 240, 19, 19,
                             '240',
                             1379827.1428571427, 5226207.142857144, -57.142857142857146, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             40, 307, 19, 20,
                             '20_19',
                             1379827.1428571427, 5226214.285714286, -57.142857142857146, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226210.714285715,
                                                   1379830.714285714 5226210.714285715,
                                                   1379830.714285714 5226217.857142858,
                                                   1379823.5714285714 5226217.857142858,
                                                   1379823.5714285714 5226210.714285715))'));
                        
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
                             40, 307, 19, 20,
                             '307',
                             1379827.1428571427, 5226214.285714286, -57.142857142857146, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             19, 382, 19, 21,
                             '21_19',
                             1379827.1428571427, 5226221.428571429, -57.142857142857146, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379823.5714285714 5226217.857142857,
                                                   1379830.714285714 5226217.857142857,
                                                   1379830.714285714 5226225.000000001,
                                                   1379823.5714285714 5226225.000000001,
                                                   1379823.5714285714 5226217.857142857))'));
                        
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
                             19, 382, 19, 21,
                             '382',
                             1379827.1428571427, 5226221.428571429, -57.142857142857146, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379827.1428571427 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             440, 439, 20, 1,
                             '01_20',
                             1379834.2857142857, 5226078.571428572, -64.28571428571429, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226075.0,
                                                   1379837.857142857 5226075.0,
                                                   1379837.857142857 5226082.142857144,
                                                   1379830.7142857143 5226082.142857144,
                                                   1379830.7142857143 5226075.0))'));
                        
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
                             440, 439, 20, 1,
                             '439',
                             1379834.2857142857, 5226078.571428572, -64.28571428571429, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             419, 360, 20, 2,
                             '02_20',
                             1379834.2857142857, 5226085.714285715, -64.28571428571429, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226082.142857143,
                                                   1379837.857142857 5226082.142857143,
                                                   1379837.857142857 5226089.285714286,
                                                   1379830.7142857143 5226089.285714286,
                                                   1379830.7142857143 5226082.142857143))'));
                        
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
                             419, 360, 20, 2,
                             '360',
                             1379834.2857142857, 5226085.714285715, -64.28571428571429, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             398, 289, 20, 3,
                             '03_20',
                             1379834.2857142857, 5226092.857142857, -64.28571428571429, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226089.285714285,
                                                   1379837.857142857 5226089.285714285,
                                                   1379837.857142857 5226096.428571429,
                                                   1379830.7142857143 5226096.428571429,
                                                   1379830.7142857143 5226089.285714285))'));
                        
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
                             398, 289, 20, 3,
                             '289',
                             1379834.2857142857, 5226092.857142857, -64.28571428571429, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             377, 290, 20, 4,
                             '04_20',
                             1379834.2857142857, 5226100.0, -64.28571428571429, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226096.428571428,
                                                   1379837.857142857 5226096.428571428,
                                                   1379837.857142857 5226103.571428572,
                                                   1379830.7142857143 5226103.571428572,
                                                   1379830.7142857143 5226096.428571428))'));
                        
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
                             377, 290, 20, 4,
                             '290',
                             1379834.2857142857, 5226100.0, -64.28571428571429, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             356, 291, 20, 5,
                             '05_20',
                             1379834.2857142857, 5226107.142857144, -64.28571428571429, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226103.571428572,
                                                   1379837.857142857 5226103.571428572,
                                                   1379837.857142857 5226110.7142857155,
                                                   1379830.7142857143 5226110.7142857155,
                                                   1379830.7142857143 5226103.571428572))'));
                        
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
                             356, 291, 20, 5,
                             '291',
                             1379834.2857142857, 5226107.142857144, -64.28571428571429, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             335, 292, 20, 6,
                             '06_20',
                             1379834.2857142857, 5226114.285714286, -64.28571428571429, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226110.714285715,
                                                   1379837.857142857 5226110.714285715,
                                                   1379837.857142857 5226117.857142858,
                                                   1379830.7142857143 5226117.857142858,
                                                   1379830.7142857143 5226110.714285715))'));
                        
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
                             335, 292, 20, 6,
                             '292',
                             1379834.2857142857, 5226114.285714286, -64.28571428571429, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             314, 293, 20, 7,
                             '07_20',
                             1379834.2857142857, 5226121.428571429, -64.28571428571429, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226117.857142857,
                                                   1379837.857142857 5226117.857142857,
                                                   1379837.857142857 5226125.000000001,
                                                   1379830.7142857143 5226125.000000001,
                                                   1379830.7142857143 5226117.857142857))'));
                        
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
                             314, 293, 20, 7,
                             '293',
                             1379834.2857142857, 5226121.428571429, -64.28571428571429, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             293, 294, 20, 8,
                             '08_20',
                             1379834.2857142857, 5226128.571428572, -64.28571428571429, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226125.0,
                                                   1379837.857142857 5226125.0,
                                                   1379837.857142857 5226132.142857144,
                                                   1379830.7142857143 5226132.142857144,
                                                   1379830.7142857143 5226125.0))'));
                        
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
                             293, 294, 20, 8,
                             '294',
                             1379834.2857142857, 5226128.571428572, -64.28571428571429, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             272, 295, 20, 9,
                             '09_20',
                             1379834.2857142857, 5226135.714285715, -64.28571428571429, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226132.142857143,
                                                   1379837.857142857 5226132.142857143,
                                                   1379837.857142857 5226139.285714286,
                                                   1379830.7142857143 5226139.285714286,
                                                   1379830.7142857143 5226132.142857143))'));
                        
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
                             272, 295, 20, 9,
                             '295',
                             1379834.2857142857, 5226135.714285715, -64.28571428571429, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             251, 296, 20, 10,
                             '10_20',
                             1379834.2857142857, 5226142.857142857, -64.28571428571429, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226139.285714285,
                                                   1379837.857142857 5226139.285714285,
                                                   1379837.857142857 5226146.428571429,
                                                   1379830.7142857143 5226146.428571429,
                                                   1379830.7142857143 5226139.285714285))'));
                        
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
                             251, 296, 20, 10,
                             '296',
                             1379834.2857142857, 5226142.857142857, -64.28571428571429, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             230, 297, 20, 11,
                             '11_20',
                             1379834.2857142857, 5226150.0, -64.28571428571429, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226146.428571428,
                                                   1379837.857142857 5226146.428571428,
                                                   1379837.857142857 5226153.571428572,
                                                   1379830.7142857143 5226153.571428572,
                                                   1379830.7142857143 5226146.428571428))'));
                        
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
                             230, 297, 20, 11,
                             '297',
                             1379834.2857142857, 5226150.0, -64.28571428571429, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             209, 298, 20, 12,
                             '12_20',
                             1379834.2857142857, 5226157.142857144, -64.28571428571429, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226153.571428572,
                                                   1379837.857142857 5226153.571428572,
                                                   1379837.857142857 5226160.7142857155,
                                                   1379830.7142857143 5226160.7142857155,
                                                   1379830.7142857143 5226153.571428572))'));
                        
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
                             209, 298, 20, 12,
                             '298',
                             1379834.2857142857, 5226157.142857144, -64.28571428571429, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             188, 299, 20, 13,
                             '13_20',
                             1379834.2857142857, 5226164.285714286, -64.28571428571429, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226160.714285715,
                                                   1379837.857142857 5226160.714285715,
                                                   1379837.857142857 5226167.857142858,
                                                   1379830.7142857143 5226167.857142858,
                                                   1379830.7142857143 5226160.714285715))'));
                        
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
                             188, 299, 20, 13,
                             '299',
                             1379834.2857142857, 5226164.285714286, -64.28571428571429, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             167, 300, 20, 14,
                             '14_20',
                             1379834.2857142857, 5226171.428571429, -64.28571428571429, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226167.857142857,
                                                   1379837.857142857 5226167.857142857,
                                                   1379837.857142857 5226175.000000001,
                                                   1379830.7142857143 5226175.000000001,
                                                   1379830.7142857143 5226167.857142857))'));
                        
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
                             167, 300, 20, 14,
                             '300',
                             1379834.2857142857, 5226171.428571429, -64.28571428571429, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             146, 301, 20, 15,
                             '15_20',
                             1379834.2857142857, 5226178.571428572, -64.28571428571429, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226175.0,
                                                   1379837.857142857 5226175.0,
                                                   1379837.857142857 5226182.142857144,
                                                   1379830.7142857143 5226182.142857144,
                                                   1379830.7142857143 5226175.0))'));
                        
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
                             146, 301, 20, 15,
                             '301',
                             1379834.2857142857, 5226178.571428572, -64.28571428571429, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             125, 302, 20, 16,
                             '16_20',
                             1379834.2857142857, 5226185.714285715, -64.28571428571429, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226182.142857143,
                                                   1379837.857142857 5226182.142857143,
                                                   1379837.857142857 5226189.285714286,
                                                   1379830.7142857143 5226189.285714286,
                                                   1379830.7142857143 5226182.142857143))'));
                        
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
                             125, 302, 20, 16,
                             '302',
                             1379834.2857142857, 5226185.714285715, -64.28571428571429, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             104, 303, 20, 17,
                             '17_20',
                             1379834.2857142857, 5226192.857142857, -64.28571428571429, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226189.285714285,
                                                   1379837.857142857 5226189.285714285,
                                                   1379837.857142857 5226196.428571429,
                                                   1379830.7142857143 5226196.428571429,
                                                   1379830.7142857143 5226189.285714285))'));
                        
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
                             104, 303, 20, 17,
                             '303',
                             1379834.2857142857, 5226192.857142857, -64.28571428571429, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             83, 304, 20, 18,
                             '18_20',
                             1379834.2857142857, 5226200.0, -64.28571428571429, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226196.428571428,
                                                   1379837.857142857 5226196.428571428,
                                                   1379837.857142857 5226203.571428572,
                                                   1379830.7142857143 5226203.571428572,
                                                   1379830.7142857143 5226196.428571428))'));
                        
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
                             83, 304, 20, 18,
                             '304',
                             1379834.2857142857, 5226200.0, -64.28571428571429, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             62, 305, 20, 19,
                             '19_20',
                             1379834.2857142857, 5226207.142857144, -64.28571428571429, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226203.571428572,
                                                   1379837.857142857 5226203.571428572,
                                                   1379837.857142857 5226210.7142857155,
                                                   1379830.7142857143 5226210.7142857155,
                                                   1379830.7142857143 5226203.571428572))'));
                        
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
                             62, 305, 20, 19,
                             '305',
                             1379834.2857142857, 5226207.142857144, -64.28571428571429, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             41, 306, 20, 20,
                             '20_20',
                             1379834.2857142857, 5226214.285714286, -64.28571428571429, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226210.714285715,
                                                   1379837.857142857 5226210.714285715,
                                                   1379837.857142857 5226217.857142858,
                                                   1379830.7142857143 5226217.857142858,
                                                   1379830.7142857143 5226210.714285715))'));
                        
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
                             41, 306, 20, 20,
                             '306',
                             1379834.2857142857, 5226214.285714286, -64.28571428571429, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             20, 381, 20, 21,
                             '21_20',
                             1379834.2857142857, 5226221.428571429, -64.28571428571429, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379830.7142857143 5226217.857142857,
                                                   1379837.857142857 5226217.857142857,
                                                   1379837.857142857 5226225.000000001,
                                                   1379830.7142857143 5226225.000000001,
                                                   1379830.7142857143 5226217.857142857))'));
                        
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
                             20, 381, 20, 21,
                             '381',
                             1379834.2857142857, 5226221.428571429, -64.28571428571429, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379834.2857142857 5226221.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             441, 440, 21, 1,
                             '01_21',
                             1379841.4285714284, 5226078.571428572, -71.42857142857143, -71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226075.0,
                                                   1379844.9999999998 5226075.0,
                                                   1379844.9999999998 5226082.142857144,
                                                   1379837.857142857 5226082.142857144,
                                                   1379837.857142857 5226075.0))'));
                        
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
                             441, 440, 21, 1,
                             '440',
                             1379841.4285714284, 5226078.571428572, -71.42857142857143, -71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226078.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             420, 361, 21, 2,
                             '02_21',
                             1379841.4285714284, 5226085.714285715, -71.42857142857143, -64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226082.142857143,
                                                   1379844.9999999998 5226082.142857143,
                                                   1379844.9999999998 5226089.285714286,
                                                   1379837.857142857 5226089.285714286,
                                                   1379837.857142857 5226082.142857143))'));
                        
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
                             420, 361, 21, 2,
                             '361',
                             1379841.4285714284, 5226085.714285715, -71.42857142857143, -64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226085.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             399, 362, 21, 3,
                             '03_21',
                             1379841.4285714284, 5226092.857142857, -71.42857142857143, -57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226089.285714285,
                                                   1379844.9999999998 5226089.285714285,
                                                   1379844.9999999998 5226096.428571429,
                                                   1379837.857142857 5226096.428571429,
                                                   1379837.857142857 5226089.285714285))'));
                        
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
                             399, 362, 21, 3,
                             '362',
                             1379841.4285714284, 5226092.857142857, -71.42857142857143, -57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226092.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             378, 363, 21, 4,
                             '04_21',
                             1379841.4285714284, 5226100.0, -71.42857142857143, -50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226096.428571428,
                                                   1379844.9999999998 5226096.428571428,
                                                   1379844.9999999998 5226103.571428572,
                                                   1379837.857142857 5226103.571428572,
                                                   1379837.857142857 5226096.428571428))'));
                        
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
                             378, 363, 21, 4,
                             '363',
                             1379841.4285714284, 5226100.0, -71.42857142857143, -50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226100.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             357, 364, 21, 5,
                             '05_21',
                             1379841.4285714284, 5226107.142857144, -71.42857142857143, -42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226103.571428572,
                                                   1379844.9999999998 5226103.571428572,
                                                   1379844.9999999998 5226110.7142857155,
                                                   1379837.857142857 5226110.7142857155,
                                                   1379837.857142857 5226103.571428572))'));
                        
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
                             357, 364, 21, 5,
                             '364',
                             1379841.4285714284, 5226107.142857144, -71.42857142857143, -42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226107.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             336, 365, 21, 6,
                             '06_21',
                             1379841.4285714284, 5226114.285714286, -71.42857142857143, -35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226110.714285715,
                                                   1379844.9999999998 5226110.714285715,
                                                   1379844.9999999998 5226117.857142858,
                                                   1379837.857142857 5226117.857142858,
                                                   1379837.857142857 5226110.714285715))'));
                        
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
                             336, 365, 21, 6,
                             '365',
                             1379841.4285714284, 5226114.285714286, -71.42857142857143, -35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226114.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             315, 366, 21, 7,
                             '07_21',
                             1379841.4285714284, 5226121.428571429, -71.42857142857143, -28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226117.857142857,
                                                   1379844.9999999998 5226117.857142857,
                                                   1379844.9999999998 5226125.000000001,
                                                   1379837.857142857 5226125.000000001,
                                                   1379837.857142857 5226117.857142857))'));
                        
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
                             315, 366, 21, 7,
                             '366',
                             1379841.4285714284, 5226121.428571429, -71.42857142857143, -28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226121.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             294, 367, 21, 8,
                             '08_21',
                             1379841.4285714284, 5226128.571428572, -71.42857142857143, -21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226125.0,
                                                   1379844.9999999998 5226125.0,
                                                   1379844.9999999998 5226132.142857144,
                                                   1379837.857142857 5226132.142857144,
                                                   1379837.857142857 5226125.0))'));
                        
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
                             294, 367, 21, 8,
                             '367',
                             1379841.4285714284, 5226128.571428572, -71.42857142857143, -21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226128.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             273, 368, 21, 9,
                             '09_21',
                             1379841.4285714284, 5226135.714285715, -71.42857142857143, -14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226132.142857143,
                                                   1379844.9999999998 5226132.142857143,
                                                   1379844.9999999998 5226139.285714286,
                                                   1379837.857142857 5226139.285714286,
                                                   1379837.857142857 5226132.142857143))'));
                        
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
                             273, 368, 21, 9,
                             '368',
                             1379841.4285714284, 5226135.714285715, -71.42857142857143, -14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226135.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             252, 369, 21, 10,
                             '10_21',
                             1379841.4285714284, 5226142.857142857, -71.42857142857143, -7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226139.285714285,
                                                   1379844.9999999998 5226139.285714285,
                                                   1379844.9999999998 5226146.428571429,
                                                   1379837.857142857 5226146.428571429,
                                                   1379837.857142857 5226139.285714285))'));
                        
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
                             252, 369, 21, 10,
                             '369',
                             1379841.4285714284, 5226142.857142857, -71.42857142857143, -7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226142.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             231, 370, 21, 11,
                             '11_21',
                             1379841.4285714284, 5226150.0, -71.42857142857143, 0.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226146.428571428,
                                                   1379844.9999999998 5226146.428571428,
                                                   1379844.9999999998 5226153.571428572,
                                                   1379837.857142857 5226153.571428572,
                                                   1379837.857142857 5226146.428571428))'));
                        
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
                             231, 370, 21, 11,
                             '370',
                             1379841.4285714284, 5226150.0, -71.42857142857143, 0.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226150.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             210, 371, 21, 12,
                             '12_21',
                             1379841.4285714284, 5226157.142857144, -71.42857142857143, 7.142857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226153.571428572,
                                                   1379844.9999999998 5226153.571428572,
                                                   1379844.9999999998 5226160.7142857155,
                                                   1379837.857142857 5226160.7142857155,
                                                   1379837.857142857 5226153.571428572))'));
                        
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
                             210, 371, 21, 12,
                             '371',
                             1379841.4285714284, 5226157.142857144, -71.42857142857143, 7.142857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226157.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             189, 372, 21, 13,
                             '13_21',
                             1379841.4285714284, 5226164.285714286, -71.42857142857143, 14.285714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226160.714285715,
                                                   1379844.9999999998 5226160.714285715,
                                                   1379844.9999999998 5226167.857142858,
                                                   1379837.857142857 5226167.857142858,
                                                   1379837.857142857 5226160.714285715))'));
                        
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
                             189, 372, 21, 13,
                             '372',
                             1379841.4285714284, 5226164.285714286, -71.42857142857143, 14.285714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226164.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             168, 373, 21, 14,
                             '14_21',
                             1379841.4285714284, 5226171.428571429, -71.42857142857143, 21.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226167.857142857,
                                                   1379844.9999999998 5226167.857142857,
                                                   1379844.9999999998 5226175.000000001,
                                                   1379837.857142857 5226175.000000001,
                                                   1379837.857142857 5226167.857142857))'));
                        
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
                             168, 373, 21, 14,
                             '373',
                             1379841.4285714284, 5226171.428571429, -71.42857142857143, 21.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226171.428571429)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             147, 374, 21, 15,
                             '15_21',
                             1379841.4285714284, 5226178.571428572, -71.42857142857143, 28.571428571428573,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226175.0,
                                                   1379844.9999999998 5226175.0,
                                                   1379844.9999999998 5226182.142857144,
                                                   1379837.857142857 5226182.142857144,
                                                   1379837.857142857 5226175.0))'));
                        
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
                             147, 374, 21, 15,
                             '374',
                             1379841.4285714284, 5226178.571428572, -71.42857142857143, 28.571428571428573,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226178.571428572)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             126, 375, 21, 16,
                             '16_21',
                             1379841.4285714284, 5226185.714285715, -71.42857142857143, 35.714285714285715,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226182.142857143,
                                                   1379844.9999999998 5226182.142857143,
                                                   1379844.9999999998 5226189.285714286,
                                                   1379837.857142857 5226189.285714286,
                                                   1379837.857142857 5226182.142857143))'));
                        
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
                             126, 375, 21, 16,
                             '375',
                             1379841.4285714284, 5226185.714285715, -71.42857142857143, 35.714285714285715,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226185.714285715)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             105, 376, 21, 17,
                             '17_21',
                             1379841.4285714284, 5226192.857142857, -71.42857142857143, 42.85714285714286,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226189.285714285,
                                                   1379844.9999999998 5226189.285714285,
                                                   1379844.9999999998 5226196.428571429,
                                                   1379837.857142857 5226196.428571429,
                                                   1379837.857142857 5226189.285714285))'));
                        
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
                             105, 376, 21, 17,
                             '376',
                             1379841.4285714284, 5226192.857142857, -71.42857142857143, 42.85714285714286,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226192.857142857)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             84, 377, 21, 18,
                             '18_21',
                             1379841.4285714284, 5226200.0, -71.42857142857143, 50.0,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226196.428571428,
                                                   1379844.9999999998 5226196.428571428,
                                                   1379844.9999999998 5226203.571428572,
                                                   1379837.857142857 5226203.571428572,
                                                   1379837.857142857 5226196.428571428))'));
                        
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
                             84, 377, 21, 18,
                             '377',
                             1379841.4285714284, 5226200.0, -71.42857142857143, 50.0,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226200.0)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             63, 378, 21, 19,
                             '19_21',
                             1379841.4285714284, 5226207.142857144, -71.42857142857143, 57.142857142857146,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226203.571428572,
                                                   1379844.9999999998 5226203.571428572,
                                                   1379844.9999999998 5226210.7142857155,
                                                   1379837.857142857 5226210.7142857155,
                                                   1379837.857142857 5226203.571428572))'));
                        
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
                             63, 378, 21, 19,
                             '378',
                             1379841.4285714284, 5226207.142857144, -71.42857142857143, 57.142857142857146,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226207.142857144)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             42, 379, 21, 20,
                             '20_21',
                             1379841.4285714284, 5226214.285714286, -71.42857142857143, 64.28571428571429,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226210.714285715,
                                                   1379844.9999999998 5226210.714285715,
                                                   1379844.9999999998 5226217.857142858,
                                                   1379837.857142857 5226217.857142858,
                                                   1379837.857142857 5226210.714285715))'));
                        
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
                             42, 379, 21, 20,
                             '379',
                             1379841.4285714284, 5226214.285714286, -71.42857142857143, 64.28571428571429,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226214.285714286)'));
                        
INSERT INTO poi_polygon 
    (poi_idim, poi_idhg, poi_idx, poi_idy, 
     poi_name, 
     xcenter,
     ycenter,
     xoffset,
     yoffset,
     poi_geom)

                        VALUES (
                             21, 380, 21, 21,
                             '21_21',
                             1379841.4285714284, 5226221.428571429, -71.42857142857143, 71.42857142857143,
                             ST_GeomFromEWKT(
                               'SRID=3946;POLYGON((1379837.857142857 5226217.857142857,
                                                   1379844.9999999998 5226217.857142857,
                                                   1379844.9999999998 5226225.000000001,
                                                   1379837.857142857 5226225.000000001,
                                                   1379837.857142857 5226217.857142857))'));
                        
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
                             21, 380, 21, 21,
                             '380',
                             1379841.4285714284, 5226221.428571429, -71.42857142857143, 71.42857142857143,
                             100,
                             ST_GeomFromEWKT(
                               'SRID=3946;POINT(1379841.4285714284 5226221.428571429)'));
                        

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

