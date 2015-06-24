#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
Du pdf initial vers des plans pdf finaux.

Script permettant d'enchainer la lecture du pdf initial
et la génération des plans pdf finaux.

"""

import subprocess

# recuperation de l'emprise geographique d'un declaration,
# en lisant le fichier pdf (document.pdf)

##./pdf2txt.sh
#x = subprocess.Popen(["./pdf2txt.sh"],
#                     stdout=subprocess.PIPE,
#                     stderr=subprocess.PIPE)
#print "code retour:", x.wait()


# generation des cases
# ./case_generator.py
p1 = subprocess.call(
    "./caseFabric.py -f empriseDeclarationQgis3946.shp 2> /dev/null",
    shell=True)

# generation des plans
##rm report.pdf
##ipython pdf_generator.py
##display report.pdf
#./pdfFabric.py -f A3 -e 200 -t case 2> /dev/null

# plan de situation
nb_folio_A4_00200_case = subprocess.call(
    "./pdfFabric.py -f A4 -e 200 -t case -s 2> /dev/null",
    shell=True)
print "A4_00200_case : " + str(nb_folio_A4_00200_case)

# cases
#nb_folio_A4_00200_case = subprocess.call(
#    "./pdfFabric.py -f A4 -e 200 -t case -s 2> /dev/null",
#    shell=True)
#print "A4_00200_case : " + str(nb_folio_A4_00200_case)
nb_folio_A3_00200_case = subprocess.call(
    "./pdfFabric.py -f A3 -e 200 -t case -s 2> /dev/null",
    shell=True)
print "A3_00200_case : " + str(nb_folio_A3_00200_case)
nb_folio_A2_00200_case = subprocess.call(
    "./pdfFabric.py -f A2 -e 200 -t case -s 2> /dev/null",
    shell=True)
print "A2_00200_case : " + str(nb_folio_A2_00200_case)
nb_folio_A1_00200_case = subprocess.call(
    "./pdfFabric.py -f A1 -e 200 -t case -s 2> /dev/null",
    shell=True)
print "A1_00200_case : " + str(nb_folio_A1_00200_case)
nb_folio_A0_00200_case = subprocess.call(
    "./pdfFabric.py -f A0 -e 200 -t case -s 2> /dev/null",
    shell=True)
print "A0_00200_case : " + str(nb_folio_A0_00200_case)

# plan de situation
nb_folio_A3_00200_situation = subprocess.call(
    "./pdfFabric.py -f A3 -e 200 -t situation 2> /dev/null",
    shell=True)
print "A3_00200_situation : " + str(nb_folio_A3_00200_situation)
nb_folio_A2_00200_situation = subprocess.call(
    "./pdfFabric.py -f A2 -e 200 -t situation 2> /dev/null",
    shell=True)
print "A2_00200_situation : " + str(nb_folio_A2_00200_situation)
nb_folio_A1_00200_situation = subprocess.call(
    "./pdfFabric.py -f A1 -e 200 -t situation 2> /dev/null",
    shell=True)
print "A1_00200_situation : " + str(nb_folio_A1_00200_situation)
nb_folio_A0_00200_situation = subprocess.call(
    "./pdfFabric.py -f A0 -e 200 -t situation 2> /dev/null",
    shell=True)
print "A0_00200_situation : " + str(nb_folio_A0_00200_situation)
