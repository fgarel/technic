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

# personnalisation des paramètres
# on met tout à zéro
pto_var \
        --set=y=0,p=0,r=0 \
        --set=TrX=0 \
        --set=TrY=0 \
        --set=TrZ=0 \
        -o /media/fred/TOSHIBA/Images/d150_v5/project3.pto \
        /media/fred/TOSHIBA/Images/d150_v5/project2.pto

# personnalisation des paramètres
# choix 1, non retenu : on decale l'image
# pto_var \
#         --set=TrX0=0 \
#         --set=TrY0=0 \
#         --set=TrX1=1125/4 \
#         --set=TrY1=0 \
#         --set=TrX2=2250/4 \
#         --set=TrY2=0 \
#         --set=TrX3=3375/4 \
#         --set=TrY3=0 \
#         --set=TrX4=4500/4 \
#         --set=TrY4=0 \
#         --set=TrX5=0 \
#         --set=TrY5=815/4 \
#         --set=TrX6=1125/4 \
#         --set=TrY6=815/4 \
#         --set=TrX7=2250/4 \
#         --set=TrY7=815/4 \
#         --set=TrX8=3375/4 \
#         --set=TrY8=815/4 \
#         --set=TrX9=4500/4 \
#         --set=TrY9=815/4 \
#         --set=TrX10=0 \
#         --set=TrY10=1630/4 \
#         --set=TrX11=1125/4 \
#         --set=TrY11=1630/4 \
#         --set=TrX12=2250/4 \
#         --set=TrY12=1630/4 \
#         --set=TrX13=3375/4 \
#         --set=TrY13=1630/4 \
#         --set=TrX14=4500/4 \
#         --set=TrY14=1630/4 \
#         --set=TrX15=0 \
#         --set=TrY15=2445/4 \
#         --set=TrX16=1125/4 \
#         --set=TrY16=2445/4 \
#         --set=TrX17=2250/4 \
#         --set=TrY17=2445/4 \
#         --set=TrX18=3375/4 \
#         --set=TrY18=2445/4 \
#         --set=TrX19=4500/4 \
#         --set=TrY19=2445/4 \
#         --set=TrX20=0 \
#         --set=TrY20=3260/4 \
#         --set=TrX21=1125/4 \
#         --set=TrY21=3260/4 \
#         --set=TrX22=2250/4 \
#         --set=TrY22=3260/4 \
#         --set=TrX23=3375/4 \
#         --set=TrY23=3260/4 \
#         --set=TrX24=4500/4 \
#         --set=TrY24=3260/4 \
#         -o /media/fred/TOSHIBA/Images/d150_v5/project4.pto \
#         /media/fred/TOSHIBA/Images/d150_v5/project3.pto
#
# pto_var \
#         --set=y=0,p=0,r=0 \
#         --set=TrX=562.5 \
#         --set=TrY=407.5 \
#         --set=TrZ=0 \
#         -o /media/fred/TOSHIBA/Images/d150_v5/project4.pto \
#         /media/fred/TOSHIBA/Images/d150_v5/project3.pto
#
#
#
# pto_var \
#         --set=y=0,p=0,r=0 \
#         --set=TrX=0 \
#         --set=TrY=0 \
#         --set=TrZ=0 \
#         -o /media/fred/TOSHIBA/Images/d150_v5/project4.pto \
#         /media/fred/TOSHIBA/Images/d150_v5/project3.pto



# personnalisation des paramètres
# choix 2, retenu : on decale l'objectif de la camera
# attention mouvement en x dans le sens inverse
# le coefficient de 0.6 pour la resolution de 150
pto_var \
        --set=d0=2250/1.6 \
        --set=e0=-1630/1.6 \
        --set=d1=1125/1.6 \
        --set=e1=-1630/1.6 \
        --set=d2=0/1.6 \
        --set=e2=-1630/1.6 \
        --set=d3=-1125/1.6 \
        --set=e3=-1630/1.6 \
        --set=d4=-2250/1.6 \
        --set=e4=-1630/1.6 \
        --set=d5=2250/1.6 \
        --set=e5=-815/1.6 \
        --set=d6=1125/1.6 \
        --set=e6=-815/1.6 \
        --set=d7=0/1.6 \
        --set=e7=-815/1.6 \
        --set=d8=-1125/1.6 \
        --set=e8=-815/1.6 \
        --set=d9=-2250/1.6 \
        --set=e9=-815/1.6 \
        --set=d10=2250/1.6 \
        --set=e10=0/1.6 \
        --set=d11=1125/1.6 \
        --set=e11=0/1.6 \
        --set=d12=0/1.6 \
        --set=e12=0/1.6 \
        --set=d13=-1125/1.6 \
        --set=e13=0/1.6 \
        --set=d14=-2250/1.6 \
        --set=e14=0/1.6 \
        --set=d15=2250/1.6 \
        --set=e15=815/1.6 \
        --set=d16=1125/1.6 \
        --set=e16=815/1.6 \
        --set=d17=0/1.6 \
        --set=e17=815/1.6 \
        --set=d18=-1125/1.6 \
        --set=e18=815/1.6 \
        --set=d19=-2250/1.6 \
        --set=e19=815/1.6 \
        --set=d20=2250/1.6 \
        --set=e20=1630/1.6 \
        --set=d21=1125/1.6 \
        --set=e21=1630/1.6 \
        --set=d22=0/1.6 \
        --set=e22=1630/1.6 \
        --set=d23=-1125/1.6 \
        --set=e23=1630/1.6 \
        --set=d24=-2250/1.6 \
        --set=e24=1630/1.6 \
        -o /media/fred/TOSHIBA/Images/d150_v5/project4.pto \
        /media/fred/TOSHIBA/Images/d150_v5/project3.pto

# pto_var \
#         --set=d=val \
#         --set=e=val \
#         -o /media/fred/TOSHIBA/Images/d150_v5/project5.pto \
#         /media/fred/TOSHIBA/Images/d150_v5/project4.pto

# personnalisation des paramètres
# optimisation possible
# avec comme point de depart, la photo central
pto_var \
        --opt=!y,!p,!r \
        --opt=d,e \
        --opt=!d12,!e12 \
        -o /media/fred/TOSHIBA/Images/d150_v5/project6.pto \
        /media/fred/TOSHIBA/Images/d150_v5/project5.pto
