#!/bin/sh

# https://geekoverdose.wordpress.com/2013/06/07/batch-panorama-stitching-with-review-using-hugin/

# pré requis :
# pto_gen      est fourni dans le paquet hugin_tools
# PTBatcherGUI est fourni dans le paquet hugin

# 1ère etape : cration des sous-repertoires

# 2ème etape : generation des projets hugin => fichier pto

# for d in `ls`; do pto_gen $d/*.jpg; done
pto_gen *.png

# etape 3 : ajout du pto à la liste d'attente d'Hugin Batch Processor
find . -name "*.pto" -exec PTBatcherGUI -a {} \;
