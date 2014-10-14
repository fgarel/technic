#!/bin/sh

# arret et relance du service

sudo service docker.io status

sudo service docker.io stop

sudo rm -f /var/run/docker.*

sudo service docker.io start

# pour lister les images
docker.io images

# pour lister les conteneurs
docker.io ps -as

