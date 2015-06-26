#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
Script permettant de générer, de fabriquer des cases.

Le but est de générer les objets géométriques cases
à partir d'une emprise initiale.
L'ensemble des cases générées forme une grille
qui servira au découpage des folios lors de
la génnération des plans réponses au dt-dict.

"""

import getopt
import sys
import subprocess
import re
#from decimal import Decimal


class CaseFabric(object):

    u"""
    Classe d'objet dont l'objectif principal est la génération de cases.

    .

    """

    def __init__(self, fileName):
        u"""
        Méthode pour initialiser l'objet.

        Lorque l'objet est instancié, c'est cette méthode qui est executée.

        """
        self.fileName = fileName
        self.bbox_emprise = []

        self.listeTable = ['00042x00030',
                           '00070x00050',
                           '00098x00070',
                           '00112x00080',
                           '00140x00100',
                           '00168x00120',
                           '00182x00130',
                           '00210x00150',
                           '00224x00160',
                           '00245x00175',
                           '00336x00240',
                           '00350x00250',
                           '00490x00350',
                           '00525x00375',
                           '00700x00500',
                           '01050x00750']

    def getBboxEmprise(self):
        u"""
        Fournit la bounding box d'un fichier shape.

        Cette Bounding Box est extraite du resultat de la commande
        ogrinfo.

        """
        coucheName = re.sub(r'\.shp', '', self.fileName)
        p1 = subprocess.Popen(["ogrinfo", self.fileName, coucheName],
                              stdout=subprocess.PIPE)
        p2 = subprocess.Popen(["grep", "Extent"],
                              stdin=p1.stdout,
                              stdout=subprocess.PIPE)
        p1.stdout.close()
        # p2.communicate renvoit un tuple : on ne prend que le 1er element
        chaine = p2.communicate()[0]
        splitchaine = chaine.split(' ')
        #print splitchaine

        xMin = re.sub(r'\(', '', splitchaine[1])
        xMin = re.sub(',', '', xMin)
        xMax = re.sub(r'\(', '', splitchaine[4])
        xMax = re.sub(',', '', xMax)
        yMin = re.sub(r'\)', '', splitchaine[2])
        yMax = re.sub(r'\)', '', splitchaine[5])
        yMax = re.sub('\n', '', yMax)
        #print "xMin = ", xMin, " yMin = ", yMin, \
        #      " ; xMax = ", xMax, " yMax = ", yMax
        self.bbox_emprise = [xMin, yMin, xMax, yMax]
        return self.bbox_emprise
        #template_file = file(template_path)
        #template_content = template_file.read()
        #template_file.close()

    def getCaseFromPoint(self, x, y, largeur, hauteur):
        u"""
        Fournit la bounding box de la case qui contient le point.

        """

        #print "x = ", x, " ; y = ", y
        #print "largeur = ", largeur, " ; hauteur = ", hauteur
        kx = float(x) / float(largeur)
        xBG = int(kx) * float(largeur)
        ky = float(y) / float(hauteur)
        yBG = int(ky) * float(hauteur)
        #print "xBG = ", xBG, " ; yBG = ", yBG
        xHD = xBG + float(largeur)
        yHD = yBG + float(hauteur)
        #print "xHD = ", xHD, " ; yHD = ", yHD
        bbox = [xBG, yBG, xHD, yHD]
        return bbox

    def getMinMaxFromBBox(self, largeur, hauteur):
        u"""
        Renvoie les Coordonnées minimum et maximum des Cases englobantes.

        Fournit la bounding box (finale) des cases qui contiennent
        la bbox (initiale).
        La bounding box finale est accrochée à la grille dont les pas
        sont donnés en paramètre.

        """

        mybbox_BG = self.getCaseFromPoint(
            self.bbox_emprise[0],
            self.bbox_emprise[1],
            largeur, hauteur)
        mybbox_HD = self.getCaseFromPoint(
            self.bbox_emprise[2],
            self.bbox_emprise[3],
            largeur, hauteur)

        bbox = [mybbox_BG[0], mybbox_BG[1], mybbox_HD[2], mybbox_HD[3]]
        return bbox

    def generate2CreateTable(self, filename):
        u"""
        Genere le fichier sql pour les différentes tables.

        .

        """
        ffile = open(filename, "w")
        for table in self.listeTable:
            x = int(re.sub(r'x.*', '', table))
            y = int(re.sub(r'.*x', '', table))
            #ligne_a_ecrire = str(x) + "_" + str(y) + '\n'
            ffile.write('-- ----------------\n')
            ffile.write('--\n')
            ligne_a_ecrire = '-- ' + table + '\n'
            ffile.write(ligne_a_ecrire)
            ffile.write('--\n')
            ffile.write('-- ----------------\n')
            ffile.write('\n')
            ligne_a_ecrire = '-- Suppression de la table ' + table + '\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = 'drop table if exists "' + table + '";\n'
            ffile.write(ligne_a_ecrire)
            ffile.write('\n')
            ligne_a_ecrire = '-- Creation de la table ' + table + '\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = 'create table "' + table + '"\n'
            ffile.write(ligne_a_ecrire)
            ffile.write('(\n')
            ffile.write('  ogc_fid serial NOT NULL,\n')
            ffile.write('  id character varying(28),\n')
            ffile.write('  wkb_geometry_3857 geometry(Geometry,3857),\n')
            ffile.write('  wkb_geometry_3946 geometry(Geometry,3946),\n')
            ligne_a_ecrire = '  CONSTRAINT "' + table + \
                '_pk" PRIMARY KEY (ogc_fid)\n'
            ffile.write(ligne_a_ecrire)
            ffile.write(')\n')
            ffile.write('WITH (\n')
            ffile.write('  OIDS=FALSE\n')
            ffile.write(');\n')
            ligne_a_ecrire = 'ALTER TABLE "' + table + '"\n'
            ffile.write(ligne_a_ecrire)
            ffile.write('  OWNER TO contrib;\n')
            ffile.write('\n')
            ligne_a_ecrire = '-- Index: ' + table + '_3857_idx\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = '-- DROP INDEX "' + table + '_3857_idx";\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = 'CREATE INDEX "' + table + '_3857_idx"\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = '  ON "' + table + '"\n'
            ffile.write(ligne_a_ecrire)
            ffile.write('  USING gist\n')
            ffile.write('  (wkb_geometry_3857);\n')
            ffile.write('\n')
            ligne_a_ecrire = '-- Index: ' + table + '_3946_idx\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = '-- DROP INDEX "' + table + '_3946_idx";\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = 'CREATE INDEX "' + table + '_3946_idx"\n'
            ffile.write(ligne_a_ecrire)
            ligne_a_ecrire = '  ON "' + table + '"\n'
            ffile.write(ligne_a_ecrire)
            ffile.write('  USING gist\n')
            ffile.write('  (wkb_geometry_3946);\n')
            ffile.write('\n')
            ffile.write('\n')

        ffile.close()

    def getListCaseFromBBox(self, largeur, hauteur):
        u"""
        Liste des cases formant la grille couvrant l'emprise.

        Pour un pas de case spécifié en paramètres (largeur, hauteur)
        cette methode fournit la bounding box (finale) des cases
        qui contiennent la bbox (initiale).
        La bounding box finale est accrochée à la grille dont les pas
        sont donnés en paramètre.
        
        La chaine retournée contient les instructions sql qui
        permettent d'importer les cases sous postgis.

        """

        minMaxBBox = self.getMinMaxFromBBox(largeur, hauteur)
        x_ini = int(minMaxBBox[0]) - largeur
        x_fin = int(minMaxBBox[2]) + largeur
        y_ini = int(minMaxBBox[1]) - hauteur
        y_fin = int(minMaxBBox[3]) + hauteur
        #print "x_ini = " + str(x_ini)
        #print "x_fin = " + str(x_fin)
        #print "y_ini = " + str(y_ini)
        #print "y_fin = " + str(y_fin)
        #x_min = x_ini
        x_max = x_ini
        #y_min = y_ini
        y_max = y_ini
        table = str(largeur) + 'x' + str(hauteur)
        table = '{0:0>5}'.format(largeur) + 'x' + '{0:0>5}'.format(hauteur)
        
        result = ''

        for x in range(x_ini, x_fin, largeur):
            for y in range(y_ini, y_fin, hauteur):
                A = str(x) + ' ' + str(y)
                B = str(x) + ' ' + str(y + hauteur)
                C = str(x + largeur) + ' ' + str(y + hauteur)
                D = str(x + largeur) + ' ' + str(y)
                iid = table + '_' + str(x) + '_' + str(y)
                geom = 'POLYGON((' + A + ',' + B + ',' + C + \
                    ',' + D + ',' + A + '))'
                insert = 'insert into "' + table
                insert += '" '
                insert += '(id, wkb_geometry_3946) values ('
                insert += "'" + iid
                insert += "'" + ', st_geomfromtext('
                insert += "'" + geom + "'" + ', 3946) );'
                #print insert
                result += insert + '\n'
                if x > x_max:
                    x_max = x
                if y > y_max:
                    y_max = y

        #print "x_min = " + str(x_min) + " , y_min = " + str(y_min)
        #print "x_max = " + str(x_max) + " , y_max = " + str(y_max)
        return result

    def generate3Import(self, filename):
        u"""
        Genere le fichier sql pour les imports.

        .

        """
        ffile = open(filename, "w")
        for table in self.listeTable:
            x = int(re.sub(r'x.*', '', table))
            y = int(re.sub(r'.*x', '', table))
            #ligne_a_ecrire = str(x) + "_" + str(y) + '\n'
            ligne_a_ecrire = self.getListCaseFromBBox(x, y)
            ffile.write(ligne_a_ecrire)

        ffile.close()

def main(argv):
    u"""
    Programme principal.

    """

    ffile = ''
    try:
        opts, args = getopt.getopt(argv, "hf:",
                                   ["file="])
    except getopt.GetoptError as err:
        print "pdfFabric.py -h"
        print 'pdfFabric.py -f <file>'
        print str(err)
        sys.exit(2)
    for opt, arg in opts:
        if opt == '-h':
            print "pdfFabric.py -h"
            print 'pdfFabric.py -f <file>'
            sys.exit()
        if opt in ("-f", "--file"):
            ffile = arg

    #print 'file = ', ffile

    __myCaseFabric = CaseFabric(ffile)
    mybbox_emprise = __myCaseFabric.getBboxEmprise()
    #print "emprise   = ", mybbox_emprise
   
    # on genere le sql qui sert à supprimer et creer des tables
    # postgis pour accueillir la geométrie des cases
    __myCaseFabric.generate2CreateTable("sql/caseFabricPgsql2_createTable.sql")

    # on genere le sql qui sert à importer les données
    # dans les tables que l'on a précédemment créées
    __myCaseFabric.generate3Import("sql/caseFabricPgsql3_import.sql")
    
    # execution des fichiers sql
    result = subprocess.call(
        "./caseFabricPgsql0.sh 1> /dev/null 2> /dev/null",
        shell=True)

if __name__ == '__main__':
    main(sys.argv[1:])
