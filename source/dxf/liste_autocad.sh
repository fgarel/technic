#!/bin/sh

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -v -i -E '/(biblio|blocs?)( ?|_)(autocad|pamcad|th.ques?)?/' \
     | \
     egrep -v -i -E '/PAMCAD/' \
     | \
     egrep -v -i -E '/forster CAD_EXP_F/' \
     | \
     egrep -v -i -E '/LTB2000 OEM/' \
     | \
     egrep -v -i -E '/Biblioth.que_architecture/' \
     | \
     egrep -v -i -E '/ARBRES-HO-FE-VEHICULES/' \
     | \
     egrep -v -i -E '/MATHIEU MARIN/' \
     | \
     egrep -v -i -E '/BANQUE_IMAGE/' \
     | \
     egrep -v -i -E '/VLR/Symb2d/' \
    > /home/fred/Documents/liste_autocad.txt


find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/(biblio|blocs?)( ?|_)(autocad|pamcad|th.ques?)?/' \
    > /home/fred/Documents/liste_autocad_bibliotheque.txt

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

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/LTB2000 OEM/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/Biblioth.que_architecture/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/ARBRES-HO-FE-VEHICULES/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/MATHIEU MARIN/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/BANQUE_IMAGE/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

find /mnt/dsifichiers02 \
     -regextype posix-extended \
     -iregex '.*\.(dxf|dwg)' \
     | \
     egrep -i -E '/VLR/Symb2d/' \
    >> /home/fred/Documents/liste_autocad_bibliotheque.txt

