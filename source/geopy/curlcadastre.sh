#!/bin/sh

CADDEPARTEMENT=017
CADCOMMUNE=300
CADQUARTIER=000
CADSECTION=BX
CADFEUILLE=01
CADNUMERO=217

# sans cookies, 1ere fois, on va sur la page d'accueil
curl --header 'Host: www.cadastre.gouv.fr' \
     --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' \
     --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
     --header 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' \
     --header 'Content-Type: application/x-www-form-urlencoded' \
     --cookie-jar cookies.txt \
     'http://www.cadastre.gouv.fr/scpc/accueil.do' \
     -L \
     -o test01.html

# avec cookies, on va sur la page rechercherParReferenceCadastrale
curl --header 'Host: www.cadastre.gouv.fr' \
     --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' \
     --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
     --header 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' \
     --header 'Content-Type: application/x-www-form-urlencoded' \
     --cookie cookies.txt \
     --cookie-jar cookies.txt \
     'http://www.cadastre.gouv.fr/scpc/rechercherParReferenceCadastrale.do' \
     -L \
     -o test02.html

# avec cookies, on va sur la page rechercherParReferenceCadastrale
# on poste des infos : recherche des plans de la parcelle BY 3
codeDepartement="017"
codePostal=17000
feuilleLibelle=""
nbResultatParPage=10
numeroParcelle="3"
prefixeFeuille=000
prefixeParcelle=000
rechercheType=1
sectionLibelle="BY"
ville="la%20rochelle"
x=45
y=5

DATA3="codeDepartement=$codeDepartement&codePostal=$codePostal&feuilleLibelle=$feuilleLibelle&nbResultatParPage=$nbResultatParPage&numeroParcelle=$numeroParcelle&prefixeFeuille=$prefixeFeuille&prefixeParcelle=$prefixeParcelle&rechercheType=$rechercheType&sectionLibelle=$sectionLibelle&ville=$ville&x=$x&y=$y"

echo "DATA3=$DATA3"

curl --header 'Host: www.cadastre.gouv.fr' \
     --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' \
     --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
     --header 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' \
     --header 'Content-Type: application/x-www-form-urlencoded' \
     --cookie cookies.txt \
     --cookie-jar cookies.txt \
     --data "$DATA3" \
     'http://www.cadastre.gouv.fr/scpc/rechercherParReferenceCadastrale.do' \
     -L \
     -o test03.html



#  http://www.cadastre.gouv.fr/scpc/rechercherParReferenceCadastrale.do?codeDepartement=017&codePostal=17000&feuilleLibelle=&nbResultatParPage=10&numeroParcelle=3&prefixeFeuille=000&prefixeParcelle=000&rechercheType=1&sectionLibelle=BY&ville=la%20rochelle&x=45&y=5

p=9A300000BY0003
f=9A300000BY01

DATA4="p=$p&f=$f"

echo "DATA4=$DATA4"

curl --header 'Host: www.cadastre.gouv.fr' \
     --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' \
     --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
     --header 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' \
     --header 'Content-Type: application/x-www-form-urlencoded' \
     --cookie cookies.txt \
     --cookie-jar cookies.txt \
     --data "$DATA4" \
     'http://www.cadastre.gouv.fr/scpc/afficherCarteParcelle.do?' \
     -L \
     -o test04.html




curl -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
     -H 'Accept-Encoding: gzip, deflate' \
     -H 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' \
     -H 'Cache-Control: no-cache' \
     -H 'Connection: keep-alive' \
     -H 'Content-Type: application/xml; charset=UTF-8' \
     -H 'Host: www.cadastre.gouv.fr' \
     -H 'Pragma: no-cache' \
     -H 'Referer: http://www.cadastre.gouv.fr/scpc/afficherCarteParcelle.do' \
     -H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' \
     --cookie cookies.txt \
     --cookie-jar cookies.txt \
     -X POST \
     -d @by3.xml \
     'http://www.cadastre.gouv.fr/scpc/wfs' \
     -L \
     | gunzip > test05.html



DRAPEAU="false"
ECHELLE=1000
MAPBBOX="1376669.6400000001%2C5227375.4399999995%2C1376865.1400000001%2C5227586.4399999995"
MAPROTATION=0
NATURE="V"
ORIENTPAGE="Portrait"
RESOLUTION=""	
RFV_REF=""
RFV_X=1376767.3900000001
RFV_Y=5227480.9399999995
TAILLEPAGE="A4"

DATA6="DRAPEAU=$DRAPEAU&ECHELLE=$ECHELLE&MAPBBOX=$MAPBOX&MAPROTATION=$MAPROTATION&NATURE=$NATURE&ORIENTPAGE=$ORIENTPAGE&RESOLUTION=$RESOLUTION&RFV_REF=$RFV_REF&RFV_X=$RFV_X&RFV_Y=$RFV_Y&TAILLEPAGE=$TAILLEPAGE"

echo "DATA6=$DATA6"


curl --header 'Host: www.cadastre.gouv.fr' \
     --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' \
     --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
     --header 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' \
     --header 'Content-Type: application/x-www-form-urlencoded' \
     --cookie cookies.txt \
     --cookie-jar cookies.txt \
     --data "$DATA6" \
     'http://www.cadastre.gouv.fr/scpc/imprimerExtraitCadastral.do?' \
     -L \
     -v \
     -o test06.html


# curl --header 'Host: www.cadastre.gouv.fr' --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' --header 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' --header 'Content-Type: application/x-www-form-urlencoded' --header 'Cookie: JSESSIONID=837A3BFEBBEF270ECB1B62D120E5A265.scppup08worker1' 'http://www.cadastre.gouv.fr/scpc/imprimerExtraitCadastral.do' -O -J -L



#######################################






bbox=1372315.19,5222786.946394628,1382563.36,5230091.943605372
exception=application/vnd.ogc.se_inimage
format=image/png
height=345
layers=CDIF:LS3,CDIF:LS2,CDIF:LS1,CDIF:PARCELLE,CDIF:NUMERO,CDIF:PT3,CDIF:PT2,CDIF:PT1,CDIF:LIEUDIT,CDIF:SUBSECTION,CDIF:SECTION,CDIF:COMMUNE
request=GetMap
styles=LS3_90,LS2_90,LS1_90,PARCELLE_90,NUMERO_90,PT3_90,PT2_90,PT1_90,LIEUDIT_90,SUBSECTION_90,SECTION_90,COMMUNE_90
version=1.1
width=484


URLVAR1="ville=LA+ROCHELLE&codePostal=17000&codeDepartcodeDepartement=017&prefixeParcelle=000&sectionLibelle=BX&numeroParcelle=&rechercheType=2&prefixeFeuille=000&feuilleLibelle=BY01"

URLCOMPLET1="http://www.cadastre.gouv.fr/scpc/rechercherParReferenceCadastrale.do?$URLVAR1"

URLVAR2=9A$CADCOMMUNE$CADQUARTIER$CADSECTION$CADFEUILLE
echo $URL
URLCOMPLET2="http://www.cadastre.gouv.fr/scpc/afficherCarteFeuille.do?f=$URLVAR&dontSaveLastForward&keepVolatileSession"
echo $URLCOMPLET
curl --header 'Host: www.cadastre.gouv.fr' \
     --cookie-jar cookies.txt \
     "$URLCOMPLET1" \
     -L \
     -o accueil.html

echo "URLCOMPLET1 = $URLCOMPLET1"
echo "http://www.cadastre.gouv.fr/scpc/rechercherParReferenceCadastrale.do?ville=LA+ROCHELLE&codePostal=17000&codeDepartement=017&prefixeParcelle=000&sectionLibelle=BX&numeroParcelle=&rechercheType=2&prefixeFeuille=000&feuilleLibelle=BY01#"

curl --header 'Host: www.cadastre.gouv.fr' \
     --header 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0' \
     --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
     --header 'Accept-Language: fr,fr-fr;q=0.8,en-us;q=0.5,en;q=0.3' \
     --header 'Content-Type: application/x-www-form-urlencoded' \
     --cookie cookies.txt \
     --cookie-jar cookies.txt \
     "$URLCOMPLET2" \
     -L \
     -o $CADSECTION$CADFEUILLE.html

echo "URLCOMPLET2 = $URLCOMPLET2"
#     --header 'Cookie: JSESSIONID=856525D7906892E53E0FE435FDE4BA50.scppup06worker1' \
