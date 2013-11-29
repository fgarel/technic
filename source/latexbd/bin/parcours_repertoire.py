#!/usr/bin/env python
# *-* encoding: utf-8 *-*

# ici, le but est de trouver les images d'un repertoire
# puis d'ecrire le code latex permettant de constituer un
# catalogue de ces images.

# le parcours d'un repertoire est détaillé ici
# http://www.pythonforbeginners.com/systems-programming/os-walk-and-fnmatch-in-python/


import fnmatch
import os

# les images sont des fichiers qui ont une extension
# parmi cette liste
images = ['*.jpg', '*.jpeg',
          '*.png',
          '*.tif', '*.tiff',
          ]
# matches sera la liste des fichiers qui correspondent au critère
matches = []

# on remplit la liste matches avec le nom des fichiers
# ayant la bonne extension.
for root, dirs, filenames in os.walk('/home/fred/geodata/raster/'):
    for extensions in images:
        for filename in fnmatch.filter(filenames, extensions):
            matches.append(os.path.join(root, filename))

print('matches = ' + matches.__str__())


