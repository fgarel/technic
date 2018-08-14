#!/usr/bin/env python3
# -*- coding: utf-8 -*-

u"""
Outil pour remplir le recepisse

Creation d'un environnement python3
# mise à jour de pip, mais juste au niveau utilisateur pour
# pas casser le systeme
python -m pip install pip --upgrade --user
# installation de pipenv
python -m pip install pipenv --user

# utilisation de pipenv
pipenv shell

# cf sam et max

"""

"""
***************************************************************************
    02_casePrepare.py
    ---------------------
    Date                 : January 2018
    Copyright            : (C) 2018-2018 La Rochelle,
                           http://www.ville-larochelle.fr
***************************************************************************
*                                                                         *
*   This program is free software; you can redistribute it and/or modify  *
*   it under the terms of the GNU General Public License as published by  *
*   the Free Software Foundation; either version 2 of the License, or     *
*   (at your option) any later version.                                   *
*                                                                         *
***************************************************************************
"""

__author__ = 'Frédéric Garel'
__date__ = 'January 2018'
__copyright__ = '(C) 2018-2018 La Rochelle, http://www.ville-larochelle.fr'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'


import subprocess

class EcrivainPdf(object):
    u"""
    Classe d'objet dont l'objectif principal est de remplir un recepisse pdf

    .

    """

    def __init__(self, parametres):
        u"""
        Méthode pour initialiser l'objet.

        Lorque l'objet est instancié, c'est cette méthode qui est executée.

        """
        self.dict_fieldName_fieldValue = parametres.dict_fieldName_fieldValue


    def FabriqueFdf(self, inFile, outFile):
        u"""
        Ecrit les informations à écrire dans un fichier FDF.

        Ce fichier FDF sera ensuite lu par l'utilitaire pdftk pour rempir le pdf

        """

        # Dans un premier temps, on fabrique le fichier body
        f = open(inFile, 'w')

        chaine = ''
        #chaine = chaine + f'<< /T({FIELD_NAME})/V({FIELD_VALUE}) >>\n'
        for fieldName, fieldValue in self.dict_fieldName_fieldValue.items():
            #print(f'Name = {fieldName} ; Value = {fieldValue}')
            chaine = chaine + f'<< /T({fieldName})/V({fieldValue}) >>\n'

        #print(f'{chaine}')
        f.write(chaine)

        f.close()


        # Dans un second temps, on fabrique le fichier fdf Total,
        # C'est à dire que nous concatenons Header Body et Footer
        f = open(outFile, 'w')

        with open('./headerFdf.fdf') as fi:
            read_data = fi.read()
            f.write(read_data)
        with open(inFile) as fi:
        #with open("../data/bodyFdf2.fdf", encoding="ISO-8859-1") as fi:
            read_data = fi.read()
            #print(f'{read_data}')
            f.write(read_data)
        with open('./footerFdf.fdf') as fi:
            read_data = fi.read()
            f.write(read_data)

        f.close()


    def RemplitPdfAvecFdf(self, inFile, outFile):
        u"""

        """

        # on encode avec le bon encodage...
        p1 = subprocess.Popen(["cat", inFile],
                              stdout=subprocess.PIPE
                              #,encoding="utf-8"
                              )
        p2 = subprocess.Popen(['iconv', "-f", "utf-8",
                                        "-t", "latin1",
                                        "-"],
                              stdin=p1.stdout,
                              stdout=subprocess.PIPE
                              #,encoding="latin1"
                              )
        p1.stdout.close()
        p3 = subprocess.Popen(["tee",
                               "../data/totalFdf2.fdf"],
                              stdin=p2.stdout,
                              stdout=subprocess.PIPE
                              #,encoding="latin1"
                              )
        p2.stdout.close()
        p3.wait()

        # puis on remplit le pdf
        subprocess.call(
            ['pdftk', "../data/cerfa_14435-03.pdf",
                      "fill_form", "../data/totalFdf2.fdf",
                      "output", outFile],
            shell=False)



def main():
    u"""
    Programme principal.

    Ce script peut etre :
    - autonome : il s'utilise alors ainsi
      python ./TestRecepisse_FillPdf.py ../data/cerfa_14435-03.pdf

    Quand il est utilisé en ligne de commande, ce script prend donc en entrée
    un fichier pdf modele, et plusieurs manipulations successives sont réalisées
    sur ce fichier de départ.

    """
    import parametresRecepisse

    __myParametres = parametresRecepisse.ParametresRecepisse()

    __myEcrivain = EcrivainPdf(__myParametres)
    __myEcrivain.FabriqueFdf('../data/bodyFdf.fdf', '../data/totalFdf.fdf')
    __myEcrivain.RemplitPdfAvecFdf('../data/totalFdf.fdf', '../data/recepisse.pdf')


if __name__ == '__main__':
    main()
