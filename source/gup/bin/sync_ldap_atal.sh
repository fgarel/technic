#/bin/sh

# Recherche des données dans l'annuaire ldap
ldapsearch -h aul.larochelle.fr -x -b "ou=people,dc=larochelle,dc=fr" -LL dn manager employeeNumber > annuaire0.ldif
ldapsearch -h aul.larochelle.fr -x -b "ou=people,dc=larochelle,dc=fr" > annuaire1.ldif


# Suppression des données photos
# utilisation du site
# https://regex101.com/codegen?language=python
#
# le script photo_remove.py decoule de ce peaufinage
./photo_remove.py

# Utilisation d'un utilitaire pour convertir du format ldif pour fabriquer un organigramme
# http://marcin.owsiany.pl/ldif2dot-page
#
#ldapsearch -h aul.larochelle.fr -x -b 'ou=people,dc=larochelle,dc=fr' | \
#           ./ldif2dot-0.1.py | \
#           dot -o nodomain.png -Nshape=box -Tpng /dev/stdin

cat annuaire3.ldif | ./ldif2dot-0.1.py | \
                     dot -o nodomain.png -Nshape=box -Tpng /dev/stdin

# Pour visualiser le png produit, il est possible d'utiliser nip2 / vips
