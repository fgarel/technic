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


class Fgmapnik:

    u"""
    Objet permettant de simplifier l'utilisation de mapnik.

    Un objet Fgmapnik peut être utilisé pour créer une image.

    """

    def __init__(self):
        u"""
        Initialisation de l'instance de l'objet.

        """
        self._host_debian = '10.2.10.37'
        self._host_dsibdd09 = '10.254.140.139'
        self._proj4_3946_cc46 = '+proj=lcc +lat_1=45.25 +lat_2=46.75 +lat_0=46 +lon_0=3 +x_0=1700000 +y_0=5200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
        #self._proj4_2154_l93 = '+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'
        #self._proj4_4326_wgs84 = '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'
        self._proj4_3857_pseudomercator = '+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs'


    def do_rule(datatype):
        u"""
        Rule est une rèle de style.

        Un style est normalement composé de plusieurs règles.

        """
        _rule = mapnik.Rule()
        if datatype == "raster":
            _rule.symbols.append(mapnik.RasterSymbolizer())
        if datatype == "vecteur":
            _polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#02eff9'))
            _polygon_symbolizer.fill_opacity = 0.5
            _line_symbolizer = mapnik.LineSymbolizer(
                mapnik.Color('rgb(50%, 50%, 50%)'), 0.1)
            _point_symbolizer = mapnik.PointSymbolizer()
            _point_symbolizer.width = 15
            _point_symbolizer.height = 15

            _rule.symbols.append(_polygon_symbolizer)
            _rule.symbols.append(_line_symbolizer)
            _rule.symbols.append(_point_symbolizer)

        return _rule


    def do_style(datatype, stylename):
        u"""
        Style est la façon de dessiner une couche.

        Un style est normalement composé de plusieurs règles.

        """
        _style = mapnik.Style()
        _style.rules.append(do_rule(datatype))

        return _style


    def do_datasource(datasourcetype, datafile, hostname, mytable, mysrid):
        u"""
        Datasource désigne la source de données.

        Un datasource de type raster, postgis, shapefile ou osm.

        """
        if datasourcetype == "raster":
            _datasource = mapnik.Gdal(file=datafile)
        if datasourcetype == "postgis":
            if hostname == "dsibdd09":
                _params_connection = dict(host=_host_dsibdd09,
                                          port=5435,
                                          dbname='base_l93',
                                          table=mytable,
                                          srid=mysrid,
                                          user='contrib',
                                          password='alambic')
            if hostname == "debian":
                _params_connection = dict(host=_host_debian,
                                          port=5435,
                                          dbname='dbmapnik',
                                          table=mytable,
                                          srid=mysrid,
                                          user='contrib',
                                          password='alambic')
            _datasource = mapnik.Postgis(**_params_connection)
        if datasourcetype == "shapefile":
            _datasource = mapnik.Shapefile(file=datafile)

        return _datasource


    def do_layer(self, layername, mysrid):
        """
        Layer est le lien entre le style et la datasource.

        """
        _layer = mapnik.Layer(layername, mysrid)
        _layer.datasource = self._datasource
        _layer.styles.append('')


    def do_map_01(self):
        u"""
        Dessin de la carte 01.

        La carte 1 est définie en suivant la procédure mapnik
            - système de projection de la carte
            - style et règle de style
            - connection et couches
            - generation du tracé
        La carte sera composée :
            - _layer_001 = ortho (système cc46)
            - _layer_002 = cad_cadastre (système l93)
            - _layer_003 = cad_parcelle (systeme )
        et voila.

        """
        # creation d"une carte dans le système de projection CC46"
        _map = mapnik.Map(256, 256, self._proj4_3946_cc46)
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
        #_datasource_001 = mapnik.Gdal(
        #    file='/home/fred/k/sig_donnees/raster/orthophotoplan/vue_2013/jp2/ortho_2013_lr_cc46.jp2')
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
        _datasource_010 = mapnik.Osm(file='/home/fred/geodata/vecteur/osm/planet_-1.2498,46.1263_-1.0831,46.2022.osm')
        _layer_001 = mapnik.Layer('ortho', self._proj4_3946_cc46)
        _layer_001.datasource = _datasource_001
        _layer_001.styles.append('style_ortho')
        _layer_010 = mapnik.Layer('osm', self._proj4_3857_pseudomercator)
        _layer_010.datasource = _datasource_010
        #_layer_010.styles.append('style_osm')
        #_layer_002 = mapnik.Layer('cad_parcelle_sig', _proj4_l93)
        #_layer_002.datasource = _datasource_002
        #_layer_002.styles.append('style_cad_parcelle_sig')

        _map.layers.append(_layer_001)
        _map.layers.append(_layer_010)
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

    #run_all(eval(x) for x in dir() if x.startswith("test_"))
    _mon_fgmapnik = Fgmapnik()
    _mon_fgmapnik.do_map_01()
