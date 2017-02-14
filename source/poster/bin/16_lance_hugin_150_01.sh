#!/bin/sh

# script vu sur cette page
# Hugin tutorial - Stitching flat scanned images
# http://hugin.sourceforge.net/tutorials/scans/en.shtml

# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell


parametre_hugin_prefix_150='Assemblage_150'
parametre_hugin_prefix_300='Assemblage_300'
parametre_hugin_fov=10

Prefix=$parametre_hugin_prefix_150
FOV=$parametre_hugin_fov


# initialisation du projet avec les differeentes images
pto_gen --projection=0 \
        --fov=30 \
        -o /media/fred/TOSHIBA/Images/d150_v5/project1.pto \
        /media/fred/TOSHIBA/Images/d150_v5/*


# creation des objectifs (1 par pva)
pto_lensstack \
              -o /media/fred/TOSHIBA/Images/d150_v5/project2.pto \
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
              /media/fred/TOSHIBA/Images/d150_v5/project1.pto
