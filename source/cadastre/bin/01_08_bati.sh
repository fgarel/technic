#!/bin/sh


# bati_article_00
cp ../data1/foot/bati_article_00.txt \
   ../data1/foot/bati_article_00.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=25 \
   ../data1/foot/bati_article_00.sav \
   > ../data1/foot/bati_article_00.txt 

# bati_article_10
cp ../data1/foot/bati_article_10.txt \
   ../data1/foot/bati_article_10.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=47 \
   ../data1/foot/bati_article_10.sav \
   > ../data1/foot/bati_article_10.txt 


# bati_article_21
#cp ../data1/foot/bati_article_21.txt \
#   ../data1/foot/bati_article_21.sav
# ici, on ne fait pas un simple copie
# on en profite pour convertir du latin1 vers de l'utf-8
iconv -f latin1 -t utf-8 \
      ../data1/foot/bati_article_21.txt  \
      > ../data1/foot/bati_article_21.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=38 \
   ../data1/foot/bati_article_21.sav \
   > ../data1/foot/bati_article_21.txt 


# bati_article_30
cp ../data1/foot/bati_article_30.txt \
   ../data1/foot/bati_article_30.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=34 \
   ../data1/foot/bati_article_30.sav \
   > ../data1/foot/bati_article_30.txt 

# bati_article_36
cp ../data1/foot/bati_article_36.txt \
   ../data1/foot/bati_article_36.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=39 \
   ../data1/foot/bati_article_36.sav \
   > ../data1/foot/bati_article_36.txt 

# bati_article_40
cp ../data1/foot/bati_article_40.txt \
   ../data1/foot/bati_article_40.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=48 \
   ../data1/foot/bati_article_40.sav \
   > ../data1/foot/bati_article_40.txt 

# bati_article_50
cp ../data1/foot/bati_article_50.txt \
   ../data1/foot/bati_article_50.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=17 \
   ../data1/foot/bati_article_50.sav \
   > ../data1/foot/bati_article_50.txt 

# bati_article_60
#cp ../data1/foot/bati_article_60.txt \
#   ../data1/foot/bati_article_60.sav
# ici, on ne fait pas un simple copie
# on en profite pour convertir du latin1 vers de l'utf-8
# (présence de caractères accentués)
iconv -f latin1 -t utf-8 \
      ../data1/foot/bati_article_60.txt  \
      > ../data1/foot/bati_article_60.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=26 \
   ../data1/foot/bati_article_60.sav \
   > ../data1/foot/bati_article_60.txt 

# bati_article_99
#cp ../data1/foot/bati_article_99.txt \
#   ../data1/foot/bati_article_99.sav
# ici, la conversion est un peu plus complexe encore
# un article 99 est en fait en article 36 mais qui contient des
# caractères de controle EBCDIC (U+009F)
# http://fr.wikipedia.org/wiki/UTF-EBCDIC
# Pour detecter ces caracteres, il faut utiliser la commande
#   recode ..dump-with-names bati_article_99.txt
#   ou
#   recode ..count-characters bati_article_99.txt
# la correction se fait avec une serie de commande :
#   - sed qui est capable de convertir un caractère hexa \x9F
#   - mais le resultat doit encore etre converti de latin1 vers utf8 (commande iconv)
#   - et on s'apercoit que la suppression du caractère de controle fait apparaitre
#     un couple de caractère composé de la
#     lettre majuscule A avec un accent circonflexe + un caractère espace
#     ce couple est remplacé par un espace, mais on aurait aussi pu
#     le remplacer par un caractère disctinctif,
#     afin de différencier l'article 99 de l'article 36
#     sed 's/Â / /g'
#   - le dernier sed permet de supprimer une ligne vide
#     sed '/^$/d'

sed -E -e 's/\x9F/ /g' ../data1/foot/bati_article_99.txt \
    | iconv -f latin1 -t utf8 \
    | sed -E -e 's/Â / /g' \
    | sed -E -e '/^$/d' \
    > ../data1/foot/bati_article_99.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=37 \
   ../data1/foot/bati_article_99.sav \
   > ../data1/foot/bati_article_99.txt 
