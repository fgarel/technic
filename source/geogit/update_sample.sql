

update case_00140_00100 set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update batiment set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update bordure set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update affleurant set wkb_geometry = st_geometryfromtext(geometry_asewkt);
update cloture set wkb_geometry = st_geometryfromtext(geometry_asewkt);

select
  id,
  geometry_asewkt,
  st_asewkt(wkb_geometry)
from case_00140_00100;




