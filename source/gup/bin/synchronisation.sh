#!/bin/sh

# Synchronisation de KG
echo "\nSynchronisation de KG\n"
rsync -avz \
  /mnt/dsifichiers02/services_all/AFF_IMMO/ACTIVITE\ SERVICE/Parc\ immobilier/inventaires/ \
  /home/fred/f/CARTOGRAPHIE/Atal/AffairesImmobilieresEtFoncieres/KG/

# Synchronisation de MLR
echo "\nSynchronisation de Mises à disposition\n"
#rsync -avz \
#  /mnt/dsifichiers02/services_all/AFF_IMMO/MISES\ A\ DISPOSITION/Inventaires/Convention/ \
#  /home/fred/f/CARTOGRAPHIE/Atal/AffairesImmobilieresEtFoncieres/Inventaires/

# Synchronisation de SDI
echo "\nSynchronisation de SDI\n"
rsync -avz \
  /mnt/dsifichiers02/services_all/AFF_IMMO/SDI/Tbmaestro/Rendus \
  /home/fred/f/CARTOGRAPHIE/Atal/AffairesImmobilieresEtFoncieres/SDI/Tbmaestro/

rsync -avz \
  /mnt/dsifichiers02/services_all/AFF_IMMO/DOSSIERS/DOSSIERS\ ANCIENS\ AGENTS/BRD\ -\ Dossiers/Schéma\ Directeur\ Immobilier/Photos\ Tbmaestro\ des\ locaux \
  /home/fred/f/CARTOGRAPHIE/Atal/AffairesImmobilieresEtFoncieres/SDI/
