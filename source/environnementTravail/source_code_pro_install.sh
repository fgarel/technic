#!/bin/bash
FONT_NAME="SourceCodePro"
# Url pour le telechargement de la font
# Attention l'url latest permet de telecharger le fichier de font web
# or, il faut telecharger le fichier fontonly
URL="http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download"
URL="http://sourceforge.net/projects/sourcecodepro.adobe/files/SourceCodePro_FontsOnly-1.017.zip/download"

mkdir /tmp/adodefont
cd /tmp/adodefont
wget ${URL} -O ${FONT_NAME}.zip
# on dezippe tous les fichiers dans le repertoire courant
unzip -o -j ${FONT_NAME}.zip

# Pour une installation pour tout les utilisateurs, alors il faut
# copier les fichiers dans le repertoire
# /usr/share/fonts/opentype/${FONT_NAME}
#mkdir -p ~/.fonts
mkdir -p /usr/share/fonts/opentype/${FONT_NAME}
cp *.otf /usr/share/fonts/opentype/${FONT_NAME}
fc-cache -f -v


