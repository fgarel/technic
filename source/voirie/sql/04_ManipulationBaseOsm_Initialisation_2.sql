
-- Initialisation_2 :

-- Transfert des valeurs du champ original vers le champ manuel

-- ---------------------------------------------------- --
-- Initialisation des valeurs pour le champ text_manuel --
-- ---------------------------------------------------- --

update table_01
set text_manuel = text_original;

update table_02
set text_manuel = text_original;

-- -------------------------------------------------------- --
-- Initialisation des valeurs pour le champ geometry_manuel --
-- -------------------------------------------------------- --

update table_01
set geometry_manuel = st_transform(geometry_original, 3946);

update table_02
set geometry_manuel = st_transform(st_force2d(geometry_original), 3946);
--set geometry_manuel = st_transform(geometry_original, 3946);
