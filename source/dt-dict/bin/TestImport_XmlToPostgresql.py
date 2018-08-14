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


import warnings
#warnings.filterwarnings("always")
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
#warnings.filterwarnings("ignore", message="numpy.ndarray size changed")
import sys
import re
import lxml.etree as et
#from ogrtools.pyogr import ogr2ogr
import subprocess
#import osgeo


class LecteurXml(object):

    u"""
    Classe d'objet dont l'objectif principal est de lire un fichier xml

    .

    """

    def __init__(self):
        u"""
        Méthode pour initialiser l'objet.

        Lorque l'objet est instancié, c'est cette méthode qui est executée.

        """
        self.noConsultationDuTeleservice = ''
        self.dateDeLaDeclaration = ''
        self.courrielDemandeur = ''
        self.geometrie = ''
        self.tailleDesPlans = ''


    def ReadWrite(self, inFile, outFile):
        u"""
        lit et écrit un fichier xml.

        """
        # Lecture du fichier SVG (comme un XML) en entree
        tree = et.parse(inFile)
        # Mise en memoire
        root = tree.getroot()

        #for element in root.iter('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}dossierConsultation'):
        #    print(f'root.iter {element.tag} {element.attrib}')
        #    if element.findall('./dtDictConjointes'):
        #        print(f'dtDictConjointes {element}')


        for element in root.iter():
            #print(f'root.iter=>{element.tag}=>{element.text}')
            for el in element.findall('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}noConsultationDuTeleservice'):
                #print(f'{element.tag}=>deb{element.text}fin=>{el.tag}=>{el.text}')
                self.noConsultationDuTeleservice = el.text
            for el in element.findall('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}noConsultationDuTeleserviceSeize'):
                #print(f'{element.tag}=>deb{element.text}fin=>{el.tag}=>{el.text}')
                self.noConsultationDuTeleservice = el.text

            for el in element.findall('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}dateDeLaDeclaration'):
                #print(f'{element.tag}=>deb{element.text}fin=>{el.tag}=>{el.text}')
                self.dateDeLaDeclaration = el.text

            for el in element.findall('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}representantDuResponsableDeProjet/{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}courriel'):
                #print(f'representantDuResponsableDeProjet=>{element.tag}=>deb{element.text}fin=>{el.tag}=>{el.text}')
                self.courrielDemandeur = el.text

            for el in element.findall('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}executantDesTravaux/{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}courriel'):
                #print(f'Executant=>{element.tag}=>deb{element.text}fin=>{el.tag}=>{el.text}')
                self.courrielDemandeur = el.text

            for el in element.findall('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}emprise/{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}geometrie'):
                #print(f'{element.tag}=>deb{element.text}fin=>{el.tag}=>{el.text}')
                self.geometrie = et.tostring(el)
                #print(f'{et.tostring(el)}')

            for el in element.findall('{http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.2}tailleDesPlans'):
                #print(f'{element.tag}=>deb{element.text}fin=>{el.tag}=>{el.text}')
                self.tailleDesPlans = el.text

        # Ecriture du fichier en sortie
        #print(f'{self.noConsultationDuTeleservice}|{self.dateDeLaDeclaration}|{self.courrielDemandeur}|{self.tailleDesPlans}')
        #print(f'{self.geometrie}')

        #tree.write(outFile)
        f = open(outFile, 'w')
        f.write(self.geometrie.decode("utf-8"))
        f.close()


    def WriteGeometrie(self, inFile, outFile):
        u"""
        lit et écrit la geometrie de l'emprise des travaux dans un fichier gml.

        """
        f = open(outFile, 'w')

        with open('./header4171.gml') as fi:
            read_data = fi.read()
            chaine = 'fid="' + self.noConsultationDuTeleservice + '"'
            chaine = chaine + ' ' + 'noConsultationDuTeleservice="' + self.noConsultationDuTeleservice + '"'
            chaine = chaine + ' ' + 'dateDeLaDeclaration="' + self.dateDeLaDeclaration + '"'
            chaine = chaine + ' ' + 'courrielDemandeur="' + self.courrielDemandeur + '"'
            chaine = chaine + ' ' + 'tailleDesPlans="' + self.tailleDesPlans + '"'
            read_data = re.sub(r"fid=\"emprise\"", chaine, read_data)
            f.write(read_data)
        with open(inFile) as fi:
            read_data = fi.read()
            f.write(read_data)
        with open('./footer4171.gml') as fi:
            read_data = fi.read()
            f.write(read_data)

        f.close()

    def GmlToPostgresql(self, inFile):
        u"""
        """
        #subprocess.call(
        #    "rm document1.pdf",
        #    shell=True)

        subprocess.call(
            ['ogr2ogr', "-skipfailures",
                        "-progress",
                        "-overwrite",
                        "-s_srs", "EPSG:4171",
                        "-t_srs", "EPSG:3946",
                        "-a_srs", "EPSG:3946",
                        "-f", "PostgreSQL",
                        "PG:host=pg.cdalr.fr port=5432 dbname=dbworkspace user=fred password=fgpass",
                        "../data/_sample/EmpriseDeclaration.gml",
                        "-nln", "pcrs.EmpriseDeclaration"],
            shell=False)

        #wkt = "POINT (1120351.5712494177 741921.4223245403)"
        #point = osgeo.ogr.CreateGeometryFromWkt(wkt)
        #print(f'{point.GetX()},{point.GetY()}')
        #print "%d,%d" % (point.GetX(), point.GetY())

        #ogr2ogr.main(["","-f", "-s_srs", "EPSG:4171", "-t_srs", "EPSG:3946", "-a_srs", "EPSG:3946", "PostgreSQL", "PG:\"host=pg.cdalr.fr port=5432 dbname=dbworkspace user=fred password=fgpass\"", "../data/_sample/EmpriseDeclaration.gml", "-nln", "pcrs.\"EmpriseDeclaration\""])

def main():
    u"""
    Programme principal.

    Ce script peut etre :
    - autonome : il s'utilise alors ainsi
      python ./TestImport_XmlToPostgresql.py ../data/_sample/direct_vlr_2018080100424T_DDC_description.xml

    Quand il est utilisé en ligne de commande, ce script prend donc en entrée
    un fichier xml modele, et plusieurs manipulations successives sont réalisées
    sur ce fichier de départ.

    """

    __myLecteur = LecteurXml()

    try:
        # Premier parametre : le nom du fichier svg a traiter (fichier template)
        # le fichier en entrée doit respecter quelques caractéristiques,
        # par exemple, son nom doit finir par le suffixe _original.svg
        fichierEntree = str(sys.argv[1])
    except:
        print("Ce script s'utilise ainsi :")
        print("python3 ./TestImport_XmlToPostgresql.py ../data/_sample/direct_vlr_2018080100424T_DDC_description.xml")
        print("python3 ./TestImport_XmlToPostgresql.py ../data/_sample/dictservices_air_17321626_RE7-1800365-2018G062-DT-15452005.xml")
        return

    cheminEntree = '/'.join(fichierEntree.split('/')[0:-1]) + '/'
    cheminSortie = cheminEntree
    fichierEntreeSansChemin = fichierEntree.split('/')[-1]
    fichierSortieSansChemin = re.sub(r'_description', r'_output', fichierEntreeSansChemin)
    fichierEntree = cheminEntree + fichierEntreeSansChemin
    fichierSortie = cheminSortie + fichierSortieSansChemin
    print("Fabrication du fichier de sortie => {}".format(fichierSortie))

    #__myLecteur.ReadWrite(fichierEntree, fichierSortie)
    __myLecteur.ReadWrite(fichierEntree, "../data/_sample/body4171.gml")
    __myLecteur.WriteGeometrie("../data/_sample/body4171.gml", "../data/_sample/EmpriseDeclaration.gml")
    __myLecteur.GmlToPostgresql("../data/_sample/EmpriseDeclaration.gml")


if __name__ == '__main__':
    main()
