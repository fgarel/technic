#!/bin/sh

#export GMTHOME=/usr/share/gmt
#export GMT_SHAREDIR=/usr/share/gmt/coast:/usr/share/gmt/pslib
#export GMT_SHAREDIR=/usr/share/gmt/coast
#export PSL_SHAREDIR=/usr/share/gmt/pslib
#export GMT_SHAREDIR=/usr/share/gmt

gmtset -G$HOME/.gmtdefaults4 BASEMAP_TYPE fancy+ PLOT_DEGREE_FORMAT ddd:mmF

pscoast -R-1.25/-1.06/46.12/46.20 \
        -P \
        -JM10c \
        -Ggreen \
        -Sblue \
        -W \
        -Df \
        -Ir \
        -B0.1g0.1 \
        > gmt_manche_01.ps

ps2pdf gmt_manche_01.ps gmt_manche_01.pdf
