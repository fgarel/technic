select  'Hyper Centre' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Notre Dame - Arsenal'
  or cq_nom = 'La Préfecture - Verdun - Saintes Claires'
  or cq_nom = 'Saint Nicolas - La Gare - Le Gabut'
union
select 'La Genette' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'La Genette'
union
select 'La Trompette - Fétilly' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'La Trompette - Jéricho - Bel Air - Franck Espoir'
  or cq_nom = 'Fétilly'
union
select 'Le Prieuré - Cognehors - Lafond - Beauregard' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Le Prieuré'
  or cq_nom = 'Cognehors - Lafond - Beauregard'
union
select 'Saint Eloi' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Saint Eloi'
union
select 'Les Minimes' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Les Minimes'
union
select 'Tasdon - Bongraine' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Tasdon'
  or cq_nom = 'Bongraine'
union
select 'VLS - Le Petit Marseille' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Villeneuve les Salines'
  or cq_nom = 'Le Petit Marseille'
union
select 'Port Neuf' as nom, st_union(geometry) as geom
from population_comite_quartier
  where cq_nom = 'Port-Neuf'
union
select 'Laleu La Pallice La Rossignolette' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Laleu - La Pallice - La Rossignolette'
union
select 'Mireuil Saint Maurice Les Hauts de Bel Air' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Mireuil'
  or cq_nom = 'Saint Maurice'
  or cq_nom = 'Les Hauts de Bel Air'
;






select  'Secteur Centre' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Notre Dame - Arsenal'
  or cq_nom = 'La Préfecture - Verdun - Saintes Claires'
  or cq_nom = 'Saint Nicolas - La Gare - Le Gabut'
  or cq_nom = 'La Genette'
  or cq_nom = 'La Trompette - Jéricho - Bel Air - Franck Espoir'
  or cq_nom = 'Fétilly'
  or cq_nom = 'Le Prieuré'
  or cq_nom = 'Cognehors - Lafond - Beauregard'
  or cq_nom = 'Saint Eloi'
union
select 'Secteur Sud' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Les Minimes'
  or cq_nom = 'Tasdon'
  or cq_nom = 'Bongraine'
  or cq_nom = 'Villeneuve les Salines'
  or cq_nom = 'Le Petit Marseille'
union
select 'Secteur Ouest 2' as nom, st_union(geometry) as geom
from population_comite_quartier
  where cq_nom = 'Port-Neuf'
  or cq_nom = 'Laleu - La Pallice - La Rossignolette'
union
select 'Secteur Ouest 1' as nom, st_union(geometry) as geom
from population_comite_quartier
where cq_nom = 'Mireuil'
  or cq_nom = 'Saint Maurice'
  or cq_nom = 'Les Hauts de Bel Air'
;
