#!/bin/sh

# script pour la recuperation des symboles carto
# ce script complète le fichier tagEtSymboles.ods

export OLDFG=/home/fred/Documents/technic/source/symbologie


# liste des symboles openstreetmap-carto
# vu ici https://github.com/gravitystorm/openstreetmap-carto
echo "# liste des symboles openstreetmap-carto"
cd ~/Images/icones/
git clone https://github.com/gravitystorm/openstreetmap-carto.git
cd ~/Images/icones/openstreetmap-carto/
git fetch origin master
cd ~/Images/icones/
find ~/Images/icones/openstreetmap-carto/symbols/ -iname "*.svg" > $OLDFG/data/list_openstreetmap-carto_icons.txt


# Liste de symboles SJJB Map icons
# http://www.sjjb.co.uk/mapicons/contactsheet
# TODO


# liste des symboles Humanitarian
# vu ici https://github.com/hotosm/HDM-CartoCSS/
echo "# liste des symboles HDM-CartoCSS"
cd ~/Images/icones/
git clone https://github.com/hotosm/HDM-CartoCSS.git
cd ~/Images/icones/HDM-CartoCSS/
git fetch origin master
cd ~/Images/icones/
find ~/Images/icones/HDM-CartoCSS/icons/ -iname "*.svg" > $OLDFG/data/list_HDM-CartoCSS_icons.txt


# liste des symboles maki
# download ici : https://labs.mapbox.com/maki-icons/
echo "# liste des symboles maki"
cd ~/Images/icones/
git clone https://github.com/mapbox/maki.git
cd ~/Images/icones/maki/
git fetch origin master
cd ~/Images/icones/
find ~/Images/icones/maki/icons/ -iname "*.svg" > $OLDFG/data/list_maki_icons.txt


# liste des symboles map-icons
# vu ici : https://github.com/openstreetmap/map-icons
echo "# liste des symboles map-icons"
cd ~/Images/icones/
git clone https://github.com/openstreetmap/map-icons.git
cd ~/Images/icones/map-icons/
git fetch origin master
cd ~/Images/icones/
find ~/Images/icones/map-icons/svg/ -iname "*.svg" > $OLDFG/data/list_map-icons-svg_icons.txt
find ~/Images/icones/map-icons/svg-twotone/ -iname "*.svg" > $OLDFG/data/list_map-icons-svg-twotone_icons.txt


# liste des symboles open-svg-map-icons
# vu ici https://github.com/twain47/Open-SVG-Map-Icons
echo "# liste des symboles Open-SVG-Map-Icons"
cd ~/Images/icones/
git clone https://github.com/twain47/Open-SVG-Map-Icons.git
cd ~/Images/icones/Open-SVG-Map-Icons/
git fetch origin master
cd ~/Images/icones/
find ~/Images/icones/Open-SVG-Map-Icons/svg/ -iname "*.svg" > $OLDFG/data/list_open-svg-map-icons_icons.txt


# liste des symboles osmic
# https://github.com/gmgeo/osmic.git
echo "# liste des symboles osmic"
cd ~/Images/icones/
git clone https://github.com/gmgeo/osmic.git
cd ~/Images/icones/osmic/
git fetch origin master
cd ~/Images/icones/
find ~/Images/icones/osmic/ -iname "*.svg" >$OLDFG/data/list_osmic_icons.txt


# liste des symboles CDA icones
echo "# liste des symboles CDA"
find ~/k/sig_legende/symboles/charte_carto/Pictos_Qgis/ -iname "*.svg" > $OLDFG/data/list_CDA_icons.txt


# liste des symboles 
echo "# liste des symboles svg"
find ~/Images/icones/svg/ -iname "*.svg" > $OLDFG/data/list___icons.txt





cd $OLDFG/bin/
