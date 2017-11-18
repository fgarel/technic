#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# script pour la creation d'une base de données :

#from connexion import parametres
#import parametresConnection
#from database import parametresConnection

#import subprocess
import pymssql


class Database(object):

    u""" Cette classe correspond à une base de donnée connectée via psycopg2. """

    def __init__(self, paramconnexion):
        u""" Fonction lancée au moment de l'instanciation. """

        self.hostname = paramconnexion.hostname
        self.port = paramconnexion.port
        self.username = paramconnexion.username
        self.password = paramconnexion.password
        self.conn = ''

    def conn_database(self, dbname):
        self.dbname = dbname
        #print("--> dbname = {}".format(self.dbname))
        self.conn = pymssql.connect(server=self.hostname,
                                     user=self.username,
                                     password=self.password,
                                     database=self.dbname
                                     )
        return self.conn

    def cursor_execute(self, dbname, sql):
        self.dbname = dbname
        self.sql = sql
        #print('dbname    = {}'.format(self.dbname))
        #print('sql       = {}'.format(self.sql))
        self.conn = self.conn_database(self.dbname)
        self.cur = self.conn.cursor()
        self.cur.execute("""
                         SELECT table_name
                         FROM information_schema.tables
                         WHERE table_type='BASE TABLE';
                         """)
        self.row = self.cur.fetchone()
        while self.row:
            print("Table = {}".format(self.row[0]))
            self.row = self.cur.fetchone()
        self.cur.close()
        self.conn.close()




def main():
    u""" Fonction appelée par défaut. """
    import parametresConnexion
    mesparametres = parametresConnexion.ParametresConnexion()
    print('hostname = {}'.format(mesparametres.hostname))
    print('username = {}'.format(mesparametres.username))
    print('password = {}'.format(mesparametres.password))
    maconnexion = Database(mesparametres)
    #print('dbname             = {}'.format(maconnexion.dbname))
    #
    print('hostname           = {}'.format(maconnexion.hostname))
    print('port               = {}'.format(maconnexion.port))
    print('username           = {}'.format(maconnexion.username))
    print('password           = {}'.format(maconnexion.password))
    maconnexion.cursor_execute("ATAL", "")


if __name__ == '__main__':
    main()
