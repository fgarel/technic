#/bin/sh

# #############################################
# Le but de cet utilitaire est de manipuler des données ldap
# les etapes sont :
# - export des données ldap au format ldif
# - manipulation du fichier ldif
# - transformation du fichier ldif en graphique
#
# #############################################

# #############################################
# 1. Recherche des données dans l'annuaire ldap
rm -f ./tmp/*
rm -f ./tmpa/*
rm -f ./tmpsa/*
rm -f ./tmpga/*
rm -f ./tmps/*
# on fabrique le fichier annuaire1.ldif
# ldapsearch -h aul.larochelle.fr -x -b "ou=people,dc=larochelle,dc=fr" -LL dn manager employeeNumber > annuaire0.ldif
#
# 5 extractions sont faites :
#  - annuaire est l'arbre complet
#  - agents est une liste de personnes
#  - serviceagents permet de savoir les personnes attachées aux services
#  - groupeAgents est aussi une relation de composition entre un groupe est une liste de personnes
#  - service est le sous-arbre d'un service
#
# Une astuce a déjà eté mise en oeuvre :
# pour ne pas avoir a gerer les problèmes
# de données ecrite en base 64, l'idée est de les ecrire dans le sous repertoire .tmp
# cf argument -t et -T
# auparvant cette gestion de base64 etait mal gerée par le programme python nettoyage_ldif.py
#
# D'autres astuces sont encore à mettre en oeuvre :
# - le problème du multiligne : à faire dans nettoyage ldif
# - la reinjection des données base64 : à faire dans nettoyage ldif
# - une selection d'attribut (on ne souhaite recuperer que certains attributs : ou, ouDisplayName, emplyeType, ....)
#   cette selectioin est à faire dans les paramètres de ldapsearch
# - un filtre pour ne gerer que l'organigramme d'un seul : nettoyage_ldif
# - une jointure pour gerer les ajouts, les modifications : nettoyage_ldif
# - une amelioration du rendu : ldif2dot

ldapsearch -h aul.larochelle.fr -x -t -T ./tmp -b "dc=larochelle,dc=fr" > annuaire1.ldif
ldapsearch -h aul.larochelle.fr -x -t -T ./tmpa -b "ou=people,dc=larochelle,dc=fr" > agents1.ldif # les agents
ldapsearch -h aul.larochelle.fr -x -t -T ./tmpsa -b "cn=Voirie,cn=Espace_Public,cn=morisset,cn=Filires,ou=collectivites,dc=larochelle,dc=fr" > serviceAgents1.ldif # les relations Services/Agents
ldapsearch -h aul.larochelle.fr -x -t -T ./tmpga -b "ou=groups,dc=larochelle,dc=fr" > groupeAgents1.ldif # les relations Groupes/Agents
ldapsearch -h aul.larochelle.fr -x -t -T ./tmps -b "ou=Voirie,ou=Espace_Public,ou=morisset,ou=Filires,ou=collectivites,dc=larochelle,dc=fr" > service1.ldif # Le service Voirie et les sous-services


# #############################################
# 2. Suppression des données photos
# Utilisation du site
# https://regex101.com/codegen?language=python
#
# Le script photo_remove.py decoule de ce peaufinage
# Ce script prend en entrée le fichier annuaire1.ldif et fabrique en sorite le fichier annuaire2.ldif
#./photo_remove.py
#./nettoyage_ldif.py

#rm agents1.ldif

# #############################################
# 3. Utilisation d'un utilitaire pour convertir du format ldif pour fabriquer un organigramme
# http://marcin.owsiany.pl/ldif2dot-page
#
#ldapsearch -h aul.larochelle.fr -x -b 'ou=people,dc=larochelle,dc=fr' | \
#           ./ldif2dot-0.1.py | \
#           dot -o nodomain.png -Nshape=box -Tpng /dev/stdin

#cat annuaire3.ldif | ./ldif2dot-0.2.py | \
#                     dot -o nodomain.png -Nshape=box -Tpng /dev/stdin
#cat annuaire2.ldif | ./ldif2dot-0.2.py | \
#                    dot -o annuaire2.svg -Nshape=box -Tsvg /dev/stdin

# Pour visualiser le png produit, il est possible d'utiliser nip2 / vips

# D'abord la transformation du ldif en dot
#cat annuaire2.ldif | ./ldif2dot-0.2.py > annuaire2.dot
#cat annuaire3.ldif | ./ldif2dot-0.2.py > annuaire3.dot
cat annuaire1.ldif | ./ldif2dot-0.2.py > annuaire1.dot
cat service1.ldif | ./ldif2dot-0.2.py > service1.dot
cat serviceAgents1.ldif | ./ldif2dot-0.2.py > serviceAgents1.dot


# Puis, la transformation du dot en png ou en svg
#dot -o annuaire2.png -Nshape=box -Tpng annuaire2.dot
#dot -o annuaire3.png -Nshape=box -Tpng annuaire3.dot
dot -o annuaire1.svg -Nshape=box -Tsvg annuaire1.dot
dot -o service1.svg -Nshape=box -Tsvg service1.dot
dot -o serviceAgents1.svg -Nshape=box -Tsvg serviceAgents1.dot
