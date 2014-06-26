#!/bin/sh
#

#mkdir mypyramid
#gdal_retile.py -v \
#               -r bilinear \
#               -levels 4 \
#               -co "TILED=YES" \
#               -co "COMPRESS=JPEG" \
#               -targetDir mypyramid \
#               ~/f/CARTOGRAPHIE/donnees/raster/ortho_2013/ortho_2013_lr_cc46.tif


#               -ps 2048 2048 \


##extraction d'une fenetre
# -projwin xmin ymax xmax ymin
# -projwin xHG yHG xBD yBD
# maison
# -projwin 1378730 5227900 1379730 5226900
# maison2
# -projwin 1378730 5227900 1379730 5226900
# papi
# -projwin 1378568 5225902 1380038 5225237

rm ~/geodata/raster/extraction_papi_lr.tif
rm ~/geodata/raster/extraction_papi_lr.jpg
#rm ~/geodata/raster/extraction_papi_lr_300.png

gdal_translate -projwin 1378500 5226000 1380100 5225200 \
                ../mapnik/vue_2013/ortho_2013_lr_cc46.jp2 \
                ~/geodata/raster/extraction_papi_lr.tif
echo "############# apres gdal_translate"
identify -verbose \
         ~/geodata/raster/extraction_papi_lr.tif

rm ~/geodata/raster/extraction_papi_lr.jpg 
convert -units PixelsPerInch \
        -density 300 \
        ~/geodata/raster/extraction_papi_lr.tif \
        ~/geodata/raster/extraction_papi_lr.jpg
echo "############# apres convert jpg pixelsperinch"
identify -verbose \
         ~/geodata/raster/extraction_papi_lr.jpg         

#exiftool -g \
#         -Photoshop:XResolution=300 \
#         -Photoshop:DisplayedUnitsX=1 \
#         -Photoshop:XResolution=300 \
#         -Photoshop:DisplayedUnitsY=1 \
#         ~/geodata/raster/extraction_papi_lr.png
#echo "############# apres exiftool"
#identify -verbose \
#         ~/geodata/raster/extraction_papi_lr.png
         

#rm ~/geodata/raster/extraction_papi_lr_300.png
#convert  \
#        -density 300 \
#        -resample 300 \
#        ~/geodata/raster/extraction_papi_lr.tif \
#        ~/geodata/raster/extraction_papi_lr_300.png


