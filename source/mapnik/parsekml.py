#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
tutorial5.py : script pour la génération d'image.

Une classe d'objet Fgmapnik inclue plusieurs méthodes
facilitant la génération automatique de cartes.

"""

import os
from lxml import etree
from pykml import parser
#import pykml


SITE_FILE = 'PatrimoineVLR.kml'




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
        self._site_file = SITE_FILE


    def parsekml(self):
        kml_file = os.path.join( \
            './', \
            self._site_file)

        with open(kml_file) as f:
            doc = parser.parse(f)
            root = doc.getroot()
            print root.Document.name
            #print etree.tostring(doc, pretty_print=True)
            #print etree.tostring(doc, pretty_print=False)
            #print root.Document.Folder.Placemark
            for element in root.Document.Folder.iter("*"):
                print root.Document.Folder.Placemark.Point.coordinates
            for event, element in etree.iterparse(etree.tostring(doc)):
                print("%s, %4s, %s" % (event, element.tag, element.text))
 
 
if __name__ == '__main__':

    # Instanciation d'un objet (site avec des coordonnées)

    _mon_fgmapnik = Fgmapnik(Height=256,
                             Width=256,
                             XCenterCC46=1379230,
                             YCenterCC46=5227400)
    
    # Creation des différentes cartes pour cet objet
    _mon_fgmapnik.parsekml()
