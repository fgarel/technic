#!/bin/sh

BASE='/home/fred/geodata/autres/patrimoine/'
LIST='999998 999999'


for ITEM in $LIST
do
    CMD='mkdir '$BASE$ITEM/
    echo $CMD
    CMD2='ln -s '$BASE$ITEM' '$BASE'batiment_y'
    echo $CMD2

done
