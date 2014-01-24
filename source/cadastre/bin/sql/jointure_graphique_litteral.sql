-- jointure entre les données litterales du cadatre et les données graphiques

-- creation d'un table cad_bati

drop table if exists cadastre_travail.cad_bati;
create table cadastre_travail.cad_bati as 
(
  select
    *,
    cast('dur' as varchar(4)) as type_bati
  from cad_bati_dur
)
union
(
  select
    *,
    cast('leger' as varchar(4)) as type_bati
  from cad_bati_leger
);

--select count(1) from cad_bati;


--jointure entre la table cad_bati (graphique) et la table dgfip_desc (infos litterale)

drop table if exists cadastre_travail.bati_desc;
create table cadastre_travail.bati_desc as 
select 
  *
from
  dgfip_desc
    left join
    cad_bati
    on cast(dgfip_desc.pbd_parcelle as varchar(15)) = rtrim(cad_bati.id_parcelle)
;

--jointure entre la table cad_bati (graphique) et la table dgfip_pev (infos litterale)

drop table if exists cadastre_travail.bati_pev;
create table cadastre_travail.bati_pev as 
select 
  *
from
  dgfip_pev
    left join
    cad_bati
    on cast(dgfip_pev.pbd_parcelle as varchar(15)) = rtrim(cad_bati.id_parcelle)
;

--jointure entre la table cad_bati (graphique) et la table dgfip_invar (infos litterale)

drop table if exists cadastre_travail.bati_invar;
create table cadastre_travail.bati_invar as 
select 
  *
from
  dgfip_invar
    left join
    cad_bati
    on cast(dgfip_invar.pbd_parcelle as varchar(15)) = rtrim(cad_bati.id_parcelle)
;

--jointure entre la table cad_bati (graphique) et la table dgfip_batiment (infos litterale)

drop table if exists cadastre_travail.bati_batiment;
create table cadastre_travail.bati_batiment as 
select 
  *
from
  dgfip_batiment
    left join
    cad_bati
    on cast(dgfip_batiment.pbd_parcelle as varchar(15)) = rtrim(cad_bati.id_parcelle)
;

--jointure entre la table cad_bati (graphique) et la table dgfip_parcelle (infos litterale)

drop table if exists cadastre_travail.bati_parcelle;
create table cadastre_travail.bati_parcelle as 
select 
  *
from
  dgfip_parcelle
    left join
    cad_bati
    on cast(dgfip_parcelle.pbd_parcelle as varchar(15)) = rtrim(cad_bati.id_parcelle)
;


--jointure entre la table cad_parcelle (graphique) et la table dgfip_parcelle (infos litterale)

drop table if exists cadastre_travail.parcelle;
create table cadastre_travail.parcelle as 
select 
  *
from
  dgfip_parcelle
    left join
    cad_parcelle
    on cast(dgfip_parcelle.pbd_parcelle as varchar(15)) = rtrim(cad_parcelle.id_parcelle)
;

--jointure entre la table cad_parcelle (graphique) et la table dgfip_batiment (infos litterale)

drop table if exists cadastre_travail.parcelle_batiment;
create table cadastre_travail.parcelle_batiment as 
select 
  *
from
  dgfip_batiment
    left join
    cad_parcelle
    on cast(dgfip_batiment.pbd_parcelle as varchar(15)) = rtrim(cad_parcelle.id_parcelle)
;

--jointure entre la table cad_parcelle (graphique) et la table dgfip_invar (infos litterale)

drop table if exists cadastre_travail.parcelle_invar;
create table cadastre_travail.parcelle_invar as 
select 
  *
from
  dgfip_invar
    left join
    cad_parcelle
    on cast(dgfip_invar.pbd_parcelle as varchar(15)) = rtrim(cad_parcelle.id_parcelle)
;


--jointure entre la table cad_parcelle (graphique) et la table dgfip_pev (infos litterale)

drop table if exists cadastre_travail.parcelle_pev;
create table cadastre_travail.parcelle_pev as 
select 
  *
from
  dgfip_pev
    left join
    cad_parcelle
    on cast(dgfip_pev.pbd_parcelle as varchar(15)) = rtrim(cad_parcelle.id_parcelle)
;

--jointure entre la table cad_parcelle (graphique) et la table dgfip_desc (infos litterale)

drop table if exists cadastre_travail.parcelle_desc;
create table cadastre_travail.parcelle_desc as 
select 
  *
from
  dgfip_desc
    left join
    cad_parcelle
    on cast(dgfip_desc.pbd_parcelle as varchar(15)) = rtrim(cad_parcelle.id_parcelle)
;


