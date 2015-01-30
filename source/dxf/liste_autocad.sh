#!/bin/sh

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -v -i -E '/biblio/' \
     | \
     egrep -v -i -E '/Blocs autocad/' \
     | \
     egrep -v -i -E '/PAMCAD/' \
     | \
     egrep -v -i -E '/forster CAD_EXP_F/' \
    > /home/fred/Documents/liste_autocad.txt


find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/biblio/' \
    > /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/Blocs autocad/' \
     | \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/PAMCAD/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/forster CAD_EXP_F/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt
