#! /bin/sh
# hugin command tools script to stitch scanned images, fov unknown
# use of fov >= 10 should be OK, could simply set FOV=10
# Terry Duell 2013, 2014

# usage...run-scan-pto_var.sh outputprefix fov

#get the output file prefix
Prefix=$1

# get the fov
FOV=$2

pto_gen --projection=0 --fov=$FOV -o project.pto scan-1.jpg scan-2.jpg
pto_lensstack -o project1.pto --new-lens i1 project.pto
cpfind -o project1.pto --multirow project1.pto
cpclean -o project2.pto project1.pto
linefind -o project3.pto project2.pto
pto_var -o setoptim.pto --opt r,d,e,!r0,!d0,!e0 project3.pto
autooptimiser -n -o autoptim.pto setoptim.pto
pano_modify  --projection=0 --fov=AUTO --center --canvas=AUTO --crop=AUTO -o autoptim2.pto autoptim.pto
pto2mk -o project.mk -p $Prefix autoptim2.pto
make -j 2 -f project.mk all

# open pto files from each step in hugin to check how it all works
