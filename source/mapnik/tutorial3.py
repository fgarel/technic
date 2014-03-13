#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# This file is part of Mapnik (c++ mapping toolkit)
#
# Copyright (C) 2006 Jean-Francois Doyon
#
# Mapnik is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

import mapnik

# Instantiate a map object with given width, height and spatial reference system
# pour connaitre les paramètres proj à utiliser pour le système CC46,
# sous wikipedia, systeme de coordonnées, on pointe sur epsg:3946, qui
# pointe vers
# http://spatialreference.org/ref/epsg/3946/mapnikpython
_proj4 = '+proj=lcc +lat_1=45.25 +lat_2=46.75 +lat_0=46 +lon_0=3 +x_0=1700000 +y_0=5200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
_proj4_l93 = '+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'

_map = mapnik.Map(256, 256, _proj4)
# Set background colour to 'steelblue'.
# You can use 'named' colours, #rrggbb, #rgb or rgb(r%,g%,b%) format
_map.background = mapnik.Color('steelblue')

# Now lets create a style and add it to the Map.
_style_001 = mapnik.Style()
# A Style can have one or more rules. A rule consists of a filter, min/max scale
# demoninators and 1..N Symbolizers. If you don't specify filter and scale denominators
# you get default values :
#   Filter =  'ALL' filter (meaning symbolizer(s) will be applied to all features)
#   MinScaleDenominator = 0
#   MaxScaleDenominator = INF
# Lets keep things simple and use default value, but to create a map we
# we still must provide at least one Symbolizer. Here we  want to fill countries polygons with
# greyish colour and draw outlines with a bit darker stroke.

_rule=mapnik.Rule()
_rule.symbols.append(mapnik.RasterSymbolizer())
_style_001.rules.append(_rule)
# Here we have to add our style to the Map, giving it a name.
_map.append_style('style_ortho',_style_001)

# style pour les parcelles (origine sig)
_style_002 = mapnik.Style()
_rule=mapnik.Rule()
_polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#02eff9'))
_polygon_symbolizer.fill_opacity = 0.5
_rule.symbols.append(_polygon_symbolizer)
_rule.symbols.append(mapnik.LineSymbolizer(mapnik.Color('rgb(50%,50%,50%)'),0.1))
_point_symbolizer = mapnik.PointSymbolizer()
_point_symbolizer.width = 15
_point_symbolizer.height = 15
_point_symbolizer.opacity = 0.8
_rule.symbols.append(_point_symbolizer)
_style_002.rules.append(_rule)
_map.append_style('style_cad_parcelle_sig',_style_002)

# style pour la parcelle (origine topo)
_style_003 = mapnik.Style()
_rule=mapnik.Rule()
_polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#f2eff9'))
_polygon_symbolizer.fill_opacity = 0.5
_rule.symbols.append(_polygon_symbolizer)
_rule.symbols.append(mapnik.LineSymbolizer(mapnik.Color('rgb(50%,50%,50%)'),0.1))
_style_003.rules.append(_rule)
_map.append_style('style_cad_parcelle_topo',_style_003)

# style pour le bati (origine topo)
_style_004 = mapnik.Style()
_rule=mapnik.Rule()
_polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#f20ff9'))
_polygon_symbolizer.fill_opacity = 0.5
_rule.symbols.append(_polygon_symbolizer)
_rule.symbols.append(mapnik.LineSymbolizer(mapnik.Color('rgb(50%,50%,50%)'),0.1))
_style_004.rules.append(_rule)
_map.append_style('style_cad_bati_topo',_style_004)

# style pour les POI 1
_style_005 = mapnik.Style()
_rule=mapnik.Rule()
_point_symbolizer = mapnik.PointSymbolizer()
_point_symbolizer.width = 10
_point_symbolizer.height = 20
_point_symbolizer.opacity = 1
_rule.symbols.append(_point_symbolizer)
_style_005.rules.append(_rule)
_map.append_style('style_poi_A',_style_005)

# style pour les POI 1
_style_006 = mapnik.Style()
_rule=mapnik.Rule()
_point_symbolizer = mapnik.PointSymbolizer()
_point_symbolizer.width = 15
_point_symbolizer.height = 15
_point_symbolizer.opacity = 0.8
_rule.symbols.append(_point_symbolizer)
_style_006.rules.append(_rule)
_map.append_style('style_poi_B',_style_006)

# style pour les POI 3
_style_007 = mapnik.Style()
_rule=mapnik.Rule()
_polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#02eff9'))
_polygon_symbolizer.fill_opacity = 0.5
_rule.symbols.append(_polygon_symbolizer)
_rule.symbols.append(mapnik.LineSymbolizer(mapnik.Color('rgb(50%,50%,50%)'),0.1))
_point_symbolizer = mapnik.PointSymbolizer()
_point_symbolizer.width = 10
_point_symbolizer.height = 10
_point_symbolizer.opacity = 0.5
_rule.symbols.append(_point_symbolizer)
_style_007.rules.append(_rule)
_map.append_style('style_poi_C',_style_007)

# Then provide the full filesystem path to a shapefile in WGS84 or EPSG 4326 projection without the .shp extension
# A sample shapefile can be downloaded from http://mapnik-utils.googlecode.com/svn/data/world_borders.zip
_datasource_001 = mapnik.Gdal(file='/home/fred/geodata/raster/test/mamaison.tif')
_params_connection_dsibdd09_cadparcelle = dict(host='dsibdd09', \
                                   port=5435, \
                                   dbname='base_l93', \
                                   table='cad_parcelle', \
                                   srid=2154, \
                                   user='contrib', \
                                   password='alambic')
_datasource_002 = mapnik.PostGIS(**_params_connection_dsibdd09_cadparcelle)
_datasource_003 = mapnik.Shapefile(file='/home/fred/geodata/vecteur/test/parcelle.shp')
_datasource_004 = mapnik.Shapefile(file='/home/fred/geodata/vecteur/test/bati.shp')
_datasource_005 = mapnik.Shapefile(file='/home/fred/geodata/vecteur/test/poi.shp')
_params_connection_dsibdd09 = dict(host='dsibdd09', \
                                   port=5435, \
                                   dbname='base_l93', \
                                   table='cad_parcelle', \
                                   srid=2154, \
                                   user='contrib', \
                                   password='alambic')
_params_connection_debian_parks2154 = dict(host='10.2.10.56', \
                                   port=5432, \
                                   dbname='dbmapnik', \
                                   table='parks2154', \
                                   srid=2154, \
                                   user='contrib', \
                                   password='alambic')
_datasource_006 = mapnik.PostGIS(**_params_connection_debian_parks2154)
_params_connection_debian_parks3946 = dict(host='10.2.10.56', \
                                   port=5432, \
                                   dbname='dbmapnik', \
                                   table='parks', \
                                   srid=3946, \
                                   user='contrib', \
                                   password='alambic')
_datasource_007 = mapnik.PostGIS(**_params_connection_debian_parks3946)

# Here we instantiate our data layer, first by giving it a name and srs (proj4 projections string), and then by giving it a datasource.
_layer_001 = mapnik.Layer('ortho', _proj4)
# Then provide the full filesystem path to a shapefile in WGS84 or EPSG 4326 projection without the .shp extension
# A sample shapefile can be downloaded from http://mapnik-utils.googlecode.com/svn/data/world_borders.zip
_layer_001.datasource = _datasource_001
_layer_001.styles.append('style_ortho')

# 2d layer = parcelles SIG
_layer_002 = mapnik.Layer('cad_parcelle_sig', _proj4_l93)
#_layer_002 = mapnik.Layer('cad_parcelle_sig', _proj4)
_layer_002.datasource = _datasource_002
_layer_002.styles.append('style_cad_parcelle_sig')

# 3eme layer = parcelle topo
_layer_003 = mapnik.Layer('cad_parcelle_topo', _proj4)
_layer_003.datasource = _datasource_003
_layer_003.styles.append('style_cad_parcelle_topo')

# 4eme layer = bati topo
_layer_004 = mapnik.Layer('cad_bati_topo', _proj4)
_layer_004.datasource = _datasource_004
_layer_004.styles.append('style_cad_bati')

# 5eme layer = poi A
_layer_005 = mapnik.Layer('poi A', _proj4)
_layer_005.datasource = _datasource_005
_layer_005.styles.append('style_poi_A')

# 6eme layer = poi B
_layer_006 = mapnik.Layer('poi B', _proj4)
_layer_006.datasource = _datasource_006
_layer_006.styles.append('style_poi_B')

# 7eme layer = poi C
_layer_007 = mapnik.Layer('poi C', _proj4)
_layer_007.datasource = _datasource_007
_layer_007.styles.append('style_poi_C')

_map.layers.append(_layer_001)
_map.layers.append(_layer_002)
_map.layers.append(_layer_003)
_map.layers.append(_layer_004)
_map.layers.append(_layer_005)
_map.layers.append(_layer_006)
_map.layers.append(_layer_007)
_map.zoom_to_box(_layer_002.envelope())
_map.zoom_to_box(_layer_003.envelope())

_scale = _map.scale()
#_zoom = _map.zoom()
_scale_denominator = _map.scale_denominator()
_new_zoom_001000 = 1000 / _scale_denominator

print("scale = %s", _scale)
#print("zoom = %s", _zoom)
print("scale_denominator = %s", _map.scale_denominator())
print("new_zoom_001000 = %s", _new_zoom_001000)
#_map.pan_and_zoom(-1,-1, _new_zoom)
_map.zoom( _new_zoom_001000)
print("scale_denominator = %s", _map.scale_denominator())
# Write the data to a png image called world.png in the base directory of your user
mapnik.render_to_file(_map,'/home/fred/geodata/raster/test/larochelle_001000.png', 'png')

_new_zoom_000500 = 500 / _map.scale_denominator()
print("new_zoom_000500 = %s", _new_zoom_000500)
_map.zoom( _new_zoom_000500)
mapnik.render_to_file(_map,'/home/fred/geodata/raster/test/larochelle_000500.png', 'png')

# Exit the python interpreter
exit()

