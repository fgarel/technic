#!/bin/sh

# script vu sur cette page
# Hugin tutorial - Stitching flat scanned images
# http://hugin.sourceforge.net/tutorials/scans/en.shtml

# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell

Path='/home/fred/Images/d300_v5/'
Prefix='Assemblage_300'
FOV=10

# Initialisation du projet avec les differeentes images
pto_gen --projection=0 \
        --fov=30 \
        -o $Path/project1.pto \
        $Path/*

# Creation des objectifs (1 par pva)
pto_lensstack \
              --new-lens i0 \
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
              --new-lens i27 \
              --new-lens i28 \
              --new-lens i29 \
              --new-lens i30 \
              --new-lens i31 \
              --new-lens i32 \
              --new-lens i33 \
              --new-lens i34 \
              --new-lens i35 \
              --new-lens i36 \
              --new-lens i37 \
              --new-lens i38 \
              --new-lens i39 \
              --new-lens i40 \
              --new-lens i41 \
              --new-lens i42 \
              --new-lens i43 \
              --new-lens i44 \
              --new-lens i45 \
              --new-lens i46 \
              --new-lens i47 \
              --new-lens i48 \
              --new-lens i49 \
              --new-lens i50 \
              --new-lens i51 \
              --new-lens i52 \
              --new-lens i53 \
              --new-lens i54 \
              --new-lens i55 \
              --new-lens i56 \
              --new-lens i57 \
              --new-lens i58 \
              --new-lens i59 \
              --new-lens i60 \
              --new-lens i61 \
              --new-lens i62 \
              --new-lens i63 \
        -o $Path/project2.pto \
        $Path/project1.pto
