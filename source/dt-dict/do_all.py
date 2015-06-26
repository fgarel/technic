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
#p1 = subprocess.subprocess.call(
#     "./pdf2txt.sh",
#     shell=True)


# generation des cases
# ./case_generator.py
p2 = subprocess.call(
    "./caseFabric.py -f empriseDeclarationQgis3946.shp 2> /dev/null",
    shell=True)

# generation des plans
##rm report.pdf
##ipython pdf_generator.py
##display report.pdf
p3 = subprocess.call(
    "./pdfFabricAll.py -f A4 -F A3 -n 10",
    shell=True)



