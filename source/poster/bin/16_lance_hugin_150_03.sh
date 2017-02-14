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


# recherche des points de controle
# mais, avec l'otpion prealign, car on utilise la position de l'objectif
cpfind --prealigned \
       -o /media/fred/TOSHIBA/Images/d150_v5/project7.pto \
       /media/fred/TOSHIBA/Images/d150_v5/project6.pto

# optimisation
autooptimiser -n \
              -o /media/fred/TOSHIBA/Images/d150_v5/project8.pto \
              /media/fred/TOSHIBA/Images/d150_v5/project7.pto

# ajustement
pano_modify --projection=0 \
            --fov=AUTO \
            --center \
            --canvas=AUTO \
            --crop=AUTO \
            -o /media/fred/TOSHIBA/Images/d150_v5/project9.pto \
            /media/fred/TOSHIBA/Images/d150_v5/project8.pto

# assemblage avec hugin_excutor, "was" fabrication d un makfile et execution
hugin_executor -t 2 -s \
               -p /media/fred/TOSHIBA/Images/d150_v5/$Prefix \
               /media/fred/TOSHIBA/Images/d150_v5/project9.pto
