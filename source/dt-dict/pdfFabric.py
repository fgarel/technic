#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
Script permetitant de générer, de fabriquer des plans au format PDF.

Les fichiers nécessaires au fonctionnement de ce script sont :
    - des fichiers template Qgis
    - une connexion aux bases de données telles qu'elles sont décrites
      dans le fichier qgis.

"""

#import csv
#import model
#import sqlalchemy.orm
import subprocess
#import re
import sys
#from qgis.core import (
#    QgsProject, QgsComposition, QgsApplication, QgsProviderRegistry)
from qgis.core import (
    QgsProject, QgsComposition, QgsApplication)
#from qgis.core import (
#    QgsProject, QgsComposition)
from qgis.gui import QgsMapCanvas, QgsLayerTreeMapCanvasBridge
from PyQt4.QtCore import QFileInfo
from PyQt4.QtXml import QDomDocument


class PdfFabric(object):

    u"""
    Classe d'objet dont l'objectif principal est la génération de pdf.

    En argument, on done un nom de fichier.

    """

    def __init__(self, path):
        u"""
        Méthode pour initialiser l'objet.

        Lorque l'objet est instancié, c'est cette méthode qui est executée.

        """
        # Repertoire de travail
        self.path = path
        # Initialisation des variables
        self.qgis_project_file = self.path + '/' + 'dt-dict.qgs'
        self.list_situation = {}
        self.list_case = {}
        self.list_all = {}
        self.list_format = ['A4', 'A3', 'A2', 'A1', 'A0']
        self.list_echelle = ['00200', '00500', '01000']
        self.list_format_echelle = []
        #self.file_case = ''
        #self.file_situation = ''
        #self.file_all = ''
        self.setFilename()
        #print self.list_situation
        self.gui_flag = True
        self.myQgisApplication = QgsApplication(sys.argv, self.gui_flag)
        self.myQgisApplication.initQgis()

    def make_pdf(self, template_filename, report_filename):
        u"""
        Méthode pour fabriquer un pdf.

        En argument, un fichier template de compostion,
                    et le debut du nom du fichier pdf en sortie.
        En sortie, un seul fichier pdf.

        """
        # http://qgis.org/api/classQgsMapCanvas.html
        # Map canvas is a class for displaying all GIS data types on a canvas.
        canvas = QgsMapCanvas()
        print "template_filename = " + template_filename
        # chargement du projet qgis
        # http://qgis.org/api/classQgsProject.html
        # Reads and writes project states.
        QgsProject.instance().read(QFileInfo(self.qgis_project_file))
        print "report_filename = " + report_filename
        # creation d'un pont entre la hierarchie des niveaux du canvas
        # et la hierarchie des niveaux du projet qgis
        # http://qgis.org/api/classQgsLayerTreeMapCanvasBridge.html
        # The QgsLayerTreeMapCanvasBridge class takes care of updates of
        # layer set for QgsMapCanvas from a layer tree.
        bridge = QgsLayerTreeMapCanvasBridge(
            QgsProject.instance().layerTreeRoot(), canvas)
        bridge.setCanvasLayers()

        template_file = file(template_filename)
        template_content = template_file.read()
        template_file.close()
        #
        document = QDomDocument()
        document.setContent(template_content)
        # http://qgis.org/api/classQgsComposition.html
        # Graphics scene for map printing.
        composition = QgsComposition(canvas.mapSettings())
        # chargement de l'objet 'map' défini dans le template de composition
        # You must set the id in the template
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
        composition.exportAsPDF(report_filename + '.pdf')
        QgsProject.instance().clear()

    def file2table(self, file_ini, table_fin):
        u"""
        Import d'un fichier dans une table.

        En argument, le nom du fichier à importer et le nom de la table
        dans la base de données qui recevra les informations.

        """
        #__file_ini = self.path_ini + '/' + file_ini
        #with open(__file_ini, 'r') as csvinputfile:
        #    csvreader = csv.reader(csvinputfile, delimiter=';', quotechar='"')
        #    #with open('data/dataout.txt', 'w') as csvoutputfile:
        #    #    csvwriter = csv.writer(csvoutputfile, delimiter='-', \
        #    #    lineterminator='\n')
        #    for row in csvreader:
        #        #print mon_point
        #        self.session.add(mon_point)
        #        self.session.commit()
        #        #self.cur.execute("select * from point;")
        #        #print(self.cur.fetchone())
        #        #csvwriter.writerow(row)
        pass

    def make_atlas_pdf(self, template_filename, report_filename):
        u"""
        Méthode pour fabriquer plusieurs pdf.

        En argument, un fichier template de compostion,
                    et le debut du nom du fichier pdf en sortie.
        En sortie, plusieurs fichiers pdf, correspondant aux
        différents folios.

        """
        # http://qgis.org/api/classQgsMapCanvas.html
        # Map canvas is a class for displaying all GIS data types on a canvas.
        canvas = QgsMapCanvas()
        # Load our project
        # http://qgis.org/api/classQgsProject.html
        # Reads and writes project states.
        QgsProject.instance().read(QFileInfo(self.qgis_project_file))
        # http://qgis.org/api/classQgsLayerTreeMapCanvasBridge.html
        # The QgsLayerTreeMapCanvasBridge class takes care of updates of
        # layer set for QgsMapCanvas from a layer tree.
        bridge = QgsLayerTreeMapCanvasBridge(
            QgsProject.instance().layerTreeRoot(), canvas)
        bridge.setCanvasLayers()

        template_file = file(template_filename)
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
        #print "coverageLayer() = ", \
        #        composition_atlas.coverageLayer().metadata()
        num_features = composition_atlas.numFeatures()
        #print "numFeatures() = ", composition_atlas.numFeatures()
        composition_atlas.setSingleFile(True)
        #print "singleFile() = ", composition_atlas.singleFile()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; \
        #        renderEnded() = ", composition_atlas.renderEnded()
        composition_atlas.firstFeature()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; \
        #        renderEnded() = ", composition_atlas.renderEnded()
        composition_atlas.beginRender()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; \
        #        renderEnded() = ", composition_atlas.renderEnded()
        report_filename_generic = report_filename + '_' + '*' + ".pdf"
        report_filename_final = report_filename + ".pdf"
        #print "report_filename_generic = ", report_filename_generic
        #print "report_filename_final = ", report_filename_final
        subprocess.call("rm " + report_filename_generic, shell=True)
        for i in range(0, num_features):
            #print "i = ", i
            #print "renderBegun()", composition_atlas.renderBegun(), " ; \
            #        renderEnded() = ", composition_atlas.renderEnded()
            composition_atlas.prepareForFeature(i, True)
            # le nom du pdf change à chaque folio
            report_filename_feature = report_filename + '_' + \
                '{0:0>3}'.format(i) + '.pdf'
            #print "i = " + i + " ; report_filename = " +\
            #      report_filename + "_" + i + ".pdf"
            composition.exportAsPDF(report_filename_feature)
            #print "i = ", i, \
            #      " ; report_filename_feature = ", report_filename_feature
        #composition_atlas.beginRender()
        #print "renderBegun()", composition_atlas.renderBegun(), " ; \
        #        renderEnded() = ", composition_atlas.renderEnded()
        #composition.refreshItems()
        #composition.exportAsPDF(self.report_filename + '_'+)
        subprocess.call(["pdftk " + report_filename_generic +
                         " cat output " + report_filename_final],
                        shell=True)
        subprocess.call("rm " + report_filename_generic, shell=True)
        QgsProject.instance().clear()

    def setFilename(self):
        u"""
        Methode pour attribuer un nom aux fichiers en sortie.

        Pour un format donné (A0, A1, ..., A4) et pour une echelle donnée
        (200, 500, 1000),
        il y a 3 fichiers qui peuvent être générés :
            situation : c'est un plan donnant une vue d'ensemble
            case : ce sont les différentes cases, folios, qui,
                   une fois assemblées,
                   couvrent l'emprise demandée dans la dt-dict
            all : c'est une compostion de deux plans précédents.

        """
        for fformat in self.list_format:
            for eechelle in self.list_echelle:
                self.list_format_echelle.append(fformat + '_' + eechelle)
        #print self.list_format_echelle
        #self.list_format_echelle = ['A0_01000', 'A0_00500', 'A0_00200',
        #                            'A1_01000', 'A1_00500', 'A1_00200',
        #                            'A2_01000', 'A2_00500', 'A2_00200',
        #                            'A3_01000', 'A3_00500', 'A3_00200',
        #                            'A4_01000', 'A4_00500', 'A4_00200']
        for fe in self.list_format_echelle:
            self.list_situation.update({'template_file_' + fe:
                                        fe + '_situation.qpt',
                                        'report_file_' + fe:
                                        fe + '_situation'})
            self.list_case.update({'template_file_' + fe:
                                   fe + '_case.qpt',
                                   'report_file_' + fe:
                                   fe + '_case'})
            self.list_all.update({'template_file_' + fe:
                                  fe + '.qpt',
                                  'report_file_' + fe:
                                  fe + ''})
        #print self.list_situation
        #print self.list_case
        #print self.list_all
        #self.qgis_template_list = \
        #    '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/' \
        #    'A1_00200_case.qpt'
        #self.qgis_report_list = \
        #    '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/' \
        #    'report.pdf'
        #self.file_case = ''
        #self.file_situation = ''
        #self.file_all = ''
        #print self.setFilename('A5_00999')[0]
        #self.file_case = format_echelle + '_case'
        #self.file_situation = format_echelle + '_situation'
        #self.file_all = format_echelle + ''
        #print format_echelle
        #return [self.file_case, self.file_situation, self.file_all]
        #pass


def main():
    u"""
    Programme principal.

    """
    # On instancie un objet de la classe pdfFabric
    # en argument, on passe le chemin du repertoire contenant
    # les infos initiales
    __myPdfFabric = PdfFabric('.')
    #print "qgis_project_file = " + __myPdfFabric.qgis_project_file
    #print __myPdfFabric.list_case
    #for fe in self.list_format_echelle:
    #    template_file =
    #__myPdfFabric.make_pdf('A3_00200.qpt', 'A3_00200')
    #__myPdfFabric.make_atlas_pdf('A3_00200_case.qpt', 'A3_00200_case')
    __myPdfFabric.make_atlas_pdf('A3_00200_case.qpt', 'A3_00200_case')
    #print "project_path = " + __myPdfFabric.project_path
    # On liste les impressions qui seront générées
    #liste = __myPdfFabric.setFilename('A1_00200')
    #print liste[0]


    #__myPdfFabric.dropAndCreateTable()
    #__myPdfFabric.file2table('point_profondeur.csv', 'point_profondeur')
    #__myPdfFabric.file2table('ep_point_eclairage.csv', 'ep_point_eclairage')
    #__myPdfFabric.addPoint()


if __name__ == '__main__':
    main()
