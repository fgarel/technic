#!/usr/bin/env python

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


#_proj4_3946_cc46 = '+proj=lcc +lat_1=45.25 +lat_2=46.75 +lat_0=46 +lon_0=3 +x_0=1700000 +y_0=5200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
#_proj4_2154_l93 = '+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
#_proj4_4326_wgs84 = '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'
#_proj4_3857_pseudomercator = '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs'
_proj4_4326_wgs84 = mapnik.Projection('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs')
_proj4_3857_pseudomercator = mapnik.Projection('+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs')
#mapfile = 'tutorial2.xml'
mapfile = '/home/fred/src/mapnik-style/osm.xml'

# il semblerait que l'on ne peut pas ecrire dans un repertoire autre que le
# repertoire courant
#map_output = '~/geodata/raster/world/hello_world_using_xml_config.png'
map_output = 'hello_world_using_xml_config.png'

# Instantiate a map object with given width, height and spatial reference system
#m = mapnik.Map(600,300,"+proj=latlong +datum=WGS84")
m = mapnik.Map(500,500)

mapnik.load_map(m, mapfile)

m.srs = _proj4_3857_pseudomercator.params()

#bbox = mapnik.Envelope(mapnik.Coord(-180.0, -90.0), mapnik.Coord(180.0, 90.0))
bbox = mapnik.Envelope(mapnik.Coord(-1.250, 46.140), mapnik.Coord(-1.080, 46.170))

transform = mapnik.ProjTransform(_proj4_4326_wgs84, _proj4_3857_pseudomercator)
merc_bbox = transform.forward(bbox)

m.zoom_to_box(merc_bbox)

# Write the data to a png image called world.png in the base directory of your user
mapnik.render_to_file(m, map_output)


# Exit the python interpreter
exit()

