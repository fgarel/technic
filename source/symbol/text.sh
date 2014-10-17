#!/bin/sh

#          -font "Source Code Pro Medium" \
#        -background lightblue \
  convert \
          -size 128x128 \
          -background '#DDDDDDFF' \
          -border 5x5 \
          -bordercolor "#FF950EFF" \
          -fill "#FF950EFF"  \
          -pointsize 32  \
          -font Source-Code-Pro-Bold \
          -gravity North \
          label:"ASSEP" \
          -gravity Center \
          -strokewidth 4 \
          -draw "\
                 line 25,50 75,50" \
          -gravity SouthEast \
          -draw "font-size 24 \
                 font Source-Code-Pro-Bold \

                 text 0,0 'L'" \
          ASSEP.png
