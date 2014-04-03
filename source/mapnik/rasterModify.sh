#!/bin/sh

gdal_translate -projwin 1378100 5226400 1378200 5226300 \
                vue_2013/ortho_2013_lr_cc46.jp2 \
                ~/geodata/raster/test/mamaison2.tif
