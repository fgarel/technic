#!/bin/sh

# arret et relance du service

sudo service docker status

sudo service docker stop

sudo rm -f /var/run/docker.*

sudo service docker start

# pour lister les images
docker.io images

# pour lister les conteneurs
docker.io ps -as

