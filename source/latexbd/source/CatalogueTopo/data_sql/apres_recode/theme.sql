 SELECT drop_table_if_exists ('theme',false); CREATE TABLE theme (   theme_id character varying(256) NOT NULL,   theme_libelle character varying(256) NOT NULL )  WITH OIDS; 
INSERT INTO theme (theme_id, theme_libelle) VALUES ('01_00_00_00', 'Raster, Prise de vue');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('03_00_00_00', 'Urbanisme et cartes à petite echelle');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('05_00_00_00', 'Réseau de Transport de personnes / déplacement');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('07_00_00_00', 'Voirie');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('09_00_00_00', 'Bâti');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('11_00_00_00', 'Réseau de Transport Eau et Energie');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('12_00_00_00', 'Réseau chauffage urbain');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('13_00_00_00', 'Reseau de Distribution');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('15_00_00_00', 'Reseau de Transport d information');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('17_00_00_00', 'Reseau en attente');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('19_00_00_00', 'Réseau de Collecte');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('21_00_00_00', 'Signalisation lumineuse');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('23_00_00_00', 'Signalisation verticale');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('25_00_00_00', 'Signalisation horizontale');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('27_00_00_00', 'Stationnement');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('29_00_00_00', 'Espaces verts');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('31_00_00_00', 'Mobilier urbain');
INSERT INTO theme (theme_id, theme_libelle) VALUES ('33_00_00_00', 'Geodesie, Points de référence et Habillage');
 VACUUM ANALYSE theme; 
