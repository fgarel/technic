
--update "case_00140_00100" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "case_00140_00100" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "AffleurantSymbole" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "AffleurantSymbole" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "Arbre" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "Arbre" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "Bordure" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "Bordure" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "Emprise" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "Emprise" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "Facade" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "Facade" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "Haie" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "Haie" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "Mur" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "Mur" set wkb_geometry = GeomFromEWKT(geometry_asewkt);
--update "PointCanevas" set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update "PointCanevas" set wkb_geometry = GeomFromEWKT(geometry_asewkt);

--select
--  id,
--  geometry_asewkt,
--  st_asewkt(wkb_geometry)
--from case_00140_00100;




