-- Selection des toponymes
select distinct voie_lib as voie_libelle
from voirie_filaire_toponymie
order by voie_lib;

-- Selection des noms des voies (attribut de filaire_voie)
select distinct voie_libelle 
from voirie_filaire_voie
order by voie_libelle;

-- Selection des noms des ouvrages
select oa_libelle as voie_libelle
from ouvrage_art
order by oa_libelle;


-- union des trois 

(
  -- Selection des toponymes
  select distinct voie_lib as voie_libelle
  from voirie_filaire_toponymie
)
union
(
  -- Selection des noms des voies (attribut de filaire_voie)
  select distinct voie_libelle 
  from voirie_filaire_voie
)
union
(
  -- Selection des noms des ouvrages
  select oa_libelle as voie_libelle
  from ouvrage_art
)
order by voie_libelle;
