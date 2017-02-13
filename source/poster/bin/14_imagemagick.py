#!/usr/bin/env python3
# coding: utf-8


import os
import stat
import re

fichier_a_executer = '15_imagemagick.sh'
chemin_des_images = '/home/fred/Images/v4/'


list_image = os.listdir(chemin_des_images)
#print('{}'.format(list_image))

f = open(fichier_a_executer, 'w')
#print(''.format())
f.write('#!/bin/sh\n')
for image in list_image:
    #print('{}'.format(image))
    if re.search('.pdf', image):
        #print('   {}'.format(image))
        image = re.sub(r'.pdf',
                       r'',
                       image)
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
        f.write('convert -density 150 -gravity Center -shave \'256x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_256_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'512x090\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_512_090.png\n'.format(chemin_des_images, image))
        """
        f.write('convert -density 150 -gravity Center -shave \'045x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_045_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'220x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_220_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'230x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_230_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'240x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_240_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'220x085\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_220_085.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'230x085\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_230_085.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'240x085\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_240_085.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'220x105\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_220_105.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'230x105\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_230_105.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'240x105\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_240_105.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'250x105\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_250_105.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'220x110\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_220_110.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'230x110\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_230_110.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'240x110\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_240_110.png\n'.format(chemin_des_images, image))
        f.write('convert -density 150 -gravity Center -shave \'250x110\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d150_250_110.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'045x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_045_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'045x165\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_045_165.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'045x205\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_045_205.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'045x245\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_045_245.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'045x265\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_045_265.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'505x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_505_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'505x165\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_505_165.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'505x205\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_505_205.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'505x245\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_505_245.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'505x265\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_505_265.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'525x045\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_525_045.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'525x165\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_525_165.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'525x205\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_525_205.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'525x245\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_525_245.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'525x265\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_d300_525_265.png\n'.format(chemin_des_images, image))
        """
f.close()

st = os.stat(fichier_a_executer)
os.chmod(fichier_a_executer, st.st_mode | stat.S_IEXEC)
