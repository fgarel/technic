#!/usr/bin/env python
# -*- encoding: utf-8 -*-

from osgeo import gdal
import numpy as np
m = 12609
n = 8810
fp = [[1, m, m, 1], [1, 1, n, n]]
tp = [[1616411.91, 1617482.52, 1617503.82, 1616433.22],
      [9173672.33, 9173641.84, 9174389.85, 9174420.34]]
pix = zip(fp[0], fp[1])
coor = zip(tp[0], tp[1])
print pix
#([(1, 1), (12609, 1), (12609, 8810), (1, 8810)]
print coor
#[(1616411.9099999999, 9173672.3300000001),
# (1617482.52, 9173641.8399999999),
# (1617503.8200000001, 9174389.8499999996),
# (1616433.22, 9174420.3399999999)])

gcps = []
# calcule des paramètres avec gdal.GCP (points d'appui)
for index, txt in enumerate(pix):
    gdal.GCPPixel = pix[index][0]
    #gcps[index].GCPPixel = pix[index][0]
    gdal.GCPLine = 8810 - int(pix[index][1])
    #gcps[index].GCPLine = 8810 - int(pix[index][1])
    gdal.GCPX = coor[index][0]
    #gcps[index].GCPX = coor[index][0]
    gdal.GCPY = coor[index][1]
    #gcps[index].GCPY = coor[index][1]
    gcps.append(gdal.GCP())
print gcps
geotransform = gdal.GCPsToGeoTransform(gcps)
print geotransform
#(1616433.1325852636, 0.084914736675147789, -0.0024185492110491138,
# 9174420.3424183074, -0.0024183058378076717, -0.084914292200888988)
M = np.matrix([[geotransform[1], geotransform[4], geotransform[0]],
               [geotransform[2], geotransform[5], geotransform[3]]])
print M
#matrix([[  8.49147367e-02,  -2.41830584e-03,   1.61643313e+06],
#        [ -2.41854921e-03,  -8.49142922e-02,   9.17442034e+06]])
