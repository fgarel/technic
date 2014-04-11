#!/usr/bin/env python
#-*- coding: utf-8 -*-

u"""
Utilitaire pour convertir des coordonnées wgs84 en tuiles.

la doc est ici :
    http://wiki.openstreetmap.org/wiki/Slippy_map_tilenames.

"""

import math


def deg2num(lat_deg, lon_deg, zoom):
    u"""
    Lon./lat. to tile numbers.

    On donne en entrée la latitude (N), la longitude (E) et le niveau de zoom.

    """
    lat_rad = math.radians(lat_deg)
    n = 2.0 ** zoom
    xtile = int((lon_deg + 180.0) / 360.0 * n)
    ytile = int((1.0 - math.log(math.tan(lat_rad) + (1 / math.cos(lat_rad)))
                 / math.pi) / 2.0 * n)
    return (xtile, ytile)


def num2deg(xtile, ytile, zoom):
    u"""
    Tile numbers to lon./lat.

    On donne en entré le x de la tuile, le y de la tuile et le niveau de zoom,
    qui sont respectivement en 2ème, 3ème et 1ère position de l'arborescence
    créée avec gdal2tiles.
    Par exemple, on a l'arborescence 20/521076/676366, alors
    xtile = 521076
    ytile = 676366
    zoom  = 20
    En sortie, on a les coordonnées géographiques de la tuile.

    """
    n = 2.0 ** zoom
    lon_deg = xtile / n * 360.0 - 180.0
    lat_rad = math.atan(math.sinh(math.pi * (1 - 2 * ytile / n)))
    lat_deg = math.degrees(lat_rad)
    return (lat_deg, lon_deg)

if __name__ == "__main__":
    lat, lon = num2deg(521076, 676366, 20)
    #lat, lon = num2deg(521094, 676367, 20)
    print "E = %s  N = %s" % (lon, lat)
