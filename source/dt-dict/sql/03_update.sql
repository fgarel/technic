

-- Mise à jour du champ wkb_geometry_3857

update cadastre_travail.case4610000
set "wkb_geometry_3857"=ST_Transform("wkb_geometry_3946",3857);

update cadastre_travail.case4605000
set "wkb_geometry_3857"=ST_Transform("wkb_geometry_3946",3857);

update cadastre_travail.case4602000
set "wkb_geometry_3857"=ST_Transform("wkb_geometry_3946",3857);

update cadastre_travail.case4601000
set "wkb_geometry_3857"=ST_Transform("wkb_geometry_3946",3857);

update cadastre_travail.case4600500
set "wkb_geometry_3857"=ST_Transform("wkb_geometry_3946",3857);

update cadastre_travail.case4600200
set "wkb_geometry_3857"=ST_Transform("wkb_geometry_3946",3857);

update cadastre_travail.case4600200A3
set "wkb_geometry_3857"=ST_Transform("wkb_geometry_3946",3857);


