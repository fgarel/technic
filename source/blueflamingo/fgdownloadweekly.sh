#/bin/sh

# recopie de la configuration dans le repertoire home de l'utilisateur
cp -f .jigdo-lite ~/.jigdo-lite

# suppression des fichiers précédents
rm -f debian-testing-amd64-netinst.iso.old
mv debian-testing-amd64-netinst.iso debian-testing-amd64-netinst.iso.old
sudo mount -o loop debian-testing-amd64-netinst.iso.old /mnt/iso.old/
sudo mount -o loop debian-testing-amd64-netinst.iso.tmp /mnt/iso.tmp/

# telechargement des fichiers jigdo et template
# avec l'option -N, on ne telecharge que si le fichier sur le serveur a été modifié
# avec l'option -c, on reprend le telechargement si celui ci a été interompu
# il ne faut pas mettre l'option -r. En effet, si cette option est activée, le telechargement se fera
# dans des sous-sous-repertoires....
# il n'est pas utile de supprimer les fichiers déjà téléchargés : l'option -N d'horodatage va
# automatiquement déterminé si le fichier du serveur est plus récent et doit être téléchargé
# pour remplacer le fihcier du poste client
#rm -f debian-testing-amd64-netinst.jigdo
#rm -f debian-testing-amd64-netinst.template
wget http://cdimage.debian.org/cdimage/weekly-builds/amd64/jigdo-cd/debian-testing-amd64-netinst.jigdo \
    -N #\
#    -c
#    -r \
wget http://cdimage.debian.org/cdimage/weekly-builds/amd64/jigdo-cd/debian-testing-amd64-netinst.template \
    -N #\
#    -c
#    -r \

# apres il faut lancer la commande jigdo-lite
# la premiere version avait le défaut de ne pas lancer le scan du contenu du fichier iso.old
# la seconde version, (grace à echo 1 | ...), permet de lire le repertoire /mnt/iso.old/
# avant de lancer les téléchargements restants et la construction du fichier iso
#jigdo-lite --noask debian-testing-amd64-netinst.jigdo
echo 1 | jigdo-lite debian-testing-amd64-netinst.jigdo

# on demounte l'ancienne image iso
sudo umount /mnt/iso.old
sudo umount /mnt/iso.tmp

# suppression des fichiers précédents
rm -f debian-testing-amd64-netinst.iso.old
rm -f debian-testing-amd64-netinst.jigdo.unpacked
rm -f jigdo-file-cache.db
