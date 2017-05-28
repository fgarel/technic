#!/bin/sh

#          -font "Source Code Pro Medium" \
#          -font Source-Code-Pro-Bold \
#          -font "Source Code Pro for Powerline Bold" \
#          -font "Source Code for Powerline, Bold" \
#          -font "Source Code Pro for Powerline" \
#                 font Source-Code-Pro-Bold \
#        -background lightblue \
  convert \
          -size 118x118 \
          -background '#DDDDDDFF' \
          -border 5x5 \
          -bordercolor "#FF950EFF" \
          -fill "#FF950EFF"  \
          -pointsize 32  \
          -gravity North \
          label:"ASSEP" \
          -gravity Center \
          -strokewidth 4 \
          -draw "\
                 line 25,50 102,50" \
          -gravity SouthEast \
          -draw "font-size 24 \

                 text 5,2 'L'" \
          ASSEP.png
