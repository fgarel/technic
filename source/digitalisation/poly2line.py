#!/usr/bin/env python
# coding: utf-8

# doc tiré de cette page :
# https://pcjericks.github.io/py-gdalogr-cookbook/vector_layers.html#convert-polygon-shapefile-to-line-shapefile


import ogr, os

def poly2line(input_poly,output_line):

    source_ds = ogr.Open(input_poly)
    source_layer = source_ds.GetLayer()

    # polygon2geometryCollection
    geomcol =  ogr.Geometry(ogr.wkbGeometryCollection)
    for feat in source_layer:
        geom = feat.GetGeometryRef()
        ring = geom.GetGeometryRef(0)
        geomcol.AddGeometry(ring)

    # geometryCollection2shp
    shpDriver = ogr.GetDriverByName("ESRI Shapefile")
    if os.path.exists(output_line):
            shpDriver.DeleteDataSource(output_line)
    outDataSource = shpDriver.CreateDataSource(output_line)

    #gpkgDriver = ogr.GetDriverByName("GPKG")
    #if os.path.exists(output_line):
    #        gpkgDriver.DeleteDataSource(output_line)
    #outDataSource = gpkgDriver.CreateDataSource(output_line)

    print(outDataSource)
    outLayer = outDataSource.CreateLayer(output_line, geom_type=ogr.wkbMultiLineString)
    #outLayer = outDataSource.CreateLayer(output_line, geom_type=ogr.wkbLineString)
    #outLayer = outDataSource.CreateLayer(output_line)
    print(outLayer)
    featureDefn = outLayer.GetLayerDefn()
    outFeature = ogr.Feature(featureDefn)
    outFeature.SetGeometry(geomcol)
    outLayer.CreateFeature(outFeature)

def geopackage2shp( input_gpkg, output_shp ):
    # Get the input Layer
    inGeopackage = input_gpkg
    inDriver = ogr.GetDriverByName("GPKG")
    inDataSource = inDriver.Open(inGeopackage, 0)
    #inLayer = inDataSource.GetLayer()
    #inLayer.SetAttributeFilter("minor = 'HYDR'")

    # Create the output LayerS
    outShapefile = output_shp
    outDriver = ogr.GetDriverByName("ESRI Shapefile")

    # Remove output shapefile if it already exists
    if os.path.exists(outShapefile):
        outDriver.DeleteDataSource(outShapefile)

    # Create the output shapefile
    outDataSource = outDriver.CreateDataSource(outShapefile)


def main(input_poly,output_line):
    #geopackage2shp()
    poly2line(input_poly,output_line)

if __name__ == "__main__":
    input_poly = '/home/fred/contlberges.gpkg'
    output_line = 'test_line.shp'

    main(input_poly,output_line)
