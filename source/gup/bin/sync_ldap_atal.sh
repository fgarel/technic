#/bin/sh

# #############################################
# 1. Recherche des données dans l'annuaire ldap
# on fabrique le fichier annuaire1.ldif
# ldapsearch -h aul.larochelle.fr -x -b "ou=people,dc=larochelle,dc=fr" -LL dn manager employeeNumber > annuaire0.ldif
ldapsearch -h aul.larochelle.fr -x -b "ou=people,dc=larochelle,dc=fr" > annuaire1.ldif


# #############################################
# 2. Suppression des données photos
# Utilisation du site
# https://regex101.com/codegen?language=python
#
# Le script photo_remove.py decoule de ce peaufinage
# Ce script prend en entrée le fichier annuaire1.ldif et fabrique en sorite le fichier annuaire2.ldif
./photo_remove.py

rm annuaire1.ldif

# #############################################
# 3. Utilisation d'un utilitaire pour convertir du format ldif pour fabriquer un organigramme
# http://marcin.owsiany.pl/ldif2dot-page
#
#ldapsearch -h aul.larochelle.fr -x -b 'ou=people,dc=larochelle,dc=fr' | \
#           ./ldif2dot-0.1.py | \
#           dot -o nodomain.png -Nshape=box -Tpng /dev/stdin

#cat annuaire3.ldif | ./ldif2dot-0.2.py | \
#                     dot -o nodomain.png -Nshape=box -Tpng /dev/stdin
cat annuaire2.ldif | ./ldif2dot-0.2.py | \
                    dot -o annuaire2.svg -Nshape=box -Tsvg /dev/stdin

# Pour visualiser le png produit, il est possible d'utiliser nip2 / vips

# D'abord la transformation du ldif en dot
cat annuaire2.ldif | ./ldif2dot-0.2.py > annuaire2.dot
#cat annuaire3.ldif | ./ldif2dot-0.2.py > annuaire3.dot


# Puis, la transformation du dot en png ou en svg
#dot -o annuaire2.png -Nshape=box -Tpng annuaire2.dot
#dot -o annuaire3.png -Nshape=box -Tpng annuaire3.dot
dot -o annuaire2.svg -Nshape=box -Tsvg annuaire2.dot
