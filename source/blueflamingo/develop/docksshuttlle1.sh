#!/bin/sh

# pour passer le proxy
sudo sshuttle -r fgarel@ssh.freeshell.de:443 \
              -x 10.0.0.0/8 \
              0/0


