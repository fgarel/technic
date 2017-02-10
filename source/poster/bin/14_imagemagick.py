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
    print('{}'.format(image))
    if re.search('.pdf', image):
        print('   {}'.format(image))
        image = re.sub(r'.pdf',
                       r'',
                       image)
        print('   {}'.format(image))
        #f.write('identify {}.png\n'.format(image))
        #f.write('convert -density 300 -gravity Center -shave \'045x049\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_v2.png\n'.format(chemin_des_images, image))
        f.write('convert -density 300 -gravity Center -shave \'045x165\' -level +0%,+100%,1.5 {0}{1}.pdf {0}{1}_v2.png\n'.format(chemin_des_images, image))
f.close()

st = os.stat(fichier_a_executer)
os.chmod(fichier_a_executer, st.st_mode | stat.S_IEXEC)
