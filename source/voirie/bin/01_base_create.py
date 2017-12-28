#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# script pour la creation d'une base de données :

from database import database
from database import parametresConnexion

#import psycopg2
#from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT # <-- ADD THIS LINE


def main():
    u""" Fonction principale. """
    mesparametres = parametresConnexion.ParametresConnexion()
    maconnexion = database.Database(mesparametres)
    maconnexion.do_all()


if __name__ == '__main__':
    main()
