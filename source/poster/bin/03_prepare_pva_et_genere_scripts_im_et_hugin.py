#!/usr/bin/env python3
# coding: utf-8


"""
L'idee est de creer un jeu de tuiles (chaque tuile est un Prise de Vue Aerienne)
puis d'assembler ces differentes tuiles pour fabriquer un poster.
Trois scripts sont fabriqués pour automatiser le processus qui contient ... 4 étapes
(il reste donc une étape qui est encore manuel) :
 - la premiere etape consiste a creer des prises de vue aerienne.
   pour cela, on va fabriquer un fichier kml qui va faciliter la
   generation de ces pva au format pdf
 - la seconde etape est manuel : fabriquer une par une, les pva
   (cette etape pourra etre eventuellement automatisée avec l'outil actiona)
   http://linuxfr.org/news/actionaz-un-logiciel-d-automatisation-libre
 - la troisième étape consite à transformer les pdf en images png (avec redecoupage)
 - la quatrieme étabe consiste à réassembler les différentes tuiles avec un script hugin
   (hugin est un outil qui est scriptable !)

 1. definir l'emprise de la zone a survoler (mettre l'entdue dans main)
 2. lancer le script pour generer le fichier sql qui contient les coordonnées du plan de vol
 3. faire les PVA et les stocker en pdf dans le repertoire Images
    (mettre ces chemins dans la fonction genere_scripts)
 4. définir la compostion a realiser (la liste des tuiles qui constituera le poster)
"""

import os
import stat
import re


class tile():
    """
    la tuile n'a que des propriétés
    """
    def __init__(self, x_indice, x_value, y_indice, y_value):
        #print('init dalle')
        self.x_indice = x_indice
        self.y_indice = y_indice
        self.x_value = x_value
        self.y_value = y_value
        self.nom_yx = '{:0>2}{:0>2}'.format(self.y_indice, self.x_indice)
        #pass

class set_of_tiles():
    """
    Un semsemble de tuiles possede des méthodes
    """
    def __init__(self, x_pas, y_pas):
        # les paramètres pour la decoupe des images
        self.cropx_072 = '128'
        self.cropy_072 = '023'
        self.cropx_150 = '256'
        self.cropy_150 = '045'

        self.cropx_225 = '384'
        self.cropy_225 = '068'

        self.cropx_300 = '512'
        self.cropy_300 = '090'
        self.cropx_450 = '768'
        self.cropy_450 = '135'
        self.cropx_600 = '1024'
        self.cropy_600 = '180'
        # les paramètres pour le positionnement des images
        self.coeff_072 = 3.08
        self.coeff_150 = 1.6
        self.coeff_225 = 1.2
        self.coeff_300 = 0.76
        self.coeff_450 = 0.59
        self.coeff_600 = 0.40
        self.x_pas = x_pas
        self.y_pas = y_pas
        self.x_indice_all_min = 0
        self.y_indice_all_min = 0
        self.x_indice_extract_min = 0
        self.y_indice_extract_min = 0

        #pass

    def init_from_extend(self, x_min, y_min, x_max, y_max):
        self.x_min = x_min
        self.y_min = y_min
        self.x_max = x_max
        self.y_max = y_max
        self.x_moyen = (self.x_max + self.x_min) / 2
        self.y_moyen = (self.y_max + self.y_min) / 2
        self.items = {}
        x_indice_all = 0
        y_indice_all = 0
        id = -1
        for x in range (self.x_min, self.x_max, self.x_pas):
            x_indice_all += 1
            #print('x {} => x = {}'.format(countx, x))
            #print('x_moyen - (x_pas / 2) = {},  x = {}, x_moyen + (x_pas / 2 ) = {}'.format(x_moyen-(x_pas/2), x, x_moyen+(x_pas/2)))
            y_indice_all = 0
            for y in range(self.y_min, self.y_max, self.y_pas):
                y_indice_all += 1
                #print('y {} => y = {}'.format(county, y))
                id += 1
                #print('id = {}'.format(id))
                self.items[id]= tile(x_indice_all, x, y_indice_all, y)
                # recherche de la dalle centrale
                if (x > (self.x_moyen - (self.x_pas / 2))) \
                  and (x < (self.x_moyen + (self.x_pas / 2))) \
                  and (y > (self.y_moyen - (self.y_pas / 2))) \
                  and (y < (self.y_moyen + (self.x_pas / 2))):
                    self.all_centre_i = id
                    #dalle_centre_nom_yx = nom_yx
                    #dalle_centre_nom_x = '{:0>2}'.format(countx)
                    #dalle_centre_nom_y = '{:0>2}'.format(county)
                    self.all_centre_x_indice = x_indice_all
                    self.all_centre_y_indice = y_indice_all
                    #dalle_centre_i = id

                    #print('ici id = {}'.format(id))

        self.x_indice_all_max = x_indice_all
        self.y_indice_all_max = y_indice_all
        self.i_indice_all_max = id + 1


    def extract(self, x_indice_extract_min, x_indice_extract_max, \
                      y_indice_extract_min, y_indice_extract_max):
        # Extraction d'une zone
        self.x_indice_extract_min = x_indice_extract_min
        self.x_indice_extract_max = x_indice_extract_max
        self.y_indice_extract_min = y_indice_extract_min
        self.y_indice_extract_max = y_indice_extract_max
        self.x_indice_extract_moyen = (x_indice_extract_min + x_indice_extract_max) / 2
        self.y_indice_extract_moyen = (y_indice_extract_min + y_indice_extract_max) / 2
        #countx = 0
        #county = 0
        id = -1
        for x_indice_extract in range (self.x_indice_extract_min, self.x_indice_extract_max + 1):
            #countx += 1
            #print('x {} => x = {}'.format(countx, x))
            #print('x_moyen - (x_pas / 2) = {},  x = {}, x_moyen + (x_pas / 2 ) = {}'.format(x_moyen-(x_pas/2), x, x_moyen+(x_pas/2)))
            #county = 0
            for y_indice_extract in range(self.y_indice_extract_min, self.y_indice_extract_max + 1):
                #county += 1
                #print('y {} => y = {}'.format(county, y))
                id += 1
                if (x_indice_extract == int(self.x_indice_extract_moyen)) \
                  and (y_indice_extract == int(self.y_indice_extract_moyen)):
                    self.extract_centre_i = id
                    self.extract_centre_x_indice = x_indice_extract
                    self.extract_centre_y_indice = y_indice_extract

        self.x_indice_extract_max = x_indice_extract
        self.y_indice_extract_max = y_indice_extract
        self.i_indice_extract_max = id + 1
        #self.x_deltaBG = x_indice_extract_min
        #self.y_deltaBG = y_indice_extract_min
        #self.y_deltaCC =


    def genere_script_kml(self, \
                         fichier_commandes, \
                         path, \
                         fichier_final, \
                         resolution):
        if resolution == 72:
            self.coeff = self.coeff_072
        elif resolution == 150:
            self.coeff = self.coeff_150
        elif resolution == 225:
            self.coeff = self.coeff_225
        elif resolution == 300:
            self.coeff = self.coeff_300
        elif resolution == 450:
            self.coeff = self.coeff_450
        elif resolution == 600:
            self.coeff = self.coeff_600
        else:
            self.coeff = self.coeff_150
        # ici, on genere deux fichier_commandes
        # - un fichier qui contient les données sql
        # - un second fichier qui contient les commandes pour traduire le sql en kml
        fckml = open(fichier_commandes, 'w')
        fckml.write('-- Fichier sql qui contient les coordonnees des centres PVA\n\n')

        fckml.write('DROP TABLE if exists poi;\n')
        fckml.write('\n')
        fckml.write('\n')
        fckml.write("CREATE TABLE poi (\n")
        fckml.write("  poi_id INTEGER,\n")
        fckml.write("  poi_name VARCHAR,\n")
        fckml.write("  longitude float DEFAULT 0.0,\n")
        fckml.write("  latitude float DEFAULT 0.0,\n")
        fckml.write("  altitude float DEFAULT 2000.0,\n")
        fckml.write("  altitudemode VARCHAR DEFAULT 'relativeToGround',\n")
        fckml.write("  tilt float DEFAULT 0,\n")
        fckml.write("  roll float DEFAULT 0\n")
        fckml.write(");\n")
        fckml.write("SELECT AddGeometryColumn('poi', 'poi_geom', 3857, 'POINT', 2);\n")
        fckml.write('\n')
        x_indice_all = 0
        y_indice_all = 0
        id = 0
        for x in range (self.x_min, self.x_max, self.x_pas):
            x_indice_all += 1
            #print('x {} => x = {}'.format(countx, x))
            #print('x_moyen - (x_pas / 2) = {},  x = {}, x_moyen + (x_pas / 2 ) = {}'.format(x_moyen-(x_pas/2), x, x_moyen+(x_pas/2)))
            y_indice_all = 0
            for y in range(self.y_min, self.y_max, self.y_pas):
                y_indice_all += 1
                #print('y {} => y = {}'.format(county, y))
                id += 1
                nom = '{:0>2}.{:0>2}'.format(y_indice_all, x_indice_all)
                #print('id = {}, nom = yx = {}, x = {}, y = {}'.format(id, nom, x, y))
                fckml.write("INSERT INTO poi (poi_id, poi_name, poi_geom)\n")
                fckml.write("  VALUES ({}, '{}', ST_GeomFromEWKT('SRID=3857;POINT({} {})'));\n".format(id, nom, x, y))

        fckml.write("\n")
        fckml.write("UPDATE poi\n")
        fckml.write("  SET \n")
        fckml.write("      longitude = \n")
        fckml.write("                 st_x(\n")
        fckml.write("                   st_transform(\n")
        fckml.write("                      poi_geom,\n")
        fckml.write("                      4326)),\n")
        fckml.write("      latitude = \n")
        fckml.write("                 st_y(\n")
        fckml.write("                   st_transform(\n")
        fckml.write("                      poi_geom,\n")
        fckml.write("                      4326));\n")

        fckml.close()

        st = os.stat(fichier_commandes)
        os.chmod(fichier_commandes, st.st_mode | stat.S_IEXEC)

    def genere_script_imagemagick(self, \
                                  fichier_commandes, \
                                  chemin_des_pdf, \
                                  chemin_des_images, \
                                  resolution):
        if resolution == 72:
            self.cropx = self.cropx_072
            self.cropy = self.cropy_072
        elif resolution == 150:
            self.cropx = self.cropx_150
            self.cropy = self.cropy_150
        elif resolution == 225:
            self.cropx = self.cropx_225
            self.cropy = self.cropy_225
        elif resolution == 300:
            self.cropx = self.cropx_300
            self.cropy = self.cropy_300
        elif resolution == 450:
            self.cropx = self.cropx_450
            self.cropy = self.cropy_450
        elif resolution == 600:
            self.cropx = self.cropx_600
            self.cropy = self.cropy_600
        else:
            self.cropx = self.cropx_150
            self.cropy = self.cropy_150

        fcim = open(fichier_commandes, 'w')
        fcim.write('#!/bin/sh\n\n')

        fcim.write('# Script pour convertir les fichiers pdf en image png\n')
        fcim.write('# On en profite pour rogner une partie de l image\n')

        list_pdf = os.listdir(chemin_des_pdf)
        for fichier_pdf in list_pdf:
            if re.search('.pdf', fichier_pdf):
                #print('   {}'.format(image))
                image = re.sub(r'.pdf',
                               r'',
                               fichier_pdf)
                #print('   {}'.format(image))

                fcim.write('convert -density {3} -gravity Center -shave \'{4}x{5}\' -level +0%,+100%,1.5 {0}{1}.pdf {2}{1}_d{3}_{4}_{5}.png\n'.format(chemin_des_pdf, image, chemin_des_images, resolution, self.cropx, self.cropy))

        fcim.write('')
        fcim.close()

        st = os.stat(fichier_commandes)
        os.chmod(fichier_commandes, st.st_mode | stat.S_IEXEC)

    def genere_script_hugin_1(self, \
                              fichier_commandes, \
                              path, \
                              fichier_final, \
                              resolution):

        fchugin = open(fichier_commandes, 'w')
        fchugin.write('#!/bin/sh\n\n')

        fchugin.write('# script vu sur cette page\n')
        fchugin.write('# Hugin tutorial - Stitching flat scanned images\n')
        fchugin.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
        fchugin.write('\n')
        fchugin.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
        fchugin.write('\n')
        fchugin.write('Path=\'{}\'\n'.format(path))
        fchugin.write('Prefix=\'{}\'\n'.format(fichier_final))
        fchugin.write('FOV={}\n'.format(10))
        fchugin.write('\n')
        fchugin.write('# Initialisation du projet avec les differeentes images\n')
        fchugin.write('pto_gen --projection=0 \\\n')
        fchugin.write('        --fov=30 \\\n')
        fchugin.write('        -o $Path/project1.pto \\\n')
        fchugin.write('        $Path/*\n')
        fchugin.write('\n')
        fchugin.write('# Creation des objectifs (1 par pva)\n')
        fchugin.write('pto_lensstack \\\n')
        for i_indice_extract in range(0, self.i_indice_extract_max):
            fchugin.write('              --new-lens i{} \\\n'.format(i_indice_extract))
        fchugin.write('        -o $Path/project2.pto \\\n')
        fchugin.write('        $Path/project1.pto\n')
        fchugin.close()

        st = os.stat(fichier_commandes)
        os.chmod(fichier_commandes, st.st_mode | stat.S_IEXEC)

    def genere_script_hugin_2(self, \
                              fichier_commandes, \
                              path, \
                              fichier_final, \
                              resolution):
        if resolution == 72:
            self.coeff = self.coeff_072
        elif resolution == 150:
            self.coeff = self.coeff_150
        elif resolution == 225:
            self.coeff = self.coeff_225
        elif resolution == 300:
            self.coeff = self.coeff_300
        elif resolution == 450:
            self.coeff = self.coeff_450
        elif resolution == 600:
            self.coeff = self.coeff_600
        else:
            self.coeff = self.coeff_150
        fchugin = open(fichier_commandes, 'w')
        fchugin.write('#!/bin/sh\n\n')

        fchugin.write('# script vu sur cette page\n')
        fchugin.write('# Hugin tutorial - Stitching flat scanned images\n')
        fchugin.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
        fchugin.write('\n')
        fchugin.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
        fchugin.write('\n')
        fchugin.write('Path=\'{}\'\n'.format(path))
        fchugin.write('Prefix=\'{}\'\n'.format(fichier_final))
        fchugin.write('FOV={}\n'.format(10))
        fchugin.write('\n')
        fchugin.write('# Personnalisation des paramètres - 1\n')
        fchugin.write('# on met tout à zéro\n')
        fchugin.write('pto_var \\\n')
        fchugin.write('        --set=y=0,p=0,r=0 \\\n')
        fchugin.write('        --set=TrX=0 \\\n')
        fchugin.write('        --set=TrY=0 \\\n')
        fchugin.write('        --set=TrZ=0 \\\n')
        fchugin.write('        -o $Path/project3.pto \\\n')
        fchugin.write('        $Path/project2.pto\n')
        #fchugin.write('# initialisation du projet avec les differeentes images\n')
        #fchugin.write('pto_gen --projection=0 --fov=$FOV -o {0}/project.pto {0}/*.png\n'.format(chemin_des_images_150))
        fchugin.write('\n')
        #fchugin.write('# creation des objectifs (1 par pva)\n')
        #fchugin.write('pto_lensstack -o {}/project1.pto \\\n'.format(chemin_des_images_150))
        fchugin.write('\n')
        fchugin.write('# Personnalisation des paramètres - 2\n')
        fchugin.write('# choix 2, retenu : on decale l objectif de la camera\n')
        fchugin.write('# pour info, le choix 1, non retenu : on decale l image\n')
        fchugin.write('# attention mouvement en x dans le sens inverse\n')
        fchugin.write('# le coefficient de 1.6 pour la resolution de 150\n')
        fchugin.write('# le coefficient de  pour la resolution de 300\n')
        fchugin.write('pto_var \\\n')
        id = -1
        for y_indice_extract in range(self.y_indice_extract_min, self.y_indice_extract_max + 1):
            for x_indice_extract in range (self.x_indice_extract_min, self.x_indice_extract_max + 1):
                id += 1
                d = -(x_indice_extract - self.extract_centre_x_indice) * self.x_pas
                fchugin.write('        --set=d{}={}/{} \\\n'.format(id, d, self.coeff))
                e = (y_indice_extract - self.extract_centre_y_indice) * self.y_pas
                fchugin.write('        --set=e{}={}/{} \\\n'.format(id, e, self.coeff))
        fchugin.write('        -o $Path/project4.pto \\\n')
        fchugin.write('        $Path/project3.pto\n')
        fchugin.write('\n')
        fchugin.write('\n')
        fchugin.write('# Personnalisation des paramètres - 3\n')
        fchugin.write('# optimisation possible\n')
        fchugin.write('# avec comme point de depart, la photo central\n')
        fchugin.write('pto_var \\\n')
        fchugin.write('        --opt=!y,!p,!r \\\n')
        fchugin.write('        --opt=d,e \\\n')
        fchugin.write('        --opt=!d{0},!e{0} \\\n'.format(self.extract_centre_i))
        fchugin.write('        -o $Path/project5.pto \\\n')
        fchugin.write('        $Path/project4.pto\n')
        fchugin.close()

        st = os.stat(fichier_commandes)
        os.chmod(fichier_commandes, st.st_mode | stat.S_IEXEC)

    def genere_script_hugin_3(self, \
                              fichier_commandes, \
                              path, \
                              fichier_final, \
                              resolution):

        fchugin = open(fichier_commandes, 'w')
        fchugin.write('#!/bin/sh\n\n')

        fchugin.write('# script vu sur cette page\n')
        fchugin.write('# Hugin tutorial - Stitching flat scanned images\n')
        fchugin.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
        fchugin.write('\n')
        fchugin.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
        fchugin.write('\n')
        fchugin.write('Path=\'{}\'\n'.format(path))
        fchugin.write('Prefix=\'{}\'\n'.format(fichier_final))
        fchugin.write('FOV={}\n'.format(10))
        fchugin.write('\n')
        fchugin.write('# Recherche des points de controle\n')
        fchugin.write('# mais, avec l option prealign, car on utilise la position de l objectif\n')
        fchugin.write('cpfind --prealigned \\\n')
        fchugin.write('       -o $Path/project6.pto \\\n')
        fchugin.write('       $Path/project5.pto\n')
        fchugin.write('\n')
        fchugin.write('# Optimisation\n')
        fchugin.write('autooptimiser -n \\\n')
        fchugin.write('              -o $Path/project7.pto \\\n')
        fchugin.write('              $Path/project6.pto\n')
        fchugin.write('\n')
        fchugin.write('# Ajustement\n')
        fchugin.write('pano_modify --projection=0 \\\n')
        fchugin.write('            --fov=AUTO \\\n')
        fchugin.write('            --center \\\n')
        fchugin.write('            --canvas=AUTO \\\n')
        fchugin.write('            --crop=AUTO \\\n')
        fchugin.write('            -o $Path/project8.pto\\\n')
        fchugin.write('            $Path/project7.pto\n')
        fchugin.write('\n')
        fchugin.write('# Assemblage avec hugin_excutor, "was" fabrication d un makfile et execution\n')
        fchugin.write('hugin_executor -t 2 -s \\\n')
        fchugin.write('               -p $Path/$Prefix \\\n')
        fchugin.write('               $Path/project8.pto\n')
        fchugin.write('\n')
        fchugin.close()

        st = os.stat(fichier_commandes)
        os.chmod(fichier_commandes, st.st_mode | stat.S_IEXEC)

def genere_scripts(emprise, resolution):

    if resolution == 72:
        #path_pdf = '/home/fred/Images/v4/'
        #path_png = '/home/fred/Images/d072_v5/'
        #hugin_path_projet = '/home/fred/Images/dO72_v5/'
        path_pdf = '/media/fred/TOSHIBA/Images/v4/'
        path_png = '/media/fred/TOSHIBA/Images/d072_v4/'
        hugin_path_projet = '/media/fred/TOSHIBA/Images/d072_v4/'
        hugin_final = 'Assemblage_072'
    elif resolution == 150:
        #path_pdf = '/home/fred/Images/v4/'
        #path_png = '/home/fred/Images/d150_v4/'
        #hugin_path_projet = '/home/fred/Images/d150_v4/'
        path_pdf = '/media/fred/TOSHIBA/Images/v4/'
        path_png = '/media/fred/TOSHIBA/Images/d150_v4/'
        hugin_path_projet = '/media/fred/TOSHIBA/Images/d150_v4/'
        hugin_final = 'Assemblage_150'
    elif resolution == 225:
        #path_pdf = '/home/fred/Images/v4/'
        #path_png = '/home/fred/Images/d225_v4/'
        #hugin_path_projet = '/home/fred/Images/d225_v4/'
        path_pdf = '/media/fred/TOSHIBA/Images/v4/'
        path_png = '/media/fred/TOSHIBA/Images/d225_v4/'
        hugin_path_projet = '/media/fred/TOSHIBA/Images/d225_v4/'
        hugin_final = 'Assemblage_225'
    elif resolution == 300:
        #path_pdf = '/home/fred/Images/v4/'
        #path_png = '/home/fred/Images/d300_v5/'
        #hugin_path_projet = '/home/fred/Images/d300_v5/'
        path_pdf = '/media/fred/TOSHIBA/Images/v4/'
        path_png = '/media/fred/TOSHIBA/Images/d300_v4/'
        hugin_path_projet = '/media/fred/TOSHIBA/Images/d300_v4/'
        hugin_final = 'Assemblage_300'
    elif resolution == 450:
        #path_pdf = '/home/fred/Images/v4/'
        #path_png = '/home/fred/Images/d450_v5/'
        #hugin_path_projet = '/home/fred/Images/d450_v5/'
        path_pdf = '/media/fred/TOSHIBA/Images/v4/'
        path_png = '/media/fred/TOSHIBA/Images/d450_v4/'
        hugin_path_projet = '/media/fred/TOSHIBA/Images/d450_v4/'
        hugin_final = 'Assemblage_450'
    elif resolution == 600:
        #path_pdf = '/home/fred/Images/v4/'
        #path_png = '/home/fred/Images/d600_v5/'
        #hugin_path_projet = '/home/fred/Images/d600_v5/'
        path_pdf = '/media/fred/TOSHIBA/Images/v4/'
        path_png = '/media/fred/TOSHIBA/Images/d600_v4/'
        hugin_path_projet = '/media/fred/TOSHIBA/Images/d600_v4/'
        hugin_final = 'Assemblage_600'
    else:
        path_pdf = '/home/fred/Images/v4/'
        path_png = '/home/fred/Images/d150_v4/'
        hugin_path_projet = '/home/fred/Images/d150_v4/'
        hugin_final = 'Assemblage_150'

    kml_commandes = '04_pva.sql'
    emprise.genere_script_kml(kml_commandes, hugin_path_projet, hugin_final, resolution)

    im_commandes = '07_imagemagick.sh'
    emprise.genere_script_imagemagick(im_commandes, path_pdf, path_png, resolution)

    hugin_commandes = '08_lance_hugin_01.sh'
    emprise.genere_script_hugin_1(hugin_commandes, hugin_path_projet, hugin_final, resolution)
    hugin_commandes = '09_lance_hugin_02.sh'
    emprise.genere_script_hugin_2(hugin_commandes, hugin_path_projet, hugin_final, resolution)
    hugin_commandes = '10_lance_hugin_03.sh'
    emprise.genere_script_hugin_3(hugin_commandes, hugin_path_projet, hugin_final, resolution)

def main():
    #print('main')
    emprise_1 = set_of_tiles(1125, 815)
    emprise_1.init_from_extend(-141375, 5798785, -119999, 5812641)
    #print(emprise_1.items[2].nom_yx)
    #print('id = {}, nom = {}'.format(emprise_1.dalle_centre_i, emprise_1.items[emprise_1.dalle_centre_i].nom_yx))
    # Utilisation
    # affichage d'une information
    print('x_indice_all_max = {}'.format(emprise_1.x_indice_all_max))
    print('y_indice_all_max = {}'.format(emprise_1.y_indice_all_max))
    print('i_indice_all_max = {}'.format(emprise_1.i_indice_all_max))

    #print('affichage all : id     = {}'.format(emprise_1.all_centre_i))
    #print('affichage all : nom_yx = {}'.format(emprise_1.items[emprise_1.all_centre_i].nom_yx))
    #print('affichage all : all_centre_x_indice = {}'.format(emprise_1.all_centre_x_indice))
    #print('affichage all : all_centre_y_indice = {}'.format(emprise_1.all_centre_y_indice))

    # On va extraire, parmi les dalles précedentes,
    # uniquement les dalles dont les indice_x et indice_y sont les suivants
    emprise_1.extract(0, 19, 0, 17)     # pour la totalite (_v4)
    #emprise_1.extract(8, 15, 8, 15)   # pour 300_v5
    #emprise_1.extract(11, 12, 11, 12)   # pour 300_v6
    #emprise_1.extract(10, 12, 10, 12)   # pour 600_v5
    #print('x_indice_extract_max = {}, y_indice_extract_max = {}'.format(emprise_1.x_indice_extract_max, emprise_1.y_indice_extract_max))
    #print('affichage extract : id     = {}'.format(emprise_1.extract_centre_i))
    print('x_indice_extract_max = {}'.format(emprise_1.x_indice_extract_max))
    print('y_indice_extract_max = {}'.format(emprise_1.y_indice_extract_max))
    print('i_indice_extract_max = {}'.format(emprise_1.i_indice_extract_max))
    #print('affichage extract : nom_yx = {}'.format(emprise_1.items[emprise_1.extract_centre_i].nom_yx))
    #print('affichage extract : extract_centre_x_indice = {}'.format(emprise_1.extract_centre_x_indice))
    #print('affichage extract : extract_centre_y_indice = {}'.format(emprise_1.extract_centre_y_indice))
    #print('affichage extract : nom_yx = {}'.format(emprise_1.items[emprise_1.extract_centre_i].nom_yx))
    genere_scripts(emprise_1, 300)

if __name__ == '__main__':
    main()
