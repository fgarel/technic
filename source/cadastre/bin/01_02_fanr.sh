#!/bin/bash

# article direction
head -n 1 ../data1/ini/FANR_300.txt | \
  cut -c 1-3,4-10,11,12-41,42-59,60-73,74,75-88 --output-delimiter=';' > \
  ../data1/foot/fanr_article_direction.txt

# article commune
head -n +2 ../data1/ini/FANR_300.txt | \
  tail -1 | \
  cut -c 1-3,4-6,7-10,11,12-41,42,43,44-49,50,51-52,53-59,60-73,74,75-88 --output-delimiter=';' > \
  ../data1/foot/fanr_article_commune.txt
  
# article voie
# on doit supprimer les lignes vides (la dernière)
tail -n +3 ../data1/ini/FANR_300.txt | \
  cut -c 1-2,3,4-6,7-10,11,12-15,16-41,42,43,44-48,49,50-59,60-73,74,75-88 --output-delimiter=';' | \
  sed -E -e '/^$/d' > \
  ../data1/foot/fanr_article_voie.txt


