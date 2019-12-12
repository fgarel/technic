#!/usr/bin/env python3
# -*- coding: utf-8 -*-

u"""QGIS Unit tests for QgsLayout

A simple demonstration of to generate a PDF using a QGIS project
and a QGIS layout template.

Inspiration originale, en version 2, mais adaptée à la version 3
http://kartoza.com/how-to-create-a-qgis-pdf-report-with-a-few-lines-of-python/

Inspiration suivante, en version 3, mais adaptée à linux
https://github.com/carey136/Standalone-Export-Atlas-QGIS3
https://github.com/carey136/Standalone-Export-Atlas-QGIS3/blob/master/AtlasExport.py

"""


__author__ = "Frédéric Garel"
__date__ = "02/04/2019"
__copyright__ = "Copyright 2019"
# This will get replaced with a git SHA1 when you do a git archive
__revision__ = "$Format:%H$"

# import qgis  # NOQA

# import os
import subprocess

# from os.path import expanduser
import datetime  # cf :

# from qgis.testing import start_app
# from qgis.core import (QgsApplication,
#                        QgsLayout,
#                        QgsLayoutAtlas,
#                        QgsLayoutExporter,
#                        QgsProject,
#                        QgsPrintLayout)

from qgis.core import QgsApplication, QgsLayoutExporter, QgsProject


class Imprimeur(object):
    u"""
    Classe d'objet dont l'objectif est de fournir un Imprimeur
    c'est à dire, un objet capable de generer des cartes, des manipulations
    """

    def __init__(self, projetQgis):
        u"""
        Méthode pour initialiser l'objet.

        Lorsque l'objet est instancié, c'est cette méthode qui est executée.

        """
        # print(
        #     "Current date and time : {}".format(
        #         datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        #     )
        # )
        self.projetQgis = projetQgis
        # print("{}".format(self.projetQgis))

        # #### Initialising QGIS in back end (utilising users temp folder) ####
        # Il exsite 2 facons de lancer qgis en mode autonome :
        # - 1ère methode de lancement (mode production)
        #   create a reference to the QgsApplication, setting the
        #   second argument for GUI
        #     False = disables the GUI = standalone scripts
        #     True = enable the GUI = custom application
        self.gui_flag = False
        self.app = QgsApplication([], self.gui_flag)
        #   Make sure QGIS_PREFIX_PATH is set in your env if needed!
        self.app.initQgis()

        # - 2de methode de lancement (mode debugage)
        #   start_app()

        # ### Defining map path and contents ####

        self.project = QgsProject.instance()
        self.manager = self.project.layoutManager()
        # print('avant chargement myProject = {}'.format(self.projetQgis))
        print(
            "Avant chargement du projet Qgis : {}".format(
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            )
        )
        self.project.read(self.projetQgis)
        # print('après chargement myProject = {}'.format(self.projetQgis))
        print(
            "Après chargement du projet Qgis : {}".format(
                datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
            )
        )

    def make_simple_pdf(self, dictionnaire_parametres):
        u"""
        Méthode pour imprimer une simple page.

        Impression d'une simple page.

        """

        self.dictionnaire_parametres = dictionnaire_parametres
        # Le gestionnaire de mise en page est utilisé pour ouvrir notre layout
        # layout_name = 'A3_Paysage'
        # layoutManager = projectInstance.layoutManager()
        # layout = layoutManager.layoutByName(layoutName) #Layout name
        self.myLayout = self.manager.layoutByName(
            self.dictionnaire_parametres["layoutName"]
        )
        # print(layout.items()[1])

        # layoutExporter = QgsLayoutExporter(layout)
        self.myLayoutExporter = QgsLayoutExporter(self.myLayout)
        settings = QgsLayoutExporter.PdfExportSettings()
        settings.dpi = 80
        settings.rasterizeWholeImage = False
        settings.forceVectorOutput = False
        # settings.exportMetadata = True
        # print(settings.dpi)
        resultpdf_path = (
            "/home/fred/Documents/report/source/QGisEnCoulisse/data/report.pdf"
        )
        resultpdf_path = "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/tadebugnumero/report.pdf"
        # layoutExporter.exportToPdf(resultpdf_path, settings)
        self.myLayoutExporter.exportToPdf(resultpdf_path, settings)

        # projectInstance.clear()
        self.project.clear()

    def make_atlas_pdf(self, dictionnaire_parametres):
        u"""
        Méthode pour imprimer un atlas.

        Impression d'un Atlas.

        """
        self.dictionnaire_parametres = dictionnaire_parametres

        # Le gestionnaire de mise en page est utilisé pour ouvrir notre layout
        self.myLayout = self.manager.layoutByName(
            self.dictionnaire_parametres["layoutName"]
        )
        # print('myLayout.name() = {}'.format(self.myLayout.name()))
        # on charge un objet de type QgsLayoutAtlas
        self.myLayoutAtlas = self.myLayout.atlas()
        self.myLayoutAtlasLayout = self.myLayoutAtlas.layout()

        # #### atlas query ####
        # QgsLayoutAtlas = https://qgis.org/api/classQgsLayoutAtlas.html
        if self.dictionnaire_parametres["coverageLayer"] in locals():
            self.myLayoutAtlas.setCoverageLayer(
                self.project.mapLayersByName(
                    self.dictionnaire_parametres["coverageLayer"]
                )
            )
        # print(
        #     "coverageLayer = {}".format(
        #         self.dictionnaire_parametres["coverageLayer"])
        # )
        # self.myPrintLayoutAtlas.setEnabled(True)

        # #### filter ####
        if self.dictionnaire_parametres["filterExpression"] != "":
            self.myLayoutAtlas.setFilterFeatures(True)
            # print("filterExpression = {}".format(
            #     self.myLayoutAtlas.filterExpression()))
            self.myLayoutAtlas.setFilterExpression(
                self.dictionnaire_parametres["filterExpression"]
            )
            # print('filterExpression = {}'.format(
            #     self.dictionnaire_parametres['filterExpression']))
            print("filterExpression = {}".format(self.myLayoutAtlas.filterExpression()))
        # print('filterExpression = {}'.format(
        #     self.myPrintLayoutAtlas.filterExpression()))

        # #### filename ####
        if self.dictionnaire_parametres["filenameExpression"] != "":
            # print('filenameExpression = {}'.format(
            #     self.myLayoutAtlas.filenameExpression()))
            self.myLayoutAtlas.setFilenameExpression(
                self.dictionnaire_parametres["filenameExpression"]
            )
            # print('filenameExpression = {}'.format(
            #     self.dictionnaire_parametres['filenameExpression']))
            print(
                "filenameExpression = {}".format(
                    self.myLayoutAtlas.filenameExpression()
                )
            )
        # print('filenameExpression = {}'.format(
        #     self.myPrintLayoutAtlas.filenameExpression()))

        # #### pdf settings ####
        # self.myPrintLayoutExporter = QgsLayoutExporter(
        #                                  self.myPrintLayoutAtlasLayout)
        self.myLayoutExporter = QgsLayoutExporter(self.myLayoutAtlasLayout)
        # print("myPrintLayoutExporter.layout.name = {}".format(
        #     self.myPrintLayoutExporter.layout().name()))
        self.myPdfExportSettings = QgsLayoutExporter.PdfExportSettings()
        # self.myPdfExportSettings.dpi = 80
        # self.myPdfExportSettings.rasterizeWholeImage = False
        # self.myPdfExportSettings.forceVectorOutput = False
        # self.myPdfExportSettings.exportMetadata = False
        # self.image_settings = \
        #     QgsLayoutExporter(self.myPrintLayout).ImageExportSettings()
        # self.image_settings.dpi = 200

        for self.myPrintLayout in self.manager.printLayouts():
            # comp                  = self.myPrintLayout
            # comp.atlas()          = self.myPrintLayoutAtlas
            # comp.atlas().layout() = self.myPrintLayoutAtlasLayout
            # print('myLayout.name() = {}'.format(self.myLayout.name()))
            # print('myPrintLayout.name() = {}'.format(
            #     self.myPrintLayout.name()))
            if (
                self.myLayout == self.myPrintLayout
                and self.myLayoutAtlas.enabled()
                and self.dictionnaire_parametres["outputFormat"] == "pdf"
            ):

                # print("myLayoutAtlas.stringType = {}".format(
                #     self.myLayoutAtlas.stringType()))
                print(
                    "Avant impression {} : {}".format(
                        self.myLayout.name(),
                        datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    )
                )
                # print("1. myLayoutAtlas.count = {}".format(
                #     self.myLayoutAtlas.count()))
                # result, error = self.myLayoutExporter.exportToPdf(
                #     self.myLayoutAtlas,
                #     self.dictionnaire_parametres['outputFolder'] + \
                #         '/' + 'result.pdf',
                #     self.myPdfExportSettings)
                result, error = QgsLayoutExporter.exportToPdfs(
                    self.myLayoutAtlas,
                    self.dictionnaire_parametres["outputFolder"] + "/",
                    self.myPdfExportSettings,
                )

                print(
                    "Après impression {} : {}".format(
                        self.myLayout.name(),
                        datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
                    )
                )
                print(" -> myLayoutAtlas.count = {}".format(self.myLayoutAtlas.count()))

                if not result == QgsLayoutExporter.Success:
                    print(error)
        print("Success!")


def main():
    u"""
    Programme principal.

    Ce script peut etre :
    - autonome : il s'utilise alors ainsi
      python3 ./espu_voirieAdministratif_qgis_python_printing.py

    """

    # Avant de faire les impressions, nous executons un script shell
    # (qui contient des commandes sql)
    # pour mettre à jour la base de données
    print(
        "Avant espu_voirieAdministratif_projet_update_avantImpression.sh : {}".format(
            datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )
    )
    subprocess.run(
        "/home/fred/Documents/technic/source/voirie/bin/espu_voirieAdministratif_projet_update_avantImpression.sh"
    )
    print(
        "Après espu_voirieAdministratif_projet_update_avantImpression.sh : {}".format(
            datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )
    )

    # On crée une instance de l'objet Imprimeur avec un projet qgis
    #   1. projetQgis     = le nom du fichier projet Qgis
    projetQgis = (
        "/home/fred/Documents/technic/source/voirie/data/numerotations_linux.qgs"
    )
    __myImprimeur = Imprimeur(projetQgis)
    # print("{}".format(projetQgis))

    # On defintit le reste des variables dans un dictionnaire
    #   2. layoutName    = le nom de la mise en page
    #   3. coverageLayer = le nom de l'entité couche de couverture
    #   4. atlasFilter   = Filtre de l'atlas
    #   5. outputFormat  = Format du fichier sortie
    #   6. outputFolder  = le repertoire de sortie
    #   7. outputName    = Option pour créer un seul fichier pdf en résultat
    #   8. pdfName       = le nom du fichier resultat
    dico_tadebugnumero = {
        "layoutName": "TADebugNumero",
        "coverageLayer": "lj_demande_numvoie_parcelle",
        "filterExpression": u"""
                            "demande_type_numerotage" like 'n'
                            """,
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/tadebugnumero",
        "filenameExpression": u"""
                              if(
                              length( "code_demande") > 5,
                              "code_demande" || '_' || 'TADebugNumero_'|| "ident",
                              substr( '00000', 1, 5-length( "code_demande")) ||  "code_demande" || '_' || 'TADebugNumero_'|| "ident")
                              """,
        "pdfName": "report",
    }
    dico_tadebugnumero = {
        "layoutName": "TADebugNumero",
        "coverageLayer": "lj_demande_numvoie_parcelle",
        "filterExpression": "",
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/tadebugnumero",
        "filenameExpression": "",
    }
    __myImprimeur.make_atlas_pdf(dico_tadebugnumero)
    dico_tadebugparcelle = {
        "layoutName": "TADebugParcelle",
        "coverageLayer": "lj_demande_parcelle_numero",
        "filterExpression": u"""
                            demande_type_numerotage" like 'n'
                            """,
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/tadebugparcelle",
        "filenameExpression": u"""
                              if(
                              length( "code_demande") > 5,
                              "code_demande" || '_' || 'TADebugNumero_'|| "ident",
                              substr( '00000', 1, 5-length( "code_demande")) ||  "code_demande" || '_' || 'TADebugNumero_'|| "ident")
                              """,
        "pdfName": "report",
    }
    dico_tadebugparcelle = {
        "layoutName": "TADebugParcelle",
        "coverageLayer": "lj_demande_parcelle_numero",
        "filterExpression": "",
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/tadebugparcelle",
        "filenameExpression": "",
    }
    __myImprimeur.make_atlas_pdf(dico_tadebugparcelle)
    dico_tacertificatnumerotage = {
        "layoutName": "TACertificatNumerotage",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": u""""
                             "demande_type_numerotage" like 'n'
                             or
                             "demande_type_numerotage" like 'f'
                             """,
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    dico_tacertificatnumerotage = {
        "layoutName": "TACertificatNumerotage",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": "",
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    __myImprimeur.make_atlas_pdf(dico_tacertificatnumerotage)
    dico_tacertificatnumerotagev2 = {
        "layoutName": "TACertificatNumerotage_v2",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": u""""
                             "demande_type_numerotage" like 'n'
                             or
                             "demande_type_numerotage" like 'f'
                             """,
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    dico_tacertificatnumerotagev2 = {
        "layoutName": "TACertificatNumerotage_v2",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": "",
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    __myImprimeur.make_atlas_pdf(dico_tacertificatnumerotagev2)
    dico_taarretedalignementindividuelnonconcerne = {
        "layoutName": "TAArreteDAlignementIndividuelNonConcerne",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": u""""
                             "demande_type_alignement" like 'nc'
                             or
                             "demande_type_alignement" like 'f'
                             """,
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    dico_taarretedalignementindividuelnonconcerne = {
        "layoutName": "TAArreteDAlignementIndividuelNonConcerne",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": "",
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    __myImprimeur.make_atlas_pdf(dico_taarretedalignementindividuelnonconcerne)
    dico_taarretedalignementindividuelseloncroquis = {
        "layoutName": "TAArreteDAlignementIndividuelSelonCroquis",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": "",
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    __myImprimeur.make_atlas_pdf(dico_taarretedalignementindividuelseloncroquis)
    dico_taarretedalignementindividuelselonplan = {
        "layoutName": "TAArreteDAlignementIndividuelSelonPlan",
        "coverageLayer": "lj_avancement_demande_parcelle",
        "filterExpression": "",
        "outputFormat": "pdf",
        "outputFolder": "/home/fred/f/CARTOGRAPHIE/donnees/urbanisme/NUMEROTATIONS/2018/taacontroler",
        "filenameExpression": "",
    }
    __myImprimeur.make_atlas_pdf(dico_taarretedalignementindividuelselonplan)

    # Après avoir fait les impressions, nous executons un script shell (commande sql)
    # pour mettre à jour la base de données
    print(
        "Avant espu_voirieAdministratif_projet_update_apresImpression.sh : {}".format(
            datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )
    )
    subprocess.run(
        "/home/fred/Documents/technic/source/voirie/bin/espu_voirieAdministratif_projet_update_apresImpression.sh"
    )
    print(
        "Après espu_voirieAdministratif_projet_update_apresImpression.sh : {}".format(
            datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        )
    )


if __name__ == "__main__":
    main()
    # pass
