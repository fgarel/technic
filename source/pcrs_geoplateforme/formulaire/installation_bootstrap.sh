#!/bin/sh


# Nettoyage
echo "Nettoyage"
rm -rf sandbox/bootstrap
rm -rf sandbox/font-awesome

# Recopie de bootstrap
echo "Recopie de bootstrap"
cp -r bootstrap-3.3.7-dist sandbox
mv sandbox/bootstrap-3.3.7-dist sandbox/bootstrap

# Recopie de font-awesome
echo "Recopie de font-awesome"
cp -r font-awesome-4.6.3 sandbox
mv sandbox/font-awesome-4.6.3 sandbox/font-awesome

# Recopie de jquery
echo "Recopie de jquery"
mkdir sandbox/js
cp jquery-3.1.0.min.js sandbox/js 

# Recopie de l'exemple
echo "Recopie de l'exemple"
cp Template-ContactFormMap/Template-ContactFormMap\\index.html sandbox/index.html

