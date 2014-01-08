#!/bin/bash

# http://www.hokstad.com/family-tree-using-graphviz-and-ruby.htm
if [ "x$1" == "x" ]; then
  echo $0: erreur, vous devez donner un fichier initial (sequel model).
else
  rm -f $1.dot
  rm -f $1.svg
  rm -f $1.png
  rm -f $1-notugly.svg
  rm -f $1-notugly.png
  ruby ancestors.rb $1 > $1.dot
  dot -Tsvg $1.dot > $1.svg
  xsltproc notugly.xsl $1.svg > $1-notugly.svg
  rsvg $1-notugly.svg $1-notugly.png
  rsvg $1.svg $1.png
  display $1-notugly.png &
fi



