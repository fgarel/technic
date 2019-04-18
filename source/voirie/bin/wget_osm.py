#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# script pour l'extraction de données osm
#
# https://github.com/DinoTools/python-overpy
# https://github.com/mocnik-science/osm-python-tools
# https://github.com/mocnik-science/osm-python-tools/blob/master/docs/overpass.md
# https://wiki.openstreetmap.org/wiki/Overpass_API
#
import overpy

api = overpy.Overpass()

# fetch all ways and nodes
result = api.query("""
    way(50.746,7.154,50.748,7.157) ["highway"];
    (._;>;);
    out body;
    """)


result = api.query("""
[out:json];

(
area[name="La Rochelle"][admin_level="8"]["ref:INSEE"="17300"];
// les adresses postales
node
  (area)
  ["addr:housenumber"];

// les voies qui ont un nom
area[name="La Rochelle"][admin_level="8"]["ref:INSEE"="17300"];
way
  (area)
  [highway][name];
// les batiments avec une adresse postale
area[name="La Rochelle"][admin_level="8"]["ref:INSEE"="17300"];
way
  (area)
  ["addr:housenumber"];

// pas de relation
/*
  rel
  (area)
  ["type"="associatedStreet"];
*/
);
out body;
>;
out skel qt;
""")

for way in result.ways:
    print("Name: %s" % way.tags.get("name", "n/a"))
    print("  Highway: %s" % way.tags.get("highway", "n/a"))
    #print("  Nodes:")
    #for node in way.nodes:
    #    print("    Lat: %f, Lon: %f" % (node.lat, node.lon))
