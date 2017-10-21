#!/bin/sh

# Commande pour convertir des données de dwg vers dxf

# Command Line Format is:
#   Quoted Input Folder
#   Quoted Output Folder
#   Output_version
#     {"ACAD9","ACAD10","ACAD12",
#      "ACAD13","ACAD14",
#      "ACAD2000","ACAD2004",
#      "ACAD2007","ACAD2010",
#      "ACAD2013","ACAD2018"}
#   Output File type
#     {"DWG","DXF","DXB"}
#   Recurse Input Folder
#     {"0","1"}
#   Audit each file
#     {"0","1"}
#   [optional] Input files filter
#     (default: "*.DWG;*.DXF")


TeighaFileConverter \
  ./dwg \
  ./dxf \
  "ACAD2010" \
  "DXF" \
  "1" \
  "1" \
  "*.DWG"
