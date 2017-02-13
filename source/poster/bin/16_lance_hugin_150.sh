#!/bin/sh

# script vu sur cette page
# Hugin tutorial - Stitching flat scanned images
# http://hugin.sourceforge.net/tutorials/scans/en.shtml

# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell

Prefix=Assemblage_150
FOV=10

# initialisation du projet avec les differeentes images
pto_gen --projection=0 --fov=$FOV -o /home/fred/Images/d150_v5//project.pto /home/fred/Images/d150_v5//*.png

# creation des objectifs (1 par pva)
pto_lensstack -o /home/fred/Images/d150_v5//project1.pto \
              --new-lens i1 \
              --new-lens i2 \
              --new-lens i3 \
              --new-lens i4 \
              --new-lens i5 \
              --new-lens i6 \
              --new-lens i7 \
              --new-lens i8 \
              --new-lens i9 \
              --new-lens i10 \
              --new-lens i11 \
              --new-lens i12 \
              --new-lens i13 \
              --new-lens i14 \
              --new-lens i15 \
              --new-lens i16 \
              --new-lens i17 \
              --new-lens i18 \
              --new-lens i19 \
              --new-lens i20 \
              --new-lens i21 \
              --new-lens i22 \
              --new-lens i23 \
              --new-lens i24 \
              --new-lens i25 \
              --new-lens i26 \
              /home/fred/Images/d150_v5//project.pto

# recherche des points de controle
cpfind -o /home/fred/Images/d150_v5//project2.pto --multirow /home/fred/Images/d150_v5//project1.pto

# nettoyage des points de controle
cpclean -o /home/fred/Images/d150_v5//project3.pto /home/fred/Images/d150_v5//project2.pto

# recherche des lignes
linefind -o /home/fred/Images/d150_v5//project4.pto /home/fred/Images/d150_v5//project3.pto

# personnalisation des paramètres
pto_var --opt r,d,e,!r0,!d0,!e0 -o /home/fred/Images/d150_v5//setoptim.pto /home/fred/Images/d150_v5//project4.pto

# optimisation
autooptimiser -n -o /home/fred/Images/d150_v5//autoptim.pto /home/fred/Images/d150_v5//setoptim.pto

# ajustement
pano_modify --projection=0 --fov=AUTO --center --canvas=AUTO --crop=AUTO -o /home/fred/Images/d150_v5//autoptim2.pto /home/fred/Images/d150_v5//autoptim.pto

# fabrication d un makfile et lancement du makefile, remplacé par hugin_excutor
hugin_executor -t 2 -s -p /home/fred/Images/d150_v5//$Prefix /home/fred/Images/d150_v5//autoptim2.pto

