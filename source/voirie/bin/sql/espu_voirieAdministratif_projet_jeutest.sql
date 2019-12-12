
-- creation et initialisation de la table avancement_gspreadsheet
-- à partir de données gspreadsheet

DROP TABLE if exists voirie_administratif.avancement_gspreadsheet;
CREATE TABLE voirie_administratif.avancement_gspreadsheet
as
  select * from mv_demande_gspreadsheet;

--update voirie_administratif.avancement_gspreadsheet
--set demande_type_numerotage = 'fait'
--where voirie_administratif.avancement_gspreadsheet.demande_type_numerotage = 'an'
--  or voirie_administratif.avancement_gspreadsheet.demande_type_numerotage = 'n';

-- ajout de quelques enregistrements
select * from  voirie_administratif.avancement_gspreadsheet;
insert into voirie_administratif.avancement_gspreadsheet (
select
  '2898' as code_demande,
  demande_date,
  demande_type_numerotage,
  demande_type_alignement,
  demandeur_telephone,
  demandeur_courriel,
  demandeur_ligne1_raison_sociale_ou_identite,
  demandeur_ligne2_identite_ou_complement,
  demandeur_ligne3_complement,
  demandeur_ligne4_numvoie_nomvoie,
  demandeur_ligne5_boite_postal_ou_lieu_dit,
  demandeur_ligne6_code_postal_ville_cedex,
  "bienImmo_vosrefs_ligne1",
  "bienImmo_vosrefs_ligne2",
  "bienImmo_proprietaire",
  numero,
  suffixe,
  voie_nom,
  observation,
  ccosec,
  parcelle,
  ident,
  codeident,
  code_fantoir,
  fin_cle_interop,
  cle_interop
from voirie_administratif.mv_demande_gspreadsheet
where voirie_administratif.mv_demande_gspreadsheet.code_demande = '2900'
);
select * from  voirie_administratif.avancement_gspreadsheet;
insert into voirie_administratif.avancement_gspreadsheet (
select
  '2899' as code_demande,
  demande_date,
  demande_type_numerotage,
  demande_type_alignement,
  demandeur_telephone,
  demandeur_courriel,
  demandeur_ligne1_raison_sociale_ou_identite,
  demandeur_ligne2_identite_ou_complement,
  demandeur_ligne3_complement,
  demandeur_ligne4_numvoie_nomvoie,
  demandeur_ligne5_boite_postal_ou_lieu_dit,
  demandeur_ligne6_code_postal_ville_cedex,
  "bienImmo_vosrefs_ligne1",
  "bienImmo_vosrefs_ligne2",
  "bienImmo_proprietaire",
  numero,
  suffixe,
  voie_nom,
  observation,
  ccosec,
  parcelle,
  ident,
  codeident,
  code_fantoir,
  fin_cle_interop,
  cle_interop
from mv_demande_gspreadsheet
where voirie_administratif.mv_demande_gspreadsheet.code_demande = '2901'
);


-- suppresion de quelques enregistrements
delete from voirie_administratif.avancement_gspreadsheet
where code_demande in ('2920','2921','2922','2923','2924','2925','2926','2927','2928');
