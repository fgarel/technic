#!/bin/sh

# Cet utilitaire doit permettre de creer un fichier csv contenant une liste de fichier

# Sous Qgis, nous allons ajouter une couche de données de type CSV$

# Ce fichier csv contiendra le nom des images qui sont dans le repertoire t/GESTION DU PATRIMOINE/photo/*

find "t/GESTION_DU_PATRIMOINE/photo" -type f | grep -v Thumbs.db | grep -v ZbThumbnail.info | grep -v pspbrwse.jbf | grep -v desktop.ini \
    | grep -v .ini | grep -v .lnk | grep -v .bak \
    > listOfPictures.txt


