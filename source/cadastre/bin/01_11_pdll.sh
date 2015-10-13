#!/bin/sh



# pdl_article_10
cp ../data1/foot/pdll_article_10.txt \
   ../data1/foot/pdll_article_10.sav
# ici, on ne fait pas un simple copie
# on en profite pour convertir du latin1 vers de l'utf-8
#iconv -f latin1 -t utf-8 \
#      ../data1/foot/pdl_article_10.txt  \
#      > ../data1/foot/pdl_article_10.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=18 \
   ../data1/foot/pdll_article_10.sav \
   > ../data1/foot/pdll_article_10.txt 


# pdl_article_20
cp ../data1/foot/pdll_article_20.txt \
   ../data1/foot/pdll_article_20.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=15 \
   ../data1/foot/pdll_article_20.sav \
   > ../data1/foot/pdll_article_20.txt 


# pdl_article_30
#cp ../data1/foot/pdl_article_30.txt \
#   ../data1/foot/pdl_article_30.sav

# ici, la conversion est un peu plus complexe encore
# il est possible que certains enregistrements (pas tous) contiennent des
# caractères non valides (U+0000)
#
# Pour detecter ces caracteres, il faut utiliser la commande
#   recode ..dump-with-names pdl_article_30.txt
#   ou
#   recode ..count-characters pdl_article_30.txt
#   ou
#   od -bc pdl_article_30.txt
#   http://perso.univ-lemans.fr/~brichard/systeme/?doc=Fichiers_et_syst%E8mes_de_fichiers
# la correction se fait avec une serie de commande :
#   - sed qui est capable de convertir un caractère octal \o000 ou hexa \x00
#     ce caractere est remplacé par un espace, mais on aurait aussi pu
#     le remplacer par un caractère disctinctif,
#     afin de différencier l'article 99 de l'article 36
#     sed 's/\x00/ /g'

sed -E -e 's/\x00/ /g' ../data1/foot/pdll_article_30.txt \
    > ../data1/foot/pdll_article_30.sav

./01_07_ajoute_champs.awk \
   -v NBCHAMP=20 \
   ../data1/foot/pdll_article_30.sav \
   > ../data1/foot/pdll_article_30.txt 
