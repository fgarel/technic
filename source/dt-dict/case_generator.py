#!/usr/bin/env python
# coding=utf-8

# A simple demonstration of to generate a PDF using a QGIS project
# and a QGIS layout template.
#
# This code is public domain, use if for any purpose you see fit.
# Tim Sutton 2015

#import sys
import subprocess
import re
#from decimal import Decimal

gui_flag = True


# Probably you want to tweak this
project_path = 'project.qgs'
project_path = '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/test_gml4326.qgs'
project_path = '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/dt-dict.qgs'


# and this
template_path = 'template.qpt'
template_path = '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/templateComposition.qpt'
template_path = '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/folio_A3_200.qpt'

report_path = '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/report.pdf'

def bbox(shapefileName):
    '''
    fournit la bounding box d'un fichier shape
    '''
    coucheName = re.sub('\.shp', '', shapefileName)
    p1 = subprocess.Popen(["ogrinfo", shapefileName, coucheName], stdout=subprocess.PIPE)
    #p1 = subprocess.Popen(["ogrinfo","empriseDeclarationQgis3946.shp", "empriseDeclarationQgis3946"], stdout=subprocess.PIPE)
    #p2 = subprocess.Popen(["grep", "Extent"], stdin=p1.stdout)
    p2 = subprocess.Popen(["grep", "Extent"], stdin=p1.stdout, stdout=subprocess.PIPE)
    p1.stdout.close()
    # p2.communicate renvoit un tuple : on ne prend que le 1er element
    chaine = p2.communicate()[0]
    splitchaine = chaine.split(' ')
    #print splitchaine

    xMin = re.sub('\(', '', splitchaine[1])
    xMin = re.sub(',', '', xMin)
    xMax = re.sub('\(', '', splitchaine[4])
    xMax = re.sub(',', '', xMax)
    yMin = re.sub('\)', '', splitchaine[2])
    yMax = re.sub('\)', '', splitchaine[5])
    yMax = re.sub('\n', '', yMax)
    print "xMin = ", xMin, " ; xMax = ", xMax, " ; yMin = ", yMin, " ; yMax = ", yMax
    bbox = [xMin, xMax, yMin, yMax]
    return bbox
    #template_file = file(template_path)
    #template_content = template_file.read()
    #template_file.close()

def caseFromPoint(x, y, largeur, hauteur):
    '''
    fournit la bounding box de la case qui contient le point
    '''
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
    bbox = [xBG, xHD, yBG, yHD]
    return bbox

def caseFromBBox(bbox, largeur, hauteur):
    '''
    fournit la bounding box (finale) des cases qui contiennent la bbox (initiale)
    la bounding box finale est accrochée à la grille dont les pas
    sont donnés en paramètre
    '''
    mybbox_BG = caseFromPoint(mybbox[0], mybbox[2], largeur, hauteur)
    mybbox_HD = caseFromPoint(mybbox[1], mybbox[3], largeur, hauteur)

    bbox = [mybbox_BG[0], mybbox_HD[1], mybbox_BG[2], mybbox_HD[3]]
    #print "xBG = ", mybbox_BG_350x250[0], " ; xHD = ", mybbox_HD_350x250[1], " ; yBG = ", mybbox_BG_350x250[2], " ; yHD = ", mybbox_HD_350x250[3]
    return bbox

if __name__ == '__main__':
    mybbox = bbox("empriseDeclarationQgis3946.shp")
    print mybbox
    #mybbox_BG_350x250 = caseFromPoint(mybbox[0], mybbox[2], 350, 250)
    #mybbox_HD_350x250 = caseFromPoint(mybbox[1], mybbox[3], 350, 250)
    #print "xBG = ", mybbox_BG_350x250[0], " ; xHD = ", mybbox_HD_350x250[1], " ; yBG = ", mybbox_BG_350x250[2], " ; yHD = ", mybbox_HD_350x250[3]
    mybbox_350x250 = caseFromBBox(mybbox, 350, 250)
    print "350x250", mybbox_350x250
    mybbox_140x100 = caseFromBBox(mybbox, 140, 100)
    print "140x100", mybbox_140x100
