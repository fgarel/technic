--
-- Création / mise à jour de la table parcelle_tab
--


-- Mise a jour de la table avancement_gspreadsheet
-- La table numvoie est dejà mise à jour dans le script
-- espu_voirieAdministratif_projet_update_avantImpression.sql

-- Après impression, on met à jour la table avancement_gspreadsheet


-- Mise à jour d'avancement_gspreadsheet pour les demandes déjà existantes demandes (forcées)
update  voirie_administratif.avancement_gspreadsheet
set code_demande = req01.code_demande,
    demande_date = req01.demande_date,
    demande_type_numerotage = req01.demande_type_numerotage,
    demande_type_alignement = req01.demande_type_alignement,
    demandeur_telephone = req01.demandeur_telephone,
    demandeur_courriel = req01.demandeur_courriel,
    demandeur_ligne1_raison_sociale_ou_identite = req01.demandeur_ligne1_raison_sociale_ou_identite,
    demandeur_ligne2_identite_ou_complement = req01.demandeur_ligne2_identite_ou_complement,
    demandeur_ligne3_complement = req01.demandeur_ligne3_complement,
    demandeur_ligne4_numvoie_nomvoie = req01.demandeur_ligne4_numvoie_nomvoie,
    demandeur_ligne5_boite_postal_ou_lieu_dit = req01.demandeur_ligne5_boite_postal_ou_lieu_dit,
    demandeur_ligne6_code_postal_ville_cedex = req01.demandeur_ligne6_code_postal_ville_cedex,
    "bienImmo_vosrefs_ligne1" = req01."bienImmo_vosrefs_ligne1",
    "bienImmo_vosrefs_ligne2" = req01."bienImmo_vosrefs_ligne2",
    "bienImmo_proprietaire" = req01."bienImmo_proprietaire",
    numero = req01.numero,
    suffixe = req01.suffixe,
    voie_nom = req01.voie_nom,
    observation = req01.observation,
    ccosec = req01.ccosec,
    parcelle = req01.parcelle,
    ident = req01.ident,
    codeident = req01.codeident,
    code_fantoir = req01.code_fantoir,
    fin_cle_interop = req01.fin_cle_interop,
    cle_interop = req01.cle_interop
from
  (select voirie_administratif.lj_avancement_demande_parcelle.*
  from voirie_administratif.avancement_gspreadsheet
  right join voirie_administratif.lj_avancement_demande_parcelle
    on voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.lj_avancement_demande_parcelle.code_demande
  ) as req01
  where voirie_administratif.avancement_gspreadsheet.code_demande = req01.code_demande;


-- Mise à jour d'avancement_gspreadsheet : insertion des nouvelles demandes
insert into voirie_administratif.avancement_gspreadsheet

	select
	  voirie_administratif.lj_avancement_demande_parcelle.code_demande,
      voirie_administratif.lj_avancement_demande_parcelle.demande_date,
      voirie_administratif.lj_avancement_demande_parcelle.demande_type_numerotage,
      voirie_administratif.lj_avancement_demande_parcelle.demande_type_alignement,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_telephone,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_courriel,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne1_raison_sociale_ou_identite,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne2_identite_ou_complement,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne3_complement,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne4_numvoie_nomvoie,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne5_boite_postal_ou_lieu_dit,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne6_code_postal_ville_cedex,
      voirie_administratif.lj_avancement_demande_parcelle."bienImmo_vosrefs_ligne1",
      voirie_administratif.lj_avancement_demande_parcelle."bienImmo_vosrefs_ligne2",
      voirie_administratif.lj_avancement_demande_parcelle."bienImmo_proprietaire",
      voirie_administratif.lj_avancement_demande_parcelle.numero,
      voirie_administratif.lj_avancement_demande_parcelle.suffixe,
      voirie_administratif.lj_avancement_demande_parcelle.voie_nom,
      voirie_administratif.lj_avancement_demande_parcelle.observation,
      voirie_administratif.lj_avancement_demande_parcelle.ccosec,
      voirie_administratif.lj_avancement_demande_parcelle.parcelle,
      voirie_administratif.lj_avancement_demande_parcelle.ident,
      voirie_administratif.lj_avancement_demande_parcelle.codeident,
      voirie_administratif.lj_avancement_demande_parcelle.code_fantoir,
      voirie_administratif.lj_avancement_demande_parcelle.fin_cle_interop,
      voirie_administratif.lj_avancement_demande_parcelle.cle_interop
    from voirie_administratif.avancement_gspreadsheet
    right join voirie_administratif.lj_avancement_demande_parcelle
      on voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.lj_avancement_demande_parcelle.code_demande
	  where voirie_administratif.avancement_gspreadsheet.code_demande is null
    --where voirie_administratif.avancement_gspreadsheet.code_demande = voirie_administratif.lj_avancement_demande_parcelle.code_demande
    group by
	  voirie_administratif.lj_avancement_demande_parcelle.code_demande,
      voirie_administratif.lj_avancement_demande_parcelle.demande_date,
      voirie_administratif.lj_avancement_demande_parcelle.demande_type_numerotage,
      voirie_administratif.lj_avancement_demande_parcelle.demande_type_alignement,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_telephone,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_courriel,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne1_raison_sociale_ou_identite,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne2_identite_ou_complement,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne3_complement,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne4_numvoie_nomvoie,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne5_boite_postal_ou_lieu_dit,
      voirie_administratif.lj_avancement_demande_parcelle.demandeur_ligne6_code_postal_ville_cedex,
      voirie_administratif.lj_avancement_demande_parcelle."bienImmo_vosrefs_ligne1",
      voirie_administratif.lj_avancement_demande_parcelle."bienImmo_vosrefs_ligne2",
      voirie_administratif.lj_avancement_demande_parcelle."bienImmo_proprietaire",
      voirie_administratif.lj_avancement_demande_parcelle.numero,
      voirie_administratif.lj_avancement_demande_parcelle.suffixe,
      voirie_administratif.lj_avancement_demande_parcelle.voie_nom,
      voirie_administratif.lj_avancement_demande_parcelle.observation,
      voirie_administratif.lj_avancement_demande_parcelle.ccosec,
      voirie_administratif.lj_avancement_demande_parcelle.parcelle,
      voirie_administratif.lj_avancement_demande_parcelle.ident,
      voirie_administratif.lj_avancement_demande_parcelle.codeident,
      voirie_administratif.lj_avancement_demande_parcelle.code_fantoir,
      voirie_administratif.lj_avancement_demande_parcelle.fin_cle_interop,
      voirie_administratif.lj_avancement_demande_parcelle.cle_interop;


--select * from voirie_administratif.mv_demande_gspreadsheet order by code_demande;
--select * from voirie_administratif.avancement_gspreadsheet order by code_demande;
--select * from voirie_administratif.lj_demande_parcelle order by code_demande;
--select * from voirie_administratif.lj_demande_parcelle_numvoie order by code_demande;
--select * from voirie_administratif.lj_demande_numvoie order by code_demande;
--select * from voirie_administratif.lj_demande_numvoie_parcelle order by code_demande;
--select * from voirie_administratif.lj_avancement_demande order by code_demande;
--select * from voirie_administratif.lj_avancement_demande_parcelle order by code_demande;
