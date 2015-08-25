#!/bin/sh

for file in `ls -1 ~fred/h/cartographie/dt-dict`;
  do { mv ~fred/h/cartographie/dt-dict/$file ~fred/h/cartographie/tmp/$file ;
       #echo "mv" ; 
       sleep 2 ;
       mv ~fred/h/cartographie/tmp/$file ~fred/h/cartographie/dt-dict/$file ;
       #echo "mv2" ; 
       # on attend une minute entre chaque fichier
       sleep 60 ;
   }
  #
done
