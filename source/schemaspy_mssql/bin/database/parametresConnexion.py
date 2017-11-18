#!/usr/bin/env python
# -*- coding: utf-8 -*-

u""" Definition des paramètres de connexion.

Paramètres de connexion à une base de données.

"""

#import psycopg2
#from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT # <-- ADD THIS LINE
#import pymssql

class ParametresConnexion(object):

    u""" Cette classe correspont aux paramètres de connexion. """

    def __init__(self):
        u""" Fonction lancée au moment de l'instanciation. """

        # les paramètres pour la connexion
        self.hostname = 'dsibdd01\MSSQLSERVER'
        self.port = '1433'
        self.username = 'sa'
        self.password = 'BDD,adm'


def main():
    u""" Fonction appelée par défaut. """
    paramconnexion = ParametresConnexion()


    print('hostname           = {}'.format(paramconnexion.hostname))
    print('port               = {}'.format(paramconnexion.port))
    print('username           = {}'.format(paramconnexion.username))
    print('password           = {}'.format(paramconnexion.password))
    #print(connection)

if __name__ == '__main__':
    main()
