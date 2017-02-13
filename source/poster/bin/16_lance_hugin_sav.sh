#!/bin/sh

# https://geekoverdose.wordpress.com/2013/06/07/batch-panorama-stitching-with-review-using-hugin/

# pré requis :
# pto_gen      est fourni dans le paquet hugin_tools
# PTBatcherGUI est fourni dans le paquet hugin

# 1ère etape : cration des sous-repertoires

# 2ème etape : generation des projets hugin => fichier pto

# for d in `ls`; do pto_gen $d/*.jpg; done
CHEMIN='/home/fred/Images/v4/'
CHEMIN='/media/fred/TOSHIBA/Images/d150_v5/'
FOV=10
#pto_gen $CHEMIN/*.png
pto_gen --projection=0 --fov=$FOV -o $CHEMIN/project.pto $CHEMIN/*.png
pto_lensstack -o $CHEMIN/project1.pto --new-lens i1 --new-lens i2 $CHEMIN/project.pto

# etape 3 : ajout du pto à la liste d'attente d'Hugin Batch Processor
#find $CHEMIN -name "*.pto" -exec PTBatcherGUI -a {} \;
