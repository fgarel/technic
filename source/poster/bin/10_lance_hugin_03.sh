#!/bin/sh

# script vu sur cette page
# Hugin tutorial - Stitching flat scanned images
# http://hugin.sourceforge.net/tutorials/scans/en.shtml

# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell

Path='/home/fred/Images/d225_v4/'
Prefix='Assemblage_225'
FOV=10

# Recherche des points de controle
# mais, avec l option prealign, car on utilise la position de l objectif
cpfind --prealigned \
       -o $Path/project6.pto \
       $Path/project5.pto

# Optimisation
autooptimiser -n \
              -o $Path/project7.pto \
              $Path/project6.pto

# Ajustement
pano_modify --projection=0 \
            --fov=AUTO \
            --center \
            --canvas=AUTO \
            --crop=AUTO \
            -o $Path/project8.pto\
            $Path/project7.pto

# Assemblage avec hugin_excutor, "was" fabrication d un makfile et execution
hugin_executor -t 2 -s \
               -p $Path/$Prefix \
               $Path/project8.pto

