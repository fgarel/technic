

update point set the_geom=
    st_setsrid(
      st_makepoint(
         x,
         y,
         z),
      2154);
    

update point_profondeur set the_geom=
    st_setsrid(
      st_makepoint(
         "X",
         "Y",
         "Z"),
      2154);
    
update ep_point_eclairage set the_geom=
    st_setsrid(
      st_makepoint(
         "X",
         "Y",
         "Z"),
      2154);

