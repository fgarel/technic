#!/usr/bin/env python
# -*- coding: utf-8 -*-

u""" Definition des objets à l'aide de sqlalchemy.

Ce fichier est soit generé à la main, soit....

TODO

"""

#import sys
#sys.path.append('.')
from sqlalchemy import Column, Integer, String
#import sqlalchemy.orm
from sqlalchemy.ext.declarative import declarative_base
import geoalchemy2
from connection import Connection

# création d'une instance connexion
MACONNECTION = Connection()
BASE = declarative_base(
    metadata=MACONNECTION.metadata)


class Lake(Base):
     __tablename__ = 'lake'
     id = Column(Integer, primary_key=True)
     name = Column(String)
     geom = Column(Geometry('POLYGON'))



class EpPointEclairage(BASE):

    u"""
    Cette classe correspont à un modele d'objet.

    la table est ep_point_eclairage
    et les attributs sont listés ci-dessous.

    """

    __tablename__ = 'ep_point_eclairage'
    identifiant = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True)
    coordx = sqlalchemy.Column(sqlalchemy.Float)
    coordy = sqlalchemy.Column(sqlalchemy.Float)
    coordz = sqlalchemy.Column(sqlalchemy.Float)
    pdop = sqlalchemy.Column(sqlalchemy.Float)
    infos = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    date = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    heure = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    coordz2 = sqlalchemy.Column(sqlalchemy.Float)
    precision1 = sqlalchemy.Column(sqlalchemy.Float)
    precision2 = sqlalchemy.Column(sqlalchemy.Float)
    coordy2 = sqlalchemy.Column(sqlalchemy.Float)
    coordx2 = sqlalchemy.Column(sqlalchemy.Float)
    the_geom = geoalchemy.GeometryColumn(geoalchemy.Point(3, srid=2154))

    def __init__(self,
                 identifiant=0,
                 coordx=0,
                 coordy=0,
                 coordz=0,
                 pdop=0,
                 infos="",
                 date="",
                 heure="",
                 coordz2=0,
                 precision1=0,
                 precision2=0,
                 coordy2=0,
                 coordx2=0):
        u""" Fonction lancée au moment de l'instanciation. """
        self.identifiant = identifiant
        self.coordx = coordx
        self.coordy = coordy
        self.coordz = coordz
        self.pdop = pdop
        self.infos = infos
        self.date = date
        self.heure = heure
        self.coordz2 = coordz2
        self.precision1 = precision1
        self.precision2 = precision2
        self.coordy2 = coordy2
        self.coordx2 = coordx2

    def __repr__(self):
        u""" Pour l'impression de l'objet. """
        return "X=%f, Y=%f, Z=%f" % (self.coordx, self.coordy, self.coordz)


class PointProfondeur(BASE):

    u"""
    Cette classe correspont à un modele d'objet.

    la table est point_profondeur
    et les attributs sont listés ci-dessous.

    """

    __tablename__ = 'point_profondeur'
    identifiant = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True)
    coordx = sqlalchemy.Column(sqlalchemy.Float)
    coordy = sqlalchemy.Column(sqlalchemy.Float)
    coordz = sqlalchemy.Column(sqlalchemy.Float)
    profondeur = sqlalchemy.Column(sqlalchemy.Float)
    numero_ligne = sqlalchemy.Column(sqlalchemy.Float)
    point_dans_ligne = sqlalchemy.Column(sqlalchemy.Float)
    pdop = sqlalchemy.Column(sqlalchemy.Float)
    infos = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    date = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    heure = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    coordz2 = sqlalchemy.Column(sqlalchemy.Float)
    precision1 = sqlalchemy.Column(sqlalchemy.Float)
    precision2 = sqlalchemy.Column(sqlalchemy.Float)
    coordy2 = sqlalchemy.Column(sqlalchemy.Float)
    coordx2 = sqlalchemy.Column(sqlalchemy.Float)
    the_geom = geoalchemy.GeometryColumn(geoalchemy.Point(3, srid=2154))

    def __init__(self,
                 identifiant=0,
                 coordx=0,
                 coordy=0,
                 coordz=0,
                 profondeur=0,
                 numero_ligne=0,
                 point_dans_ligne=0,
                 pdop=0,
                 infos="",
                 date="",
                 heure="",
                 coordz2=0,
                 precision1=0,
                 precision2=0,
                 coordy2=0,
                 coordx2=0):
        u""" Fonction lancée au moment de l'instanciation. """
        self.identifiant = identifiant
        self.coordx = coordx
        self.coordy = coordy
        self.coordz = coordz
        self.profondeur = profondeur
        self.numero_ligne = numero_ligne
        self.point_dans_ligne = point_dans_ligne
        self.pdop = pdop
        self.infos = infos
        self.date = date
        self.heure = heure
        self.coordz2 = coordz2
        self.precision1 = precision1
        self.precision2 = precision2
        self.coordy2 = coordy2
        self.coordx2 = coordx2

    def __repr__(self):
        u""" Pour l'impression de l'objet. """
        return "X=%f, Y=%f, Z=%f" % (self.coordx, self.coordy, self.coordz)


def drop_all():
    u""" Suppression de toutes les tables. """
    MACONNECTION.metadata.drop_all()


def create_all():
    u""" Creation de toutes les tables. """
    geoalchemy.GeometryDDL(EpPointEclairage.__tablename__)
    geoalchemy.GeometryDDL(PointProfondeur.__tablename__)
    MACONNECTION.metadata.create_all()


def add_point(ma_table, identifiant, coordx, coordy, coordz):
    """ Ajoute un point. """
    ma_table.insert(identifiant, coordx, coordy, coordz)


def main():
    u""" Fonction Principale.

    Ici, on commence par suppremier puis créer les objets
    dans la base deonnées.
    Puis, on insert un objet.

    """

    drop_all()
    create_all()
    print(u"Tables du modèle :")
    for table in MACONNECTION.metadata.sorted_tables:
        print("  table : %s") % table.name
    #ma_table_point_profondeur = Point_Profondeur()
    #addPoint(ma_table_point_profondeur, 56, 2.5, 6.2, 8.9)
    #print ma_table_point_profondeur
    mon_point_profondeur = PointProfondeur(identifiant=1,
                                           coordx=150.8998,
                                           coordy=55654.654,
                                           coordz=3.2)
    print mon_point_profondeur

if __name__ == '__main__':
    main()
