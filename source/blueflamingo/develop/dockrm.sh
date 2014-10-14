#!/bin/sh


# pour supprimer les conteneurs
#docker.io ps -as

#docker.io ps -as | tail -n+2 | cut -f 1 -d ' '

docker rm `docker.io ps -as | tail -n+2 | cut -f 1 -d ' '`
