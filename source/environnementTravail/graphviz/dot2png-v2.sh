#!/bin/bash

#echo $1
 
while getopts ":d:" opt; do
  case $opt in
    d)
      #echo "-d was triggered, Parameter: $OPTARG" >&2
      # nettoyage des fichiers temporaires...
      FILE=$OPTARG
      FILEUML=uml/$OPTARG.uml

      FILESVGFALSE=uml/$OPTARG.svg
      FILESVG=svg/$OPTARG.svg
      FILESVGNU=svgnu/$OPTARG.svg
      FILEPNGFALSE=uml/$OPTARG.png
      FILEPNG=png/$OPTARG.png
      FILEPNGNU=pngnu/$OPTARG.png
      rm -f $FILEPNGFALSE
      rm -f $FILESVGFALSE
      rm -f $FILEPNG
      rm -f $FILESVG
      rm -f $FILEPNGNU
      rm -f $FILESVGNU
      # conversion d'un fichier dot en svg
      #dot -Tsvg $FILEDOT > $FILESVG
      plantuml -tsvg $FILEUML
      mv $FILESVGFALSE $FILESVG 
      #mv $FILEPNGFALSE $FILEPNG 
      # le xsl a pour but de rendre le svg joli
      #xsltproc notugly.xsl $FILESVG > $FILESVGNU
      # conversion du svg en png
      #rsvg $FILESVGNU $FILEPNGNU
      rsvg $FILESVG $FILEPNG
      # affichage du fichier png
      #display $FILEPNG &
      #identify $FILEPNG

      #mogrify -bordercolor white -border 320x200 $FILEPNG
      #identify $FILEPNG
      #mogrify  -gravity Center -crop 640x400+0+0 $FILEPNG
      #mogrify -resize 640x400 -gravity Center -crop 640x400+0+0 $FILEPNG

      
      #mogrify -gravity Center -crop 640x400+0+0 $FILEPNG
      
      mogrify -gravity center -background white -resize 640x480+0+0\> -extent 640x480 $FILEPNG
      
      #identify $FILEPNG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done


