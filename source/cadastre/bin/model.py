#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Definition des objets à l'aide de sqlalchemy
"""

import sqlalchemy
import sqlalchemy.orm
import sqlalchemy.ext.declarative
import geoalchemy
import connection

# création d'une instance connexion
connection = connection.Connection()
Base = sqlalchemy.ext.declarative.declarative_base(metadata=connection.metadata)


class Ep_Point_Eclairage(Base):
    """
    Cette classe correspont à un modele d'objet
    """
    __tablename__ = 'ep_point_eclairage'
    id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True)
    X = sqlalchemy.Column(sqlalchemy.Float)
    Y = sqlalchemy.Column(sqlalchemy.Float)
    Z = sqlalchemy.Column(sqlalchemy.Float)
    pdop = sqlalchemy.Column(sqlalchemy.Float)
    infos = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    date = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    heure = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    Z2 = sqlalchemy.Column(sqlalchemy.Float)
    precision1 = sqlalchemy.Column(sqlalchemy.Float)
    precision2 = sqlalchemy.Column(sqlalchemy.Float)
    Y2 = sqlalchemy.Column(sqlalchemy.Float)
    X2 = sqlalchemy.Column(sqlalchemy.Float)
    the_geom = geoalchemy.GeometryColumn(geoalchemy.Point(3, srid=2154))

    def __init__(self, id=0,
                       X=0,
                       Y=0,
                       Z=0,
                       pdop=0,
                       infos="",
                       date="",
                       heure="",
                       Z2=0,
                       precision1=0,
                       precision2=0,
                       Y2=0,
                       X2=0):
        """
        lancé au moment de l'instanciation
        """
        self.id = id
        self.X = X
        self.Y = Y
        self.Z = Z
        self.pdop = pdop
        self.infos = infos
        self.date = date
        self.heure = heure
        self.Z2 = Z2
        self.precision1 = precision1
        self.precision2 = precision2
        self.Y2 = Y2
        self.X2 = X2

    def __repr__(self):
        """
        Pour l'impression de l'objet
        """
        return "X=%f, Y=%f, Z=%f" % (self.X, self.Y, self.Z)


class Point_Profondeur(Base):
    """
    Cette classe correspont à un modele d'objet
    """
    __tablename__ = 'point_profondeur'
    id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True)
    X = sqlalchemy.Column(sqlalchemy.Float)
    Y = sqlalchemy.Column(sqlalchemy.Float)
    Z = sqlalchemy.Column(sqlalchemy.Float)
    profondeur = sqlalchemy.Column(sqlalchemy.Float)
    numero_ligne = sqlalchemy.Column(sqlalchemy.Float)
    point_dans_ligne = sqlalchemy.Column(sqlalchemy.Float)
    pdop = sqlalchemy.Column(sqlalchemy.Float)
    infos = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    date = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    heure = sqlalchemy.Column(sqlalchemy.Unicode, nullable=True)
    Z2 = sqlalchemy.Column(sqlalchemy.Float)
    precision1 = sqlalchemy.Column(sqlalchemy.Float)
    precision2 = sqlalchemy.Column(sqlalchemy.Float)
    Y2 = sqlalchemy.Column(sqlalchemy.Float)
    X2 = sqlalchemy.Column(sqlalchemy.Float)
    the_geom = geoalchemy.GeometryColumn(geoalchemy.Point(3, srid=2154))

    def __init__(self, id=0,
                       X=0,
                       Y=0,
                       Z=0,
                       profondeur=0,
                       numero_ligne=0,
                       point_dans_ligne=0,
                       pdop=0,
                       infos="",
                       date="",
                       heure="",
                       Z2=0,
                       precision1=0,
                       precision2=0,
                       Y2=0,
                       X2=0):
        """
        lancé au moment de l'instanciation
        """
        self.id = id
        self.X = X
        self.Y = Y
        self.Z = Z
        self.profondeur = profondeur
        self.numero_ligne = numero_ligne
        self.point_dans_ligne = point_dans_ligne
        self.pdop = pdop
        self.infos = infos
        self.date = date
        self.heure = heure
        self.Z2 = Z2
        self.precision1 = precision1
        self.precision2 = precision2
        self.Y2 = Y2
        self.X2 = X2

    def __repr__(self):
        """
        pour l'impression de l'objet
        """
        return "X=%f, Y=%f, Z=%f" % (self.X, self.Y, self.Z)

def drop_all():
    """
    Suppression de toutes les tables
    """
    connection.metadata.drop_all()

def create_all():
    """
    Creation de toutes les tables
    """
    geoalchemy.GeometryDDL(Ep_Point_Eclairage.__table__)
    geoalchemy.GeometryDDL(Point_Profondeur.__table__)
    connection.metadata.create_all()

def addPoint(ma_table, id, X, Y, Z):
    """
    Creation de toutes les tables
    """
    ma_table.insert(id, X, Y, Z)

def main():
    """
    """
    drop_all()
    create_all()
    print("Tables du modèle :")
    for table in connection.metadata.sorted_tables:
        print("  table : %s") % table.name
    #ma_table_point_profondeur = Point_Profondeur()
    #addPoint(ma_table_point_profondeur, 56, 2.5, 6.2, 8.9)
    #print ma_table_point_profondeur
    mon_point_profondeur = Point_Profondeur(id=1,X=150.8998,Y=55654.654,Z=3.2)
    print mon_point_profondeur

if __name__ == '__main__':
    main()
