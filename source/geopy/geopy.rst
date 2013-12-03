*********
GeoCoding
*********

Le but est de trouver les coordonnées d'un objet quand on caonnait une information de localisation indirecte,

c'est à dire, soit :
 - une adresse postale,
 - une reférence cadastrale

Geocoding avec une référence cadastrale
=======================================

Pour recuperer l'image d'une feuille cadastrale, l'adresse est :

http://www.cadastre.gouv.fr/scpc/rechercherParReferenceCadastrale.do?ville=LA+ROCHELLE&codePostal=17000&codeDepartement=017&prefixeParcelle=000&sectionLibelle=BX&numeroParcelle=&rechercheType=2&prefixeFeuille=000&feuilleLibelle=BY01&nbResultatParPage=10&x=74&y=6i

http://www.cadastre.gouv.fr/scpc/afficherCarteFeuille.do?f=9A300000BY01&dontSaveLastForward&keepVolatileSession


Pour récupérer l'image d'une parcelle

http://www.cadastre.gouv.fr/scpc/rechercherParReferenceCadastrale.do?ville=LA+ROCHELLE&codePostal=17000&codeDepartement=017&rechercheType=1&prefixeParcelle=000&sectionLibelle=BX&numeroParcelle=217&prefixeFeuille=000&feuilleLibelle=BY01&nbResultatParPage=10&x=45&y=6

http://www.cadastre.gouv.fr/scpc/afficherCarteParcelle.do?p=9A300000BX0217&f=9A300000BX01&dontSaveLastForward&keepVolatileSessioni

Pour recuperer le plan pdf

http://www.cadastre.gouv.fr/scpc/imprimerExtraitCadastral.do?MAPBBOX=1377170.23%2C5227775.8100000005%2C1377365.73%2C5227986.8100000005&MAPROTATION=0&TAILLEPAGE=A4&ORIENTPAGE=Portrait&RFV_REF=&RFV_X=1377267.98&RFV_Y=5227881.3100000005&ECHELLE=1000&NATURE=V&RESOLUTION=&DRAPEAU=false
http://www.cadastre.gouv.fr/scpc/imprimerExtraitCadastral.do?MAPBBOX=1377170%2C5227775%2C1377365%2C5227986&MAPROTATION=0&TAILLEPAGE=A4&ORIENTPAGE=Portrait&RFV_REF=&RFV_X=1377268&RFV_Y=52278815&ECHELLE=1000&NATURE=V&RESOLUTION=&DRAPEAU=false

Geocoding avec une une adresse postale
======================================

Utilisation de geopy
--------------------
http://code.google.com/p/geopy/

Utilisation de l'api mapquest
-----------------------------
http://developer.mapquest.com/web/products/open/geocoding-service
http://open.mapquestapi.com/geocoding/
http://open.mapquestapi.com/geocoding/v1/address?key=Fmjtd%7Cluubn16ang%2C82%3Do5-90axua&callback=renderOptions&inFormat=kvp&outFormat=json&location=19 rue des roseaux, la rochelle, france

Geocoding inverse
-----------------
C'est à dire, trouver une adresse postale à partir d'une coordonnées
http://open.mapquestapi.com/geocoding/v1/reverse?key=Fmjtd%7Cluubn16ang%2C82%3Do5-90axua&callback=renderReverse&location=46.170806,-1.15526

