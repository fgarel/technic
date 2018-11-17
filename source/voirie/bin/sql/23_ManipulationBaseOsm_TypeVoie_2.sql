-- Comparaison des 2 libellés des deux tables

-- les mises à jour, c'est à dire les transferts d'infos en fonction de
-- certains criteres


SET search_path = stockage, travail, public;


-- ------------------------------------------------ --
-- Remplissage des infos VLR à partir des infos Osm --
-- ------------------------------------------------ --
-- ------------ --
-- codeTypeVoie --
-- ------------ --
-- -------------- --
-- Voie Nationale --
-- -------------- --

update table_01_extended
  set "codeTypeVoie" = 'VNAT'
    where highway = 'trunk';

-- ------------------- --
-- Voie Départementale --
-- ------------------- --

update table_01_extended
  set "codeTypeVoie" = 'VDEP'
    where highway = 'path';


-- ----------------------------------- --
-- Voie Communale "à caractère de rue" --
-- ----------------------------------- --

update table_01_extended
  set "codeTypeVoie" = 'VCVU'
  where highway = 'residential';

-- ------------------------------ --
-- Voie Communale "Voie Piétonne" --
-- ------------------------------ --

update table_01_extended
  set "codeTypeVoie" = 'VCVP'
  where highway = 'footway';

-- ------------------------------- --
-- Voie Communale "Piste Cyclable" --
-- ------------------------------- --

update table_01_extended
  set "codeTypeVoie" = 'VCPC'
  where highway = 'cycleway';


-- ------------ --
-- Proprietaire --
-- ------------ --


-- ------------------------------------------------ --
-- Remplissage des infos VLR à partir des infos VLR --
-- ------------------------------------------------ --

select
*
from
  stockage.table_01_extended
    inner join stockage."diffManuel"
      on table_01_extended.id_original = "diffManuel".id;
