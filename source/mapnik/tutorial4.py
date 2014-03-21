#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
tutorial4.py : script pour la génération d'image.

Ce script, découpé en fonction, est inspiré des scripts vus sur ce site :
    https://github.com/mapnik/mapnik/blob/master/tests/python_tests/
    https://github.com/mapnik/mapnik/wiki/GettingStartedInPython
Le code est moins spagetti.

"""

import mapnik
#import os
#import nose
#from utilities import execution_path
#from utilities import execution_path, run_all


def setup():
    u"""
    Fonction lancée au démarage.

    All of the paths used are relative, if we run the tests
    from another directory we need to chdir().

    """
    #os.chdir(execution_path('.'))
    pass


def do_map_01():
    u"""
    Dessin de la carte 01.

    La carte 1 est définie en suivant la procédure mapnik
     - système de projection de la carte
     - style et règle de style
     - connection et couches
     - generation du tracé
    et voila.
    la carte sera composée :
        - layer_01 = ortho (système cc46)
        - layer_02 = cadastre (système l93)
    """
    _proj4_3946_cc46 = '+proj=lcc +lat_1=45.25 +lat_2=46.75 +lat_0=46 +lon_0=3 +x_0=1700000 +y_0=5200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
    _proj4_2154_l93 = '+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
    #_proj4_4326_wgs84 = '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'
    # creation d"une carte dans le système de projection CC46"
    _map = mapnik.Map(256, 256, _proj4_3946_cc46)
    #_map.background = mapnik.Color('steelblue')

    # couche ortho
    # creation du style pour l'ortho
    _style_001 = mapnik.Style()
    _rule = mapnik.Rule()
    _rule.symbols.append(mapnik.RasterSymbolizer())
    _style_001.rules.append(_rule)
    _map.append_style('style_ortho', _style_001)

    #_style_002 = mapnik.Style()
    #_rule = mapnik.Rule()
    #_polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#02eff9'))
    #_polygon_symbolizer.fill_opacity = 0.5
    #_rule.symbols.append(_polygon_symbolizer)
    #_rule.symbols.append(mapnik.LineSymbolizer(
    #    mapnik.Color('rgb(50%,50%,50%)'),
    #    0.1))
    #_point_symbolizer = mapnik.PointSymbolizer()
    #_point_symbolizer.width = 15
    #_point_symbolizer.height = 15
    #_point_symbolizer.opacity = 0.8
    #_rule.symbols.append(_point_symbolizer)
    #_style_002.rules.append(_rule)
    #_map.append_style('style_cad_parcelle_sig', _style_002)

    # définition de la source de données pour l'ortho
    # l'ortho de la rochelle est trop grande :
    # il faut en faire un extrait en utilisant la commande suivante :
    # gdal_translate -projwin 1378100 5226400 1378200 5226300 \
    #                ortho_2013_lr_cc46.jp2 \
    #                ~/geodata/raster/test/mamaison2.tif
    # ce tips a ete vu ici : https://trac.osgeo.org/gdal/wiki/FAQRaster
    _datasource_001 = mapnik.Gdal(
        file='/home/fred/k/sig_donnees/raster/orthophotoplan/vue_2013/jp2/ortho_2013_lr_cc46.jp2')
    _datasource_001 = mapnik.Gdal(
        file='/home/fred/geodata/raster/test/mamaison2.tif')
    #_params_connection_dsibdd09_cadparcelle = dict(host='dsibdd09',
    #                                               port=5435,
    #                                               dbname='base_l93',
    #                                               table='cad_parcelle',
    #                                               srid=2154,
    #                                               user='contrib',
    #                                               password='alambic')
    #_datasource_002 = mapnik.PostGIS(**_params_connection_dsibdd09_cadparcelle)
    _layer_001 = mapnik.Layer('ortho', _proj4_3946_cc46)
    _layer_001.datasource = _datasource_001
    _layer_001.styles.append('style_ortho')
    #_layer_002 = mapnik.Layer('cad_parcelle_sig', _proj4_l93)
    #_layer_002.datasource = _datasource_002
    #_layer_002.styles.append('style_cad_parcelle_sig')
    _map.layers.append(_layer_001)
    #_map.layers.append(_layer_002)
    #_map.zoom_to_box(_layer_002.envelope())
    _map.zoom_to_box(mapnik.Box2d(1378100, 5226300, 1378200, 5226400))
    _scale = _map.scale()
    _scale_denominator = _map.scale_denominator()
    _new_zoom_001000 = 1000 / _scale_denominator

    print("scale = %s", _scale)
    print("scale_denominator = %s", _map.scale_denominator())
    print("new_zoom_001000 = %s", _new_zoom_001000)
    _map.zoom(_new_zoom_001000)
    print("scale_denominator = %s", _map.scale_denominator())
    mapnik.render_to_file(
        _map,
        '/home/fred/geodata/raster/test/larochelle_001000.png',
        'png')


if __name__ == '__main__':
    setup()
    #run_all(eval(x) for x in dir() if x.startswith("test_"))
    do_map_01()
