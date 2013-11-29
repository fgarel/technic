#!/bin/sh

# tips pour l'extraction de d'information contenues dans le fichier TODO

# liste des projets
echo
echo "Liste des projets"
echo "-----------------"
sed -e 's/ø/\t/g' TODO | cut -f 2,4 

# liste des ressources
echo
echo "Liste des ressources"
echo "--------------------"
sed -e 's/ø/\t/g' TODO | cut -f 2,3
