#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Definition des objets à l'aide de sqlalchemy
"""

import sqlalchemy
#import sqlalchemy.orm
#import sqlalchemy.ext.declarative


class Connection():
    """
    Cette classe correspont à un modele d'objet
    """
    def __init__(self):
        """
        lancé au moment de l'instanciation
        """
        # 3.   Paramètres pour l'acces a une base postgresql via sqlalchemy
        # 3.1. Création d'un objet engine pour la connexion a une base de données
        self.engine = sqlalchemy.create_engine('postgresql://contrib:alambic@10.2.10.47:5432/dbmapnik', echo=True)
        #self.engine = sqlalchemy.create_engine('postgresql://contrib:alambic@10.2.10.47:5432/dbmapnik', echo=False)
        # 3.2. Création d'un objet metadata pour créer le lien enre la base et
        #      sqlalchemy
        self.metadata = sqlalchemy.MetaData(self.engine)
        # 3.3. Création d'un session
        #self.Session = sqlalchemy.orm.sessionmaker(bind=self.engine)
        #session = Session()
        pass



def main():
    """
    """
    connection = Connection()
    #print(connection)

if __name__ == '__main__':
    main()
