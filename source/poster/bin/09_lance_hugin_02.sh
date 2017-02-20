#!/bin/sh

# script vu sur cette page
# Hugin tutorial - Stitching flat scanned images
# http://hugin.sourceforge.net/tutorials/scans/en.shtml

# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell

Path='/home/fred/Images/dO72_v5/'
Prefix='Assemblage_072'
FOV=10

# Personnalisation des paramètres - 1
# on met tout à zéro
pto_var \
        --set=y=0,p=0,r=0 \
        --set=TrX=0 \
        --set=TrY=0 \
        --set=TrZ=0 \
        -o $Path/project3.pto \
        $Path/project2.pto


# Personnalisation des paramètres - 2
# choix 2, retenu : on decale l objectif de la camera
# pour info, le choix 1, non retenu : on decale l image
# attention mouvement en x dans le sens inverse
# le coefficient de 1.6 pour la resolution de 150
# le coefficient de  pour la resolution de 300
pto_var \
        --set=d0=3375/3.08 \
        --set=e0=-2445/3.08 \
        --set=d1=2250/3.08 \
        --set=e1=-2445/3.08 \
        --set=d2=1125/3.08 \
        --set=e2=-2445/3.08 \
        --set=d3=0/3.08 \
        --set=e3=-2445/3.08 \
        --set=d4=-1125/3.08 \
        --set=e4=-2445/3.08 \
        --set=d5=-2250/3.08 \
        --set=e5=-2445/3.08 \
        --set=d6=-3375/3.08 \
        --set=e6=-2445/3.08 \
        --set=d7=-4500/3.08 \
        --set=e7=-2445/3.08 \
        --set=d8=3375/3.08 \
        --set=e8=-1630/3.08 \
        --set=d9=2250/3.08 \
        --set=e9=-1630/3.08 \
        --set=d10=1125/3.08 \
        --set=e10=-1630/3.08 \
        --set=d11=0/3.08 \
        --set=e11=-1630/3.08 \
        --set=d12=-1125/3.08 \
        --set=e12=-1630/3.08 \
        --set=d13=-2250/3.08 \
        --set=e13=-1630/3.08 \
        --set=d14=-3375/3.08 \
        --set=e14=-1630/3.08 \
        --set=d15=-4500/3.08 \
        --set=e15=-1630/3.08 \
        --set=d16=3375/3.08 \
        --set=e16=-815/3.08 \
        --set=d17=2250/3.08 \
        --set=e17=-815/3.08 \
        --set=d18=1125/3.08 \
        --set=e18=-815/3.08 \
        --set=d19=0/3.08 \
        --set=e19=-815/3.08 \
        --set=d20=-1125/3.08 \
        --set=e20=-815/3.08 \
        --set=d21=-2250/3.08 \
        --set=e21=-815/3.08 \
        --set=d22=-3375/3.08 \
        --set=e22=-815/3.08 \
        --set=d23=-4500/3.08 \
        --set=e23=-815/3.08 \
        --set=d24=3375/3.08 \
        --set=e24=0/3.08 \
        --set=d25=2250/3.08 \
        --set=e25=0/3.08 \
        --set=d26=1125/3.08 \
        --set=e26=0/3.08 \
        --set=d27=0/3.08 \
        --set=e27=0/3.08 \
        --set=d28=-1125/3.08 \
        --set=e28=0/3.08 \
        --set=d29=-2250/3.08 \
        --set=e29=0/3.08 \
        --set=d30=-3375/3.08 \
        --set=e30=0/3.08 \
        --set=d31=-4500/3.08 \
        --set=e31=0/3.08 \
        --set=d32=3375/3.08 \
        --set=e32=815/3.08 \
        --set=d33=2250/3.08 \
        --set=e33=815/3.08 \
        --set=d34=1125/3.08 \
        --set=e34=815/3.08 \
        --set=d35=0/3.08 \
        --set=e35=815/3.08 \
        --set=d36=-1125/3.08 \
        --set=e36=815/3.08 \
        --set=d37=-2250/3.08 \
        --set=e37=815/3.08 \
        --set=d38=-3375/3.08 \
        --set=e38=815/3.08 \
        --set=d39=-4500/3.08 \
        --set=e39=815/3.08 \
        --set=d40=3375/3.08 \
        --set=e40=1630/3.08 \
        --set=d41=2250/3.08 \
        --set=e41=1630/3.08 \
        --set=d42=1125/3.08 \
        --set=e42=1630/3.08 \
        --set=d43=0/3.08 \
        --set=e43=1630/3.08 \
        --set=d44=-1125/3.08 \
        --set=e44=1630/3.08 \
        --set=d45=-2250/3.08 \
        --set=e45=1630/3.08 \
        --set=d46=-3375/3.08 \
        --set=e46=1630/3.08 \
        --set=d47=-4500/3.08 \
        --set=e47=1630/3.08 \
        --set=d48=3375/3.08 \
        --set=e48=2445/3.08 \
        --set=d49=2250/3.08 \
        --set=e49=2445/3.08 \
        --set=d50=1125/3.08 \
        --set=e50=2445/3.08 \
        --set=d51=0/3.08 \
        --set=e51=2445/3.08 \
        --set=d52=-1125/3.08 \
        --set=e52=2445/3.08 \
        --set=d53=-2250/3.08 \
        --set=e53=2445/3.08 \
        --set=d54=-3375/3.08 \
        --set=e54=2445/3.08 \
        --set=d55=-4500/3.08 \
        --set=e55=2445/3.08 \
        --set=d56=3375/3.08 \
        --set=e56=3260/3.08 \
        --set=d57=2250/3.08 \
        --set=e57=3260/3.08 \
        --set=d58=1125/3.08 \
        --set=e58=3260/3.08 \
        --set=d59=0/3.08 \
        --set=e59=3260/3.08 \
        --set=d60=-1125/3.08 \
        --set=e60=3260/3.08 \
        --set=d61=-2250/3.08 \
        --set=e61=3260/3.08 \
        --set=d62=-3375/3.08 \
        --set=e62=3260/3.08 \
        --set=d63=-4500/3.08 \
        --set=e63=3260/3.08 \
        -o $Path/project4.pto \
        $Path/project3.pto


# Personnalisation des paramètres - 3
# optimisation possible
# avec comme point de depart, la photo central
pto_var \
        --opt=!y,!p,!r \
        --opt=d,e \
        --opt=!d27,!e27 \
        -o $Path/project5.pto \
        $Path/project4.pto
