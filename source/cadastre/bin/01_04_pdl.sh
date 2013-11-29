#!/bin/bash

# article direction
# on doit supprimer les lignes vides (la dernière)
head -n 1 ../data1/ini/PDL_300.txt | \
  cut -b 1-2,3,4-27,28-57,58-59,60-67,68-100 --output-delimiter=';' | \
  sed -E -e '/^$/d' > \
  ../data1/foot/pdl_article_direction.txt

# article pdl (10)
tail -n +2 ../data1/ini/PDL_300.txt | \
  grep -E "^.{25}10" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-18,19-25,26-27,28,29-31,32-61,62-81,82,83-88,89-93,94-97,98-100 --output-delimiter=';' > \
  ../data1/foot/pdl_article_10.txt
  

# article assise de pdl (20)
tail -n +2 ../data1/ini/PDL_300.txt | \
  grep -E "^.{25}20" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-18,19-25,26-27,28-30,31-32,33-36,37-93,94-97,98-100 --output-delimiter=';' > \
  ../data1/foot/pdl_article_20.txt

# article descriptif du lot (30)
tail -n +2 ../data1/ini/PDL_300.txt | \
  grep -E "^.{25}30" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-18,19-25,26-27,28,29-37,38-44,45-51,52-71,72-79,80-82,83-88,89-93,94-97,98-100 --output-delimiter=';' > \
  ../data1/foot/pdl_article_30.txt
  
# article restant (99)
tail -n +2 ../data1/ini/PDL_300.txt | \
  grep -v -E "^.{25}(10|20|30)" > \
  ../data1/foot/pdl_article_99.txt 
