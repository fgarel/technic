#!/bin/sh

# https://geekoverdose.wordpress.com/2013/06/07/batch-panorama-stitching-with-review-using-hugin/

# pré requis :
# pto_gen      est fourni dans le paquet hugin_tools
# PTBatcherGUI est fourni dans le paquet hugin

# 1ère etape : cration des sous-repertoires

# 2ème etape : generation des projets hugin => fichier pto

# for d in `ls`; do pto_gen $d/*.jpg; done
CHEMIN='/home/fred/Images/v4/'
pto_gen $CHEMIN/*.png

# etape 3 : ajout du pto à la liste d'attente d'Hugin Batch Processor
find $CHEMIN -name "*.pto" -exec PTBatcherGUI -a {} \;
