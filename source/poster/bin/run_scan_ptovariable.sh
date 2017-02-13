#! /bin/sh
# hugin command tools script to stitch two scanned images, fov unknown
# use of fov >= 10 should be OK...could simply set FOV=10
# Terry Duell 2013, 2014
# Uses ptovariable, a function from perl-Panotools-Script by Bruno Postle
# run man cmd with cmd = ptovariable and all the others below to learn how they work

# usage...run_scan_ptovariable.sh outputprefix fov
 
#get the output file prefix
Prefix=$1
 
# get the fov
FOV=$2
 
pto_gen --projection=0 --fov=$FOV -o project.pto scan-1.jpg scan-2.jpg
pto_lensstack -o project1.pto --new-lens i1 project.pto
cpfind -o project2.pto --multirow project1.pto
cpclean -o project3.pto project2.pto
linefind -o project4.pto project3.pto
ptovariable --translations --response --exposure --roll -o setoptim.pto project4.pto
autooptimiser -n -o autoptim.pto setoptim.pto
pano_modify  --projection=0 --fov=AUTO --center --canvas=AUTO --crop=AUTO -o autoptim2.pto autoptim.pto
pto2mk -o project.mk -p $Prefix autoptim2.pto
make -j 2 -f project.mk all
 
# open pto files from each step in hugin to check how it all worksq
