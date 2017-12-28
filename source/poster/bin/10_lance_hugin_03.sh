#!/bin/sh

# script vu sur cette page
# Hugin tutorial - Stitching flat scanned images
# http://hugin.sourceforge.net/tutorials/scans/en.shtml

# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell

Path='/home/fred/hugin/case21'
Prefix='Case21'
FOV=10

# Recherche des points de controle
# mais, avec l option prealign, car on utilise la position de l objectif
cpfind --prealigned \
       --fullscale \
       --sieve1width 50 \
       --sieve1height 50 \
       --sieve1size 2500 \
       -o $Path/project6.pto \
       $Path/project5.pto

# Nettoyage des points de controle
cpclean --max-distance=1 \
        -o $Path/project7.pto \
        $Path/project6.pto

# # Nettoyage des points de controle
# cpclean --max-distance=1 \
#         -o $Path/project7.pto \
#         $Path/project7.pto
#
# # Nettoyage des points de controle
# cpclean --max-distance=1 \
#         -o $Path/project7.pto \
#         $Path/project7.pto

# Recherche des lignes
linefind \
         -o $Path/project8.pto \
         $Path/project7.pto

# Optimisation
autooptimiser -n \
              -o $Path/project9.pto \
              $Path/project8.pto

# Ajustement
pano_modify --projection=0 \
            --fov=AUTO \
            --center \
            --canvas=AUTO \
            --crop=AUTO \
            -o $Path/project10.pto \
            $Path/project9.pto

# Assemblage avec hugin_excutor, "was" fabrication d un makfile et execution
hugin_executor -t 2 -s \
               -p $Path/$Prefix \
               $Path/project10.pto
