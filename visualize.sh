#!/bin/sh

echo "#"
firefox \
    file:///home/fred/Documents/technic/build/html/index.html \
    file:///home/fred/Documents/technic/build/html/geogig/geogig.html \
    file:///home/fred/Documents/technic/build/slideshie/index.html \
    file:///home/fred/Documents/technic/build/slideshov/geogig_hov.html \
    file:///home/fred/Documents/technic/build/latex/geogig.pdf \
    http://www.google.fr
echo "evince /home/fred/Documents/technic/build/latex/geogig.pdf &"
      evince /home/fred/Documents/technic/build/latex/geogig.pdf &
