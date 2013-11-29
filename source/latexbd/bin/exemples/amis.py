#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

from sqlalchemy import *

db = create_engine('postgres:///exemples-lbd')

db.echo = False  # Try changing this to True and see what happens

metadata = BoundMetaData(db)

amis = Table('amis', metadata,#autoload=True)
    Column('id', Integer, primary_key=True),
    Column('nom', String(30)),
    Column('prenom', String(30)),
    Column('tel', String(10)),
)
amis.create()

i = amis.insert()
i.execute({'nom': 'Ami', 'prenom': 'Alfred','tel':'0000000001'},
          {'nom': 'Amie', 'prenom':'Julie','tel':'9999999998'},
          {'name': 'Amis', 'prenom':'Léo,Lea', 'tel':'3300330033'})

s = amis.select()
rs = s.execute()

for row in rs:
    print row

