# This file creates a container that runs X11 and SSH services
# The ssh is used to forward X11 and provide you encrypted data
# communication between the docker container and your local 
# machine.
#
# Xpra allows to display the programs running inside of the
# container such as Firefox, LibreOffice, xterm, etc. 
# with disconnection and reconnection capabilities
#
# Xephyr allows to display the programs running inside of the
# container such as Firefox, LibreOffice, xterm, etc. 
#
# Fluxbox and ROX-Filer creates a very minimalist way to 
# manages the windows and files.
#
# Author: Roberto Gandolfo Hashioka
# Date: 07/28/2013

FROM debian:wheezy
MAINTAINER Frédéric Garel "frederic.garel@gmail.com"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Depots, mises a jour
RUN echo "deb http://ftp.fr.debian.org/debian/ wheezy main non-free contrib" > /etc/apt/sources.list
RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
#RUN apt-get install -y -q vim ssh supervisor python-software-properties apache2 libapache2-mod-php5 php5-cli php5-mysql

# Installing the environment required: xserver, xdm, flux box, roc-filer and ssh
#RUN apt-get install -y -q vim ssh
#RUN apt-get install -y xpra rox-filer ssh pwgen xserver-xephyr xdm fluxbox



EXPOSE 22
# Start xdm and ssh services.
CMD ["/bin/bash"]
