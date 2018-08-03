#/bin/sh



# installation de generateDS
pip3 install --user --upgrade utils bleach html5lib

pip3 install --user --upgrade generateDS bleach


# Recuperation des schemas xsd
# http://www.reseaux-et-canalisations.ineris.fr/gu-presentation/outils/schema-xml-du-dossier-declarant.html
wget -O schemaTeleservice_2_1.xsd http://www.reseaux-et-canalisations.ineris.fr/gu-presentation/schemas/schemaTeleservice_2_1.xsd
wget -O schemaTeleservice_2_2.xsd http://www.reseaux-et-canalisations.ineris.fr/gu-presentation/schemas/schemaTeleservice_2_2.xsd


# correction de l'encodage
cat schemaTeleservice_2_1.xsd | iconv -f 'utf-8' -t 'utf-8' - > schemaTeleservice_2_1-utf8.xsd
cat schemaTeleservice_2_2.xsd | iconv -f 'utf-8' -t 'utf-8' - > schemaTeleservice_2_2-utf8.xsd
sed -e 's/é/e/g' -e 's/è/e/g' -e 's/ê/e/g' -e 's/à/a/g' schemaTeleservice_2_2.xsd | grep -P -no '[^\x00-\x7F]'

sed -e 's/é/e/g' -e 's/è/e/g' -e 's/ê/e/g' -e 's/à/a/g' schemaTeleservice_2_2.xsd > schemaTeleservice_2_2-utf-8.xsd



# fabrication de deux fichiers pour le parseur
# - dtdict_api.py
# - dtdict_appli1.py

# ici member-specs=dict est le dict de dictionnaire....


python3 ~/.local/bin/generateDS.py \
        -f \
        -o dtdict_api.py \
        -s dtdict_appli1.py \
        --super=dtdict_api \
        --member-specs=dict \
        --external-encoding='utf-8' \
        --export='write literal etree' \
        --user-methods=gends_user_methods \
        --silence \
        schemaTeleservice_2_2.xsd


/usr/local/bin/generateDS.py \
        -f \
        -o dtdict_api.py \
        -s dtdict_appli1.py \
        --super=dtdict_api \
        --member-specs=dict \
        --external-encoding='utf-8' \
        --export='write literal etree' \
        --user-methods=gends_user_methods \
        --silence \
        schemaTeleservice_2_1.xsd


# on effectue quelques modifications dans les fichiers qui ont été générés :
#  - il manque parfois des guillemets pour encadrer des caractères spéciaux
#    en particulier dans les comparaisons == ou !=
#  - le false doit devenir False

sed -i -E -e 's/!= , /!= \",\" /g' dtdict_api.py
sed -i -E -e 's/!= \. /!= \"\.\" /g' dtdict_api.py
sed -i -E -e 's/!=   /!= \" \" /g' dtdict_api.py
sed -i -E -e 's/!= \#ISO-8601 /!= \"\#ISO-8601\" /g' dtdict_api.py
sed -i -E -e 's/!= \+ /!= \"\+\" /g' dtdict_api.py
sed -i -E -e 's/!= false /!= False /g' dtdict_api.py

# attention, il faut aussi ajouter une variable global 'counter'
# cette variable globale est utilisé dans les méthodes walk_and_show()
# qui est dans gends_user_methods
sed -i '/from lxml import etree as etree_/a counter = 0' dtdict_api.py

chmod +x dtdict_api.py

chmod +x dtdict_appli1.py

echo "./dtdict_api.py ../data/2015070114453D.xml"
./dtdict_api.py ../data/2015070114453D.xml

echo "./dtdict_appli1.py ../data/2015070114453D.xml"
./dtdict_appli1.py ../data/2015070114453D.xml

echo "./dtdict_appli2.py ../data/2015070114453D.xml"
./dtdict_appli2.py ../data/2015070114453D.xml
