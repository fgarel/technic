#!/usr/bin/env python3
# -*- coding: utf-8 -*-

u"""
Génération d'un tableau des valeurs de la BB d'un polygone en fct de sa rotation.

Nous faisons tourner un objet surfacique (polygone) de -100 grades à + 100 gradesself.
Pour cahque position, nous enrgistrons les informations sur la Bounding box, c'est à
Longueur, Largeur, surface de la Bounging Box, les sous-polygones entre
le polygone initial 'empriseTravaux' et sa Bounding boxself.

Largement inspiré de :
http://geopandas.readthedocs.io/en/latest/gallery/create_geopandas_from_pandas.html#


Creation d'un environnement python3 avec geopandas
# mise à jour de pip, mais juste au niveau utilisateur pour
# pas casser le  system
python -m pip install pip --upgrade --user
# installation de pipenv
python -m pip install pipenv --user

# utilisation de pipenv
pipenv shell

# cf sam et max

# installation de pandas
pip install pandas
pip install geopandas
pip install matplotlib
pip install psycopg2-binary
pip install rtree
"""

import warnings
#warnings.filterwarnings("always")
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
#warnings.filterwarnings("ignore", message="numpy.ndarray size changed")

import pandas as pd
import geopandas
#from shapely.geometry import Point
from shapely import wkt
import psycopg2
#import fiona
import matplotlib.pyplot as plt


class Testeur(object):

    u"""
    Classe d'objet dont l'objectif principal est le test de la BB d'un objet.

    .

    """

    def __init__(self):
        u"""
        Méthode pour initialiser l'objet.

        Lorque l'objet est instancié, c'est cette méthode qui est executée.

        """

        #self.df = pd.DataFrame(
        #    {'EmriseTravauxNumero':
        #         ['1',
        #          '2',
        #          '3'],
        #     'EmpriseTravauxEwkt':
        #         ['MULTIPOLYGON(((-1.149158 46.161561,-1.148659 46.161476,-1.148696 46.161264,-1.149169 46.161334,-1.149158 46.161561)),((-1.149453 46.161951,-1.149866 46.161936,-1.149769 46.162189,-1.149308 46.162129,-1.149453 46.161951)),((-1.149555 46.161527,-1.149469 46.161709,-1.149721 46.161758,-1.149887 46.161568,-1.149555 46.161527)))',
        #          'MULTIPOLYGON(((-1.14972155702764 46.1628188001529,-1.14844478087132 46.1620677216423,-1.1483101067169 46.1613743685234,-1.14770493035078 46.1613872791222,-1.14798986743053 46.1623770063138,-1.14946625147696 46.1629586877786,-1.14972155702764 46.1628188001529)))',
        #          'MULTIPOLYGON(((-1.15057758584281 46.1624769527403,-1.15044828960035 46.1625897521052,-1.15055187548056 46.1626310452065,-1.15068319501326 46.1625452007441,-1.15057758584281 46.1624769527403)))']})

        #self.df['EmpriseTravauxEwkt'] = self.df['EmpriseTravauxEwkt'].apply(wkt.loads)
        #self.gdf = geopandas.GeoDataFrame(self.df, geometry='EmpriseTravauxEwkt')
        #print(self.gdf.head())


    def readFromPgWkt(self):
        u"""
        lecture des emprisesTravaux stockées dans la base dbworkspace, table total4171v2
        """

        # Try to connect
        try:
            pg_conn=psycopg2.connect("host='pg.cdalr.fr' dbname='dbworkspace' user='fred' password='fgpass'")
        except:
            print("I am unable to connect to the database.")


        # Lecture de la table total4171v2
        self.reqWkt = """
        SELECT fid, st_astext(st_transform(wkb_geometry, 3946)) as geometrywkt from pcrs.total4171v2
        """

        self.EmpriseTravaux = pd.read_sql(self.reqWkt, con=pg_conn)
        #print('loaded dataframe from Postgresql. # Records: {}'.format(len(self.EmpriseTravaux)))
        #print(self.EmpriseTravaux.head())

        # Etape supplementaire : transformation de wkt en geometry
        self.EmpriseTravaux['geometrywkt'] = self.EmpriseTravaux['geometrywkt'].apply(wkt.loads)

        self.gEmpriseTravaux = geopandas.GeoDataFrame(self.EmpriseTravaux, geometry='geometrywkt')
        #print(self.gEmpriseTravaux.head())


        # Lecture de la table EmpriseEchangePCRS
        self.reqWkt = """
        SELECT *, st_astext(st_transform(geometrie, 3946)) as geometrywkt from pcrs."EmpriseEchangePCRS"
        """

        self.EmpriseEchangePCRS = pd.read_sql(self.reqWkt, con=pg_conn)
        #print('loaded dataframe from Postgresql. # Records: {}'.format(len(self.EmpriseEchangePCRS)))
        #print(self.EmpriseEchangePCRS.head())

        # Etape supplementaire : transformation de wkt en geometry
        self.EmpriseEchangePCRS['geometrywkt'] = self.EmpriseEchangePCRS['geometrywkt'].apply(wkt.loads)

        self.gEmpriseEchangePCRS = geopandas.GeoDataFrame(self.EmpriseEchangePCRS, geometry='geometrywkt')
        #print(self.gEmpriseEchangePCRS.head())


    def traitementGeometrique(self):
        u"""
        traitementGeometrique entre les dataframes
        """

        # Manipulation des dataframes
        # affichage d'information : aire, enveloppe, ...
        print(self.gEmpriseTravaux.area)
        print(self.gEmpriseTravaux.envelope)
        print(self.gEmpriseEchangePCRS.area)
        print(self.gEmpriseEchangePCRS.envelope)

        # Intersection et difference
        self.res_intersection = geopandas.overlay(self.gEmpriseTravaux, self.gEmpriseEchangePCRS, how='intersection')
        print(self.res_intersection)
        self.res_symetric_difference = geopandas.overlay(self.gEmpriseTravaux, self.gEmpriseEchangePCRS, how='difference')
        print(self.res_symetric_difference)

        # on prend un objet et on le fait touner



def main():
    u"""
    Programme principal.

    """

    __myTest = Testeur()
    __myTest.readFromPgWkt()
    __myTest.traitementGeometrique()
    #__myTest.readFromPgGeometry()



if __name__ == '__main__':
    main()
