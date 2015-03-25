#!/bin/sh

# conversion d'un gml codé en 4171
cat header4171.gml > empriseDeclarationQgis4171.gml
cat empriseDeclaration4171.gml | sed -E -e 's/\r$//g' -e 's/<.*>/\n/' | sed -e '/^$/d' | sed '$!N;s/\n/ /g' | sed '$!N;s/\n/ /g' | sed -E -e 's/(\S*) (\S*) /\1,\2\n/g' | sed -E -e 's/(\S*) (\S*)/\1,\2/g' >> empriseDeclarationQgis4171.gml
cat footer4171.gml >> empriseDeclarationQgis4171.gml

ogrinfo empriseDeclarationQgis4171.gml empriseDeclaration


# conversion d'un gml codé en 4326
cat header4326.gml > empriseDeclarationQgis4326.gml
cat empriseDeclaration4326.gml | sed -E -e 's/EPSG: 4326; Points//g' -e 's/\[//g' -e 's/\]//g' | sed '$!N;s/\n//g' | sed -E -e 's/; /\n/g' | sed -e '/^$/d' >> empriseDeclarationQgis4326.gml
cat footer4326.gml >> empriseDeclarationQgis4326.gml

ogrinfo empriseDeclarationQgis4326.gml empriseDeclaration
