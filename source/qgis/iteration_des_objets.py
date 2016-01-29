import qgis.core

# set host name, port, database name, username and password
uri.setConnection("dsibdd09", "5432", "eaupluviale", "contrib", "alambic")

# set database schema, table name, geometry column and optionaly
# subset (WHERE clause)
uri.setDataSource("sig", "ep_regard_pluvial", "wkb_geometry", "")

vlayer = QgsVectorLayer(uri.uri(), "ep_regard_pluvial", "postgres")


if not vlayer.isValid():
  print "Layer failed to load!"

iter = vlayer.getFeatures()


for feature in iter:
  # retreive every feature with its geometry and attributes
    # fetch geometry
    geom = feature.geometry()
    
    print "Feature ID %d: " % feature.id()

    # show some information about the feature
    if geom.type() == QGis.Point:
      x = geom.asPoint()
      print "Point: " + str(x)
    elif geom.type() == QGis.Line:
      x = geom.asPolyline()
      print "Line: %d points" % len(x)
    elif geom.type() == QGis.Polygon:
      x = geom.asPolygon()
      numPts = 0
      for ring in x:
        numPts += len(ring)
      print "Polygon: %d rings with %d points" % (len(x), numPts)
    else:
      print "Unknown"

    # fetch attributes
    attrs = feature.attributes()

    # attrs is a list. It contains all the attribute values of this feature
    print attrs
