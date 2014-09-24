#!/bin/sh

#documentation sur docker
#http://linuxfr.org/news/docker-tutoriel-pour-manipuler-les-conteneurs

#Installation de Docker
#sudo echo "deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
#apt-get update
##apt-get install lxc-docker
#apt-get install docker.io

# il faut ensuite modifer le fichier /etc/default/docker.io
# afin de pouvoir se connecter au reseau 
# WARNING: Local (127.0.0.1) DNS resolver found in resolv.conf and containers can't use it. Using default external servers : [8.8.8.8 8.8.4.4]
# http://askubuntu.com/questions/475764/docker-io-dns-doesnt-work-its-trying-to-use-8-8-8-8
# sudo vi /etc/default/docker.io
# DOCKER_OPTS="--dns 10.254.141.250 --dns 10.254.141.253"
# ces adresses ip sont ceux des serveurs dns de la ville
# dig mairie.fr
# dig dsiad03.mairie.fr
# dig dsiad04.mairie.fr

# puis, il faut relancer le server pour charger cette nouvelle configuration
# sudo restart docker.io


# recuperation du fichier blueflamingo-installer
# on fait cette recuperation dans docker.sh et non dans le dockerfile pour regler les problèmes de proxy
#rm -f blueflamingo-installer
#wget -O blueflamingo-installer https://raw.githubusercontent.com/fgarel/myDebianInstall01/master/usr/sbin/blueflamingo-installer

# utilisation de docker en interactif

# telechargement d'une image
#docker pull debian
# un simple cat
#docker run -i -t debian:testing cat /etc/apt/sources.list
# travailler dans un shell
#docker run -i -t debian /bin/bash

# utilisation de docker en automatise
# vi Dockerfile
docker.io build -t fgarel/blueflamingo:1.0 .

# pour lister les conteneurs
docker.io ps -as

# pour lister les images
docker.io images

# pour travailler dans la nouvelle image blueflamingo
docker.io run -i -t fgarel/blueflamingo:1.0 /bin/bash
