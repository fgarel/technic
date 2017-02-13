#!/usr/bin/env python3
# coding: utf-8


import os
import stat
import re

fichier_commandes_im_a_executer_150 = '15_imagemagick_150.sh'
fichier_commandes_im_a_executer_300 = '15_imagemagick_300.sh'
fichier_commandes_hugin_a_executer_150 = '16_lance_hugin_150.sh'
fichier_commandes_hugin_a_executer_300 = '16_lance_hugin_300.sh'
chemin_des_pdf = '/media/fred/TOSHIBA/Images/v4/'
chemin_des_pdf = '/home/fred/Images/v5/'
chemin_des_images_150 = '/media/fred/TOSHIBA/Images/d150_v4/'
chemin_des_images_300 = '/media/fred/TOSHIBA/Images/d300_v4/'
chemin_des_images_150 = '/home/fred/Images/d150_v5/'
chemin_des_images_300 = '/home/fred/Images/d300_v5/'
parametre_hugin_prefix_150='Assemblage_150'
parametre_hugin_prefix_300='Assemblage_300'
parametre_hugin_fov=10


list_pdf = os.listdir(chemin_des_pdf)


# debut de fichier commun au deux scripts
fcim_150 = open(fichier_commandes_im_a_executer_150, 'w')
fcim_150.write('#!/bin/sh\n\n')
fcim_300 = open(fichier_commandes_im_a_executer_300, 'w')
fcim_300.write('#!/bin/sh\n\n')
fchugin_150 = open(fichier_commandes_hugin_a_executer_150, 'w')
fchugin_150.write('#!/bin/sh\n\n')
fchugin_300 = open(fichier_commandes_hugin_a_executer_300, 'w')
fchugin_300.write('#!/bin/sh\n\n')

fchugin_150.write('# script vu sur cette page\n')
fchugin_150.write('# Hugin tutorial - Stitching flat scanned images\n')
fchugin_150.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
fchugin_150.write('\n')
fchugin_150.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
fchugin_150.write('\n')
fchugin_150.write('Prefix={}\n'.format(parametre_hugin_prefix_150))
fchugin_150.write('FOV={}\n'.format(parametre_hugin_fov))
fchugin_150.write('\n')
fchugin_150.write('# initialisation du projet avec les differeentes images\n')
fchugin_150.write('pto_gen --projection=0 --fov=$FOV -o {0}/project.pto {0}/*.png\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_150.write('# creation des objectifs (1 par pva)\n')
fchugin_150.write('pto_lensstack -o {}/project1.pto \\\n'.format(chemin_des_images_150))

fchugin_300.write('# script vu sur cette page\n')
fchugin_300.write('# Hugin tutorial - Stitching flat scanned images\n')
fchugin_300.write('# http://hugin.sourceforge.net/tutorials/scans/en.shtml\n')
fchugin_300.write('\n')
fchugin_300.write('# http://wiki.panotools.org/Panorama_scripting_in_a_nutshell\n')
fchugin_300.write('\n')
fchugin_300.write('Prefix={}\n'.format(parametre_hugin_prefix_300))
fchugin_300.write('FOV={}\n'.format(parametre_hugin_fov))
fchugin_300.write('\n')
fchugin_300.write('# initialisation du projet avec les differeentes images\n')
fchugin_300.write('pto_gen --projection=0 --fov=$FOV -o {0}/project.pto {0}/*.png\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_300.write('# creation des objectifs (1 par pva)\n')
fchugin_300.write('pto_lensstack -o {}/project1.pto \\\n'.format(chemin_des_images_300))

compteur = 0

for fichier_pdf in list_pdf:
    #print('{}'.format(image))
    if re.search('.pdf', fichier_pdf):
        #print('   {}'.format(image))
        compteur += 1
        image = re.sub(r'.pdf',
                       r'',
                       fichier_pdf)
        #print('   {}'.format(image))
        #f.write('identify {}.png\n'.format(image))
        #f.write('convert -density 300 -gravity Center -shave \'045x049\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_v2.png\n'.format(chemin_des_images, image))
        for x in range(254, 257, 2):
            for y in range(44, 47, 2):
                #f.write('convert -density 150 -gravity Center -shave \'{2}x{3}\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_{2}_{3}.png\n'.format(chemin_des_images, image, x, y))
                pass
        for x in range(508, 513, 2):
            for y in range(88, 93, 2):
                #f.write('convert -density 300 -gravity Center -shave \'{2}x{3}\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_{2}_{3}.png\n'.format(chemin_des_images, image, x, y))
                pass
        fcim_150.write('convert -density 150 -gravity Center -shave \'256x045\' -level +0%,+100%,1.5 {0}{1}.pdf {2}{1}_d150_256_045.png\n'.format(chemin_des_pdf, image, chemin_des_images_150))
        fcim_300.write('convert -density 300 -gravity Center -shave \'512x090\' -level +0%,+100%,1.5 {0}{1}.pdf {2}{1}_d300_512_090.png\n'.format(chemin_des_pdf, image, chemin_des_images_300))

        fchugin_150.write('              --new-lens i{} \\\n'.format(compteur))
        fchugin_300.write('              --new-lens i{} \\\n'.format(compteur))


fcim_150.close()
fcim_300.close()

fchugin_150.write('              {}/project.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_300.write('              {}/project.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_150.write('# personnalisation des paramètres\n')
fchugin_300.write('# personnalisation des paramètres\n')

#  ### http://hugin.sourceforge.net/docs/manual/Pto_var.html
#

# countx = 0
# county = 0
# for x in range(1, 20):
#     countx += 1
#     county = 0
#     for y in range(1, 18):
#         county += 1

fchugin_150.write('# recherche des points de controle\n')
fchugin_150.write('cpfind -o {0}/project2.pto --multirow {0}/project1.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_150.write('# nettoyage des points de controle\n')
fchugin_150.write('cpclean -o {0}/project3.pto {0}/project2.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_150.write('# recherche des lignes\n')
fchugin_150.write('linefind -o {0}/project4.pto {0}/project3.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_150.write('# personnalisation des paramètres\n')
#fchugin.write('ptovariable --translations --response --exposure --roll -o {0}/setoptim.pto {0}/project4.pto\n'.format(chemin_des_images_150))
fchugin_150.write('pto_var --opt r,d,e,!r0,!d0,!e0 -o {0}/setoptim.pto {0}/project4.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_150.write('# optimisation\n')
fchugin_150.write('autooptimiser -n -o {0}/autoptim.pto {0}/setoptim.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_150.write('# ajustement\n')
fchugin_150.write('pano_modify --projection=0 --fov=AUTO --center --canvas=AUTO --crop=AUTO -o {0}/autoptim2.pto {0}/autoptim.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')
fchugin_150.write('# fabrication d un makfile et lancement du makefile, remplacé par hugin_excutor\n')
fchugin_150.write('hugin_executor -t 2 -s -p {0}/$Prefix {0}/autoptim2.pto\n'.format(chemin_des_images_150))
fchugin_150.write('\n')


fchugin_300.write('# recherche des points de controle\n')
fchugin_300.write('cpfind -o {0}/project2.pto --multirow {0}/project1.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_300.write('# nettoyage des points de controle\n')
fchugin_300.write('cpclean -o {0}/project3.pto {0}/project2.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_300.write('# recherche des lignes\n')
fchugin_300.write('linefind -o {0}/project4.pto {0}/project3.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_300.write('# personnalisation des paramètres\n')
#fchugin.write('ptovariable --translations --response --exposure --roll -o {0}/setoptim.pto {0}/project4.pto\n'.format(chemin_des_images_150))
fchugin_300.write('pto_var --opt r,d,e,!r0,!d0,!e0 -o {0}/setoptim.pto {0}/project4.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_300.write('# optimisation\n')
fchugin_300.write('autooptimiser -n -o {0}/autoptim.pto {0}/setoptim.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_300.write('# ajustement\n')
fchugin_300.write('pano_modify --projection=0 --fov=AUTO --center --canvas=AUTO --crop=AUTO -o {0}/autoptim2.pto {0}/autoptim.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')
fchugin_300.write('# fabrication d un makfile et lancement du makefile, remplacé par hugin_excutor\n')
fchugin_300.write('hugin_executor -t 2 -s -p {0}/$Prefix {0}/autoptim2.pto\n'.format(chemin_des_images_300))
fchugin_300.write('\n')

fchugin_150.close()
fchugin_300.close()

st = os.stat(fichier_commandes_im_a_executer_150)
os.chmod(fichier_commandes_im_a_executer_150, st.st_mode | stat.S_IEXEC)

st = os.stat(fichier_commandes_im_a_executer_300)
os.chmod(fichier_commandes_im_a_executer_300, st.st_mode | stat.S_IEXEC)

st = os.stat(fichier_commandes_hugin_a_executer_150)
os.chmod(fichier_commandes_hugin_a_executer_150, st.st_mode | stat.S_IEXEC)

st = os.stat(fichier_commandes_hugin_a_executer_300)
os.chmod(fichier_commandes_hugin_a_executer_300, st.st_mode | stat.S_IEXEC)
