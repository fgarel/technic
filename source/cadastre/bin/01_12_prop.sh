#!/bin/sh



# prop_article_courant
cp ../data1/foot/prop_article_courant.txt \
   ../data1/foot/prop_article_courant.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=69 \
   ../data1/foot/prop_article_courant.sav \
   > ../data1/foot/prop_article_courant.txt 

