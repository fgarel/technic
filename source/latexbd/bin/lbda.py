#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-


########################### lbda.py #############################################
# (C) 2007 Etienne Marache <e.marache@wanadoo.fr>
# Ce fichier fait partie du programme latexbd version 0.10
# Utilisation des bases de données dans un fichier latex.
# 22 juillet 2007.
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
####################################################################################

"""
Outre latex, ce programme nécessite SQLalchemy ainsi que ceux nécessaires
à faire fonctionner celui-ci.

"""
import traceback
import sys
import re
from sqlalchemy import *

# Les fichiers annexes
fichier = sys.argv[1]
fichierini = fichier+".tex"
fichierbut = fichier+'-but.tex'
ini = open(fichierini,'r')
but = open(fichierbut,'w')
lignesini = ini.readlines()

# La variable ifin est utilisée pour repérer les lignes.
ifin = 0
q = {}   #  query dictionary, empty
######################## PATTERN ###############################
# lbdpython
matchlbdpython = re.compile(r"[%\s]*\\begin{lbdpython}")
matchfinpython = re.compile(r"[%\s]*\\end{lbdpython}")
matchcommentairepython = re.compile("#")
######################## FONCTIONS #############################
## La fonction traite, ouvre une connexion et envoie l'instruction SQL
def traite(engine,insSQL):
    conn = engine.connect()
    trans = conn.begin()
    try:
        conn.execute(insSQL)
        trans.commit()
    except:
        trans.rollback() 
    conn.close()
# fin fonction traite.
######################## LECTURE DES INSTRUCTION ###############
numligne = 0
for l in lignesini:
    numligne = numligne +1
#    print numligne,l
    if matchlbdpython.match(l):        
        il = numligne
        print il,"lbdpython trouvé"
        for lll in lignesini[ifin:il-1]:
            but.write(lll)
        source = ""
        ifin = numligne
        for ll in lignesini[il:]:
            ifin = ifin +1
            if matchfinpython.match(ll):
#                ifin = ifin+1
#                print source
                print ifin,"fin de l'environnement python"
                break
            else:
                source += ll
        try:
             ccod = compile(source,'mon_code_source:','exec')
             flagcompile = True
        except:
             print "erreur de compilation"
             flagcompile = False
        if flagcompile == True:
             try:
                 exec(ccod,globals(),globals())
             except:
                 tb = sys.exc_info()[2] # traceback
                 print str(sys.exc_info()[0]),traceback.format_exc()


for lll in lignesini[ifin:]:
    but.write(lll)
but.close()

"""
HISTORIQUE
2 mars 2007, version 0.0 de latexbd.
27 avril 2007 version 0.9.
22 juillet 2007 version 0.10 fonction traite dans lbda.
"""
