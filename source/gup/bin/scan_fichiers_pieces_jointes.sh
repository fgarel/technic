#!/bin/sh

# utilitaire pour faire l'inventaire des données
# L'idee est de fournir les informations à un système de GED.
# il reste a voir :
#   - la mise a jour de la source d'informations (versionning)
#   - la creation plus ou moins automatisé des tags (original / automatique / manuel)
# cf cocalc
# develop/atal/integration_donnees_externes_vers_atal.md
# /home/fred/f/CARTOGRAPHIE/Atal/AffairesImmoblieresEtFoncieres/synchonisation.sh

# 1. Les photos du patrimoine immobilier
# 1.1. Aff_immo/sdi
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 0/*.JPG > data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 2/*.JPG >> data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 3/*.JPG >> data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 4/*.JPG >> data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 5-6/*.JPG >> data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 7/*.JPG >> data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 8/*.JPG >> data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 9/*.JPG >> data_jpg_photo.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/Anciens\ agents/Dossiers\ anciens\ agents/BRD/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux/Typo\ 56/*.JPG >> data_jpg_photo.txt
# 1.2. projets_transversaux/sdi
ls -1 /mnt/san/projets_transversaux/GESTION_DU_PATRIMOINE/photo/SDI\ photos/* >> data_jpg_photo.txt
# 1.3. projets_transversaux
ls -1 /mnt/san/projets_transversaux/GESTION_DU_PATRIMOINE/photo/* >> data_jpg_photo.txt
# 1.4. gtpb/plano_cache
ls -1 /mnt/dsifichiers02/services_all/POLE\ AMENAGEMENT\ ET\ PATRIMOINE/MAINTENANCE\ ENERGIE/PLANO\ CACHE/DOSSIERS\ PAR\ PATRIMOINE/000001/PLANS/  >> data_jpg_photo.txt
# 1.5. amenagement et CONSTRUCTION
ls -1 /mnt/dsifichiers02/services_all/AMENAGEMENT\ ET\ CONSTRUCTION/CONSTRUCTION/OPERATIONS/* >> data_jpg_photo.txt

# 2. Les fiches du schema directeur immobilier
# 2.1. Aff_immo 1
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/0\ -\ Administratif/*.pdf > data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/2\ -\ Scolaire/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/3\ -\ Culturel/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/4\ -\ Sport/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/5-6\ -\ Associatif/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/7\ -\ Logements/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/8\ -\ Technique/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Documents\ de\ Rendu\ VF\ SDI\ VLR\ Sept\ 2016/20\ -\ Carnets\ de\ Santé/Fiches\ Actif/9\ -\ Economique/*.pdf >> data_pdf_sdi.txt
# 2.2. Aff_immo 2
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/0\ -\ Administratif/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/2\ -\ Scolaire/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/3\ -\ Culturel/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/4\ -\ Sport/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/5-6\ -\ Associatif/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/7\ -\ Logements/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/8\ -\ Technique/*.pdf >> data_pdf_sdi.txt
ls -1 -r /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/MS2/CdS\ Fiches\ Actif\ -\ tbm\ SDI\ VLR\ -\ mars\ 2016/Fiches\ Actif/9\ -\ Economique/*.pdf >> data_pdf_sdi.txt

# 3. Les conventions
# 3.1. aif
ls -1 /mnt/dsifichiers02/services_all/AFF_IMMO/MISES\ A\ DISPOSITION/Inventaires/Convention/* > data_pdf_conventions.txt
# 3.2. finances
ls -1 /mnt/dsifichiers02/services_all/FINANCES/LOYERS/CONVENTIONS/ >> data_pdf_conventions.txt
# 3.3. projets_transversaux
ls -1 /mnt/san/projets_transversaux/CONVENTIONS_OCCUPATION/* >> data_pdf_conventions.txt

# 4. Les plans
# 4.1. pdf ou raster (jpg, ...)
# 4.1.1. Aff_immo/annexes_des_conventions
ls -1 /mnt/dsifichiers02/services_all/AFF_IMMO/MISES\ A\ DISPOSITION/Inventaires/Plans\ annexés/* > data_pdf_plans.txt
# 4.1.2. projets_transversaux
ls -1 /mnt/san/projets_transversaux/GESTION_DU_PATRIMOINE/Plan/* >> data_pdf_plans.txt
# 4.1.3. gtpb/plano_cache
ls -1 /mnt/dsifichiers02/services_all/POLE\ AMENAGEMENT\ ET\ PATRIMOINE/MAINTENANCE\ ENERGIE/PLANO\ CACHE/DOSSIERS\ PAR\ PATRIMOINE/000001/PLANS/  >> data_pdf_plans.txt
# 4.2. dwg ou vecteur
# 4.2.1. projets_transversaux
ls -1 /mnt/san/projets_transversaux/GESTION_DU_PATRIMOINE/Plan/* > data_cad_plans.txt
# 4.2.2. gtpb/plano_cache
ls -1 /mnt/dsifichiers02/services_all/POLE\ AMENAGEMENT\ ET\ PATRIMOINE/MAINTENANCE\ ENERGIE/PLANO\ CACHE/DOSSIERS\ PAR\ PATRIMOINE/000001/PLANS/  >> data_cad_plans.txt
# 4.2.3. amenagement et CONSTRUCTION
ls -1 /mnt/dsifichiers02/services_all/AMENAGEMENT\ ET\ CONSTRUCTION/CONSTRUCTION/OPERATIONS/* >> data_cad_plans.txt

# 5. Les doe
# 5.1. gtpb/plano_cache
ls -1 /mnt/dsifichiers02/services_all/POLE\ AMENAGEMENT\ ET\ PATRIMOINE/MAINTENANCE\ ENERGIE/PLANO\ CACHE/DOE/ > data_pdf_doe.txt
# 5.2. amenagement et CONSTRUCTION
ls -1 /mnt/dsifichiers02/services_all/AMENAGEMENT\ ET\ CONSTRUCTION/CONSTRUCTION/OPERATIONS/* >> data_pdf_doe.txt


# 6. Les opérations sur le PATRIMOINE
# 6.1. gtpb
ls -1 /mnt/dsifichiers02/services_all/POLE\ AMENAGEMENT\ ET\ PATRIMOINE/MAINTENANCE\ ENERGIE/OPERATIONS/ > data_pdf_operations.txt
# 6.2. Amenagement et construction
ls -1 /mnt/dsifichiers02/services_all/AMENAGEMENT\ ET\ CONSTRUCTION/CONSTRUCTION/OPERATIONS/* >> data_pdf_operations.txt
