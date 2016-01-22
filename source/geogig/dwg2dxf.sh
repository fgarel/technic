#!/bin/sh

cp ~/f/CARTOGRAPHIE/Plans/1_Topo_Existants/4_Plans_conformes_CC46/Rue\ du\ temple/115137-1.dwg ~/Documents/technic/source/geogig/dwg/


# Utilisation de TeighaFileConverter pour transormer du dwg en dxf

#Command Line Format is:
#  Quoted Input Folder
#  Quoted Output Folder
#  Output_version
#    {"ACAD9","ACAD10","ACAD12",
#     "ACAD13","ACAD14",
#     "ACAD2000","ACAD2004",
#     "ACAD2007","ACAD2010"}
#  Output File type
#    {"DWG","DXF","DXB"}
#  Recurse Input Folder
#    {"0","1"}
#  Audit each file
#    {"0","1"}
#  [optional] Input files filter
#    (default: "*.DWG;*.DXF")



/usr/bin/TeighaFileConverter \
    ~/Documents/technic/source/geogig/dwg/ \
    ~/Documents/technic/source/geogig/dxf/ \
    "ACAD2010" \
    "DXF" \
    "1" \
    "*.DWG"
