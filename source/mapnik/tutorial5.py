#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
tutorial5.py : script pour la génération d'image.

Ce script, découpé en fonction, est inspiré des scripts vus sur ce site :
    https://github.com/mapnik/mapnik/blob/master/tests/python_tests/
    https://github.com/mapnik/mapnik/wiki/GettingStartedInPython
Le code est moins spagetti.

"""

import mapnik
#import mapnik2 as mapnik
#import os
#import nose
#from utilities import execution_path
#from utilities import execution_path, run_all

# config at home
PG_HOST_CARTO = '192.168.0.21' # osm
PG_HOST_VLR = '192.168.0.21'   # cadastre
PG_PORT_VLR = 5432
PG_DBNAME_VLR = 'gis'
MAPFILE = '/home/fred/src/mapnik-style/osm.xml'

# config at work
PG_HOST_CARTO = '10.2.10.38'   # osm      = debian
PG_HOST_VLR = '10.254.140.139' # cadastre = dsibdd09
PG_PORT_VLR = 5435
PG_DBNAME_VLR = 'base_l93'
MAPFILE = '/home/fred/src/mapnik-style/osm.xml'

class Fgmapnik:

    u"""
    Objet permettant de simplifier l'utilisation de mapnik.

    Un objet Fgmapnik peut être utilisé pour créer une image.

    """

    def __init__(self, Height=256,
                       Width=256,
                       XCenterCC46=1379337.72,
                       YCenterCC46=5225674.09):
        u"""
        Initialisation de l'instance de l'objet.

        """
        self._pg_host_carto = PG_HOST_CARTO
        self._pg_host_vlr = PG_HOST_VLR
        self._pg_port_vlr = PG_PORT_VLR
        self._pg_dbname_vlr = PG_DBNAME_VLR
        self._mapfile = MAPFILE
        self._proj4_3946_cc46 = mapnik.Projection('+proj=lcc +lat_1=45.25 +lat_2=46.75 +lat_0=46 +lon_0=3 +x_0=1700000 +y_0=5200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs')
        self._proj4_2154_l93 = mapnik.Projection('+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs')
        self._proj4_4326_wgs84 = mapnik.Projection('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs')
        self._proj4_3857_pseudomercator = mapnik.Projection('+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs')
        self._height = Height
        self._width = Width
        self._xcenter_cc46 = XCenterCC46
        self._ycenter_cc46 = YCenterCC46


    def do_rule(datatype):
        u"""
        Rule est une règle de style.

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
        u"""
        Layer est le lien entre le style et la datasource.

        """
        _layer = mapnik.Layer(layername, mysrid)
        _layer.datasource = self._datasource
        _layer.styles.append('')


    def init_layer_ortho(self):
        u"""
        Initialisation du layer ortho.

        """

        # Initialisation du layer, avec sa projection
        _layer_001 = mapnik.Layer('ortho', self._proj4_3946_cc46.params())
        # datasource de type gdal, avec le nom de fichier
        _datasource_001 = mapnik.Gdal(
            file='/home/fred/geodata/raster/test/mamaison2.tif')
        _layer_001.datasource = _datasource_001
        # creation du style pour l'ortho
        _style_001 = mapnik.Style()
        # creation d'une règle
        _rule = mapnik.Rule()
        _rule.symbols.append(mapnik.RasterSymbolizer())
        # on ajoute la règle au style
        _style_001.rules.append(_rule)
        # le syle est ajouté à la carte
        _map.append_style('style_ortho', _style_001)
        # et il est relié au layer
        _layer_001.styles.append('style_ortho')

    def init_layer_cadastre(self):
        u"""
        Initialisation du layer cadastre.

        """

        # Initialisation du layer, avec sa projection
        _layer_002 = mapnik.Layer('cad_parcelle_sig', self._proj4_2154_l93.params())
        # datasource de type postgis, avec la chaine de connection
        _params_connection_vlr_cadparcelle = dict(host=self._pg_host_vlr,
                                                       port=self._pg_port_vlr,
                                                       dbname=self._pg_dbname_vlr,
                                                       table='cad_parcelle',
                                                       srid=2154,
                                                       user='contrib',
                                                       password='alambic')
        _datasource_002 = mapnik.PostGIS(**_params_connection_vlr_cadparcelle)
        _layer_002.datasource = _datasource_002

        # creation du style pour l'ortho
        _style_002 = mapnik.Style()
        # creation d'une règle
        _rule = mapnik.Rule()
        _polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#02eff9'))
        _polygon_symbolizer.fill_opacity = 0.5
        _rule.symbols.append(_polygon_symbolizer)
        _rule.symbols.append(mapnik.LineSymbolizer(
            mapnik.Color('rgb(50%,50%,50%)'),
            0.1))
        _point_symbolizer = mapnik.PointSymbolizer()
        _point_symbolizer.width = 15
        _point_symbolizer.height = 15
        _point_symbolizer.opacity = 0.8
        _rule.symbols.append(_point_symbolizer)
        # on ajoute la règle au style
        _style_002.rules.append(_rule)
        # le syle est ajouté à la carte
        _map.append_style('style_cad_parcelle_sig', _style_002)
        # et il est relié au layer
        _layer_002.styles.append('style_cad_parcelle_sig')

    def do_map_01(self, *args, **kwargs):
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
        for arg in args:
            #print("arg %s" % arg)
            pass
        for key, value in kwargs.iteritems():
            #print("key %s == value %s" % (key, value))
            if (key == 'Scale'):
                self._scale = value
            if (key == 'File'):
                self._file = value

        #print("Height = %s" % self._height)
        #print("Width = %s" % self._width)
        #print("XCenterCC46 = %s" % self._xcenter_cc46)
        #print("YCenterCC46 = %s" % self._ycenter_cc46)
        #print("Scale = %s" % self._scale)
        #print("File = %s" % self._file)

        # creation d'une carte dans le système de projection pseudo_mercator"
        #_map = mapnik.Map(256, 256, self._proj4_3946_cc46)
        #_map = mapnik.Map(256, 256, self._proj4_3857_pseudomercator)
        #_map = mapnik.Map(256, 256, self._proj4_4326_wgs84)
        #_map = mapnik.Map(self._height, self._width)
        _map = mapnik.Map(self._height, self._width, self._proj4_3857_pseudomercator.params())
        #_map.background = mapnik.Color('steelblue')

        # couche osm
        #print("PG_HOST_CARTO = %s" % self._pg_host_carto)
        mapfile = self._mapfile
        mapnik.load_map(_map, mapfile)

        # couche ortho
        # creation du style pour l'ortho
        _style_001 = mapnik.Style()
        _rule = mapnik.Rule()
        _rule.symbols.append(mapnik.RasterSymbolizer())
        _style_001.rules.append(_rule)
        _map.append_style('style_ortho', _style_001)

        _style_002 = mapnik.Style()
        _rule = mapnik.Rule()
        _polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#02eff9'))
        _polygon_symbolizer.fill_opacity = 0.5
        _rule.symbols.append(_polygon_symbolizer)
        _rule.symbols.append(mapnik.LineSymbolizer(
            mapnik.Color('rgb(50%,50%,50%)'),
            0.1))
        _point_symbolizer = mapnik.PointSymbolizer()
        _point_symbolizer.width = 15
        _point_symbolizer.height = 15
        _point_symbolizer.opacity = 0.8
        _rule.symbols.append(_point_symbolizer)
        _style_002.rules.append(_rule)
        _map.append_style('style_cad_parcelle_sig', _style_002)

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
        _params_connection_vlr_cadparcelle = dict(host=self._pg_host_vlr,
                                                       port=self._pg_port_vlr,
                                                       dbname=self._pg_dbname_vlr,
                                                       table='cad_parcelle',
                                                       srid=2154,
                                                       user='contrib',
                                                       password='alambic')
        _datasource_002 = mapnik.PostGIS(**_params_connection_vlr_cadparcelle)
        #_datasource_010 = mapnik.Osm(file='/home/fred/geodata/vecteur/osm/planet_-1.2498,46.1263_-1.0831,46.2022.osm')
        #_params_connection_debian_osm = dict(host=POSTGIS_HOST,
        #                                               port=5432,
        #                                               dbname='gis',
        #                                               table='planet_osm_roads',
        #                                               srid=900913,
        #                                               user='contrib',
        #                                               password='alambic')
        #_datasource_011 = mapnik.PostGIS(**_params_connection_debian_osm)
        _layer_001 = mapnik.Layer('ortho', self._proj4_3946_cc46.params())
        _layer_001.datasource = _datasource_001
        _layer_001.styles.append('style_ortho')
        #_layer_010 = mapnik.Layer('osm', self._proj4_3857_pseudomercator)
        #_layer_010.datasource = _datasource_010
        #_layer_011 = mapnik.Layer('osm2', self._proj4_3857_pseudomercator)
        #_layer_011.datasource = _datasource_011
        #_layer_011.styles.append('style_osm')
        _layer_002 = mapnik.Layer('cad_parcelle_sig', self._proj4_2154_l93.params())
        _layer_002.datasource = _datasource_002
        _layer_002.styles.append('style_cad_parcelle_sig')

        _map.layers.append(_layer_001)
        _map.layers.append(_layer_002)
        #_map.layers.append(_layer_010)
        #_map.layers.append(_layer_011)
        #_map.layers.append(_layer_002)

        #_map.zoom_to_box(_layer_002.envelope())

        # Se placer au bon endroit, à la bonne échelle
        # on definit une fenetre de 1000 par 1000, que l'on centre ensuite sur le point centre
        # la boundingbox doit être dans le système 3857_pseudomercator
        _size = self._scale * 0.047179993
        #print("size = %s" % _size)
        bbox_3946_cc46 = mapnik.Envelope(mapnik.Coord(0, 0), mapnik.Coord(_size, _size))
        bbox_3946_cc46.center(self._xcenter_cc46, self._ycenter_cc46)
        transform = mapnik.ProjTransform(self._proj4_3946_cc46, self._proj4_3857_pseudomercator)
        bbox_3857_pseudomercator = transform.forward(bbox_3946_cc46)
        _map.zoom_to_box(bbox_3857_pseudomercator)
        # on va effectuer un zoom de façon a ce que l'image soit à la bonne échelle
        #_old_scale = _map.scale()
        _scale_denominator = _map.scale_denominator()
        _new_zoom = self._scale / _scale_denominator

        #print("old_scale = %s", _old_scale)
        #print("scale_denominator = %s", _map.scale_denominator())
        #print("new_zoom = %s", _new_zoom)
        _map.zoom(_new_zoom)
        #_new_scale = _map.scale()
        #print("new_scale = %s", _new_scale)
        #print("scale_denominator = %s", _map.scale_denominator())
        mapnik.render_to_file(
            _map,
            self._file,
            'png')


if __name__ == '__main__':

    #run_all(eval(x) for x in dir() if x.startswith("test_"))
    _mon_fgmapnik = Fgmapnik(Height=256, Width=256, XCenterCC46=1379230, YCenterCC46=5227400)
    _mon_fgmapnik.do_map_01(Scale=500, File='/home/fred/geodata/raster/test/000000_map01_000500.png')
    _mon_fgmapnik.do_map_01(Scale=1000, File='/home/fred/geodata/raster/test/000000_map01_001000.png')
    _mon_fgmapnik.do_map_01(Scale=2000, File='/home/fred/geodata/raster/test/000000_map01_002000.png')
    _mon_fgmapnik = Fgmapnik(XCenterCC46=1379337, YCenterCC46=5225674)
    _mon_fgmapnik.do_map_01(Scale=5000, File='/home/fred/geodata/raster/test/000001_map01_005000.png')
