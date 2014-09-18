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

#FROM debian:wheezy
FROM debian:testing
MAINTAINER Frédéric Garel "frederic.garel@gmail.com"

# Set the env variable DEBIAN_FRONTEND to noninteractive
ENV DEBIAN_FRONTEND noninteractive

# Depots, mises a jour
ADD sources.list /etc/apt/sources.list
RUN (apt-get update && apt-get -y -q install aptitude && aptitude -y -q install ssh git curl)
ADD https://raw.githubusercontent.com/fgarel/myDebianInstall01/master/usr/sbin/blueflamingo-installer /usr/local/sbin/blueflamingo-installer
#ADD https://raw.githubusercontent.com/fgarel/myDebianInstall01/master/etc/apt/sources.list.d/all.list /etc/apt/sources.list.d/all.list
#ADD https://raw.githubusercontent.com/fgarel/myDebianInstall01/master/etc/apt/preferences.testing /etc/apt/preferences
RUN /usr/local/sbin/blueflamingo-installer
#RUN (rm -f /etc/apt/sources.list)
#RUN (apt-get update && apt-get -y -q install aptitude && aptitude -y -q install ssh git)
#RUN (aptitude -y -q upgrade && aptitude -y -q dist-upgrade && aptitude -y -q autoclean && aptitude -y -q autoremove && aptitude -y -q install apt-file && apt-file update)
#RUN (cd /root && git clone --progress --verbose http://github.com/fgarel/myDebianInstall01.git /root/myDebianInstall01)
#RUN (cp /root/myDebianInstall01/usr/sbin/fggitfetch-preseed.sh /usr/sbin)
#RUN (fggitfetch-preseed.sh)
#RUN echo "deb http://ftp.fr.debian.org/debian/ wheezy main non-free contrib" > /etc/apt/sources.list
#RUN echo "deb http://ftp.fr.debian.org/debian/ testing main non-free contrib" > /etc/apt/sources.list
#RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove)
#RUN (apt-get update && apt-get upgrade -y -q && apt-get dist-upgrade -y -q && apt-get -y -q autoclean && apt-get -y -q autoremove && apt-get install -y -q aptitude apt-file && apt-file update)
#RUN (apt-get install -y -q aptitude)
#RUN (aptitude install -y -q vim ssh supervisor git)
#RUN aptitude install -y -q git
#RUN (aptitude install -y -q autopoint automake check doxygen gcc 'g++' libfontconfig-dev libfribidi-dev libfreetype6-dev libgif-dev libglib2.0-dev libgles2-mesa-dev libgstreamer1.0-dev libjpeg-dev libluajit-5.1-dev libmount-dev libopenjpeg-dev libpulse-dev libsndfile1-dev libssl-dev libtiff5-dev libtool libudev-dev libxp-dev make pkg-config x11proto-print-dev xorg-dev xserver-xorg-dev)
#RUN aptitude install -y -q git
#RUN aptitude install -y -q autopoint # necessaire pour compiler terminology
#RUN aptitude install -y -q automake # necessaire pour compiler terminology
#RUN aptitude install -y -q check # necessaire pour compiler terminology
#RUN aptitude install -y -q doxygen # necessaire pour compiler terminology
#RUN aptitude install -y -q gcc # necessaire pour compiler terminology
#RUN aptitude install -y -q 'g++' # necessaire pour compiler terminology
#RUN aptitude install -y -q libfontconfig-dev # necessaire pour compiler terminology
#RUN aptitude install -y -q libfribidi-dev # necessaire pour compiler terminology
#RUN aptitude install -y -q libfreetype6-dev # necessaire pour compiler terminology
#RUN aptitude install -y -q libjpeg-dev # necessaire pour compiler terminology
#RUN aptitude install -y -q libssl-dev # necessaire pour compiler terminology
#RUN aptitude install -y -q libtool # necessaire pour compiler terminology
#RUN aptitude install -y -q libluajit-5.1-dev # necessaire pour compiler terminology
#RUN aptitude install -y -q make # necessaire pour compiler terminology
#RUN aptitude install -y -q pkg-config # necessaire pour compiler terminology
#RUN (cd /usr/local/src && git clone http://git.enlightenment.org/core/efl.git)
#RUN (cd /usr/local/src/efl && automake -a && ~/.autogen.sh)
#RUN (cd /usr/local/src/efl && automake -a)
#RUN (cd /usr/local/src/efl && ~/.autogen.sh)
#RUN (cd /usr/local/src && git clone http://git.enlightenment.org/core/elementary.git)
#RUN (cd /usr/local/src && git clone http://git.enlightenment.org/apps/terminology.git)
#RUN apt-get install -y -q vim ssh supervisor python-software-properties apache2 libapache2-mod-php5 php5-cli php5-mysql

# Installing the environment required: xserver, xdm, flux box, roc-filer and ssh
#RUN apt-get install -y -q vim ssh
#RUN apt-get install -y xpra rox-filer ssh pwgen xserver-xephyr xdm fluxbox

# Demarrage des services
#
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD start.sh /start.sh
#ADD https://github.com/fgarel/myDebianInstall01/tree/master/usr/sbin/fggitftech-preseed.sh /usr/sbin/fggitfetch-preseed.sh
#ADD https://github.com/fgarel/myDebianInstall01/tree/master/etc/apt/sources.list.d/all.list /etc/apt/sources.list.d/all.list
#ADD https://raw.githubusercontent.com/fgarel/myDebianInstall01/master/etc/apt/sources.list.d/all.list /etc/apt/sources.list.d/all.list
#ADD https://github.com/fgarel/myDebianInstall01/tree/master/etc/apt/preferences /etc/apt/preferences
#ADD https://raw.githubusercontent.com/fgarel/myDebianInstall01/master/etc/apt/preferences /etc/apt/preferences

EXPOSE 22
# Start xdm and ssh services.
CMD ["/bin/bash", "-e", "/start.sh"]
