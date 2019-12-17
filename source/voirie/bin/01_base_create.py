#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# script pour la creation d'une base de données :

from database import database
from database import parametresConnexion

# import psycopg2
# from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT  # <-- ADD THIS LINE


def main():
    u""" Fonction principale. """
    mesparametres = parametresConnexion.ParametresConnexion()
    maconnexion = database.Database(mesparametres)
    #maconnexion.do_all()

    print('dict_dbuser_dbpass         = {}'.format(mesparametres.dict_dbuser_dbpass))
    print('dict_dbuser_listdroits     = {}'.format(mesparametres.dict_dbuser_listdroits))
    print('listdbname                 = {}'.format(mesparametres.listdbname))
    print('dict_dbname_dbowner        = {}'.format(mesparametres.dict_dbname_dbowner))
    print('dict_dbname_listextensions = {}'.format(mesparametres.dict_dbname_listextensions))
    print('dict_dbname_listschemas    = {}'.format(mesparametres.dict_dbname_listschemas))

    print('hostname                   = {}'.format(mesparametres.hostname))
    print('port                       = {}'.format(mesparametres.port))
    print('username                   = {}'.format(mesparametres.username))
    print('password                   = {}'.format(mesparametres.password))



if __name__ == '__main__':
    main()
