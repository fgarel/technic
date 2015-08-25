#/bin/sh


echo "/usr/local/bin/generateDS.py ...."
# ici member-specs=dict est le dict de dictionnaire....
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
