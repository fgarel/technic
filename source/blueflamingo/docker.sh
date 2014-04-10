#!/bin/sh

#documentation sur docker
#http://linuxfr.org/news/docker-tutoriel-pour-manipuler-les-conteneurs

#Installation de Docker
#sudo echo "deb http://get.docker.io/ubuntu docker main" > /etc/apt/sources.list.d/docker.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
#apt-get update
#apt-get install lxc-docker


#utilisation de docker
docker pull debian
docker run -i -t debian /bin/bash
