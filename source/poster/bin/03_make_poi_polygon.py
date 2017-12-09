#!/usr/bin/env python3
# coding: utf-8

import os
import stat
import lxml.etree as et

# Creation d'un fichier sql qui contiendra les centres des prises de vue
class set_of_tiles():
    """
    Un ensemble de tuiles est un groupe d'objets, de type tuile,
    qui correspond à une emprise géographique.
    Cet ensemble possede des propriétés et des méthodes
    """
    def __init__(self, NbCasesX, Coeff):
        # Initialisation de l'emprise
        # coordonnées du centre
        # largeur, hauteur
        # et nombre de bandes de découpages

        self.path = '/home/fred/hugin/pva{}'.format(NbCasesX)
        self.fichier_final = 'Assemblage'
        self.coeff = Coeff
        if NbCasesX == 1:
            self.altitude = 14000
        elif NbCasesX == 2:
            self.altitude = 8000
            self.coeff = Coeff * 4
        elif NbCasesX == 3:
            self.altitude = 6000
            self.coeff = Coeff * 2
        elif NbCasesX == 4:
            self.altitude = 4500
            self.coeff = Coeff * 1.5
        elif NbCasesX == 5:
            self.altitude = 4000
            self.coeff = Coeff * 1.2
        elif NbCasesX == 6:
            self.altitude = 3500
            self.coeff = Coeff * 1.0
        elif NbCasesX == 7:
            self.altitude = 2800
            self.coeff = Coeff * 1.0
        elif NbCasesX == 8:
            self.altitude = 2000
        elif NbCasesX == 9:
            self.altitude = 1800
        elif NbCasesX == 10:
            self.altitude = 1600
        elif NbCasesX == 11:
            self.altitude = 1500
        elif NbCasesX == 12:
            self.altitude = 1400
        elif NbCasesX == 13:
            self.altitude = 1300
        elif NbCasesX == 14:
            self.altitude = 1250
        elif NbCasesX == 15:
            self.altitude = 1200
        self.Xcenter = -131011
        self.Ycenter = 5806279
        self.Largeur = 15000
        self.Hauteur = 10500
        self.Largeur = 16000
        self.Hauteur = 11500
        self.NbCasesX = NbCasesX
        self.NbCasesY = NbCasesX
        self.xBGEmprise = self.Xcenter - self.Largeur / 2
        self.yBGEmprise = self.Ycenter - self.Hauteur / 2
        self.xHDEmprise = self.Xcenter + self.Largeur / 2
        self.yHDEmprise = self.Ycenter + self.Hauteur / 2
        self.xPas = self.Largeur / self.NbCasesX
        self.yPas = self.Hauteur / self.NbCasesY
        self.NbCasesT = self.NbCasesX * self.NbCasesY
        print('xBGEmprise = {}, xHDEmprise = {}, xPas = {}, \
               yBGEmprise = {}, yHDEmprise = {}, yPas = {}'.format( \
               self.xBGEmprise, self.xHDEmprise, self.xPas, \
               self.yBGEmprise, self.yHDEmprise, self.yPas))

    def calcul_index_hugin(self, n, x, y):
        """
        fonction utile pour la mise à jour des index hugin
        un index hugin est un index qui sert à indexer les tuiles
        0 en partant du centre, puis s'incremente en decrivant une spirale
        autour de ce centre.
        ces index sont :
          - indice x par rapport au centre de la photo
          - indice y par rapport au cnetre de la photo
          - coefficient par rapport au centre de la photo (ratyon de la spirale)
        """
        self.poi_idhgx = (x - int((n+1)/2))
        self.poi_idhgy = (y - int((n+1)/2))
        self.poi_idhgc = max(abs(self.poi_idhgx), abs(self.poi_idhgy))

    def calcul_index_hugin_Ouest(self, x, y):
        """
        Calcul de l'index hugin pour la partie Ouest de l'emprise
        """
        if self.poi_idhgc == 0:
            return self.poi_idhgc + x - y
        else:
            w = self.poi_idhgc * 2 + 1
            return (w * w - w + x - y)
            #return (self.NbCasesX * self.NbCasesX - self.NbCasesX + x - y)

    def calcul_index_hugin_Sud(self, x, y):
        """
        Calcul de l'index hugin pour la partie Sud de l'emprise
        """
        # test si NbCasesX est pair
        if self.NbCasesX == 2 * int(self.NbCasesX / 2):
            #print("pair")
            if self.poi_idhgy == 0:
                #print("Sud")
                return 1
            elif (y == self.NbCasesX + 1 - x):
                w = self.poi_idhgc + 1
                return (w * w - w + x - y)
            else:
                w = 2 * self.poi_idhgc + 1
                return (w * w - w + x - y)
        else:
            #print("impair")
            if self.poi_idhgy == 0:
                #print("Sud")
                return 1
            else:
                w = 2 * self.poi_idhgc + 1
                return (w * w - w + x - y)

            #return (self.NbCasesX * self.NbCasesX - self.NbCasesX + x - y)

    def calcul_index_hugin_Nord(self, x, y):
        """
        Calcul de l'index hugin pour la partie Nord de l'emprise
        """
        # test si NbCasesX est pair
        if self.NbCasesX == 2 * int(self.NbCasesX / 2):
            #print("pair")
            w = self.poi_idhgc * 2
            return (w * w + self.NbCasesX - x - y)
        else:
            #print("impair")
            w = self.poi_idhgc * 2
            return (w * w + self.NbCasesX + 1 - x - y)

    def calcul_index_hugin_Est(self, x, y):
        """
        Calcul de l'index hugin pour la partie Est de l'emprise
        """
        # test si NbCasesX est pair
        if self.NbCasesX == 2 * int(self.NbCasesX / 2):
            #print("pair")
            if self.poi_idhgx == 1 and self.poi_idhgy == 0:
                return 1
            else:
                w = 2 * self.poi_idhgc - 1
                #print ("w={} ; Nb={} ; x={} ; y={} ; r={}".format(w, self.NbCasesX, x, y, (w * w - self.NbCasesX + x + y - 4)))
                return (w * w - self.NbCasesX + x + y - 1)
        else:
            #print("impair")
            if self.poi_idhgx == 1 and self.poi_idhgy == 0:
                return 1
            else:
                w = 2 * self.poi_idhgc - 1
                #print ("w={} ; Nb={} ; x={} ; y={} ; r={}".format(w, self.NbCasesX, x, y, (w * w + self.NbCasesX + x + y - 12)))
                return (w * w - self.NbCasesX + x + y - 2)

    def genere_script_sql(self, \
                          sql, \
                          actiona, \
                          im, \
                          hugin01, \
                          hugin02, \
                          hugin03):

        fcsql = open(sql, 'w')
        fcactiona = open(actiona, 'r+')
        fcim = open(im, 'w')
        fchugin01 = open(hugin01, 'w')
        fchugin02 = open(hugin02, 'w')
        fchugin03 = open(hugin03, 'w')

        # Dans le script actiona, nous injectons la valeur de NbCasesX
        # Lecture du fichier SVG/XML en entree
        tree = et.parse(fcactiona)
        # Mise en memoire
        root = tree.getroot()

        for element in root.findall("./script/action[@comment='Affectation de la variable NbCasesX']/parameter[@name='value']/subParameter"):
            print('element {}, {}'.format(element.tag, \
                                          element.attrib))
            print('text {}'.format(element.text))
            element.text = '{}'.format(self.NbCasesX)
            #element.text = self.NbCasesX

        tree.write(actiona)
        # for element in root.findall("./{http://www.w3.org/2000/svg}g/{http://www.w3.org/2000/svg}g"):
        #     if element.findall('{http://www.w3.org/2000/svg}path'):
        #         #print('path {}, {}'.format(element.tag, \
        #         #                           element.attrib))
        #         pass
        #
        #
        # fcactionaold = fcactiona.readlines() # Pull the file contents to a list
        # fcactiona.seek(0) # Jump to start, so we overwrite instead of appending
        # for line in fcactionaold:
        #     if line == '                <subParameter name="value" code="0">9999</subParameter>':
        #         fcactiona.write('                <subParameter name="value" code="0">{}</subParameter>'.format(self.NbCasesX))
        #     else:
        #         fcactiona.write(line)

        fcsql.write("-- Fichier sql qui contient des objets geographiques utiles\n")
        fcsql.write("-- pour faire des tuiles :\n")
        fcsql.write("--   - des polygones qui vont servir pour du découpage\n")
        fcsql.write("--         sous qgis\n")
        fcsql.write("--   - des points qui vont etre les\n")
        fcsql.write("--         positions camera (simili - prises de vue aerienne)\n")
        fcsql.write("\n")
        # ecriture de create table
        fcsql.write("-- Tables des polygones\n")
        fcsql.write("\n")
        fcsql.write("-- Table qui contient les polygones pour l atlas sous qgis\n")
        fcsql.write("\n")
        fcsql.write("DROP TABLE if exists poi_polygon;\n")
        fcsql.write("\n")
        fcsql.write("CREATE TABLE poi_polygon (\n")
        fcsql.write("  poi_idim INTEGER,\n")
        fcsql.write("  poi_idhg INTEGER,\n")
        fcsql.write("  poi_idx INTEGER,\n")
        fcsql.write("  poi_idy INTEGER,\n")
        fcsql.write("  poi_name VARCHAR,\n")
        fcsql.write("  xcenter float,\n")
        fcsql.write("  ycenter float,\n")
        fcsql.write("  xoffset float,\n")
        fcsql.write("  yoffset float,\n")
        fcsql.write("  longitude float DEFAULT 0.0,\n")
        fcsql.write("  latitude float DEFAULT 0.0,\n")
        fcsql.write("  altitude float DEFAULT 2000.0,\n")
        fcsql.write("  altitudemode VARCHAR DEFAULT 'relativeToGround',\n")
        fcsql.write("  tilt float DEFAULT 0,\n")
        fcsql.write("  roll float DEFAULT 0\n")
        fcsql.write(");\n")
        fcsql.write("\n")
        fcsql.write("SELECT AddGeometryColumn('poi_polygon', 'poi_geom',\n");
        fcsql.write("                          3857, 'POLYGON', 2);\n")
        fcsql.write("\n")
        fcsql.write("\n")
        fcsql.write("-- Tables des points\n")
        fcsql.write("\n")
        fcsql.write("-- Table qui contient les coordonnees des centres PVA\n")
        fcsql.write("\n")
        fcsql.write('DROP TABLE if exists poi_point;\n')
        fcsql.write('\n')
        fcsql.write("CREATE TABLE poi_point (\n")
        fcsql.write("  poi_idim INTEGER,\n")
        fcsql.write("  poi_idhg INTEGER,\n")
        fcsql.write("  poi_idx INTEGER,\n")
        fcsql.write("  poi_idy INTEGER,\n")
        fcsql.write("  poi_name VARCHAR,\n")
        fcsql.write("  xcenter float,\n")
        fcsql.write("  ycenter float,\n")
        fcsql.write("  xoffset float,\n")
        fcsql.write("  yoffset float,\n")
        fcsql.write("  longitude float DEFAULT 0.0,\n")
        fcsql.write("  latitude float DEFAULT 0.0,\n")
        fcsql.write("  altitude float DEFAULT 2000.0,\n")
        fcsql.write("  altitudemode VARCHAR DEFAULT 'relativeToGround',\n")
        fcsql.write("  tilt float DEFAULT 0,\n")
        fcsql.write("  roll float DEFAULT 0\n")
        fcsql.write(");\n")
        fcsql.write("\n")
        fcsql.write("SELECT AddGeometryColumn('poi_point', 'poi_geom', 3857, 'POINT', 2);\n")
        fcsql.write('\n')

        fcim.write("#!/bin/sh\n")
        fcim.write('\n')
        fcim.write('# Script pour convertir les fichiers pdf en image png\n')
        fcim.write('# On en profite pour rogner une partie de l image\n')
        fcim.write('\n')

        fchugin01.write('#!/bin/sh\n\n')

        fchugin01.write('# script vu sur cette page\n')
        fchugin01.write('# Hugin tutorial - Stitching flat scanned images\n')
        fchugin01.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
        fchugin01.write('\n')
        fchugin01.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
        fchugin01.write('\n')
        fchugin01.write('Path=\'{}\'\n'.format(self.path))
        fchugin01.write('Prefix=\'{}\'\n'.format(self.fichier_final))
        fchugin01.write('FOV={}\n'.format(10))
        fchugin01.write('\n')
        fchugin01.write('# Initialisation du projet avec les differeentes images\n')
        fchugin01.write('pto_gen --projection=0 \\\n')
        fchugin01.write('        --fov=30 \\\n')
        fchugin01.write('        -o $Path/project1.pto \\\n')
        fchugin01.write('        $Path/*\n')
        fchugin01.write('\n')
        fchugin01.write('# Creation des objectifs (1 par pva)\n')
        fchugin01.write('pto_lensstack \\\n')

        fchugin02.write('#!/bin/sh\n\n')

        fchugin02.write('# script vu sur cette page\n')
        fchugin02.write('# Hugin tutorial - Stitching flat scanned images\n')
        fchugin02.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
        fchugin02.write('\n')
        fchugin02.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
        fchugin02.write('\n')
        fchugin02.write('Path=\'{}\'\n'.format(self.path))
        fchugin02.write('Prefix=\'{}\'\n'.format(self.fichier_final))
        fchugin02.write('FOV={}\n'.format(10))
        fchugin02.write('\n')
        fchugin02.write('# Personnalisation des paramètres - 1\n')
        fchugin02.write('# on met tout à zéro\n')
        fchugin02.write('pto_var \\\n')
        fchugin02.write('        --set=y=0,p=0,r=0 \\\n')
        fchugin02.write('        --set=TrX=0 \\\n')
        fchugin02.write('        --set=TrY=0 \\\n')
        fchugin02.write('        --set=TrZ=0 \\\n')
        fchugin02.write('        -o $Path/project3.pto \\\n')
        fchugin02.write('        $Path/project2.pto\n')
        #fchugin02.write('# initialisation du projet avec les differeentes images\n')
        #fchugin02.write('pto_gen --projection=0 --fov=$FOV -o {0}/project.pto {0}/*.png\n'.format(chemin_des_images_150))
        fchugin02.write('\n')
        #fchugin02.write('# creation des objectifs (1 par pva)\n')
        #fchugin02.write('pto_lensstack -o {}/project1.pto \\\n'.format(chemin_des_images_150))
        fchugin02.write('\n')
        fchugin02.write('# Personnalisation des paramètres - 2\n')
        fchugin02.write('# choix 2, retenu : on decale l objectif de la camera\n')
        fchugin02.write('# pour info, le choix 1, non retenu : on decale l image\n')
        fchugin02.write('# attention mouvement en x dans le sens inverse\n')
        fchugin02.write('# le coefficient de 1.6 pour la resolution de 150\n')
        fchugin02.write('# le coefficient de  pour la resolution de 300\n')
        fchugin02.write('pto_var \\\n')


        fchugin03.write('#!/bin/sh\n\n')

        fchugin03.write('# script vu sur cette page\n')
        fchugin03.write('# Hugin tutorial - Stitching flat scanned images\n')
        fchugin03.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
        fchugin03.write('\n')
        fchugin03.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
        fchugin03.write('\n')
        fchugin03.write('Path=\'{}\'\n'.format(self.path))
        fchugin03.write('Prefix=\'{}\'\n'.format(self.fichier_final))
        fchugin03.write('FOV={}\n'.format(10))
        fchugin03.write('\n')
        fchugin03.write('# Recherche des points de controle\n')
        fchugin03.write('# mais, avec l option prealign, car on utilise la position de l objectif\n')
        fchugin03.write('cpfind --prealigned \\\n')
        fchugin03.write('       -o $Path/project6.pto \\\n')
        fchugin03.write('       $Path/project5.pto\n')
        fchugin03.write('\n')
        fchugin03.write('# Optimisation\n')
        fchugin03.write('autooptimiser -n \\\n')
        fchugin03.write('              -o $Path/project7.pto \\\n')
        fchugin03.write('              $Path/project6.pto\n')
        fchugin03.write('\n')
        fchugin03.write('# Ajustement\n')
        fchugin03.write('pano_modify --projection=0 \\\n')
        fchugin03.write('            --fov=AUTO \\\n')
        fchugin03.write('            --center \\\n')
        fchugin03.write('            --canvas=AUTO \\\n')
        fchugin03.write('            --crop=AUTO \\\n')
        fchugin03.write('            -o $Path/project8.pto \\\n')
        fchugin03.write('            $Path/project7.pto\n')
        fchugin03.write('\n')
        fchugin03.write('# Assemblage avec hugin_excutor, "was" fabrication d un makfile et execution\n')
        fchugin03.write('hugin_executor -t 2 -s \\\n')
        fchugin03.write('               -p $Path/$Prefix \\\n')
        fchugin03.write('               $Path/project8.pto\n')
        fchugin03.write('\n')

        poi_idx = 0
        poi_idx = 0
        poi_idy = 0
        id = 0
        #poi_idim = NbCasesX * NbCasesX
        #poi_idhg = NbCasesX * NbCasesX - NbCasesX + poi_idx - poi_idy
        #for x in range(int(xBGEmprise + xPas / 2), int(xHDEmprise), int(xPas)):
        for x in range(0, self.NbCasesX):
            #print("x = {} ; NbCasesX = {}".format(x, self.NbCasesX))
            poi_idx += 1
            poi_idy = 0
            xCentre = (self.xBGEmprise + self.xPas / 2) + (poi_idx - 1) * self.xPas
            poi_idim = self.NbCasesX * self.NbCasesX + poi_idx
            #poi_idhg = NbCasesX * NbCasesX - NbCasesX + poi_idx
            #print("poi_idhg = {}".format(poi_idhg))
            #for y in range(int(yBGEmprise + yPas / 2), int(yHDEmprise), int(yPas)):
            for y in range(0, self.NbCasesY):
                #print("y = {} ; NbCasesY = {}".format(y, self.NbCasesY))
                poi_idy += 1
                yCentre = (self.yBGEmprise + self.yPas / 2) + (poi_idy - 1) * self.yPas
                id += 1
                poi_idim -= self.NbCasesX
                #poi_idhg = self.NbCasesX * self.NbCasesX - self.NbCasesX + poi_idx - poi_idy
                self.calcul_index_hugin(self.NbCasesX, poi_idx, poi_idy)
                #print("self.poi_idhgx = {} ; self.poi_idhgy = {} ; self.poi_idhgc = {}".format(self.poi_idhgx, self.poi_idhgy, self.poi_idhgc))

                # pour le calcul de l'indice hugin, nous avons .... 4 formules
                # les formules sont differnetes en fonction de la zone
                # dans laquelle on se trouve... (Nord, Sud, Est Ouest)
                # et des fois meme, à l'interieur de ces zones,
                # des formules diffèrent selon la parite du nombre de cases...

                if (self.poi_idhgy >= self.poi_idhgx) \
                    and (self.poi_idhgy <= 0 - self.poi_idhgx):
                    #poi_idhg = self.NbCasesX * self.NbCasesX - self.NbCasesX + poi_idx - poi_idy
                    poi_idhg = self.calcul_index_hugin_Ouest(poi_idx, poi_idy)
                    #print("Ouest : coeff = {}".format(self.poi_idhgc))
                elif (self.poi_idhgy <= self.poi_idhgx) \
                    and (self.poi_idhgy > 0 - self.poi_idhgx):
                    poi_idhg = self.calcul_index_hugin_Est(poi_idx, poi_idy)
                    #print("Est   : coeff = {}".format(self.poi_idhgc))
                elif (self.poi_idhgy > self.poi_idhgx) \
                    and (self.poi_idhgy > 0 - self.poi_idhgx):
                    poi_idhg = self.calcul_index_hugin_Nord(poi_idx, poi_idy)
                    #print("Nord  : coeff = {}".format(self.poi_idhgc))
                elif (self.poi_idhgy < self.poi_idhgx) \
                    and (self.poi_idhgy <= 1 - self.poi_idhgx):
                    poi_idhg = self.calcul_index_hugin_Sud(poi_idx, poi_idy)
                    #print("Sud   : coeff = {}".format(self.poi_idhgc))

                nom = '{:0>2}_{:0>2}'.format(poi_idy, poi_idx)
                # print('poi_idim = {}, poi_idhg = {}, poi_idx = {}, poi_idy = {}, poi_nom = {}, poi_idhgx = {}, poi_idghy = {}, x = {}, y = {}'.format(poi_idim, poi_idhg, poi_idx, poi_idy, \
                #                               nom, \
                #                               self.poi_idhgx, \
                #                               self.poi_idhgy, \
                #                               x, y))
                xBGCase = xCentre - self.xPas / 2
                yBGCase = yCentre - self.yPas / 2
                xBDCase = xCentre + self.xPas / 2
                yBDCase = yCentre - self.yPas / 2
                xHDCase = xCentre + self.xPas / 2
                yHDCase = yCentre + self.yPas / 2
                xHGCase = xCentre - self.xPas / 2
                yHGCase = yCentre + self.yPas / 2
                #print('xHGCase = {}, yHGCase = {}, \
                #       xHDCase = {}, yHDCase = {}'.format(xHGCase, yHGCase, xHDCase, yHDCase))
                #print('xBGCase = {}, yBGCase = {}, \
                #       xBDCase = {}, yBDCase = {}'.format(xBGCase, yBGCase, xBDCase, yBDCase))
                fcsql.write("INSERT INTO poi_polygon \n")
                fcsql.write("    (poi_idim, poi_idhg, poi_idx, poi_idy, \n")
                fcsql.write("     poi_name, \n")
                fcsql.write("     xcenter,\n")
                fcsql.write("     ycenter,\n")
                fcsql.write("     xoffset,\n")
                fcsql.write("     yoffset,\n")
                fcsql.write("     poi_geom)\n")
                fcsql.write("""
                        VALUES (
                             {}, {}, {}, {},
                             '{}',
                             {}, {}, {}, {},
                             ST_GeomFromEWKT(
                               'SRID=3857;POLYGON(({} {},
                                                   {} {},
                                                   {} {},
                                                   {} {},
                                                   {} {}))'));
                        """.format(poi_idim, poi_idhg, poi_idx, poi_idy, \
                                   nom, \
                                   xCentre, yCentre, \
                                   0 - self.poi_idhgx * self.xPas, self.poi_idhgy * self.yPas, \
                                   xBGCase, yBGCase, \
                                   xBDCase, yBDCase, \
                                   xHDCase, yHDCase, \
                                   xHGCase, yHGCase, \
                                   xBGCase, yBGCase))
                fcsql.write("\n")
                fcsql.write("INSERT INTO poi_point \n")
                fcsql.write("    (poi_idim, poi_idhg, poi_idx, poi_idy, \n")
                fcsql.write("     poi_name, \n")
                fcsql.write("     xcenter,\n")
                fcsql.write("     ycenter,\n")
                fcsql.write("     xoffset,\n")
                fcsql.write("     yoffset,\n")
                fcsql.write("     altitude,\n")
                fcsql.write("     poi_geom)\n")
                fcsql.write("""
                        VALUES (
                             {}, {}, {}, {},
                             '{}',
                             {}, {}, {}, {},
                             {},
                             ST_GeomFromEWKT(
                               'SRID=3857;POINT({} {})'));
                        """.format(poi_idim, poi_idhg, poi_idx, poi_idy, \
                                   poi_idhg, \
                                   xCentre, yCentre, \
                                   0 - self.poi_idhgx * self.xPas, self.poi_idhgy * self.yPas, \
                                   self.altitude, \
                                   xCentre, yCentre))
                fcsql.write("\n")
                #fcsql.write("-- a recopier dans 08_lance_gugin_01.sh\n")
                #fcsql.write("\n")

                fchugin01.write('              --new-lens i{} \\\n'.format(poi_idhg))
                fchugin02.write('        --set=d{}={}/{} \\\n'.format(poi_idhg, 0 - self.poi_idhgx * self.xPas, self.coeff))
                fchugin02.write('        --set=e{}={}/{} \\\n'.format(poi_idhg, self.poi_idhgy * self.yPas, self.coeff))

        fcsql.write("\n")
        fcsql.write("UPDATE poi_polygon\n")
        fcsql.write("  SET\n")
        fcsql.write("      longitude =\n")
        fcsql.write("                 st_x(\n")
        fcsql.write("                   st_transform(\n")
        fcsql.write("                      st_centroid(poi_geom),\n")
        fcsql.write("                      4326)),\n")
        fcsql.write("      latitude =\n")
        fcsql.write("                 st_y(\n")
        fcsql.write("                   st_transform(\n")
        fcsql.write("                      st_centroid(poi_geom),\n")
        fcsql.write("                      4326));\n")
        fcsql.write("\n")
        #fcsql.write("select\n")
        #fcsql.write("       st_x(\n")
        #fcsql.write("         st_transform(\n")
        #fcsql.write("           ST_GeomFromEWKT('SRID=4326;POINT(' || CAST(longitude AS text) || ' ' || CAST(latitude AS text) || ')'),\n")
        #fcsql.write("           3857)) as x,\n")
        #fcsql.write("       st_y(\n")
        #fcsql.write("         st_transform(\n")
        #fcsql.write("           ST_GeomFromEWKT('SRID=4326;POINT(' || CAST(longitude AS text) || ' ' || CAST(latitude AS text) || ')'),\n")
        #fcsql.write("           3857)) as y\n")
        #fcsql.write("from\n")
        #fcsql.write("  (select\n")
        #fcsql.write("    longitude,\n")
        #fcsql.write("    latitude\n")
        #fcsql.write("  from poi_polygon) a;\n")
        fcsql.write("\n")
        #fcsql.write("select\n")
        #fcsql.write("  concat('--set=d', poi_idhg, '=', xoffset, '/1.5 \',\n")
        #fcsql.write("         '--set=e', poi_idhg, '=', yoffset, '/1.5')\n")
        #fcsql.write("from poi_polygon\n")
        #fcsql.write("order by poi_idhg;\n")
        fcsql.write("\n")
        fcsql.write("UPDATE poi_point\n")
        fcsql.write("  SET \n")
        fcsql.write("      longitude = \n")
        fcsql.write("                 st_x(\n")
        fcsql.write("                   st_transform(\n")
        fcsql.write("                      poi_geom,\n")
        fcsql.write("                      4326)),\n")
        fcsql.write("      latitude = \n")
        fcsql.write("                 st_y(\n")
        fcsql.write("                   st_transform(\n")
        fcsql.write("                      poi_geom,\n")
        fcsql.write("                      4326));\n")
        fcsql.write("\n")

        fcim.write('for i in `seq 0 {}`;'.format(id - 1))
        fcim.write('do\n')
        fcim.write("   #convert -density 225 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/$i.pdf /home/fred/h/cartographie/pva/$i.png\n")
        fcim.write("  convert -density 75 -gravity Center -shave '384x068' -level +0%,+100%,1.5 /home/fred/PDF/$i.pdf {}/$i.png\n".format(self.path))
        fcim.write('done\n')
        fcim.write('\n')

        fchugin01.write('        -o $Path/project2.pto \\\n')
        fchugin01.write('        $Path/project1.pto\n')

        fchugin02.write('        -o $Path/project4.pto \\\n')
        fchugin02.write('        $Path/project3.pto\n')
        fchugin02.write('\n')
        fchugin02.write('\n')
        fchugin02.write('# Personnalisation des paramètres - 3\n')
        fchugin02.write('# optimisation possible\n')
        fchugin02.write('# avec comme point de depart, la photo central\n')
        fchugin02.write('pto_var \\\n')
        fchugin02.write('        --opt=!y,!p,!r \\\n')
        fchugin02.write('        --opt=d,e \\\n')
        fchugin02.write('        --opt=!d{0},!e{0} \\\n'.format(0))
        fchugin02.write('        -o $Path/project5.pto \\\n')
        fchugin02.write('        $Path/project4.pto\n')

        fcsql.close()
        fcactiona.close()
        fcim.close()
        fchugin01.close()
        fchugin02.close()
        fchugin03.close()

        st = os.stat(hugin01)
        os.chmod(hugin01, st.st_mode | stat.S_IEXEC)
        st = os.stat(hugin02)
        os.chmod(hugin02, st.st_mode | stat.S_IEXEC)
        st = os.stat(hugin03)
        os.chmod(hugin03, st.st_mode | stat.S_IEXEC)


def genere_scripts(emprise):
    #print('genere_scripts')
    sql_commandes = '04_make_poi_polygon.sql'
    actiona_commandes = '06_script_actiona_v2.ascr'
    im_commandes = '07_imagemagick.sh'
    hugin01_commandes = '08_lance_hugin_01.sh'
    hugin02_commandes = '09_lance_hugin_02.sh'
    hugin03_commandes = '10_lance_hugin_03.sh'
    emprise.genere_script_sql(sql_commandes, \
                              actiona_commandes, \
                              im_commandes, \
                              hugin01_commandes, \
                              hugin02_commandes, \
                              hugin03_commandes)

def main():
    #print('main')
    emprise_1 = set_of_tiles(9, 1.0)
    genere_scripts(emprise_1)


if __name__ == '__main__':
    main()
