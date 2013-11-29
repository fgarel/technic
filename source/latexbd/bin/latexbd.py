#!/usr/bin/env python
# -*- coding: utf-8 -*-


########################### latexbd.py #############################################
# (C) 2007,2010 Etienne Marache <et.marache@orange.fr>
# Ce programme permet d'utiliser des bases de données dans un fichier latex.
# 3 novembre 2010 version 0.13 (passage en utf-8 et adaptation à sqlalchemy 0.6)
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
Ce programme nécessite python+SQLalchemy et un système de bases
de données avec un module python (par exemple PostgreSQL+psycopg2). Il
permet de réaliser des instructions SQL et d'incorporer les résultats
dans un fichier latex. Il reprend le programme latexdb de Hans-Georg
Hesser, tout fichier compilable par latexdb l'est aussi pour latexbd
avec des modifications minimes.

MODE D'EMPLOI: on se place dans le répertoire du fichier à traiter on
lance latexbd.py <nom du fichier> après avoir rendu ce fichier
exécutable (ou python latexdb.py <nom du fichier> sinon).  Le nom <nom
du fichier> est donné sans l'extension .tex. Le programme crée un
nouveau fichier du même nom suivi de -but.tex, contenant les données
et prêt à être compilé par latex.

On peut également le lancer avec le script latexbd.

COMMANDES SPECIALES:
-- \texdbconnexion
-- \texdbdef
-- \texdbfor
-- \texdbinstruction
ENVIRONNEMENTs SPECIAUX
-- lbdpour
-- lbdpython

Les instructions peuvent être écrites sur plusieurs lignes précédées
ou non de symboles % et d'espaces et peuvent être suivies de
commentaires LaTeX.
Les \begin et \end environnement doivent être sur une seule ligne, ils
peuvent être précédés ou suivis d'espaces ou de symboles %.

Pour plus de détail, voir le manuel latexbd.

L'environnement lbdpour prend en argument, la liste parcourue par l'indice.
Les instructions LaTeX contenues dans l'argument sont recopiées pour chaque valeur
de l'indice. Il permet de lancer plusieurs suites de \texdbfor
dans une seule boucle.

L'environnement lbdpython, permet d'inclure du code python dans latexbd.py. 

"""

### FICHIERS : importation des modules, des arguments et définition des
#fichiers utilisés:
import sys
import re
import traceback
from sqlalchemy import *
from string import lower

# Fichier à traiter, il doit être donné sans l'extension .tex. La philosophie de
#latexbd est de ne pas toucher au fichier source. On utilise un seul fichier intermédiaire.
fichier = sys.argv[1]
fichierini = fichier+".tex"
fichierbut = fichier+'-but.tex'

# La variable ifin est utilisée pour repérer les lignes.
ifin = 0
_texDBqueries={}   #  query dictionary, empty

# Préparation du fichier initial
ini = open(fichierini,'r')
but = open(fichierbut,'w')

# La liste des lignes du fichier à traiter est lignesini.
lignesini = ini.readlines()
ini.close()

### PATTERN pour la définition de la connexion, des requêtes et des boucles.
# texdbselect
matchDef=re.compile(r"[%\s]*\\texdbdef{##([^}]*)}\[*([^\]]*)\]*{(.*)\s*}")
matchselect = re.compile(r"[%\s]*\\texdbdef")
# texdbfor
matchtexdbfor = re.compile(r"[%\s]*\\texdbfor")
matchFor=re.compile(r"[%\s]*\\texdbfor{##([^}]*)}\[*([^{\]]*)\]*{(.*)}")
ddfor=re.compile(r"##texdbfor")
matchendfor=re.compile(r"\\endtexdbfor")
# texdbdef
matchDbDef=re.compile(r"[%\s]*\\texdbconnection{([^,]*),([^,]*),([^,]*),([^,]*),([^}]*)}")
matchdb = re.compile(r"[%\s]*\\texdbconnection")
# texdbinstruction
matchIns = re.compile(r"[%\s]*\\texdbinstruction\[*([^\]]*)\]*{(.*)}")
matchins = re.compile(r"[%\s]*\\texdbinstruction")
# Balise pour remplacement
dd=re.compile(r"##1")
# Pour enlever espaces et commentaires
hc = re.compile(r"[%\s]*([^%]*)%*.*\n")
# Repérage des accolades pour vérifier l'équilibrage
acco = re.compile(r"{")
accf = re.compile(r"}")
# lbdpour
matchPour = re.compile(r"[%\s]*\\begin{lbdpour}{(.*)}")
matchlbdpour = re.compile(r"[%\s]*\\begin{lbdpour}")
matchfinpour = re.compile(r"[%\s]*\\end{lbdpour}")
# lbdpython
matchlbdpython = re.compile(r"[%\s]*\\begin{lbdpython}")
matchfinpython = re.compile(r"[%\s]*\\end{lbdpython}")
matchcommentairepython = re.compile("#")

### FONCTIONS

## texDBgetVarsFromString
## Argument: texDB enhanced LaTeX string with Variables
## Return value: List of row.xxx variables contained therein
def texDBgetVarsFromString(s):
    matchvar =re.compile(r"(row\.[a-zA-Z0-9]+)")
    ma = matchvar.findall(s)
#    print ma
    return ma
## texDBgetVarsFromString ends

# La fonction prepare, établit les compteurs il et ifin pour le
# + début et la fin du groupe exécuté qui sera commenté.
# Elle teste si l'instruction est complète et si ce n'est pas le cas
# + réunit avec la ligne suivante. Le test d'accolades est pour prévenir un
#+ accident avec des accolades de commandes LaTeX dans un texdbfor.
#Pour finir, elle récupère les arguments.
def prepare(l,md):
#    global il
    global ifin
    select = ""
    il = lignesini.index(l)
    for lll in lignesini[ifin:il]:
        but.write(lll)
    ifin = il
    for ll in lignesini[il:]:
        ifin = ifin+1
        mm = hc.match(ll)
        select+=mm.group(1)+" "
        but.write("%"+ll)
        sacco = acco.findall(select)
        saccf = accf.findall(select)
        if md.match(select) and (len(sacco)==len(saccf)):
             break
    m = md.match(select)
#    print select
    return m.groups()
## prepare fin

## La fonction traite, ouvre une connexion et envoie l'instruction SQL
def traite(engine,insSQL):
    conn = engine.connect()
    trans = conn.begin()
    conn.execute(insSQL)
    trans.commit()
    conn.close()
# fin fonction traite.


## La fonction traitefor: 2 arguments, un nom de select et une phrase tex.
# remplace dans la requête les cellules par leurs valeurs.

def traitefor(q,s):
        r = text(_texDBqueries[q],bind=db)# r requête associée à q (bind au lieu de engine 8/11/07)
        rs = r.execute()
        for row in rs:
            liste = s+'\n'
            for var in texDBgetVarsFromString(s): # var parcourt les noms de cellule
                st = eval(var)
                liste = re.sub(r"%s(\W)"%var,r'%s\1'%str(st),liste)
                # on effectue la substitution dans la ligne row
# on est obligé d'embarquer le caractère suivant pour ne pas avoir de remplacement parasite
#de row.moy par row.m par exemple.
            but.write(liste) # Ecriture de la ligne garnie
#        print "données introduites"

### PREMIER PASSAGE 
# On commence par développer les environnement lbdpour.
numligne = 0 # nécessaire pour distinguer les lignes \begin{lbdpython} et \end{lbdpython} entre elles
for l in lignesini:
    numligne = numligne +1
# recherche d'une boucle lbdpour
    if matchlbdpour.match(l):
        il = numligne
        print "boucle lbdpour touvée ligne %s" %il
        g = prepare(l,matchPour)
        print g
        for i in eval(g[0]):
            for ll in lignesini[ifin:]:
                if dd.search(ll):
                    ll = re.sub("##1",str(i),ll)
                    but.write(ll)
                elif matchfinpour.search(ll):
                    but.write("%"+l)
                    ifinpour = lignesini.index(ll)
                    break
                else:
                    but.write(ll)
        ifin = ifinpour+1
        print "fin du lbdpour ligne %s" %ifin
# Traitement des environnements python.
    elif matchlbdpython.match(l):
        il = numligne
        print "début lbdpython ligne %s" %il
        for lll in lignesini[ifin:il-1]:
            but.write(lll)
        source = ""
        ifin = numligne
        for ll in lignesini[il:]:
            ifin = ifin +1
            if matchfinpython.match(ll):
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
                
### PARTIE PRINCIPALE: réalisation de la connexion, traitement des
# requêtes, écriture du fichier -but.
but = open(fichierbut,'r')
lignesini = but.readlines()
but.close()
but = open(fichierbut,'w')
ifin = 0
for l in lignesini:
# Recherche de la ligne de connexion et création de l'engin
    if matchdb.match(l):
        g = prepare(l,matchDbDef)
        (dbType,dbHost,dbUser,dbPass,dbDB)=g
#Version 0.12, mise en minuscule de dbType
        if dbType == "PostgreSQL":
            dbType = "postgres"
        else:
            dbType =lower(dbType)
        chaine = '%s://%s:%s@%s/%s'%(dbType,dbUser,dbPass,dbHost,dbDB)
        db = create_engine(chaine,use_native_unicode=False)
#option ajoutée pour sqlalchemy 0.6
        metadata = MetaData(db)
        print "engin créé"        
    elif matchins.match(l):
        g = prepare(l,matchIns)
        (opt,instruction)=g
        if opt:# si l'argument optionnel, on développe
            for i in eval(opt):
                instr = re.sub("##1",str(i),instruction)
                print instr # debug
                traite(db,instr)
        else:
# Effectue l'instruction g[1] dans la  base
            traite(db,g[1])
#        cursor.execute(g[1])
    elif matchselect.match(l):
        g=prepare(l,matchDef)
        (qName,opt,qString)=g#(nom,optionel,requete)
        if opt:
#   Si l'argument optionnel est présent on remplace dans la requête ##1 par i
# qui parcourt la liste eval(opt).
            for i in eval(opt):
                qS = re.sub("##1",str(i),qString)
                _texDBqueries[qName+str(i)]=qS
#                print "select traité"
        else:
            _texDBqueries[qName]=qString
# On traite maintenant texdbfor
    elif matchtexdbfor.match(l):
        g=prepare(l,matchFor)
        (qName,opt,texString)=g
#        print g
        if opt:
            for i in eval(opt):
                qN = qName+str(i)            
# remplacer ##texdbfor par son développement et ##1 par la valeur de i.
                for ll in lignesini[ifin:]:
                    if dd.search(ll):
                        ll = re.sub("##1",str(i),ll)
                    if ddfor.search(ll):
                        re.sub("##texdbfor",texString,ll)
                        traitefor(qN,texString)
                    elif matchendfor.search(ll):
                        but.write("%"+ll)
                        ifinfor = lignesini.index(ll)
                        break
                    else:
                        but.write(ll)
            ifin = ifinfor+1
# Si pas d'argument optionnel, on remplace les variables dans la commande \texdbfor
        else:
               traitefor(qName,texString)
# On recherche la requête qName
 
for lll in lignesini[ifin:]:
    but.write(lll)
but.close()

"""
HISTORIQUE
2 mars 2007, version 0.0 de latexbd.
5 mars 2007, version 0.1 souplesse dans l'écriture des instructions 
             version 0.2 nouvelle instruction \texdbinstruction
7 mars 2007  version 0.3 réparation de l'oubli de db.commit() ligne 180.
10 mars 2007 version 0.4 retour à la syntaxe latexdb, utilisation de SQLalchemy.
23 mars 2007 version 0.5-r1 alias PostgreSQL pour postgres et correction bug ligne 191
25 mars 2007 version 0.5-r2 correction petit bug ligne 214 ifin au lieu de ifin+1 
26 mars 2007 version 0.5-r3 correction bug remplacement des cellules (fonction traitefor ligne 170)
27 mars 2007 version 0.6 argument optionnel de \texdbinstruction
3 avril 2007 version 0.6-r1 fonction traitefor, correction bug ligne se terminant par une variable.
17 avril 2007 version 0.7 boucle lbdpour.
22 avril 2007 version 0.8 boucle lbdpython, ajout de dbPass à la ligne 264.
16 juin 2007 version 0.9-r3 suppression fichier -temp, correction bug lbdpour.
8 novembre 2007 version 0.11 pour fonctionner avec sqlalchemy 0.4.
23 mars 2010 version 0.12 (passage en utf-8)
3 novembre 2010 version 0.13 (adaptation à sqlalchemy 0.6)
"""
