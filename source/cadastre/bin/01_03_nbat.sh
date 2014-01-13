#!/bin/bash

# article direction
head -n 1 ../data1/ini/NBAT_300.txt | \
  cut -b 1-30,31-32,33-40,41-42,43-46 --output-delimiter=';' > \
  ../data1/foot/nbat_article_direction.txt

# article descriptif de parcelle (10)
tail -n +2 ../data1/ini/NBAT_300.txt | \
  grep -E "^.{19}10" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-19,20-21,22-30,31,32-37,38-45,46-50,51,52-54,55-56,57-60,61-63,64,65-68,69,70,71,72-83,84,85,86-89,90,91-95,96-99,100-103,104,105-150 --output-delimiter=';' > \
  ../data1/foot/nbat_article_10.txt
  

# article descriptif de suf (21)
tail -n +2 ../data1/ini/NBAT_300.txt | \
  grep -E "^.{19}21" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-17,18-19,20-21,22-30,31-36,37-38,39-48,49-58,59,60-61,62-63,64-65,66-70,71,72-74,75-76,77-80,81-83,84-90,91-136,137,138,139-146,147,148-150 --output-delimiter=';' > \
  ../data1/foot/nbat_article_21.txt

# article exoneration de suf (30)
tail -n +2 ../data1/ini/NBAT_300.txt | \
  grep -E "^.{19}30" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-17,18-19,20-21,22-31,32-33,34-38,39-40,41-44,45-48,49-58,59-68,69-78,79-88,89,90-99,100-150 --output-delimiter=';' > \
  ../data1/foot/nbat_article_30.txt
  
# article taxation de suf (36)
#tail -n +2 ../data1/ini/NBAT_300.txt | \
#  grep -E "^.{19}36" | \
#  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-17,18-19,20-21,22-109,110-150 --output-delimiter=';' > \
#  ../data1/foot/nbat_article_36.txt
  
tail -n +2 ../data1/ini/NBAT_300.txt | \
  grep -E "^.{19}36" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-17,18-19,20-21,22,23-32,33,34-43,44,45-54,55,56-65,66,67-76,77,78-87,88,89-98,99,100-109,110-150 --output-delimiter=';' > \
  ../data1/foot/nbat_article_36.txt

# article restant (99)
# on doit supprimer les lignes vides (la dernière)
tail -n +2 ../data1/ini/NBAT_300.txt | \
  grep -v -E "^.{19}(10|21|30|36)" | \
  cut -b 1-2,3,4-6,7-9,10-11,12-15,16-17 --output-delimiter=';' | \
  sed -E -e '/^$/d' > \
  ../data1/foot/nbat_article_99.txt 
