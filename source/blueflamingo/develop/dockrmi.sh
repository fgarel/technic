#!/bin/sh

# pour supprimer toutes les images
#docker.io images

#docker.io images | tail -n+2 | cut -c 43-54

#docker.io rmi `docker.io images | tail -n+2 | cut -c 43-54`

# pour supprimer toutes les images, sauf la premiere qui a été teléchargée
docker.io rmi `docker.io images | tail -n+2 | head -n-1 | cut -c 43-54`
