#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Ce petit script permet d'importer des fichiers dans une base de donnees
"""

import csv
import model
import sqlalchemy.orm

class Csv2psql():
    """
    Cette classe correspont à la cible
    en argument, on done un nom de fichier
    """
    def __init__(self, path_ini):
        """
        La fonction __call__ d'une classe est apellée
        lorque la classe est appellée....
        """
        # 1.   Paramètres pour la lecture du fichier csv
        self.path_ini = path_ini
        # 3.3. Création d'un session
        self.Session = sqlalchemy.orm.sessionmaker(bind=model.connection.engine)
        self.session = self.Session()
        #self.point_profondeur = model.Point_Profondeur()
        #self.ep_point_eclairage = model.Ep_Point_Eclairage()
        pass

    def dropAndCreateTable(self):
        """
        Suppression et creation des tables
        """
        model.drop_all()
        model.geoalchemy.GeometryDDL(model.Ep_Point_Eclairage.__table__)
        model.geoalchemy.GeometryDDL(model.Point_Profondeur.__table__)

        model.create_all()

    def addPoint(self):
        """
        methode pour ajouter un point dans la table
        """
        #point = self.point_profondeur.insert(45,X=2,Y=3.2,Z=5.2)
        #print point
        #self.session.add(self.point_profondeur)
        #print self.point_profondeur
        mon_point = model.Point_Profondeur(id=2,X=654654651.35,Y=3335131.63,Z=2.25)
        #print mon_point
        self.session.add(mon_point)
        self.session.commit()
        our_point = self.session.query(model.Point_Profondeur).first()
        if (our_point is mon_point):
            print("ok")
        else:
            print("ko")
        print our_point

    def file2table(self, file_ini, table_fin):
        """
        Import d'un fichier dans une table
        """
        __file_ini = self.path_ini + '/' +file_ini
        with open(__file_ini, 'r') as csvinputfile:
            csvreader = csv.reader(csvinputfile, delimiter=';', quotechar='"')
            #with open('data/dataout.txt', 'w') as csvoutputfile:
            #    csvwriter = csv.writer(csvoutputfile, delimiter='-',lineterminator='\n')
            for row in csvreader:
                if (table_fin == "ep_point_eclairage"):
                    id = 0
                    X, Y, Z, pdop, Z2, precision1, precision2, Y2, Z2 = 0,0,0,0,0,0,0,0,0
                    infos, date, heure = '','',''
                    if (row[0] != ""):
                        id=int(row[0])
                    if (row[1] != ""):
                        X=float(row[1])
                    if (row[2] != ""):
                        Y=float(row[2])
                    if (row[3] != ""):
                        Z=float(row[3])
                    if (row[4] != ""):
                        pdop=float(row[4])
                    if (row[5] != ""):
                        infos=row[5].decode('latin1')
                    if (row[6] != ""):
                        date=row[6].decode('latin1')
                    if (row[7] != ""):
                        heure=row[7].decode('latin1')
                    if (row[8] != ""):
                        Z2=float(row[8])
                    if (row[9] != ""):
                        precision1=float(row[9])
                    if (row[10] != ""):
                        precision2=float(row[10])
                    if (row[11] != ""):
                        Y2=float(row[11])
                    if (row[12] != ""):
                        X2=float(row[12])
                    mon_point = model.Ep_Point_Eclairage(id=id,
                                                         X=X,
                                                         Y=Y,
                                                         Z=Z,
                                                         pdop=pdop,
                                                         infos=infos,
                                                         date=date,
                                                         heure=heure,
                                                         Z2=Z2,
                                                         precision1=precision1,
                                                         precision2=precision2,
                                                         Y2=Y2,
                                                         X2=X2)
                #    mon_point = model.Ep_Point_Eclairage(arguments)
                if (table_fin == "point_profondeur"):
                    id = 0
                    X, Y, Z, profondeur, numero_ligne, point_dans_ligne, pdop, Z2, precision1, precision2, Y2, Z2 = 0,0,0,0,0,0,0,0,0,0,0,0
                    infos, date, heure = '','',''
                    if (row[0] != ""):
                        id=int(row[0])
                    if (row[1] != ""):
                        X=float(row[1])
                    if (row[2] != ""):
                        Y=float(row[2])
                    if (row[3] != ""):
                        Z=float(row[3])
                    if (row[4] != ""):
                        profondeur=float(row[4])
                    if (row[5] != ""):
                        numero_ligne=float(row[5])
                    if (row[6] != ""):
                        point_dans_ligne=float(row[6])
                    if (row[7] != ""):
                        pdop=float(row[7])
                    if (row[8] != ""):
                        infos=row[8].decode('latin1')
                    if (row[9] != ""):
                        date=row[9].decode('latin1')
                    if (row[10] != ""):
                        heure=row[10].decode('latin1')
                    if (row[11] != ""):
                        Z2=float(row[11])
                    if (row[12] != ""):
                        precision1=float(row[12])
                    if (row[13] != ""):
                        precision2=float(row[13])
                    if (row[14] != ""):
                        Y2=float(row[14])
                    if (row[15] != ""):
                        X2=float(row[15])
                    mon_point = model.Point_Profondeur(id=id,
                                                       X=X,
                                                       Y=Y,
                                                       Z=Z,
                                                       profondeur=profondeur,
                                                       numero_ligne=numero_ligne,
                                                       point_dans_ligne=point_dans_ligne,
                                                       pdop=pdop,
                                                       infos=infos,
                                                       date=date,
                                                       heure=heure,
                                                       Z2=Z2,
                                                       precision1=precision1,
                                                       precision2=precision2,
                                                       Y2=Y2,
                                                       X2=X2)


                #print mon_point
                self.session.add(mon_point)
                self.session.commit()
                #self.cur.execute("select * from point;")
                #print(self.cur.fetchone())
                #csvwriter.writerow(row)
                pass


def main():
    """
    Création d'un table, lecture d'un fichier
    """
    #myconnection = connection.Connection()
    # creation des tables
    #__csv2psql = Csv2psql('data/e030717b')
    __csv2psql = Csv2psql('data/Export/e031517b')
    __csv2psql.dropAndCreateTable()
    __csv2psql.file2table('point_profondeur.csv', 'point_profondeur')
    __csv2psql.file2table('ep_point_eclairage.csv', 'ep_point_eclairage')
    #__csv2psql.addPoint()


if __name__ == '__main__':
    main()
