#!/bin/sh

cat header.gml > empriseDeclarationQgis.gml
cat empriseDeclaration.gml | sed -E -e 's/\r$//g' -e 's/<.*>/\n/' | sed -e '/^$/d' | sed '$!N;s/\n/ /g' | sed '$!N;s/\n/ /g' | sed -E -e 's/(\S*) (\S*) /\1,\2\n/g' | sed -E -e 's/(\S*) (\S*)/\1,\2/g' >> empriseDeclarationQgis.gml
cat footer.gml >> empriseDeclarationQgis.gml

ogrinfo empriseDeclarationQgis.gml empriseDeclaration
