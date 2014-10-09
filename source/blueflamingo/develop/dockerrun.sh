#!/bin/sh


# pour lister les conteneurs
docker.io ps -as

# pour lister les images
docker.io images

# pour travailler dans la nouvelle image blueflamingo
docker.io run -i -t -u blueflamingo -w /home/blueflamingo fgarel/blueflamingo:1.0 /bin/bash
