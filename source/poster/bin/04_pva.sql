CREATE TABLE poi (
  poi_id INTEGER,
  poi_name VARCHAR
);
SELECT AddGeometryColumn('poi', 'poi_geom', 3857, 'POINT', 2);

INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (1, '01.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (2, '02.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (3, '03.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (4, '04.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (5, '05.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (6, '06.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (7, '07.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (8, '08.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (9, '09.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (10, '10.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (11, '11.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (12, '12.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (13, '13.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (14, '14.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (15, '15.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (16, '16.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (17, '17.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (18, '18.01', ST_GeomFromEWKT('SRID=3857;POINT(-141375 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (19, '01.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (20, '02.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (21, '03.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (22, '04.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (23, '05.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (24, '06.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (25, '07.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (26, '08.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (27, '09.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (28, '10.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (29, '11.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (30, '12.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (31, '13.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (32, '14.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (33, '15.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (34, '16.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (35, '17.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (36, '18.02', ST_GeomFromEWKT('SRID=3857;POINT(-140250 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (37, '01.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (38, '02.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (39, '03.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (40, '04.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (41, '05.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (42, '06.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (43, '07.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (44, '08.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (45, '09.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (46, '10.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (47, '11.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (48, '12.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (49, '13.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (50, '14.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (51, '15.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (52, '16.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (53, '17.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (54, '18.03', ST_GeomFromEWKT('SRID=3857;POINT(-139125 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (55, '01.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (56, '02.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (57, '03.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (58, '04.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (59, '05.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (60, '06.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (61, '07.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (62, '08.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (63, '09.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (64, '10.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (65, '11.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (66, '12.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (67, '13.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (68, '14.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (69, '15.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (70, '16.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (71, '17.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (72, '18.04', ST_GeomFromEWKT('SRID=3857;POINT(-138000 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (73, '01.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (74, '02.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (75, '03.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (76, '04.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (77, '05.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (78, '06.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (79, '07.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (80, '08.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (81, '09.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (82, '10.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (83, '11.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (84, '12.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (85, '13.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (86, '14.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (87, '15.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (88, '16.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (89, '17.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (90, '18.05', ST_GeomFromEWKT('SRID=3857;POINT(-136875 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (91, '01.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (92, '02.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (93, '03.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (94, '04.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (95, '05.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (96, '06.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (97, '07.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (98, '08.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (99, '09.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (100, '10.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (101, '11.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (102, '12.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (103, '13.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (104, '14.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (105, '15.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (106, '16.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (107, '17.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (108, '18.06', ST_GeomFromEWKT('SRID=3857;POINT(-135750 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (109, '01.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (110, '02.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (111, '03.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (112, '04.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (113, '05.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (114, '06.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (115, '07.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (116, '08.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (117, '09.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (118, '10.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (119, '11.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (120, '12.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (121, '13.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (122, '14.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (123, '15.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (124, '16.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (125, '17.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (126, '18.07', ST_GeomFromEWKT('SRID=3857;POINT(-134625 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (127, '01.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (128, '02.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (129, '03.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (130, '04.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (131, '05.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (132, '06.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (133, '07.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (134, '08.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (135, '09.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (136, '10.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (137, '11.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (138, '12.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (139, '13.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (140, '14.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (141, '15.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (142, '16.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (143, '17.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (144, '18.08', ST_GeomFromEWKT('SRID=3857;POINT(-133500 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (145, '01.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (146, '02.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (147, '03.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (148, '04.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (149, '05.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (150, '06.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (151, '07.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (152, '08.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (153, '09.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (154, '10.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (155, '11.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (156, '12.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (157, '13.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (158, '14.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (159, '15.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (160, '16.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (161, '17.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (162, '18.09', ST_GeomFromEWKT('SRID=3857;POINT(-132375 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (163, '01.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (164, '02.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (165, '03.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (166, '04.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (167, '05.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (168, '06.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (169, '07.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (170, '08.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (171, '09.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (172, '10.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (173, '11.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (174, '12.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (175, '13.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (176, '14.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (177, '15.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (178, '16.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (179, '17.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (180, '18.10', ST_GeomFromEWKT('SRID=3857;POINT(-131250 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (181, '01.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (182, '02.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (183, '03.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (184, '04.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (185, '05.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (186, '06.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (187, '07.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (188, '08.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (189, '09.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (190, '10.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (191, '11.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (192, '12.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (193, '13.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (194, '14.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (195, '15.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (196, '16.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (197, '17.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (198, '18.11', ST_GeomFromEWKT('SRID=3857;POINT(-130125 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (199, '01.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (200, '02.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (201, '03.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (202, '04.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (203, '05.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (204, '06.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (205, '07.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (206, '08.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (207, '09.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (208, '10.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (209, '11.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (210, '12.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (211, '13.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (212, '14.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (213, '15.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (214, '16.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (215, '17.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (216, '18.12', ST_GeomFromEWKT('SRID=3857;POINT(-129000 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (217, '01.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (218, '02.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (219, '03.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (220, '04.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (221, '05.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (222, '06.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (223, '07.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (224, '08.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (225, '09.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (226, '10.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (227, '11.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (228, '12.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (229, '13.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (230, '14.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (231, '15.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (232, '16.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (233, '17.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (234, '18.13', ST_GeomFromEWKT('SRID=3857;POINT(-127875 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (235, '01.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (236, '02.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (237, '03.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (238, '04.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (239, '05.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (240, '06.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (241, '07.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (242, '08.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (243, '09.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (244, '10.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (245, '11.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (246, '12.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (247, '13.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (248, '14.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (249, '15.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (250, '16.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (251, '17.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (252, '18.14', ST_GeomFromEWKT('SRID=3857;POINT(-126750 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (253, '01.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (254, '02.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (255, '03.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (256, '04.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (257, '05.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (258, '06.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (259, '07.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (260, '08.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (261, '09.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (262, '10.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (263, '11.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (264, '12.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (265, '13.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (266, '14.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (267, '15.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (268, '16.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (269, '17.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (270, '18.15', ST_GeomFromEWKT('SRID=3857;POINT(-125625 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (271, '01.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (272, '02.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (273, '03.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (274, '04.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (275, '05.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (276, '06.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (277, '07.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (278, '08.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (279, '09.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (280, '10.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (281, '11.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (282, '12.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (283, '13.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (284, '14.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (285, '15.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (286, '16.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (287, '17.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (288, '18.16', ST_GeomFromEWKT('SRID=3857;POINT(-124500 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (289, '01.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (290, '02.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (291, '03.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (292, '04.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (293, '05.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (294, '06.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (295, '07.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (296, '08.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (297, '09.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (298, '10.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (299, '11.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (300, '12.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (301, '13.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (302, '14.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (303, '15.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (304, '16.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (305, '17.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (306, '18.17', ST_GeomFromEWKT('SRID=3857;POINT(-123375 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (307, '01.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (308, '02.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (309, '03.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (310, '04.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (311, '05.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (312, '06.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (313, '07.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (314, '08.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (315, '09.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (316, '10.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (317, '11.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (318, '12.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (319, '13.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (320, '14.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (321, '15.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (322, '16.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (323, '17.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (324, '18.18', ST_GeomFromEWKT('SRID=3857;POINT(-122250 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (325, '01.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (326, '02.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (327, '03.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (328, '04.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (329, '05.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (330, '06.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (331, '07.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (332, '08.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (333, '09.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (334, '10.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (335, '11.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (336, '12.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (337, '13.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (338, '14.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (339, '15.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (340, '16.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (341, '17.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (342, '18.19', ST_GeomFromEWKT('SRID=3857;POINT(-121125 5812640)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (343, '01.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5798785)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (344, '02.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5799600)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (345, '03.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5800415)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (346, '04.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5801230)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (347, '05.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5802045)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (348, '06.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5802860)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (349, '07.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5803675)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (350, '08.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5804490)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (351, '09.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5805305)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (352, '10.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5806120)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (353, '11.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5806935)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (354, '12.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5807750)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (355, '13.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5808565)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (356, '14.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5809380)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (357, '15.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5810195)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (358, '16.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5811010)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (359, '17.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5811825)'));
INSERT iNTO poi (poi_id, poi_name, poi_geom)
  VALUES (360, '18.20', ST_GeomFromEWKT('SRID=3857;POINT(-120000 5812640)'));
