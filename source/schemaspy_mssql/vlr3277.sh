#!/bin/sh

# en general, ce sont des jobs talend qui alimentent la
# base dsibdd09 (Job ou dev)
# cependant, pour des raisons x ou y des jobs n'ont pas pu etre rejoués
# le résultat de la dernière execution, stocké sous dsiappli14 est
# donc tout simplement recopié de dsiappli14 vers dsibdd09
./dsiappli14ToDsibdd09.sh

# le script d'anonymisation permet de jouer un certain nombre de commande sql
# par dessus le resultat des jobs talend
./anonymisation.sh

# un script permet d'exporter les données de postgresql vers des fichiers csv
./dsibdd09ToCsvApresAnonymisation.sh

# script (pour le moment executé sur vlr3277, mais qui au final, sera execute sur dsibdd09)
# permettant de transferer les données de dev vers prod
./dsibdd09ToOvh.sh
