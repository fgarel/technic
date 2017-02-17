#!/bin/sh


# 1. Automatisation de la creation des layers
# a partir d'une liste, et d'un fichier script autocad qui nous sert de template
# un programme python genere un gros fichier LayerCreation qui doit etre executé sous autocad
# pour fabriquer le fichier gabarit

cp ~fred/geodata/DCE/levetopo/symbole/liste.csv ../data/
./makeLayerCreation.py
sudo cp ../data/LayerCreation.scr ~fred/f/CARTOGRAPHIE/documentation/leica-Atlog/

# 2. Creation des fichiers de styles de lignes
cp ~fred/geodata/DCE/levetopo/symbole/acadiso.lin ../data/
sudo cp ../data/acadiso.lin ~fred/f/CARTOGRAPHIE/documentation/leica-Atlog/

# 3. Creation des symboles

# 4. Creation des icones
