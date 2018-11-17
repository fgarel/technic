#!/usr/bin/env python3
# -*- coding: utf-8 -*-

u"""
Outil pour lire un xml et enregistrer les infos dans une table postgresql

Creation d'un environnement python3
# mise à jour de pip, mais juste au niveau utilisateur pour
# pas casser le systeme
python -m pip install pip --upgrade --user
# installation de pipenv
python -m pip install pipenv --user

# utilisation de pipenv
pipenv shell

# cf sam et max

# installation de lxml
pip install lxml
pip install ogrtools

# pour l'install de gdal, necessaire pour ogr, nous avons un souci de librairie
# https://gis.stackexchange.com/questions/28966/python-gdal-package-missing-header-file-when-installing-via-pip
sudo apt-get install libgdal-dev
pip install
export CPLUS_INCLUDE_PATH=/usr/include/gdalgdal
export C_INCLUDE_PATH=/usr/include/gdal

pip install gdal==2.2.4
pip install pygdal=2.2.3.3
"""

class Convertisseur(object):
    u"""
    Classe d'objet dont l'objectif est de fournir un convertisseur
    """

    def __init__(self):
        u"""
        Méthode pour initialiser l'objet.

        Lorque l'objet est instancié, c'est cette méthode qui est executée.

        """
        self.aecrire = ''


    def Adresses(self, inFile, outFile):
        u"""
        lit et écrit un fichier.

        """
        f = open(outFile, 'w')
        f.write(self.aecrire)
        f.close()


    def VoiesLieuxDits(self, inFile, outFile):
        u"""
        lit et écrit un fichier.

        """
        f = open(outFile, 'w')
        f.write(self.aecrire)
        f.close()


def main():
    u"""
    Programme principal.

    Ce script peut etre :
    - autonome : il s'utilise alors ainsi
      python ./99_stetl_ban_to_ban.py ../data/extraction_ban_csv/ ../data/a_transferer_ban_csv/

    Quand il est utilisé en ligne de commande, ce script prend donc en entrée
    un fichier xml modele, et plusieurs manipulations successives sont réalisées
    sur ce fichier de départ.

    """

    __myLecteur = Convertisseur()
    __myLecteur.Adresses("../data/extraction_ban_csv/adresse_opendata.csv", \
                         "../data/a_transferer_ban_csv/Adresses.csv")
    __myLecteur.VoiesLieuxDits("../data/extraction_ban_csv/troncon_de_route.csv", \
                               "../data/a_transferer_ban_csv/VoiesLieuxDits.csv")

if __name__ == '__main__':
    main()
