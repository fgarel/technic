
select 
 id,
 ST_AsEWKT(wkb_geometry_3857) as geom_3857,
 ST_AsEWKT(wkb_geometry_3946) as geom_3946
from cadastre_travail.case4600200A3;
