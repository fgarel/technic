#/bin/sh

# suppression des fichiers précédents
rm -f debian-testing-amd64-netinst.iso
rm -f debian-testing-amd64-netinst.jigdo
rm -f debian-testing-amd64-netinst.template


# telechargement des fichiers jigdo et template
wget http://cdimage.debian.org/cdimage/weekly-builds/amd64/jigdo-cd/debian-testing-amd64-netinst.jigdo \
    -O debian-testing-amd64-netinst.jigdo \
    -c
wget http://cdimage.debian.org/cdimage/weekly-builds/amd64/jigdo-cd/debian-testing-amd64-netinst.template \
    -O debian-testing-amd64-netinst.template \
    -c

# apres il faut lancer la commande jigdo-lite
jigdo-lite --noask --force debian-testing-amd64-netinst.jigdo
