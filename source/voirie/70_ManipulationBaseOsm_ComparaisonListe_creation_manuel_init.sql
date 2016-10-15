
-- Initialisation des valeurs pour le champ manuel



update table_left_outer
set table_01_manuel = table_01_automatique;

update table_right_outer
set table_02_manuel = table_02_automatique;



--vacuum table_right_outer;