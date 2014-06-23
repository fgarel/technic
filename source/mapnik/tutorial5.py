#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
tutorial5.py : script pour la génération d'image.

Une classe d'objet Fgmapnik inclue plusieurs méthodes
facilitant la génération automatique de cartes.

"""

import os
import mapnik

# config at home
PG_HOST_CARTO = '192.168.0.21'  # osm
PG_HOST_VLR = '192.168.0.21'    # cadastre
PG_PORT_VLR = 5432
PG_DBNAME_VLR = 'gis'
PG_USER_VLR = 'contrib'
PG_PASSWORD_VLR = 'alambic'
SITE_FILE = 'PatrimoineVLR.kml'
MAPFILE = '/home/fred/src/mapnik-style/osm.xml'
ORTHO = 'vue_2013/ortho_2013_lr_cc46.jp2'
ORTHO_TMP = '/home/fred/geodata/raster/test/mamaison2.tif'
OUTPUT_FILE = '/home/fred/geodata/raster/test/000000_map01_001000.png'

# config at work
PG_HOST_CARTO = '10.2.10.38'    # osm      = debian
PG_HOST_VLR = '10.254.140.139'  # cadastre = dsibdd09
PG_PORT_VLR = 5435
PG_DBNAME_VLR = 'base_l93'
PG_USER_VLR = 'contrib'
PG_PASSWORD_VLR = 'alambic'
SITE_FILE = 'PatrimoineVLR.kml'
MAPFILE = '/home/fred/src/mapnik-style/osm.xml'
ORTHO = 'vue_2013/ortho_2013_lr_cc46.jp2'
ORTHO_TMP = '/home/fred/geodata/raster/test/mamaison2.tif'
OUTPUT_FILE = '/home/fred/geodata/raster/test/000000_map01_001000.png'


class Fgmapnik(object):

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
        self._pg_user_vlr = PG_USER_VLR
        self._pg_password_vlr = PG_PASSWORD_VLR
        self._site_file = SITE_FILE
        self._mapfile = MAPFILE
        self._ortho = ORTHO
        self._ortho_tmp = ORTHO_TMP
        self._proj4_3946_cc46 = mapnik.Projection('+proj=lcc +lat_1=45.25 +lat_2=46.75 +lat_0=46 +lon_0=3 +x_0=1700000 +y_0=5200000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs')
        self._proj4_2154_l93 = mapnik.Projection('+proj=lcc +lat_1=49 +lat_2=44 +lat_0=46.5 +lon_0=3 +x_0=700000 +y_0=6600000 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs')
        self._proj4_4326_wgs84 = mapnik.Projection('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs')
        self._proj4_3857_pseudomercator = mapnik.Projection('+proj=merc +a=6378137 +b=6378137 +lat_ts=0.0 +lon_0=0.0 +x_0=0.0 +y_0=0 +k=1.0 +units=m +nadgrids=@null +wktext  +no_defs')
        self._height = Height
        self._width = Width
        self._xcenter_cc46 = XCenterCC46
        self._ycenter_cc46 = YCenterCC46
        self._scale = 1000
        self._output_file = OUTPUT_FILE
        self._extract_image(self._height,
                            self._width,
                            self._xcenter_cc46,
                            self._ycenter_cc46,
                            self._ortho,
                            self._ortho_tmp)
        # initialisation de la carte 01 (plan de situation = base osm)
        self._map_01 = mapnik.Map(
            self._height,
            self._width,
            self._proj4_3857_pseudomercator.params())
        # initialisation de la carte 02 (vue aerienne = base ortho)
        self._map_02 = mapnik.Map(
            self._height,
            self._width,
            self._proj4_3857_pseudomercator.params())
        # initialisation de la carte 03 (ortho + cadastre)
        self._map_03 = mapnik.Map(
            self._height,
            self._width,
            self._proj4_3857_pseudomercator.params())
        # initialisation de la carte 04 (cadastre seul)
        self._map_04 = mapnik.Map(
            self._height,
            self._width,
            self._proj4_3857_pseudomercator.params())
        # initialisation de la carte 05 (plan de situation = base osm)
        self._map_05 = mapnik.Map(
            self._height,
            self._width,
            self._proj4_3857_pseudomercator.params())

        # Initialisation du layer osm, avec sa projection
        self._layer_osm = mapnik.Layer(
            'osm',
            self._proj4_3857_pseudomercator.params())
        # Initialisation du layer ortho, avec sa projection
        self._layer_ortho = mapnik.Layer(
            'ortho',
            self._proj4_3946_cc46.params())
        # Initialisation du layer cadastre_vlr, avec sa projection
        self._layer_cadastre_vlr = mapnik.Layer(
            'cadastre_vlr',
            self._proj4_2154_l93.params())
        # Initialisation du layer cadastre_carto, avec sa projection
        self._layer_cadastre_carto = mapnik.Layer(
            'cadastre_carto',
            self._proj4_3946_cc46.params())
        # Initialisation du layer site, avec sa projection
        self._layer_site = mapnik.Layer(
            'site',
            #self._proj4_3857_pseudomercator.params())
            self._proj4_4326_wgs84.params())


    def _extract_image(self,
                      Height,
                      Width,
                      XCenterCC46,
                      YCenterCC46,
                      inputFilename,
                      outputFilename):
        u"""
        Extraction d'une fenetre (partie d'une image).
        
        # l'ortho de la rochelle est trop grande :
        # il faut en faire un extrait en utilisant la commande suivante :
        # gdal_translate -projwin 1378100 5226400 1378200 5226300 \
        #                ortho_2013_lr_cc46.jp2 \
        #                ~/geodata/raster/test/mamaison2.tif
        # ce tips a ete vu ici : https://trac.osgeo.org/gdal/wiki/FAQRaster


        """
        xMin = XCenterCC46 - Width / 2
        yMin = YCenterCC46 - Height / 2
        xMax = XCenterCC46 + Width / 2
        yMax = YCenterCC46 + Height / 2
        #cmd = "-projwin 1378730 5227900 1379730 5226900"  # just for example!
        cmd = "gdal_translate"
        opt = "-projwin " + str(xMin) + " " + str(yMax) + " " + str(xMax) + " " + str(yMin)
        #src = "vue_2013/ortho_2013_lr_cc46.jp2"
        #dst = "~/geodata/raster/test/mamaison2.tif"
        src = inputFilename
        dst = outputFilename
        #print("%s %s %s %s" % (cmd, opt, src, dst))
        os.system(cmd + " " + opt + " " + src + " " + dst + "1> /dev/null")


    def do_style_ortho(self):
        u"""
        Style est un ensemble de règles pour dessiner une couche.

        Un style est normalement composé de plusieurs règles.

        """
        _style = mapnik.Style()
        # creation d'une règle
        _rule = mapnik.Rule()
        _rule.symbols.append(mapnik.RasterSymbolizer())
        # on ajoute la règle au style
        _style.rules.append(_rule)

        return _style


    def do_style_cadastre(self):
        u"""
        Style est un ensemble de règles pour dessiner une couche.

        Un style est normalement composé de plusieurs règles.

        """
        _style = mapnik.Style()
        # creation d'une règle
        _rule = mapnik.Rule()
 
        _polygon_symbolizer = mapnik.PolygonSymbolizer(mapnik.Color('#EAEDAA'))
        _polygon_symbolizer.fill_opacity = 0.5
        _line_symbolizer = mapnik.LineSymbolizer(
            mapnik.Color('rgb(50%, 50%, 50%)'), 0.1)
        _line_symbolizer = mapnik.LineSymbolizer(
            mapnik.Color('rgb(80%, 80%, 80%)'), 0.5)
        #_line_symbolizer.stroke = 2
        #_point_symbolizer = mapnik.PointSymbolizer()
        #_point_symbolizer.width = 15
        #_point_symbolizer.height = 15

        _rule.symbols.append(_polygon_symbolizer)
        _rule.symbols.append(_line_symbolizer)
        #_rule.symbols.append(_point_symbolizer)
        # on ajoute la règle au style
        _style.rules.append(_rule)

        return _style


    def do_style_site(self):
        u"""
        Style est un ensemble de règles pour dessiner une couche.

        Un style est normalement composé de plusieurs règles.

        """
        _style = mapnik.Style()
        # creation d'une règle
        _rule = mapnik.Rule()
 
        _point_symbolizer = mapnik.PointSymbolizer()
        _point_symbolizer.width = 15
        _point_symbolizer.height = 15

        _rule.symbols.append(_point_symbolizer)
        # on ajoute la règle au style
        _style.rules.append(_rule)

        return _style


    def init_layer_ortho(self, mymap):
        u"""
        Initialisation du layer ortho.

        datasource_ortho = mapnik.Gdal
        
        """

        # L'initialisation du layer, avec sa projection, se fait dans
        # la fonction __init__
        #
        # datasource de type gdal, avec le nom de fichier
        self._datasource_ortho = mapnik.Gdal(
            file=self._ortho_tmp)
        self._layer_ortho.datasource = self._datasource_ortho
        # le syle est ajouté à la carte
        mymap.append_style('style_ortho', self.do_style_ortho())
        # et il est relié au layer
        self._layer_ortho.styles.append('style_ortho')

    def init_layer_cadastre_vlr(self, mymap):
        u"""
        Initialisation du layer cadastre_vlr.

        datasource_cadastre_vlr = mapnik.Postgis
        
        """

        # L'initialisation du layer, avec sa projection, se fait dans
        # la fonction __init__
        #
        # datasource de type postgis, avec la chaine de connection
        _params_connection_cadastre_vlr = dict(host=self._pg_host_vlr,
                                               port=self._pg_port_vlr,
                                               dbname=self._pg_dbname_vlr,
                                               table='cad_parcelle',
                                               srid=2154,
                                               user=self._pg_user_vlr,
                                               password=self._pg_password_vlr)
        self._datasource_cadastre_vlr = mapnik.PostGIS(**_params_connection_cadastre_vlr)
        self._layer_cadastre_vlr.datasource = self._datasource_cadastre_vlr

        # le syle est ajouté à la carte
        mymap.append_style('style_cadastre_vlr', self.do_style_cadastre())
        # et il est relié au layer
        self._layer_cadastre_vlr.styles.append('style_cadastre_vlr')


    def init_layer_site(self, mymap):
        u"""
        Initialisation du layer site.
        
        datasource_site = mapnik.Ogr

        """

        # L'initialisation du layer, avec sa projection, se fait dans
        # la fonction __init__
        #
        # datasource de type Ogr, avec la chaine de connection
        self._datasource_site = mapnik.Ogr(file=self._site_file,
                                           layer="Ponctuel")
        self._layer_site.datasource = self._datasource_site

        # le syle est ajouté à la carte
        mymap.append_style('style_site', self.do_style_site())
        # et il est relié au layer
        self._layer_site.styles.append('style_site')


    def pan_map(self, mymap):
        u"""
        Deplacement et mise à l'echelle de la carte.

        """
        # Se placer au bon endroit, à la bonne échelle
        # on definit une fenetre de 1000 par 1000, que l'on centre ensuite sur le point centre
        # la boundingbox doit être dans le système 3857_pseudomercator
        _size = self._scale * 0.047179993
        #print("size = %s" % _size)
        bbox_3946_cc46 = mapnik.Envelope(mapnik.Coord(0, 0), mapnik.Coord(_size, _size))
        bbox_3946_cc46.center(self._xcenter_cc46, self._ycenter_cc46)
        transform = mapnik.ProjTransform(self._proj4_3946_cc46, self._proj4_3857_pseudomercator)
        bbox_3857_pseudomercator = transform.forward(bbox_3946_cc46)
        mymap.zoom_to_box(bbox_3857_pseudomercator)
        # on va effectuer un zoom de façon a ce que l'image soit à la bonne échelle
        #_old_scale = _map.scale()
        _scale_denominator = mymap.scale_denominator()
        _new_zoom = self._scale / _scale_denominator

        #print("old_scale = %s", _old_scale)
        #print("scale_denominator = %s", _map.scale_denominator())
        #print("new_zoom = %s", _new_zoom)
        mymap.zoom(_new_zoom)


    def do_map_01(self, *args, **kwargs):
        u"""
        Dessin de la carte 01.

        La carte 1 est une carte basé sur le fond de plan
        issu d'Open Street Map
        
        La carte sera composée :
            - _layer_001 = osm (système pseudomercator)
            - _layer_002 = site (système pseuomercator)
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
                self._output_file = value

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
        ###_map = mapnik.Map(self._height,
        ###                  self._width,
        ###                  self._proj4_3857_pseudomercator.params())
        #_map.background = mapnik.Color('steelblue')

        # couche osm
        #print("PG_HOST_CARTO = %s" % self._pg_host_carto)
        
        # la map_01 est basée sur osm :
        # on charge les données osm en utilisant un mapfile
        ###mapfile = self._mapfile
        ###mapnik.load_map(_map, mapfile)
        mapnik.load_map(self._map_01, self._mapfile)

        #_layer_010 = mapnik.Layer('osm', self._proj4_3857_pseudomercator)
        #_layer_010.datasource = _datasource_010

        ####_map.layers.append(_layer_001)
        #_map.layers.append(_layer_002)
        #_map.layers.append(_layer_010)
        #_map.layers.append(_layer_011)
        #_map.layers.append(_layer_002)

        #_map.zoom_to_box(_layer_002.envelope())

        # on se place au bon endroit, à la bonne échelle
        self.pan_map(self._map_01)
        
        mapnik.render_to_file(
            self._map_01,
            self._output_file,
            'png')
        print("display %s" % self._output_file)
        
            
    def do_map_02(self, *args, **kwargs):
        u"""
        Dessin de la carte 02.

        La carte 2 correspond à la vue aerienne

        La carte sera composée :
            - _layer_001 = ortho (système cc46)
            - _layer_002 = site (système pseudomercator)
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
                self._output_file = value

        # la map_02 est basée sur l'ortho :
        # on utilise une fonction que va initialiser le layer ortho
        self.init_layer_ortho(self._map_02)
        # le layer est ajouté à la carte
        self._map_02.layers.append(self._layer_ortho)
        # on se place au bon endroit, à la bonne échelle
        self.pan_map(self._map_02)
        
        mapnik.render_to_file(
            self._map_02,
            self._output_file,
            'png')
        print("display %s" % self._output_file)


    def do_map_03(self, *args, **kwargs):
        u"""
        Dessin de la carte 03.

        La carte 3 correspond à la vue aerienne + cadastre

        La carte sera composée :
            - _layer_001 = ortho (système cc46)
            - _layer_002 = cad_parcelle (système pseudomercator)
            - _layer_003 = site (système pseudomercator)

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
                self._output_file = value

        # la map_03 est basée sur l'ortho :
        # on utilise une fonction que va initialiser le layer ortho
        self.init_layer_ortho(self._map_03)
        # on utilise une fonction que va initialiser le layer cadastre_vlr
        self.init_layer_cadastre_vlr(self._map_03)
        # les layers sont ajoutés à la carte
        self._map_03.layers.append(self._layer_ortho)
        self._map_03.layers.append(self._layer_cadastre_vlr)
        # on se place au bon endroit, à la bonne échelle
        self.pan_map(self._map_03)
        
        mapnik.render_to_file(
            self._map_03,
            self._output_file,
            'png')
        print("display %s" % self._output_file)


    def do_map_04(self, *args, **kwargs):
        u"""
        Dessin de la carte 04.

        La carte 4 correspond au cadastre seul

        La carte sera composée :
            - _layer_001 = cad_parcelle (système pseudomercator)
            - _layer_002 = site (système pseudomercator)

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
                self._output_file = value

        # la map_04 est basée sur le cadastre :
        
        self._map_04.background = mapnik.Color('white')
        
        # on utilise une fonction que va initialiser le layer cadastre_vlr
        self.init_layer_cadastre_vlr(self._map_04)
        # on utilise une fonction que va initialiser le layer site
        self.init_layer_site(self._map_04)
        # le layer est ajouté à la carte
        self._map_04.layers.append(self._layer_cadastre_vlr)
        self._map_04.layers.append(self._layer_site)
        # on se place au bon endroit, à la bonne échelle
        self.pan_map(self._map_04)
        self._map_04.zoom_to_box(self._layer_site.envelope())
        mapnik.render_to_file(
            self._map_04,
            self._output_file,
            'png')
        print("self._layer_cadastre_vlr.srs = %s" % self._layer_cadastre_vlr.srs)
        print("self._layer_site.srs = %s" % self._layer_site.srs)
        print("self._map_04.srs = %s" % self._map_04.srs)
        print("display %s" % self._output_file)


    def do_map_05(self, *args, **kwargs):
        u"""
        Dessin de la carte 05.

        La carte 5 est une carte basé sur le fond de plan
        issu d'Open Street Map
        
        La carte sera composée :
            - _layer_001 = osm (système pseudomercator)
            - _layer_002 = site (système pseuomercator)

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
                self._output_file = value

        self._map_05.background = mapnik.Color('white')
        
        # la map_05 est basée sur OSM :
        # on charge les données osm en utilisant un mapfile
        mapnik.load_map(self._map_05, self._mapfile)        

        # on utilise une fonction que va initialiser le layer cadastre_vlr
        #self.init_layer_cadastre_vlr(self._map_05)
        # on utilise une fonction que va initialiser le layer site
        self.init_layer_site(self._map_05)
        # le layer est ajouté à la carte
        #self._map_05.layers.append(self._layer_cadastre_vlr)
        self._map_05.layers.append(self._layer_site)
        # on se place au bon endroit, à la bonne échelle
        self.pan_map(self._map_05)
        ##self._map_05.zoom_to_box(self._layer_site.envelope())
        ##self._map_05.zoom_to_box(self._layer_site.envelope())
        mapnik.render_to_file(
            self._map_05,
            self._output_file,
            'png')
        #print("self._layer_cadastre_vlr.srs = %s" % self._layer_cadastre_vlr.srs)
        print("self._layer_site.srs = %s" % self._layer_site.srs)
        print("self._map_05.srs = %s" % self._map_05.srs)
        print("display %s" % self._output_file)

    def do_map_99(self, *args, **kwargs):
        u"""
        Dessin de toutes les cartes.



        et voila.

        """
        pass


if __name__ == '__main__':

    # Instanciation d'un objet (site avec des coordonnées)

    _mon_fgmapnik = Fgmapnik(Height=256,
                             Width=256,
                             XCenterCC46=1379230,
                             YCenterCC46=5227400)
    
    # Creation des différentes cartes pour cet objet
    _mon_fgmapnik.do_map_01(
        Scale=500,
        File='/home/fred/geodata/raster/test/000000_map01_000500.png')
    _mon_fgmapnik.do_map_02(
        Scale=1000,
        File='/home/fred/geodata/raster/test/000000_map02_001000.png')
    _mon_fgmapnik.do_map_01(
        Scale=2000,
        File='/home/fred/geodata/raster/test/000000_map01_002000.png')
    _mon_fgmapnik.do_map_01(
        Scale=10000,
        File='/home/fred/geodata/raster/test/000000_map01_010000.png')

    # Instanciation d'un second objet (site avec des coordonnées)

    _mon_fgmapnik = Fgmapnik(XCenterCC46=1379337,
                             YCenterCC46=5225674)

    _mon_fgmapnik.do_map_01(
        Scale=5000,
        File='/home/fred/geodata/raster/test/000001_map01_005000.png')
    #_mon_fgmapnik.do_map_02(
    #    Scale=5000,
    #    File='/home/fred/geodata/raster/test/000001_map02_005000.png')
    #_mon_fgmapnik.do_map_03(
    #    Scale=5000,
    #    File='/home/fred/geodata/raster/test/000001_map03_005000.png')
    #_mon_fgmapnik.do_map_05(
    #    Scale=20000,
    #    File='/home/fred/geodata/raster/test/000001_map05_020000.png')
