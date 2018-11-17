


?query=select%20*%0Afrom%20LocalisationPPI%0A--where%20LocalisationPPI.dataPPI_GrandProjet%20%3D%20'X'%0A&uid=pkuid

------------
-- requete 0 = LocalisationPPI_TousAvecNumero
------------
select
    *
from
    LocalisationPPI
--  where
--    LocalisationPPI.dataPPI_GrandProjet = 'X'




?query=select%20*%0Afrom%20LocalisationPPI%0Awhere%20LocalisationPPI.dataPPI_GrandProjet%20%3D%20'X'%0A&uid=pkuid

------------
-- requete 1 = LocalisationPPI_TousAvecNumero
------------
select
    *
from
    LocalisationPPI
where
    LocalisationPPI.dataPPI_GrandProjet = 'X'

?query=select%201%20as%20id%20/*:int*/,%20st_envelope(st_union(geometry))%20as%20geom%0Afrom%20LocalisationPPI_GrandsProjetsUniquement%0A--where%20dataPPI_Axe2.codeAxe2%20%3D%20'C4'&uid=id

------------
-- requete 2 = LocalisationPPI_Axe0
------------
select
    1 as id /*:int*/,
    st_envelope(st_union(geometry)) as geom
from
    LocalisationPPI_GrandsProjetsUniquement
-- where
--    dataPPI_Axe2.codeAxe2 = 'C4'


?query=select%20dataPPI_Axe1.id,%20dataPPI.Axe1,%20dataPPI_Axe1.libelleAxe1,%20st_envelope(st_union(geometry))%20as%20geom%0Afrom%20LocalisationPPI_GrandsProjetsUniquement,%20dataPPI,%20dataPPI_Axe1%0Awhere%20LocalisationPPI_GrandsProjetsUniquement.NumeroPPI%20%3D%20dataPPI.NumeroPPI%0Aand%20dataPPI.Axe1%20%3D%20dataPPI_Axe1.codeAxe1%0Agroup%20by%20dataPPI.Axe1%0A%0A&uid=id

------------
-- requete 3 = LocalisationPPI_Axe1
------------
select
    dataPPI_Axe1.id,
    dataPPI.Axe1,
    dataPPI_Axe1.libelleAxe1,
    st_envelope(st_union(geometry)) as geom
from
    LocalisationPPI_GrandsProjetsUniquement,
    dataPPI,
    dataPPI_Axe1
where
    LocalisationPPI_GrandsProjetsUniquement.NumeroPPI %= dataPPI.NumeroPPI
  and
    dataPPI.Axe1 = dataPPI_Axe1.codeAxe1
group by
    dataPPI.Axe1


?query=select%20dataPPI_Axe2.id,%20dataPPI.Axe2,%20dataPPI_Axe2.libelleAxe2,%20dataPPI_Axe2.codeAxe1,%20dataPPI_Axe2.libelleAxe1,%20st_envelope(st_union(geometry))%20as%20geom%0Afrom%20LocalisationPPI_GrandsProjetsUniquement,%20dataPPI,%20dataPPI_Axe2%0Awhere%20LocalisationPPI_GrandsProjetsUniquement.NumeroPPI%20%3D%20dataPPI.NumeroPPI%0A%20%20and%20dataPPI.Axe2%20%3D%20dataPPI_Axe2.codeAxe2%0Agroup%20by%20dataPPI.Axe2%0Aunion%0A%0Aselect%2012,%20'C4',%20'Outils%20de%20projection%20et%20de%20suivi',%20'C',%20'Ville%20sure%20et%20durable',%20st_envelope(st_union(geometry))%20as%20geom%0Afrom%20LocalisationPPI%0A--where%20dataPPI_Axe2.codeAxe2%20%3D%20'C4'%0A%0Aunion%0A%0Aselect%2010,%20'C2',%20'Les%20nouvelles%20mobilit%C3%A9s',%20'C',%20'Ville%20sure%20et%20durable',%20st_envelope(st_union(geometry))%20as%20geom%0Afrom%20LocalisationPPI%0A--where%20dataPPI_Axe2.codeAxe2%20%3D%20'C4'&uid=id

------------
-- requete 4 = LocalisationPPI_Axe2
------------
select
    dataPPI_Axe2.id,
    dataPPI.Axe2,
    dataPPI_Axe2.libelleAxe2,
    dataPPI_Axe2.codeAxe1,
    dataPPI_Axe2.libelleAxe1,
    st_envelope(st_union(geometry)) as geom
from
    LocalisationPPI_GrandsProjetsUniquement,
    dataPPI,
    dataPPI_Axe2
where
    LocalisationPPI_GrandsProjetsUniquement.NumeroPPI = dataPPI.NumeroPPI
  and
    dataPPI.Axe2 = dataPPI_Axe2.codeAxe2
group by
    dataPPI.Axe2

union

select
    12,
    'C4',
    'Outils de projection et de suivi',
    'C',
    'Ville sure et durable',
    st_envelope(st_union(geometry)) as geom
from
    LocalisationPPI
-- where
--    dataPPI_Axe2.codeAxe2 = 'C4'

union

select
    10,
    'C2',
    'Les nouvelles mobilité%A9s',
    'C',
    'Ville sure et durable',
    st_envelope(st_union(geometry)) as geom
from
    LocalisationPPI
-- where
    dataPPI_Axe2.codeAxe2 = 'C4'


