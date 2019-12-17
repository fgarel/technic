#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# script pour la creation d'une base de données :

# from connexion import parametres
# import parametresConnection
# from database import parametresConnection

import subprocess
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT  # <-- ADD THIS LINE
from psycopg2.extensions import ISOLATION_LEVEL_READ_COMMITTED  # <-- ADD THIS LINE


class Database(object):

    u""" Cette classe correspond à une base de donnée connectée via psycopg2. """

    def __init__(self, paramconnexion):
        u""" Fonction lancée au moment de l'instanciation. """
        self.dict_dbuser_dbpass = paramconnexion.dict_dbuser_dbpass
        self.dict_dbuser_listdroits = paramconnexion.dict_dbuser_listdroits
        self.listdbname = paramconnexion.listdbname
        self.dict_dbname_dbowner = paramconnexion.dict_dbname_dbowner
        self.dict_dbname_dict_dbuser_listdroits = paramconnexion.dict_dbname_dict_dbuser_listdroits
        self.dict_dbname_listextensions = paramconnexion.dict_dbname_listextensions
        self.dict_dbname_listschemas = paramconnexion.dict_dbname_listschemas
        self.dict_dbuser_searchpath = paramconnexion.dict_dbuser_searchpath
        self.dict_dbname_dict_schema_dict_dbuser_listdroits = paramconnexion.dict_dbname_dict_schema_dict_dbuser_listdroits
        self.dict_dbname_dict_schema_listtables = paramconnexion.dict_dbname_dict_schema_listtables
        self.dict_dbname_dict_schema_listsqlfilescreate = paramconnexion.dict_dbname_dict_schema_listsqlfilescreate
        self.dict_dbname_dict_schema_listsqlfilesinsert = paramconnexion.dict_dbname_dict_schema_listsqlfilesinsert

        self.hostname = paramconnexion.hostname
        self.port = paramconnexion.port
        self.username = paramconnexion.username
        self.password = paramconnexion.password
        self.conn = ''

    def conn_database(self, dbname):
        self.dbname = dbname
        #print("--> dbname = {}".format(self.dbname))
        self.conn = psycopg2.connect(host=self.hostname,
                                     port=self.port,
                                     dbname=self.dbname,
                                     user=self.username,
                                     password=self.password)
        return self.conn

    def create_role(self, username, password):
        # La creation du role se fait hors connexion :
        # on a pas besoin d'etre connecté à une base de données
        # pour créer le role
        # La creation du role se fait grace à la commande shell (en sudo)
        # createuser
        # et cette commande shell est appelé grace au module subprocess
        # Des exemples plus poussés de l'utilisation du module subprocess
        # peuvent etre trouvés dans dt-dict/bin/pdfReader.py

        # La premiere commande, c'est pour créer le role
        commande = "sudo -u postgres " + \
                   "     createuser \"" + username + "\""

        print("{}".format(commande))
        subprocess.call(
            commande,
            shell=True)

        # La seconde commande, c'est pour modifier son mot de passe
        commande = "sudo -u postgres " + \
                   "     psql -c " + \
                   "\"" + "ALTER ROLE \\\"" + username + "\\\"" + \
                   " WITH PASSWORD \'" + password + "\';" + "\""

        #print("commande    = {}".format(commande))
        subprocess.call(
            commande,
            shell=True)

    def update_role_right(self, username, right):
        # La modifiaction du role se fait hors connexion :
        # on a pas besoin d'etre connecté à une base de données
        # pour modifier le role
        # La modification du role se fait grace à la commande shell (en sudo)
        # psql
        # et cette commande shell est appelé grace au module subprocess

        # La troisième commande, c'est pour lui affecter des droits
        commande = "sudo -u postgres " + \
                   "     psql -c " + \
                   "\'" + 'ALTER ROLE "' + username + '"' + \
                   " " + right + ";" + "\'"

        print("{}".format(commande))
        subprocess.call(
            commande,
            shell=True)

    def update_role_searchpath(self, username, searchpath):
        # pour modifier le search_path d'un utilisateur
        commande = "sudo -u postgres " + \
                   "     psql -c " + \
                   "\'" + 'ALTER ROLE "' + username + '"' + \
                   " " + "SET search_path = " + \
                   " " + searchpath + ";" + "\'"

        print("{}".format(commande))
        subprocess.call(
            commande,
            shell=True)

    def create_database(self, dbname, dbowner):
        #print("dbname    = {}".format(self.dbname))
        self.conn = self.conn_database('postgres')
        self.dbname = dbname
        self.dbowner = dbowner
        self.conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT) # <-- ADD THIS LINE
        self.cur = self.conn.cursor()
        #self.cur.execute("-- REVOKE CONNECT ON DATABASE {} FROM public;".format(self.dbname))
        self.cur.execute("DROP DATABASE if exists {} ;".format(self.dbname))
        self.cur.execute("CREATE DATABASE {} ;".format(self.dbname))
        self.cur.execute("ALTER DATABASE {} OWNER TO \"{}\";".format(self.dbname, self.dbowner))
        self.cur.execute("ALTER DATABASE {} SET search_path = \"$user\", public, topology;".format(self.dbname))

        self.cur.close()
        self.conn.close()

    def update_database(self, dbname, dbuser, right):
        #print("dbname    = {}".format(self.dbname))
        self.conn = self.conn_database('postgres')
        self.dbname = dbname
        self.conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT) # <-- ADD THIS LINE
        self.cur = self.conn.cursor()
        self.cur.execute("GRANT {} ON DATABASE {} TO \"{}\";".format(right, dbname, dbuser))
        self.cur.close()
        self.conn.close()

    def create_extension(self, dbname, extension):
        self.dbname = dbname
        self.extension = extension
        #print("dbname    = {}".format(self.dbname))
        #print("extension = {}".format(self.extension))
        self.conn = self.conn_database(self.dbname)
        self.conn.autocommit = True
        self.cur = self.conn.cursor()
        self.cur.execute("CREATE EXTENSION if not exists {} CASCADE ;".format(self.extension))
        self.cur.close()
        self.conn.close()

    def create_schema(self, dbname, schema):
        self.dbname = dbname
        self.schema = schema
        #print("dbname    = {}".format(self.dbname))
        #print('schema    = {}'.format(self.schema))
        self.conn = self.conn_database(self.dbname)
        self.conn.autocommit = True
        self.cur = self.conn.cursor()
        self.cur.execute("CREATE SCHEMA if not exists \"{}\" ;".format(self.schema))
        self.cur.close()
        self.conn.close()

    def update_schema(self, dbname, schema, dbuser, right):
        self.dbname = dbname
        self.schema = schema
        #print("dbname    = {}".format(self.dbname))
        #print('schema    = {}'.format(self.schema))
        self.conn = self.conn_database(self.dbname)
        self.conn.autocommit = True
        self.cur = self.conn.cursor()
        #print("GRANT {} ON SCHEMA {} TO \"{}\";".format(rights, schema, dbuser))
        self.cur.execute("GRANT {} ON SCHEMA \"{}\" TO \"{}\";".format(right, schema, dbuser))
        self.cur.close()
        self.conn.close()

    def create_table(self, dbname, schema, table):
        self.dbname = dbname
        self.schema = schema
        self.table = table
        #print("dbname    = {}".format(self.dbname))
        #print('schema    = {}'.format(self.schema))
        #print('table     = {}'.format(self.table))
        self.conn = self.conn_database(self.dbname)
        self.conn.autocommit = True
        self.cur = self.conn.cursor()
        self.cur.execute("CREATE table if not exists \"{}\".\"{}\" () ;".format(self.schema,self.table))
        self.cur.close()
        self.conn.close()

    def execute_sqlfile(self, dbname, schema, sqlfile):
        self.dbname = dbname
        self.schema = schema
        self.sqlfile = sqlfile
        #print("dbname    = {}".format(self.dbname))
        #print('schema    = {}'.format(self.schema))
        #print('sqlfile   = {}'.format(self.sqlfile))
        self.conn = self.conn_database(self.dbname)
        self.conn.autocommit = True
        self.cur = self.conn.cursor()
        try:
            self.sqlfileraw = open(self.sqlfile,'r')
            self.cur.execute(self.sqlfileraw.read())
            self.sqlfileraw.close()
        except:
            print('Impossible d acceder au fichier {}'.format(self.sqlfile))
        self.cur.close()
        self.conn.close()

    def do_first(self):
        """
        Methode pour automatiser la creation de la base de données postgresql
        """

        # Creation des roles / utilisateurs
        print('1. Creation des roles / utilisateurs')
        for dbuser, dbpass in self.dict_dbuser_dbpass.items():
            self.create_role(dbuser, dbpass)

        # Affectation des droits (niveau utilisateurs)
        print('2 Affectation des droits (niveau utilisateurs)')
        for dbuser, listdroits in self.dict_dbuser_listdroits.items():
            for droit in listdroits:
                self.update_role_right(dbuser, droit)

        # Creation de la base de données
        print('3 Creation de la base de données')
        for dbname, dbowner in self.dict_dbname_dbowner.items():
            self.create_database(dbname, dbowner)

        # Affectation des droits (niveau base de données)
        print('4 Affectation des droits (niveau base de données)')
        for dbname, dict_dbuser_listdroits in self.dict_dbname_dict_dbuser_listdroits.items():
            for dbuser, listdroits in dict_dbuser_listdroits.items():
                for droit in listdroits:
                    self.update_database(dbname, dbuser, droit)

        # Creation des schemas
        print('5 Creation des schemas')
        for dbname, listschemas in self.dict_dbname_listschemas.items():
            for schema in listschemas:
                #print('schema = {}'.format(schema))
                self.create_schema(dbname, schema)

        # Affectation des droits (niveau utilisateur)
        print('6 Affectation des droits, (niveau utilisateur)')
        for dbuser, searchpath in self.dict_dbuser_searchpath.items():
            self.update_role_searchpath(dbuser, searchpath)

        # Creation des extensions
        print('7 Creation des extensions')
        for dbname, listextensions in self.dict_dbname_listextensions.items():
            #print('listextensions = {}'.format(listextensions))
            for extension in listextensions:
                #print('extension = {}'.format(extension))
                self.create_extension(dbname, extension)

        # Affectation des droits (niveau schema)
        print('8 Affectation des droits (niveau schema)')
        for dbname, dict_schema_dict_dbuser_listdroits in self.dict_dbname_dict_schema_dict_dbuser_listdroits.items():
            for schema, dict_dbuser_listdroits in dict_schema_dict_dbuser_listdroits.items():
                for dbuser, listdroits in dict_dbuser_listdroits.items():
                    for droit in listdroits:
                        self.update_schema(dbname, schema, dbuser, droit)

        # Creation des tables
        print('9 Creation des tables')
        for dbname, dict_schema_listtables in self.dict_dbname_dict_schema_listtables.items():
            for schema, listtables in dict_schema_listtables.items():
                for table in listtables:
                    self.create_table(dbname, schema, table)

    def do_sqlfilescreate(self):
        """
        Methode pour simplement executer un fichier sql dans la base
        """

        # Execution fichier de commandes SQL
        print('10 Execution fichier de commandes SQL : Create')
        for dbname, dict_schema_listsqlfilescreate in self.dict_dbname_dict_schema_listsqlfilescreate.items():
            for schema, listsqlfilescreate in dict_schema_listsqlfilescreate.items():
                for sqlfilecreate in listsqlfilescreate:
                    self.execute_sqlfile(dbname, schema, sqlfilecreate)

    def do_sqlfilesinsert(self):
        """
        Methode pour simplement executer un fichier sql dans la base
        """

        # Execution fichier de commandes SQL
        print('11 Execution fichier de commandes SQL : Insert')
        for dbname, dict_schema_listsqlfilesinsert in self.dict_dbname_dict_schema_listsqlfilesinsert.items():
            for schema, listsqlfilesinsert in dict_schema_listsqlfilesinsert.items():
                for sqlfileinsert in listsqlfilesinsert:
                    self.execute_sqlfile(dbname, schema, sqlfileinsert)


    def do_all(self):
        """
        Methode pour automatiser la creation et la configuration de la base de
        données postgresql
        """

        #print('do_all')
        self.do_first()
        self.do_sqlfilescreate()
        self.do_sqlfilesinsert()

def main():
    u""" Fonction appelée par défaut. """
    import parametresConnexion
    mesparametres = parametresConnexion.ParametresConnexion()
    madatabase = Database(mesparametres)
    madatabase.do_all()

    #print('dict_dbuser_dbpass         = {}'.format(mesparametres.dict_dbuser_dbpass))
    #print('dict_dbuser_listdroits     = {}'.format(mesparametres.dict_dbuser_listdroits))
    #print('listdbname                 = {}'.format(mesparametres.listdbname))
    #print('dict_dbname_dbowner        = {}'.format(mesparametres.dict_dbname_dbowner))
    #print('dict_dbname_listextensions = {}'.format(mesparametres.dict_dbname_listextensions))
    #print('dict_dbname_listschemas    = {}'.format(mesparametres.dict_dbname_listschemas))

    #print('hostname                   = {}'.format(mesparametres.hostname))
    #print('port                       = {}'.format(mesparametres.port))
    #print('username                   = {}'.format(mesparametres.username))
    #print('password                   = {}'.format(mesparametres.password))


if __name__ == '__main__':
    main()
