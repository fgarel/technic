#!/bin/sh


# pour travailler dans la nouvelle image blueflamingo
docker.io run -i \
              -t \
              --name="myContainer" \
              -e "TERM=screen-256color" \
              -u blueflamingo \
              -w /home/blueflamingo \
              -e "HOME=/home/blueflamingo" \
              fgarel/blueflamingo:1.0 /bin/zsh
