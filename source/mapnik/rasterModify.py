#!/usr/bin/env python
# -*- encoding: utf-8 -*-

u"""
Script pour l'extraction d'une partie d'une image.

Ce script va extraire une fenêtre de l'image.

"""

import os

# constants
#gdalTranslate = 'gdal_translate'
#cmd = "-projwin 1378730 5227900 1379730 5226900"  # just for example!
#src = "vue_2013/ortho_2013_lr_cc46.jp2"
#dst = "~/geodata/raster/test/mamaison2.tif"


def extract(xCenterCC46, yCenterCC46, Height, Width, filename):
    u"""
    Extraction d'une fenetre.

    """
    xMin = xCenterCC46 - Width / 2
    yMin = yCenterCC46 - Height / 2
    xMax = xCenterCC46 + Width / 2
    yMax = yCenterCC46 + Height / 2
    #cmd = "-projwin 1378730 5227900 1379730 5226900"  # just for example!
    cmd = "-projwin " + str(xMin) + " " + str(yMax) + " " + str(xMax) + " " + str(yMin)
    src = "vue_2013/ortho_2013_lr_cc46.jp2"
    dst = "~/geodata/raster/test/mamaison2.tif"
    print("gdal_translate %s %s %s" % (cmd, src, dst))
    os.system("gdal_translate " + cmd + " " + src + " " + dst)

if __name__ == '__main__':
    extract(1379230, 5227400,
            1000, 1000,
            "~/geodata/raster/test/mamaison2.tif")
