#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Ce petit script permet de générer, c'est à dire de fabriquer des
plans au format PDF.
les fichiers nécessaires au fonctionnement de ce script sont :
    - des fichiers template Qgis
"""

#import csv
#import model
#import sqlalchemy.orm
import sys
#from qgis.core import (
#    QgsProject, QgsComposition, QgsApplication, QgsProviderRegistry)
from qgis.core import (
    QgsProject, QgsComposition, QgsApplication)
from qgis.gui import QgsMapCanvas, QgsLayerTreeMapCanvasBridge
from PyQt4.QtCore import QFileInfo
from PyQt4.QtXml import QDomDocument



class PdfFabric():
    """
    Cette classe correspont à la cible
    en argument, on done un nom de fichier
    """
    def __init__(self, path_ini):
        """
        La fonction __call__ d'une classe est apellée
        lorque la classe est appellée....
        """
        # 1.   Paramètres pour la lecture du fichier csv
        self.path_ini = path_ini
        # Initialisation des variables
        self.project_path = \
            '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/dt-dict.qgs'
        self.template_path = \
            '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/A1_00200_case.qpt'
        self.report_path = \
            '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/report.pdf'

        pass

    def make_pdf():
        '''
        fonction pour fabriquer un fichier pdf à partir d'un fichier
        template de compostion
        '''
        # http://qgis.org/api/classQgsMapCanvas.html
        # Map canvas is a class for displaying all GIS data types on a canvas.
        canvas = QgsMapCanvas()
        # Load our project
        # http://qgis.org/api/classQgsProject.html
        # Reads and writes project states.
        QgsProject.instance().read(QFileInfo(project_path))
        # http://qgis.org/api/classQgsLayerTreeMapCanvasBridge.html
        # The QgsLayerTreeMapCanvasBridge class takes care of updates of layer set for QgsMapCanvas from a layer tree.
        bridge = QgsLayerTreeMapCanvasBridge(
            QgsProject.instance().layerTreeRoot(), canvas)
        bridge.setCanvasLayers()

        template_file = file(template_path)
        template_content = template_file.read()
        template_file.close()
        #
        document = QDomDocument()
        document.setContent(template_content)
        # http://qgis.org/api/classQgsComposition.html
        # Graphics scene for map printing.
        composition = QgsComposition(canvas.mapSettings())
        # You can use this to replace any string like this [key]
        # in the template with a new value. e.g. to replace
        # [date] pass a map like this {'date': '1 Jan 2012'}
        substitution_map = {
            'DATE_TIME_START': 'foo',
            'DATE_TIME_END': 'bar'}
        composition.loadFromTemplate(document, substitution_map)
        # You must set the id in the template
        # chargement de l'objet 'map' défini dans le template de composition
        map_item = composition.getComposerItemById('map')
        map_item.setMapCanvas(canvas)
        map_item.zoomToExtent(canvas.extent())
        print "atlasMode = ", composition.atlasMode()
        #composition.setAtlasMode(QgsComposition.AtlasMode.PreviewAtlas)
        #composition.setAtlasMode(QgsComposition.AtlasMode['PreviewAtlas'])
        #print "QgsComposition ", type(QgsComposition.AtlasMode)
        print "atlasMode = ", composition.atlasMode()
        #composition_atlas = composition.atlasComposition()
        # You must set the id in the template
        #legend_item = composition.getComposerItemById('legend')
        #legend_item.updateLegend()
        composition.refreshItems()
        composition.exportAsPDF(report_path)
        QgsProject.instance().clear()


    def dropAndCreateTable(self):
        """
        Suppression et creation des tables
        """
        model.drop_all()
        model.geoalchemy.GeometryDDL(model.Ep_Point_Eclairage.__table__)
        model.geoalchemy.GeometryDDL(model.Point_Profondeur.__table__)

        model.create_all()

    def addPoint(self):
        """
        methode pour ajouter un point dans la table
        """
        mon_point = model.Point_Profondeur(id=2,X=654654651.35,Y=3335131.63,Z=2.25)
        #print mon_point
        #self.
        pass

    def file2table(self, file_ini, table_fin):
        """
        Import d'un fichier dans une table
        """
        __file_ini = self.path_ini + '/' +file_ini
        with open(__file_ini, 'r') as csvinputfile:
            csvreader = csv.reader(csvinputfile, delimiter=';', quotechar='"')
            #with open('data/dataout.txt', 'w') as csvoutputfile:
            #    csvwriter = csv.writer(csvoutputfile, delimiter='-',lineterminator='\n')
            for row in csvreader:


                #print mon_point
                self.session.add(mon_point)
                self.session.commit()
                #self.cur.execute("select * from point;")
                #print(self.cur.fetchone())
                #csvwriter.writerow(row)
                pass
                
    def make_atlas_pdf():
        '''
        fonction pour fabriquer un fichier pdf à partir d'un fichier
        template de compostion
        '''
        # http://qgis.org/api/classQgsMapCanvas.html
        # Map canvas is a class for displaying all GIS data types on a canvas.
        canvas = QgsMapCanvas()
        # Load our project
        # http://qgis.org/api/classQgsProject.html
        # Reads and writes project states.
        QgsProject.instance().read(QFileInfo(project_path))
        # http://qgis.org/api/classQgsLayerTreeMapCanvasBridge.html
        # The QgsLayerTreeMapCanvasBridge class takes care of updates of layer set for QgsMapCanvas from a layer tree.
        bridge = QgsLayerTreeMapCanvasBridge(
            QgsProject.instance().layerTreeRoot(), canvas)
        bridge.setCanvasLayers()

        template_file = file(template_path)
        template_content = template_file.read()
        template_file.close()
        #
        document = QDomDocument()
        document.setContent(template_content)
        # http://qgis.org/api/classQgsComposition.html
        # Graphics scene for map printing.
        composition = QgsComposition(canvas.mapSettings())
        # You can use this to replace any string like this [key]
        # in the template with a new value. e.g. to replace
        # [date] pass a map like this {'date': '1 Jan 2012'}
        substitution_map = {
            'DATE_TIME_START': 'foo',
            'DATE_TIME_END': 'bar'}
        composition.loadFromTemplate(document, substitution_map)
        # You must set the id in the template
        # chargement de l'objet 'map' défini dans le template de composition
        ##map_item = composition.getComposerItemById('map')
        ##map_item.setMapCanvas(canvas)
        ##map_item.zoomToExtent(canvas.extent())
        #print "atlasMode = ", composition.atlasMode()
        #composition.setAtlasMode(QgsComposition.AtlasMode.PreviewAtlas)
        # on passe en mode PreviewAtlas
        composition.setAtlasMode(1)
        composition.setAtlasMode(2)
        #print "QgsComposition ", type(QgsComposition.AtlasMode)
        #print "atlasMode = ", composition.atlasMode()
        composition_atlas = composition.atlasComposition()
        # You must set the id in the template
        #legend_item = composition.getComposerItemById('legend')
        #legend_item.updateLegend()
        #print "coverageLayer() = ", composition_atlas.coverageLayer()
        #print "coverageLayer() = ", composition_atlas.coverageLayer().metadata()
        num_features=composition_atlas.numFeatures()
        print "numFeatures() = ", composition_atlas.numFeatures()
        composition_atlas.setSingleFile(True)
        print "singleFile() = ", composition_atlas.singleFile()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; renderEnded() = ", composition_atlas.renderEnded()
        composition_atlas.firstFeature()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; renderEnded() = ", composition_atlas.renderEnded()
        composition_atlas.beginRender()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; renderEnded() = ", composition_atlas.renderEnded()
        for i in range (0, num_features):
            print "i = ", i
            #print "renderBegun()", composition_atlas.renderBegun(), " ; renderEnded() = ", composition_atlas.renderEnded()
            composition_atlas.prepareForFeature(i, True)
            composition.exportAsPDF(report_path)
        #composition_atlas.beginRender()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; renderEnded() = ", composition_atlas.renderEnded()
        #composition.refreshItems()
        composition.exportAsPDF(report_path)
        QgsProject.instance().clear()

    def setFilename(self, format_echelle):
        """
        methode pour attribuer un nom aux fichiers en sortie
        """
        case_file = format_echelle + '_case'
        print format_echelle
        return [case_file, 0]
        #pass


def main():
    """
    Programme principal
    """
    # On instancie un objet de la classe pdfFabric
    #__myPdfFabric = PdfFabric('data/e030717b')
    __myPdfFabric = PdfFabric('data/Export/e031517b')
    # On liste les impressions qui seront générées
    liste = __myPdfFabric.setFilename('A1_00200')
    print liste[0]


    #__myPdfFabric.dropAndCreateTable()
    #__myPdfFabric.file2table('point_profondeur.csv', 'point_profondeur')
    #__myPdfFabric.file2table('ep_point_eclairage.csv', 'ep_point_eclairage')
    #__myPdfFabric.addPoint()


if __name__ == '__main__':
    main()
