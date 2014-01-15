#!/bin/sh


# nbat_article_10
cp ../data1/foot/nbat_article_10.txt \
   ../data1/foot/nbat_article_10.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=41 \
   ../data1/foot/nbat_article_10.sav \
   > ../data1/foot/nbat_article_10.txt 


# nbat_article_21
cp ../data1/foot/nbat_article_21.txt \
   ../data1/foot/nbat_article_21.sav
# ici, on ne fait pas un simple copie
# on en profite pour convertir du latin1 vers de l'utf-8
#iconv -f latin1 -t utf-8 \
#      ../data1/foot/nbat_article_21.txt  \
#      > ../data1/foot/nbat_article_21.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=31 \
   ../data1/foot/nbat_article_21.sav \
   > ../data1/foot/nbat_article_21.txt 


# nbat_article_30
cp ../data1/foot/nbat_article_30.txt \
   ../data1/foot/nbat_article_30.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=22 \
   ../data1/foot/nbat_article_30.sav \
   > ../data1/foot/nbat_article_30.txt 

# nbat_article_36
cp ../data1/foot/nbat_article_36.txt \
   ../data1/foot/nbat_article_36.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=27 \
   ../data1/foot/nbat_article_36.sav \
   > ../data1/foot/nbat_article_36.txt 


# nbat_article_99
cp ../data1/foot/nbat_article_99.txt \
   ../data1/foot/nbat_article_99.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=7 \
   ../data1/foot/nbat_article_99.sav \
   > ../data1/foot/nbat_article_99.txt 
