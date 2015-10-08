#!/bin/bash

# article direction
head -n 1 ../data1/ini/LLOC_300.txt | \
  cut -b 1-2,3,4-5,6-13,14-15,16-19 --output-delimiter=';' > \
  ../data1/foot/lloc_article_direction.txt

# article commune
head -n +2 ../data1/ini/LLOC_300.txt | \
  tail -1 | \
  cut -c 1-2,3,4-6,7-16,17-60 --output-delimiter=';' > \
  ../data1/foot/lloc_article_commune.txt

# article lot local
# on doit supprimer les lignes vides (la dernière)
tail -n +3 ../data1/ini/LLOC_300.txt | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-18,19-25,26-27,28-29,30,31-33,34-36,37-46,47-53,54-60 --output-delimiter=';' | \
  sed -E -e '/^$/d' > \
  ../data1/foot/lloc_article_lotlocal.txt
  
