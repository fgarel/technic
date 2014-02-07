#!/bin/bash


# ce script a pour but d'executer un certain nombre de requete sql dans les 
#différents datasmart

# pour eviter de s'authentifier à chaque execution de psql, on utilise cette 
# astuce consitant à creer un fichier .pgpass
# http://www.postgresql.org/docs/8.3/static/libpq-pgpass.html
# vi ~/.pgpass

rm -f *.csv
rm -f ./A_Citoyennete/Formalites_administratives/*.csv
rm -f ./A_Citoyennete/Electeurs/*.csv
rm -f ./A_Citoyennete/Cimetieres/*.csv
rm -f ./A_Citoyennete/Associations/*.csv
rm -f ./A_Citoyennete/Actes_d_etat_civil/*.csv

rm -f ./B_Deplacement/Accidents_routiers/*.csv

rm -f ./C_Espace_public/Dict/*.csv
rm -f ./C_Espace_public/Patrimoine_communal/*.csv
rm -f ./C_Espace_public/Reseau_d_eclairage_public/*.csv
rm -f ./C_Espace_public/Reseau_d_eaux_pluviales/*.csv
rm -f ./C_Espace_public/Reseau_d_eau_potable/*.csv
rm -f ./C_Espace_public/Erp/*.csv
rm -f ./C_Espace_public/Mobilier_urbain/*.csv
rm -f ./C_Espace_public/Reseau_de_transport_cyclable/*.csv

rm -f ./D_Finance/Facturation_de_l_eau/*.csv
rm -f ./D_Finance/Taxe_de_sejour/*.csv

rm -f ./E_Gestion_interne/Files_d_attente/*.csv
rm -f ./E_Gestion_interne/Indicateurs_touristiques/*.csv

rm -f ./F_Jeunesse_sort_et_culture/Enfants_scolarises/*.csv
rm -f ./F_Jeunesse_sort_et_culture/Archives_municipales/*.csv
rm -f ./F_Jeunesse_sort_et_culture/Passeport_jeune/*.csv


rm -f ./H_Referentiel_geographique/Decoupages_electoraux/*.csv
rm -f ./H_Referentiel_geographique/Decoupages_population/*.csv
rm -f ./H_Referentiel_geographique/Decoupages_Insee/*.csv
rm -f ./H_Referentiel_geographique/Cadastre/*.csv
rm -f ./H_Referentiel_geographique/Referentiel_topographique/*.csv
rm -f ./H_Referentiel_geographique/Voies_et_adresses/*.csv


###################
###################
## A_Citoyennete ##
###################
###################


###############
# ds_decennie #
###############
# autorisation_sortie_territoire
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from autorisation_sortie_territoire order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ast_civilite_dem) * from autorisation_sortie_territoire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__ast_civilite_dem.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ast_sit_famil_dem) * from autorisation_sortie_territoire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__ast_sit_famil_dem.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ast_avis) * from autorisation_sortie_territoire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__ast_avis.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ast_lieu_depot) * from autorisation_sortie_territoire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__ast_lieu_depot.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ast_lieu_retrait) * from autorisation_sortie_territoire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__ast_lieu_retrait.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ast_sexe_sup) * from autorisation_sortie_territoire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__ast_sexe_sup.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ast_obs) * from autorisation_sortie_territoire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__autorisation_sortie_territoire__ast_obs.csv

# debit_permanent
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from debit_permanent order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_permanent__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (dp_demande_valide) * from debit_permanent;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_permanent__dp_demande_valide.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (dp_classe) * from debit_permanent;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_permanent__dp_classe.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (dp_type_evenement) * from debit_permanent;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_permanent__dp_type_evenement.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (dp_qualite_demandeur) * from debit_permanent;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_permanent__dp_qualite_demandeur.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (dp_qualite_proprio) * from debit_permanent;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_permanent__dp_qualite_proprio.csv

# debit_temporaire
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from debit_temporaire order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_temporaire__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (dt_classe_debit) * from debit_temporaire;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__debit_temporaire__dt_classe_debit.csv


# demande_attestation_accueil
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from demande_attestation_accueil order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__2000.csv
paste -s -d ' ' A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_civilite) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_lieu_depot) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa__lieu_depot.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_lieu_retrait) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa_lieu_retrait.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_type_resid) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa_type_resid.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_type_occup) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa_type_occup.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_assur) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa_assur.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_visite) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa_visite.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (aa_statut_visa) * from demande_attestation_accueil;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_attestation_accueil__aa_statut_visa.csv


# demande_carte_grise
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from demande_carte_grise order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_grise__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cg_civilite_demandeur) * from demande_carte_grise;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_grise__cg_civilite_demandeur.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cg_lieu_depot) * from demande_carte_grise;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_grise__cg_lieu_depot.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cg_lieu_retrait) * from demande_carte_grise;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_grise__cg_lieu_retrait.csv

# demande_carte_identite
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from demande_carte_nationale_identite order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_nationale_identite__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cni_civilite_dem) * from demande_carte_identite;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_identite__cni_civilite_dem.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cni_avis) * from demande_carte_identite;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_identite__cni_avis.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cni_lieu_depot) * from demande_carte_identite;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_identite__cni_lieu_depot.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cni_lieu_retrait) * from demande_carte_identite;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_identite__cni_lieu_retrait.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cni_validite) * from demande_carte_identite;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_carte_identite__cni_validite.csv

# demande_naturalisation
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from demande_naturalisation order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_naturalisation__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (na_civilite) * from demande_naturalisation;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_naturalisation__na_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (na_avis) * from demande_naturalisation;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_naturalisation__na_avis.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (na_lieu_depot) * from demande_naturalisation;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_naturalisation__na_lieu_depot.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (na_lieu_retrait) * from demande_naturalisation;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_naturalisation__na_lieu_retrait.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (na_validite) * from demande_naturalisation;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_naturalisation__na_validite.csv

# demande_passeport
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from demande_passeport order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_passeport__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (pa_civilite) * from demande_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_passeport__pa_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (pa_avis) * from demande_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_passeport__pa_avis.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (pa_lieu_depot) * from demande_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_passeport__pa_lieu_depot.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (pa_lieu_retrait) * from demande_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_passeport__pa_lieu_retrait.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (pa_validite) * from demande_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_passeport__pa_validite.csv

# demande_sdf
psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from demande_sdf order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_sdf__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (hu_civilite) * from demande_sdf;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_sdf__hu_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (hu_lieu_depot) * from demande_sdf;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_sdf__hu_lieu_depot.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (hu_lieu_retrait) * from demande_sdf;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__demande_sdf__hu_lieu_retrait.csv

# personne_hebergee
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from personne_hebergee order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_hebergee__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ph_type) * from personne_hebergee;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_hebergee__ph_type.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ph_civilite) * from personne_hebergee;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_hebergee__ph_civilite.csv

# personne_suppl_cni
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from personne_suppl_cni order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_cni__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cp_lien) * from personne_suppl_cni;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_cni__cp_lien.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cp_sexe) * from personne_suppl_cni;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_cni__cp_sexe.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cp_civilite) * from personne_suppl_cni;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_cni__cp_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (cp_sit_famil) * from personne_suppl_cni;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_cni__cp_sit_famil.csv

# personne_suppl_naturalisation
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from personne_suppl_naturalisation order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_naturalisation__2000.csv

# personne_suppl_passeport
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from personne_suppl_passeport order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_passeport__2000.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ps_type_personne_supl) * from personne_suppl_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_passeport__ps_type_personne_supl.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ps_sexe) * from personne_suppl_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_passeport__ps_sexe.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ps_civilite) * from personne_suppl_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_passeport__ps_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select distinct on (ps_situation_familiale) * from personne_suppl_passeport;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__personne_suppl_passeport__ps_situation_familiale.csv

# pli_huissier
#psql -h dsiappli14 -U contrib -d ds_decennie -c "select * from pli_huissier order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Formalites_administratives/ds_decennie__pli_huissier__2000.csv


################
# ds_electeurs #
################
# bureau
psql -h dsiappli14 -U contrib -d ds_electeurs -c "select * from bureau order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Electeurs/ds_electeurs__bureau__2000.csv
rm -f tmpfile ; cat ./A_Citoyennete/Electeurs/ds_electeurs__bureau__2000.csv | recode utf-8..cp850 | recode iso8859-1..utf-8  > tmpfile ; rm -f ./A_Citoyennete/Electeurs/ds_electeurs__bureau__2000.csv ; mv -f tmpfile A_Citoyennete/Electeurs/ds_electeurs__bureau__2000.csv

# electeur
psql -h dsiappli14 -U contrib -d ds_electeurs -c "select * from electeur order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Electeurs/ds_electeurs__electeur__2000.csv
rm -f tmpfile ; cat ./A_Citoyennete/Electeurs/ds_electeurs__electeur__2000.csv | recode utf-8..cp850 | recode iso8859-1..utf-8  > tmpfile ; rm -f ./A_Citoyennete/Electeurs/ds_electeurs__electeur__2000.csv ; mv -f tmpfile A_Citoyennete/Electeurs/ds_electeurs__electeur__2000.csv

# voie
psql -h dsiappli14 -U contrib -d ds_electeurs -c "select * from voie order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Electeurs/ds_electeurs__voie__2000.csv
rm -f tmpfile ; cat ./A_Citoyennete/Electeurs/ds_electeurs__voie__2000.csv | recode utf-8..cp850 | recode iso8859-1..utf-8  > tmpfile ; rm -f ./A_Citoyennete/Electeurs/ds_electeurs__voie__2000.csv ; mv -f tmpfile A_Citoyennete/Electeurs/ds_electeurs__voie__2000.csv

###############
# ds_gescimes #
###############
# cimetiere
psql -h dsiappli14 -U contrib -d ds_gescimes -c "select * from cimetiere order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__cimetiere__2000.csv

# concession
psql -h dsiappli14 -U contrib -d ds_gescimes -c "select * from concession order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__2000.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (co_duree) * from concession;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__co_duree.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (co_type) * from concession;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__co_type.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (co_surface) * from concession;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__co_surface.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (co_type_cim) * from concession;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__co_type_cim.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (co_etat) * from concession;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__co_etat.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (co_lieu_multiple) * from concession;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__co_lieu_multiple.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (co_lieu_multiple_princ) * from concession;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concession__co_lieu_multiple_princ.csv

# concessionnaire
psql -h dsiappli14 -U contrib -d ds_gescimes -c "select * from concessionnaire order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concessionnaire__2000.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (ca_civilite) * from concessionnaire;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__concessionnaire__ca_civilite.csv

# defunt
psql -h dsiappli14 -U contrib -d ds_gescimes -c "select * from defunt order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__defunt__2000.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (df_parente) * from defunt;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__defunt__df_parente.csv

# interlocuteur
psql -h dsiappli14 -U contrib -d ds_gescimes -c "select * from interlocuteur order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__interlocuteur__2000.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (in_civilite) * from interlocuteur;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__interlocuteur__in_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_gescimes -c "select distinct on (in_nature) * from interlocuteur;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__interlocuteur__in_nature.csv

# lieu
psql -h dsiappli14 -U contrib -d ds_gescimes -c "select * from lieu order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__lieu__2000.csv

# lieu_multiple
psql -h dsiappli14 -U contrib -d ds_gescimes -c "select * from lieu_multiple order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Cimetieres/ds_gescimes__lieu_multiple__2000.csv


###################
# ds_associations #
###################
# activite
psql -h dsiappli14 -U contrib -d ds_associations -c "select * from activite order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Associations/ds_associations__activite__2000.csv

# association
psql -h dsiappli14 -U contrib -d ds_associations -c "select * from association order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Associations/ds_associations__association__2000.csv

# association_activite
psql -h dsiappli14 -U contrib -d ds_associations -c "select * from association_activite order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Associations/ds_associations__association_activite__2000.csv

# division_principale
psql -h dsiappli14 -U contrib -d ds_associations -c "select * from division_principale order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Associations/ds_associations__division_principale__2000.csv

# evenement
psql -h dsiappli14 -U contrib -d ds_associations -c "select * from evenement order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Associations/ds_associations__evenement__2000.csv

# proprietaire
#psql -h dsiappli14 -U contrib -d ds_associations -c "select * from proprietaire order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Associations/ds_associations__proprietaire__2000.csv

# site
psql -h dsiappli14 -U contrib -d ds_associations -c "select * from site order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Associations/ds_associations__site__2000.csv

#############
# ds_siecle #
#############
# acte_deces
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_deces limit 300;" -A -F ";" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__300.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ad_hors_comm) * from acte_deces;" -A -F ";" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__ad_hors_comm.csv

# acte_deces_2
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_deces__acte order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_deces__acte_personne_deces order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte_personne_deces__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte_personne_deces__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte_personne_deces__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__acte_personne_deces__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_deces__personne_deces order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__personne_deces__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__personne_deces__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__personne_deces__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces__personne_deces__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ad_deces_lieu_type) * from acte_deces_2;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_deces_lieu_type.csv
#sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_deces_lieu_type.csv
#paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_deces_lieu_type.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_deces_lieu_type.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ad_defunt_sexe) * from acte_deces_2;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_sexe.csv
#sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_sexe.csv
#paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_sexe.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_sexe.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ad_defunt_situation_matrimoniale) * from acte_deces_2;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_situation_matrimoniale.csv
#sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_situation_matrimoniale.csv
#paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_situation_matrimoniale.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_deces_2__ad_defunt_situation_matrimoniale.csv

# acte_mariage
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_mariage limit 300;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__300.csv
#sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__300.csv
#paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__300.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__300.csv

# acte_mariage_2
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_mariage__acte order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_mariage__acte_personne_mariage order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte_personne_mariage__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte_personne_mariage__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte_personne_mariage__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__acte_personne_mariage__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_mariage__personne_mariage order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__personne_mariage__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__personne_mariage__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__personne_mariage__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_mariage__personne_mariage__2000.csv
# acte_naissance
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_naissance limit 300;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__300.csv
#sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__300.csv
#paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__300.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__300.csv

# acte_naissance_2
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_naissance__acte order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_naissance__acte_personne_naissance order by random() limit 4000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte_personne_naissance__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte_personne_naissance__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte_personne_naissance__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__acte_personne_naissance__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_naissance__personne_naissance_pere order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_pere__2000.csv
#sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_pere__2000.csv
#paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_pere__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_pere__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_naissance__personne_naissance_mere order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_mere__2000.csv
#sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_mere__2000.csv
#paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_mere__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_mere__2000.csv
#rm -f A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance__2000.csv
#touch A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance__2000.csv
#cat A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_pere__2000.csv A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance_mere__2000.csv >> A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_naissance__personne_naissance order by random() limit 4000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance__personne_naissance__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_enfant_sexe) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_enfant_sexe.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_accouchement_type) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_accouchement_type.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_accouchement_condition) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_accouchement_condition.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_qualite_juridique) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_qualite_juridique.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_reconnaissance_pere_type) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_reconnaissance_pere_type.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_pere_situation_professionnelle) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_pere_situation_professionnelle.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_pere_adresse_voie_type) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_pere_adresse_voie_type.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_reconnaissance_mere_type) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_reconnaissance_mere_type.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_mere_situation_professionnelle) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_mere_situation_professionnelle.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (an_mere_adresse_voie_type) * from acte_naissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_naissance_2__an_mere_adresse_voie_type.csv

# acte_personne
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_personne order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_personne__2000.csv

# acte_reconnaissance
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_reconnaissance limit 300;" -A -F ";" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__300.csv

# acte_reconnaissance_2
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_reconnaissance__acte order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_reconnaissance__acte_personne_reconnaissance order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte_personne_reconnaissance__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte_personne_reconnaissance__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte_personne_reconnaissance__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__acte_personne_reconnaissance__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from acte_reconnaissance__personne_reconnaissance order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__personne_reconnaissance__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__personne_reconnaissance__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__personne_reconnaissance__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance__personne_reconnaissance__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ar_reconnaissance_ante_ou_post) * from acte_reconnaissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance_2__ar_reconnaissance_ante_ou_post.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ar_pere_situation_professionnelle) * from acte_reconnaissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance_2__ar_pere_situation_professionnelle.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ar_pere_adresse_voie_type) * from acte_reconnaissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance_2__ar_pere_adresse_voie_type.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ar_mere_situation_professionnelle) * from acte_reconnaissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance_2__ar_mere_situation_professionnelle.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ar_mere_adresse_voie_type) * from acte_reconnaissance_2;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__acte_reconnaissance_2__ar_mere_adresse_voie_type.csv


# affichage_mairie
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from affichage_mairie order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__affichage_mairie__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (af_civ_titulaire) * from affichage_mairie;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__affichage_mairie__af_civ_titulaire.csv

# certif_non_opposition
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from certificat_non_opposition order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__certificat_non_opposition__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (cp_civ_dem) * from certif_non_opposition;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__certif_non_opposition__cp_civ_dem.csv

# certif_heredite
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from certificat_heredite order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__certificat_heredite__2000.csv

# demande_extrait_acte
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from demande_extrait_acte order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ea_type_cext_id) * from demande_extrait_acte;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__ea_type_cext_id.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ea_qualite_dem) * from demande_extrait_acte;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__ea_qualite_dem.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ea_mode_recep) * from demande_extrait_acte;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__ea_mode_recep.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ea_piece_justif) * from demande_extrait_acte;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__ea_piece_justif.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ea_etat) * from demande_extrait_acte;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__ea_etat.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (ea_civilite_dem) * from demande_extrait_acte;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__demande_extrait_acte__ea_civilite_dem.csv


# enfant_livret_famille
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from enfant_livret_famille order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__enfant_livret_famille__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (elf_civilite) * from enfant_livret_famille;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__enfant_livret_famille__elf_civilite.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (elf_sexe) * from enfant_livret_famille;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__enfant_livret_famille__elf_sexe.csv

# livret_famille
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from livret_famille limit 300;" -A -F ";" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__300.csv
# livret_famille_2
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from livret_famille__livret order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from livret_famille__livret_personne order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret_personne__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret_personne__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret_personne__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__livret_personne__2000.csv
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from livret_famille__personne order by random() limit 2000;" -A -F "|" -R "~" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__personne__2000.csv
sed -i -e 's/\x0D$/ /' A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__personne__2000.csv
paste -s -d ' ' A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__personne__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille__personne__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from livret_famille_2 order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__livret_famille_2__2000.csv


# parrainage_civil
psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from parrainage_civil order by random() limit 2000;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__parrainage_civil__2000.csv
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select distinct on (pa_civ_dem) * from parrainage_civil;" -A -F "|" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__parrainage_civil__pa_civ_dem.csv

# sous_type
#psql -h dsiappli14 -U contrib -d ds_siecle -c "select * from sous_type limit 300;" -A -F ";" -o ./A_Citoyennete/Actes_d_etat_civil/ds_siecle__sous_type__300.csv





###################
###################
## B_Deplacement ##
###################
###################

#####################
# ds_accidentologie #
#####################
# lieu
psql -h dsiappli14 -U contrib -d ds_accidentologie -c "select * from lieu limit 300;" -A -F ";" -o ./B_Deplacement/Accidents_routiers/ds_accidentologie__lieu__300.csv

# pv
psql -h dsiappli14 -U contrib -d ds_accidentologie -c "select * from pv limit 300;" -A -F ";" -o ./B_Deplacement/Accidents_routiers/ds_accidentologie__pv__300.csv

# usager
psql -h dsiappli14 -U contrib -d ds_accidentologie -c "select * from usager limit 300;" -A -F ";" -o ./B_Deplacement/Accidents_routiers/ds_accidentologie__usager__300.csv

# vehicule
psql -h dsiappli14 -U contrib -d ds_accidentologie -c "select * from vehicule limit 300;" -A -F ";" -o ./B_Deplacement/Accidents_routiers/ds_accidentologie__vehicule__300.csv

#########################
# ds_transport_cyclable #
#########################
# cycl_bande_cyclable
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from bande_cyclable limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__bande_cyclable__300.csv

# cycl_bool
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from bool limit 300;" -A -F ";" -o ds_transport_cyclable__bool__300.csv

# cycl_bool_2
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from bool_2 limit 300;" -A -F ";" -o ds_transport_cyclable__bool_2__300.csv

# cycl_cheminement_mixte
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from cheminement_mixte limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__cheminement_mixte__300.csv

# cycle_entree_sortie_piste
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from entree_sortie_piste limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__entree_sortie_piste__300.csv

# cycl_frequentation
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from frequentation limit 300;" -A -F ";" -o ds_transport_cyclable__frequentation__300.csv

# cycl_itineraire_balise
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from itineraire_balise limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__itineraire_balise__300.csv

# cycl_obstacle
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from obstacle limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__obstacle__300.csv

# cycl_panneau_directionnel
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from panneau_directionnel limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__panneau_directionnel__300.csv

# cycl_panneau_police
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from panneau_police limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__panneau_police__300.csv

# cycl_parking_cycle_couleur
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from parking_cycle_couleur limit 300;" -A -F ";" -o ds_transport_cyclable__parking_cycle_couleur__300.csv

# cycl_parking_cycle_demandeur
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from parking_cycle_demandeur limit 300;" -A -F ";" -o ds_transport_cyclable__parking_cycle_demandeur__300.csv

# cycl_parking_cycle_type_arceau
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from parking_cycle_type_arceau limit 300;" -A -F ";" -o ds_transport_cyclable__parking_cycle_type_arceau__300.csv

# cycl_parking_cycles
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from parking_cycles limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__parking_cycles__300.csv

# cycl_passage_pieton
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from passage_pieton limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__passage_pieton__300.csv

# cycl_piste_cyclable
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from piste_cyclable limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__piste_cyclable__300.csv

# cycl_poussoir_feu_tricolore
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from poussoir_feu_tricolore limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__poussoir_feu_tricolore__300.csv

# cycl_raccordement
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from raccordement limit 300;" -A -F ";" -o ds_transport_cyclable__raccordement__300.csv

# cycl_revetement
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from revetement limit 300;" -A -F ";" -o ds_transport_cyclable__revetement__300.csv

# cycl_support_fixation
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from support_fixation limit 300;" -A -F ";" -o ds_transport_cyclable__support_fixation__300.csv

# cycl_traverse_acces_divers
psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from traverse_acces_divers limit 300;" -A -F ";" -o ./B_Deplacement/Reseau_de_transport_cyclable/ds_transport_cyclable__traverse_acces_divers__300.csv

# cycl_type_bc
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from type_bc limit 300;" -A -F ";" -o ds_transport_cyclable__type_bc__300.csv

# cycl_type_che
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from type_che limit 300;" -A -F ";" -o ds_transport_cyclable__type_che__300.csv

# cycl_type_marquage
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from type_marquage limit 300;" -A -F ";" -o ds_transport_cyclable__type_marquage__300.csv

# cycl_type_obstacle
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from type_obstacle limit 300;" -A -F ";" -o ds_transport_cyclable__type_obstacle__300.csv

# cycl_type_protection
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from type_protection limit 300;" -A -F ";" -o ds_transport_cyclable__type_protection__300.csv

# cycl_type_traversee
#psql -h dsiappli14 -U contrib -d ds_transport_cyclable -c "select * from type_traversee limit 300;" -A -F ";" -o ds_transport_cyclable__type_traversee__300.csv




#####################
#####################
## C_Espace_public ##
#####################
#####################

###########
# ds_dict #
###########
# 
# dict
psql -h dsiappli14 -U contrib -d ds_dict -c "select * from dict order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Dict/ds_dict__dict__2000.csv
# entreprise
psql -h dsiappli14 -U contrib -d ds_dict -c "select * from entreprise order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Dict/ds_dict__entreprise__2000.csv
# intervenant
psql -h dsiappli14 -U contrib -d ds_dict -c "select * from intervenant order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Dict/ds_dict__intervenant__2000.csv
# intervention_dict
psql -h dsiappli14 -U contrib -d ds_dict -c "select * from intervention_dict order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Dict/ds_dict__intervention_dict__2000.csv
#####################
# ds_domaine_public #
#####################
# 

###########
# ds_gima #
###########
# a_archivage
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from a_archivage limit 300;" -A -F ";" -o ds_gima__a_archivage__300.csv

# acte_juridique
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from acte_juridique order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__acte_juridique__2000.csv

# batiment
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from batiment order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__batiment__2000.csv

# cr_champ
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from cr_champ limit 300;" -A -F ";" -o ds_gima__cr_champ__300.csv

# cr_chfichier
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from cr_chfichier limit 300;" -A -F ";" -o ds_gima__cr_chfichier__300.csv

# cr_chgroupe
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from cr_chgroupe limit 300;" -A -F ";" -o ds_gima__cr_chgroupe__300.csv

# cr_fichier
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from cr_fichier limit 300;" -A -F ";" -o ds_gima__cr_fichier__300.csv

# cr_groupe
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from cr_groupe limit 300;" -A -F ";" -o ds_gima__cr_groupe__300.csv

# document
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from document order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__document__2000.csv

# ensemble_bati
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from ensemble_bati order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__ensemble_bati__2000.csv

# equipement
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from equipement order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__equipement__2000.csv

# et_action
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from et_action limit 300;" -A -F ";" -o ds_gima__et_action__300.csv

# et_equi_action
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from et_equi_action limit 300;" -A -F ";" -o ds_gima__et_equi_action__300.csv

# et_equi_doc
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from et_equi_doc limit 300;" -A -F ";" -o ds_gima__et_equi_doc__300.csv

# et_equi_histo
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from et_equi_histo limit 300;" -A -F ";" -o ds_gima__et_equi_histo__300.csv

# et_equi_nomencl
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from et_equi_nomencl limit 300;" -A -F ";" -o ds_gima__et_equi_nomencl__300.csv

# installation_equipement
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from installation_equipement order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__installation_equipement__2000.csv

# local_fonctionnel
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from local_fonctionnel limit 300;" -A -F ";" -o ds_gima__local_fonctionnel__300.csv

# local_physique
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from local_physique limit 300;" -A -F ";" -o ds_gima__local_physique__300.csv

# niveau
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from niveau order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__niveau__2000.csv

# piece
psql -h dsiappli14 -U contrib -d ds_gima -c "select * from piece order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Patrimoine_communal/ds_gima__piece__2000.csv

# pp_accessibilite_batiment
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_accessibilite_batiment limit 300;" -A -F ";" -o ds_gima__pp_accessibilite_batiment__300.csv

# pp_batiment_erp_acces
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_batiment_erp_acces limit 300;" -A -F ";" -o ds_gima__pp_batiment_erp_acces__300.csv

# pp_couts
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_couts limit 300;" -A -F ";" -o ds_gima__pp_couts__300.csv

# pp_etage
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_etage limit 300;" -A -F ";" -o ds_gima__pp_etage__300.csv

# pp_identite_batiment
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_identite_batiment limit 300;" -A -F ";" -o ds_gima__pp_identite_batiment__300.csv

# pp_parcelle_physique
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_parcelle_physique limit 300;" -A -F ";" -o ds_gima__pp_parcelle_physique__300.csv

# pp_physique_surfaces
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_physique_surfaces limit 300;" -A -F ";" -o ds_gima__pp_physique_surfaces__300.csv

# pp_proplocalisation
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_proplocalisation limit 300;" -A -F ";" -o ds_gima__pp_proplocalisation__300.csv

# pp_site_cout
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_site_cout limit 300;" -A -F ";" -o ds_gima__pp_site_cout__300.csv

# pp_surfaces
#psql -h dsiappli14 -U contrib -d ds_gima -c "select * from pp_surfaces limit 300;" -A -F ";" -o ds_gima__pp_surfaces__300.csv


############
# ds_gmlux #
############
# operation
psql -h dsiappli14 -U contrib -d ds_gmlux -c "select * from operation order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eclairage_public/ds_gmlux__operation__2000.csv

# point_eclairage
psql -h dsiappli14 -U contrib -d ds_gmlux -c "select * from point_eclairage order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eclairage_public/ds_gmlux__point_eclairage__2000.csv

# point_lumineux
psql -h dsiappli14 -U contrib -d ds_gmlux -c "select * from point_lumineux order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eclairage_public/ds_gmlux__point_lumineux__2000.csv

# poste
psql -h dsiappli14 -U contrib -d ds_gmlux -c "select * from poste order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eclairage_public/ds_gmlux__poste__2000.csv


##########################
# ds_structures_sociales #
##########################
# 


#####################
# ds_sis_prevention #
#####################
# avis
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from avis order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__avis__2000.csv

# cis
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from cis order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__cis__2000.csv

# erp
#psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from erp;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__erp.csv
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from erp order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__erp__2000.csv
#psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select distinct on (erp_avis) * from erp;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__erp__erp_avis.csv
#psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select distinct on (erp_etat) * from erp;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__erp__erp_etat.csv

# prescription
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from prescription order by random() limit 2000;" -A -F "|" -R "~" -o ./C_Espace_public/Erp/ds_sis_prevention__prescription__2000.csv
sed -i -e 's/\x0D$/ /' C_Espace_public/Erp/ds_sis_prevention__prescription__2000.csv
paste -s -d ' ' C_Espace_public/Erp/ds_sis_prevention__prescription__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile C_Espace_public/Erp/ds_sis_prevention__prescription__2000.csv


# responsable
#psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from responsable;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__responsable.csv
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from responsable order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__responsable__2000.csv

# type_document
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_document order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__type_document__2000.csv

# type_erp
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_erp order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__type_erp__2000.csv

# type_hab
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_hab order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__type_hab__2000.csv

# type_hydrant
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_hydrant order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__type_hydrant__2000.csv

# type_ind
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_ind order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__type_ind__2000.csv

# type_prescription
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_prescription order by random() limit 2000;" -A -F "|" -R "~" -o ./C_Espace_public/Erp/ds_sis_prevention__type_prescription__2000.csv
sed -i -e 's/\x0D$/ /' C_Espace_public/Erp/ds_sis_prevention__type_prescription__2000.csv
paste -s -d ' ' C_Espace_public/Erp/ds_sis_prevention__type_prescription__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile C_Espace_public/Erp/ds_sis_prevention__type_prescription__2000.csv


# type_suivi
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_suivi order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__type_suivi__2000.csv

# type_visite
psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from type_visite order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Erp/ds_sis_prevention__type_visite__2000.csv

###########
# ds_tlpe #
###########
# 
#psql -h dsiappli14 -U contrib -d ds_sis_prevention -c "select * from avis limit 300;" -A -F ";" -o ds_sis_prevention__avis__300.csv

######################
# ds_mobilier_urbain #
######################
# mu_abribus
psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from abribus order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Mobilier_urbain/ds_mobilier_urbain__abribus__2000.csv

# mu_banc
psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from banc order by random() limit 2000;;" -A -F ";" -o ./C_Espace_public/Mobilier_urbain/ds_mobilier_urbain__banc__2000.csv

# mu_corbeille
psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from corbeille order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Mobilier_urbain/ds_mobilier_urbain__corbeille__2000.csv

# mu_parking_cycle_couleur
#psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from parking_cycle_couleur limit 300;" -A -F ";" -o ds_mobilier_urbain__parking_cycle_couleur__300.csv

# mu_parking_cycle_demandeur
#psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from parking_cycle_demandeur limit 300;" -A -F ";" -o ds_mobilier_urbain__parking_cycle_demandeur__300.csv

# mu_parking_cycle_type_arceau
#psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from parking_cycle_type_arceau limit 300;" -A -F ";" -o ds_mobilier_urbain__parking_cycle_type_arceau__300.csv

# mu_parking_cycles
psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from parking_cycles order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Mobilier_urbain/ds_mobilier_urbain__parking_cycles__2000.csv

# mu_planimetre
psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from planimetre order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Mobilier_urbain/ds_mobilier_urbain__planimetre__2000.csv

# mu_publicitaire_enseigne
psql -h dsiappli14 -U contrib -d ds_mobilier_urbain -c "select * from publicitaire_enseigne order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Mobilier_urbain/ds_mobilier_urbain__publicitaire_enseigne__2000.csv



#####################
# ds_eaux_pluviales #
#####################
# bassin_orage 
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from bassin_orage order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__bassin_orage__2000.csv

# branchement
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from branchement order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__branchement__2000.csv

# ouvrage_collecte
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from ouvrage_collecte order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__ouvrage_collecte__2000.csv

# ouvrage_engouffrement 
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from ouvrage_engouffrement order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__ouvrage_engouffrement__2000.csv

# ouvrage_fonctionnel 
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from ouvrage_fonctionnel order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__ouvrage_fonctionnel__2000.csv

# puisard 
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from puisard order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__puisard__2000.csv

# regard_pluvial 
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from regard_pluvial order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__regard_pluvial__2000.csv

# sortie_fosse 
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from sortie_fosse order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__sortie_fosse__2000.csv

# station_pompage
psql -h dsiappli14 -U contrib -d ds_eaux_pluviales -c "select * from station_pompage order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eaux_pluviales/ds_eaux_pluviales__station_pompage__2000.csv


##################
# ds_eau_potable #
##################
# branchement
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from branchement order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__branchement__2000.csv
# conduite
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from conduite order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__conduite__2000.csv
# forage
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from forage order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__forage__2000.csv
# poteau_incendie
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from poteau_incendie order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__poteau_incendie__2000.csv
# reducteur_pression
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from reducteur_pression order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__reducteur_pression__2000.csv
# vanne
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from vanne order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__vanne__2000.csv
# ventouse
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from ventouse order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__ventouse__2000.csv
# vidange
psql -h dsiappli14 -U contrib -d ds_eau_potable -c "select * from vidange order by random() limit 2000;" -A -F ";" -o ./C_Espace_public/Reseau_d_eau_potable/ds_eau_potable__vidange__2000.csv



###############
###############
## D_Finance ##
###############
###############

###########
# ds_egee #
###########
# abonnement
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from abonnement order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__abonnement__2000.csv

# client 
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from client order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__client__2000.csv

# compteur
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from compteur order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__compteur__2000.csv

# consommation 
#psql -h dsiappli14 -U contrib -d ds_egee -c "select * from consommation limit 300;" -A -F ";" -o ds_egee__consommation__300.csv

# cpteau 
#psql -h dsiappli14 -U contrib -d ds_egee -c "select * from cpteau limit 300;" -A -F ";" -o ds_egee__cpteau__300.csv

# facture 
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from facture order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__facture__2000.csv

# facture_releve 
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from facture_releve order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__facture_releve__2000.csv

# factureeau 
#psql -h dsiappli14 -U contrib -d ds_egee -c "select * from factureeau limit 300;" -A -F ";" -o ds_egee__factureeau__300.csv

# installation 
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from installation order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__installation__2000.csv

# proprietaire 
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from proprietaire order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__proprietaire__2000.csv

# releve 
psql -h dsiappli14 -U contrib -d ds_egee -c "select * from releve order by random() limit 2000;" -A -F ";" -o ./D_Finance/Facturation_de_l_eau/ds_egee__releve__2000.csv

# tournee 
#psql -h dsiappli14 -U contrib -d ds_egee -c "select * from tournee limit 300;" -A -F ";" -o ds_egee__tournee__300.csv

##################
# ds_taxe_sejour #
##################
# hebergement 
psql -h dsiappli14 -U contrib -d ds_taxe_sejour -c "select * from hebergement limit 300;" -A -F ";" -o ./D_Finance/Taxe_de_sejour/ds_taxe_sejour__hebergement__300.csv
# paiement 
psql -h dsiappli14 -U contrib -d ds_taxe_sejour -c "select * from paiement limit 300;" -A -F ";" -o ./D_Finance/Taxe_de_sejour/ds_taxe_sejour__paiement__300.csv


#######################
#######################
## E_Gestion_interne ##
#######################
#######################

###################
# ds_file_attente #
###################
# file 
psql -h dsiappli14 -U contrib -d ds_file_attente -c "select * from file limit 300;" -A -F ";" -o ./E_Gestion_interne/Files_d_attente/ds_file_attente__file__300.csv
# site 
psql -h dsiappli14 -U contrib -d ds_file_attente -c "select * from site limit 300;" -A -F ";" -o ./E_Gestion_interne/Files_d_attente/ds_file_attente__site__300.csv
# ticket 
psql -h dsiappli14 -U contrib -d ds_file_attente -c "select * from ticket limit 300;" -A -F ";" -o ./E_Gestion_interne/Files_d_attente/ds_file_attente__ticket__300.csv

###############
# ds_tourisme #
###############
# acteur 
psql -h dsiappli14 -U contrib -d ds_tourisme -c "select * from acteur limit 300;" -A -F ";" -o ./E_Gestion_interne/Indicateurs_touristiques/ds_tourisme__acteur__300.csv
# activite 
psql -h dsiappli14 -U contrib -d ds_tourisme -c "select * from activite limit 300;" -A -F ";" -o ./E_Gestion_interne/Indicateurs_touristiques/ds_tourisme__activite__300.csv
# indicateur 
psql -h dsiappli14 -U contrib -d ds_tourisme -c "select * from indicateur limit 300;" -A -F ";" -o ./E_Gestion_interne/Indicateurs_touristiques/ds_tourisme__indicateur__300.csv
# periode 
psql -h dsiappli14 -U contrib -d ds_tourisme -c "select * from periode limit 300;" -A -F ";" -o ./E_Gestion_interne/Indicateurs_touristiques/ds_tourisme__periode__300.csv
# structure 
psql -h dsiappli14 -U contrib -d ds_tourisme -c "select * from structure limit 300;" -A -F ";" -o ./E_Gestion_interne/Indicateurs_touristiques/ds_tourisme__structure__300.csv
# structure_activite 
psql -h dsiappli14 -U contrib -d ds_tourisme -c "select * from structure_activite limit 300;" -A -F ";" -o ./E_Gestion_interne/Indicateurs_touristiques/ds_tourisme__structure_activite__300.csv

################
################
## F_Jeunessse #
################
################

#############
# ds_pueris #
#############
# accueil 
psql -h dsiappli14 -U contrib -d ds_pueris -c "select * from accueil order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Enfants_scolarises/ds_pueris__accueil__2000.csv

# ecole 
psql -h dsiappli14 -U contrib -d ds_pueris -c "select * from ecole order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Enfants_scolarises/ds_pueris__ecole__2000.csv

# enfant 
psql -h dsiappli14 -U contrib -d ds_pueris -c "select * from enfant order by random() limit 2000;;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Enfants_scolarises/ds_pueris__enfant__2000.csv

# responsable_legal  
psql -h dsiappli14 -U contrib -d ds_pueris -c "select * from responsable_legal order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Enfants_scolarises/ds_pueris__responsable_legal__2000.csv

# restaurant 
psql -h dsiappli14 -U contrib -d ds_pueris -c "select * from restaurant order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Enfants_scolarises/ds_pueris__restaurant__2000.csv

# restauration 
psql -h dsiappli14 -U contrib -d ds_pueris -c "select * from restauration order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Enfants_scolarises/ds_pueris__restauration__2000.csv

# scolarite 
psql -h dsiappli14 -U contrib -d ds_pueris -c "select * from scolarite order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Enfants_scolarises/ds_pueris__scolarite__2000.csv

###########
# ds_thot #
###########
# cote 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from cote limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__cote__300.csv

# localisation 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from localisation limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__localisation__300.csv
# fiche 
psql -h dsiappli14 -U contrib -d ds_thot -c "select * from fiche order by random() limit 2000;" -A -A -F "|" -R "~"  -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__fiche__2000.csv
sed -i -e 's/\x0D$/ /' F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__fiche__2000.csv
paste -s -d ' ' F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__fiche__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__fiche__2000.csv


# personne 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from personne limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__personne__300.csv
# article
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from article limit 300;" -A -F "|" -R "~" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__article__300.csv
#sed -i -e 's/\x0D$/ /' F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__article__300.csv
#paste -s -d ' ' F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__article__300.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__article__300.csv

# consultation 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from consultation limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__consultation__300.csv
# entree 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from entree limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__entree__300.csv
# mouvement 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from mouvement limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__mouvement__300.csv
# producteur 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from producteur limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__producteur__300.csv
# recherche
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from recherche limit 300;" -A -F "|" -R "~" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__recherche__300.csv
#sed -i -e 's/\x0D$/ /' F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__recherche__300.csv
#paste -s -d ' ' F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__recherche__300.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__recherche__300.csv

# seance 
#psql -h dsiappli14 -U contrib -d ds_thot -c "select * from seance limit 300;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Archives_municipales/ds_thot__seance__300.csv


######################
# ds_passeport_jeune #
######################
# activite
# attention traitement particulier pour résoudre un problème de données sur plusieurs lignes
psql -h dsiappli14 -U contrib -d ds_passeport_jeune -c "select * from activite order by random() limit 2000;" -A -F "|" -R "~" -o ./F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__activite__2000.csv
sed -i -e 's/\x0D$/ /' F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__activite__2000.csv
paste -s -d ' ' F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__activite__2000.csv | sed 's/\~/\n/g' > tmpfile ; mv -f tmpfile F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__activite__2000.csv

# cheque 
psql -h dsiappli14 -U contrib -d ds_passeport_jeune -c "select * from cheque order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__cheque__2000.csv
# chequier 
psql -h dsiappli14 -U contrib -d ds_passeport_jeune -c "select * from chequier order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__chequier__2000.csv
# chequier_composition 
psql -h dsiappli14 -U contrib -d ds_passeport_jeune -c "select * from chequier_composition order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__chequier_composition__2000.csv
# personne 
psql -h dsiappli14 -U contrib -d ds_passeport_jeune -c "select * from personne order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__personne__2000.csv
# vente 
psql -h dsiappli14 -U contrib -d ds_passeport_jeune -c "select * from vente order by random() limit 2000;" -A -F ";" -o ./F_Jeunesse_sport_et_culture/Passeport_jeune/ds_passeport_jeune__vente__2000.csv



################################
################################
## H_Referentiel_Geographique ##
################################
################################

################################
# ds_decoupages_administratifs #
################################
# 
#psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from axe_voie limit 300;" -A -F ";" -o ds_cadastre__axe_voie__300.csv

############################
# ds_decoupages_electoraux #
############################
# bureau_vote 
psql -h dsiappli14 -U contrib -d ds_decoupages_electoraux -c "select * from bureau_vote limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_electoraux/ds_decoupages_electoraux__bureau_vote__300.csv

# canton
psql -h dsiappli14 -U contrib -d ds_decoupages_electoraux -c "select * from canton limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_electoraux/ds_decoupages_electoraux__canton__300.csv

#######################
# ds_decoupages_insee #
#######################
# ilot
psql -h dsiappli14 -U contrib -d ds_decoupages_insee -c "select * from ilot limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_Insee/ds_decoupages_insee__ilot__300.csv

# quartier
psql -h dsiappli14 -U contrib -d ds_decoupages_insee -c "select * from quartier limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_Insee/ds_decoupages_insee__quartier__300.csv

############################
# ds_decoupages_population #
############################
# comite_quartier
psql -h dsiappli14 -U contrib -d ds_decoupages_population -c "select * from comite_quartier limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_population/ds_decoupages_population__comite_quartier__300.csv

# conseil_de_secteur
psql -h dsiappli14 -U contrib -d ds_decoupages_population -c "select * from conseil_de_secteur limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_population/ds_decoupages_population__conseil_de_secteur__300.csv

# delegation_urbanisme
psql -h dsiappli14 -U contrib -d ds_decoupages_population -c "select * from delegation_urbanisme limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_population/ds_decoupages_population__delegation_urbanisme__300.csv

# mairie_annexe
psql -h dsiappli14 -U contrib -d ds_decoupages_population -c "select * from mairie_annexe limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Decoupages_population/ds_decoupages_population__mairie_annexe__300.csv


###############
# ds_cadastre #
###############
# axe_voie
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from axe_voie limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__axe_voie__300.csv

# bati_dur
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from bati_dur limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__bati_dur__300.csv

# bati_leger
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from bati_leger limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__bati_leger__300.csv

# detail_topo
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from detail_topo limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__detail_topo__300.csv

# detail_topo_hydro
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from detail_topo_hydro limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__detail_topo_hydro__300.csv

# etang_lac_piscine
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from etang_lac_piscine limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__etang_lac_piscine__300.csv

# mitoyennete
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from mitoyennete limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__mitoyennete__300.csv

# numero_voie
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from numero_voie limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__numero_voie__300.csv

# parcelle
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from parcelle limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__parcelle__300.csv

# section
psql -h dsiappli14 -U contrib -d ds_cadastre -c "select * from section limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Cadastre/ds_cadastre__section__300.csv

###########
# ds_topo #
###########
# alti_ligne_iso
psql -h dsiappli14 -U contrib -d ds_topo -c "select * from alti_ligne_iso limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Referentiel_topographique/ds_topo__alti_ligne_iso__300.csv

# alti_point_cote
psql -h dsiappli14 -U contrib -d ds_topo -c "select * from alti_point_cote limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Referentiel_topographique/ds_topo__alti_point_cote__300.csv

# batiment_clocher
psql -h dsiappli14 -U contrib -d ds_topo -c "select * from batiment_clocher limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Referentiel_topographique/ds_topo__batiment_clocher__300.csv


#############
# ds_voirie #
#############
# ca_borne
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from ca_borne limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__ca_borne__300.csv

# ca_zone
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from ca_zone limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__ca_zone__300.csv

# carrefour_ce
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from carrefour_ce limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__carrefour_ce__300.csv

# limitation_vitesse
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from limitation_vitesse limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__limitation_vitesse__300.csv

# ouvrage_art
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from ouvrage_art limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__ouvrage_art__300.csv

# sommet_troncon_photo
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from sommet_troncon_photo limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__sommet_troncon_photo__300.csv

# tempo_voie_modif
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from tempo_voie_modif limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__tempo_voie_modif__300.csv

# voirie_filaire_carrefour
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_carrefour limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_carrefour__300.csv

# voirie_filaire_indice
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_indice limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_indice__300.csv

# voirie_filaire_nature
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_nature limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_nature__300.csv

# voirie_filaire_numero
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_numero limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_numero__300.csv

# voirie_filaire_photo
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_photo limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_photo__300.csv

# voirie_filaire_statut
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_statut limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_statut__300.csv

# voirie_filaire_toponymie
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_toponymie limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_toponymie__300.csv

# voirie_filaire_troncon
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_troncon limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_troncon__300.csv

# voirie_filaire_type_voie
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_type_voie limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_type_voie__300.csv

# voirie_filaire_usage
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_usage limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_usage__300.csv

# voirie_filaire_voie
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_voie limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_voie__300.csv

# voirie_filaire_voie_attribut
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_filaire_voie_attribut limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_filaire_voie_attribut__300.csv

# voirie_histoire_theme
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_histoire_theme limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_histoire_theme__300.csv

# voirie_histoire_voie
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_histoire_voie limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_histoire_voie__300.csv

# voirie_histoire_voie_theme
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from voirie_histoire_voie_theme limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__voirie_histoire_voie_theme__300.csv

# zoneinterdiction_pl_cv
psql -h dsiappli14 -U contrib -d ds_voirie -c "select * from zoneinterdiction_pl_cv limit 300;" -A -F ";" -o ./H_Referentiel_geographique/Voies_et_adresses/ds_voirie__zone_interdiction_pl_cv__300.csv

