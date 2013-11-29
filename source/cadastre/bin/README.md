Le script csv2db.sh permet de 
lire un fichier csv
ecrire dans une base de donnée et y faire des traitments
d'exporter les points dans un fichier de sortie


Avant de pouvoir exécuter ce script, quelques petites préparations
doivent être réalisées.

Préparation du flux entrant
===========================
Mettre les fichiers initiaux dans le bon repertoire

    cp data/point2.csv ~/geodata/vecteur/test/


Préparation de l'infrastructure intermédiaire
=============================================

Creation d'une base de donnée dbmapnik
--------------------------------------
L'installation de postgresql ainsi que la creation des bases sont détaillées dans le fichier
https://github.com/fgarel/myDebianInstall01/blob/master/usr/sbin/fgaptitudeinstallgis02b.sh

on retient ces quelques lignes :

    sudo -u postgres createuser -s contrib
    sudo -u postgres psql -d templatepostgis -c "ALTER ROLE contrib WITH PASSWORD 'alambic';"
    sudo -u postgres createdb -O contrib -T templatepostgis dbmapnik



Création d'un fichier .pgpass
-----------------------------
Le fichier .pgpass doit être placé dans le répertoire personnel de l'utilisateur.
La doc sur ce fichier est ici :
http://docs.postgresql.fr/9.1/libpq-pgpass.html

    cp .pgpass ~/
    chmod 0600 ~/.pgpass

Préparation du flux sortant
===========================
Autoriser l'ecriture dans le repertoire de sortie

    chmod 755 ~/geodata/vecteur/test/

Cas particulier d'un montage entre linux et windows
===================================================

Installation de autofs et de smbfs
----------------------------------
http://doc.ubuntu-fr.org/autofs_avec_samba

### Installation

    links2 -g www.google.fr
    sudo aptitude install autofs
    sudo aptitude install cifs-utils/squeeze-backports smbfs

### Configuration

    vi /etc/auto.master
    /net    /etc/auto.net   --ghost,--timeout=30

    vi /etc/auto.net
    dsifichiers02/services2     -fstype=smb,rw,options      dsifichiers02:/services2
    san/echanges                -fstype=smb,rw,options      san:/ECHANGES
    cartes/sig_ville            -fstype=smb,rw,options      cartes:/SIG_VILLE


