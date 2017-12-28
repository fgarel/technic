#!/usr/bin/env python
# -*- coding: utf-8 -*-

u""" Definition des paramètres de connexion.

Paramètres de connexion à une base de données.

"""

#import psycopg2
#from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT # <-- ADD THIS LINE

class ParametresConnexion(object):

    u""" Cette classe correspont aux paramètres de connexion. """

    def __init__(self):
        u""" Fonction lancée au moment de l'instanciation. """
        # les parametres pour la creation
        # Attention : la creation se fait sur la machine localhost
        self.dict_dbuser_dbpass = {'fred': 'fred',
                                   'francois': 'fc',
                                   'michel': 'mr',
                                   'pascal': 'pb',
                                   'voirie_administratif': 'adm',
                                   'voirie_deplacement': 'dep',
                                   'voirie_topographie': 'topo',
                                   'voirie_travaux': 'tvx'}
        self.dict_dbuser_listdroits = {'fred':                 ['SUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION'],
                                       'francois':             ['NOSUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION'],
                                       'michel':               ['NOSUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION'],
                                       'pascal':               ['NOSUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION'],
                                       'voirie_administratif': ['NOSUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION'],
                                       'voirie_deplacement':   ['NOSUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION'],
                                       'voirie_topographie':   ['NOSUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION'],
                                       'voirie_travaux':       ['NOSUPERUSER', 'NOCREATEDB',
                                                                'NOCREATEROLE', 'NOREPLICATION']}
        #self.dbname = 'osm'
        #self.dbowner = 'osmuser'
        #self.listextension = ['adminpack', 'postgis', 'postgis_topology', 'fuzzystrmatch', 'hstore', 'dblink']
        #self.listschema = ['apidb', 'osm2pgsql']
        self.listdbname = ['espu']
        self.dict_dbname_dbowner = {'espu': 'fred'}

        self.dict_dbname_dict_dbuser_listdroits = \
            {'espu':             {'fred':                 ['CONNECT', 'TEMPORARY', 'ALL'],
                                  'francois':             ['CONNECT', 'TEMPORARY', 'ALL'],
                                  'michel':               ['CONNECT', 'TEMPORARY', 'ALL'],
                                  'pascal':               ['CONNECT', 'TEMPORARY', 'ALL'],
                                  'voirie_administratif': ['CONNECT', 'TEMPORARY', 'ALL'],
                                  'voirie_deplacement':   ['CONNECT', 'TEMPORARY', 'ALL'],
                                  'voirie_topographie':   ['CONNECT', 'TEMPORARY', 'ALL'],
                                  'voirie_travaux':       ['CONNECT', 'TEMPORARY', 'ALL']}}


        self.dict_dbname_listextensions = {'espu':             ['adminpack',
                                                                'postgis',
                                                                'postgis_topology',
                                                                'fuzzystrmatch',
                                                                'hstore',
                                                                'dblink']}
        self.dict_dbname_listschemas = {'espu': ['voirie_administratif',
                                                 'voirie_deplacement',
                                                 'voirie_topographie',
                                                 'voirie_travaux']}
        self.dict_dbuser_searchpath = {'fred':                 'public',
                                       'francois':             'voirie_topographie, voirie_administratif, voirie_deplacement, voirie_travaux, public',
                                       'michel':               'voirie_topographie, voirie_administratif, voirie_deplacement, voirie_travaux, public',
                                       'pascal':               'voirie_topographie, voirie_administratif, voirie_deplacement, voirie_travaux, public',
                                       'voirie_administratif': 'voirie_administratif, public',
                                       'voirie_deplacement':   'voirie_deplacement, public',
                                       'voirie_topographie':   'voirie_topographie, public',
                                       'voirie_travaux':       'voirie_travaux, public'                                       }
        self.dict_dbname_dict_schema_dict_dbuser_listdroits = \
            {'espu': {'voirie_administratif':       {'fred':                 ['ALL'],
                                                     'francois':             ['ALL'],
                                                     'michel':               ['ALL'],
                                                     'pascal':               ['ALL'],
                                                     'voirie_administratif': ['ALL']},
                      'voirie_deplacement':         {'fred':                 ['ALL'],
                                                     'francois':             ['ALL'],
                                                     'michel':               ['ALL'],
                                                     'pascal':               ['ALL'],
                                                     'voirie_deplacement':   ['ALL']},
                      'voirie_topographie':         {'fred':                 ['ALL'],
                                                     'francois':             ['ALL'],
                                                     'michel':               ['ALL'],
                                                     'pascal':               ['ALL'],
                                                     'voirie_topographie':   ['ALL']},
                      'voirie_travaux':             {'fred':                 ['ALL'],
                                                     'francois':             ['ALL'],
                                                     'michel':               ['ALL'],
                                                     'pascal':               ['ALL'],
                                                     'voirie_travaux':       ['ALL']}}}
        self.dict_dbname_dict_schema_listtables = \
            {'espu': {'voirie_administratif':       [],
                      'voirie_deplacement':         [],
                      'voirie_topographie':         [],
                      'voirie_travaux':             []}}


        # les paramètres pour la connexion
        self.hostname = 'localhost'
        self.port = '5432'
        self.username = 'fred'
        self.password = 'fred'


def main():
    u""" Fonction appelée par défaut. """
    paramconnexion = ParametresConnexion()

    print('dict_dbuser_dbpass         = {}'.format(paramconnexion.dict_dbuser_dbpass))
    print('dict_dbuser_listdroits     = {}'.format(paramconnexion.dict_dbuser_listdroits))
    print('listdbname                 = {}'.format(paramconnexion.listdbname))
    print('dict_dbname_dbowner        = {}'.format(paramconnexion.dict_dbname_dbowner))
    print('dict_dbname_listextensions = {}'.format(paramconnexion.dict_dbname_listextensions))
    print('dict_dbname_listschemas    = {}'.format(paramconnexion.dict_dbname_listschemas))

    print('hostname                   = {}'.format(paramconnexion.hostname))
    print('port                       = {}'.format(paramconnexion.port))
    print('username                   = {}'.format(paramconnexion.username))
    print('password                   = {}'.format(paramconnexion.password))
    #print(connection)

if __name__ == '__main__':
    main()
