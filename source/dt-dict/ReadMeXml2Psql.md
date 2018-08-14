# DT-DICT : récupération de la geometrie des emprises à partir des fichiers fournis

Une déclaration arrive sous la forme d'un mail avec pièce jointe.
Après extraction de la ou des pièce(s) jointe(s), (xml et/ou pdf), il s'agit de
lire les informations afin de préparer notre réponse.

Nous allons nous concentrer sur l'extraction de l'emprise géométrique des travaux.

Au départ, nous avons donc un mail avec un pièce jointe.
A la fin, nous devons donc remplir une table postgis :
- l'identifiant sera le numéro de la demande (DT, DICT, ou ATU)
- la colonne géométrie sera issu de l'extraction du pdf ou du xml


## De xml vers postgresql

Soit on utilise les fonctionnalités de postgresql : cependant, nous avons un problème avec xpah et les namespaces : (abandon de cette solution....)
Soit on programme avec python3 (lxml.etree) : c'est la solution que nous adopterons
cf technic/source/symbologie/bin/manipuleSymbole.py

### Pour mémoire : En utilisant les fonctionnalités de postgresql
Nous souhaitons importer les infos du xml dans des tables postgresql.

Pour faire cela, il faut plusieurs étapes :
 - copier le fichier xml au bon endroit et avec les bons droits
 - sous postgresql, utilisation de
    - XMLPARSE pour lire le fichier xml
    - xpath pour extraire les infos à stocker dans les colonnes

Tout cela est expliqué dans la réponse vue ici

https://stackoverflow.com/questions/19007884/import-xml-files-to-postgresql

### La solution adoptée : En utilisant un script python (avec du lxml), suivi par ogr2ogr

cf TestImport_XmlToPostgresql.py
```
./TestImport_XmlToPostgresql.py ../data/sample/dictservices_air_17321626_RE7-180036518G062-DT-15425005.xml
```

suivi de
```
ConvertDaoSig.sh --gmltopsql ../data/_sample/EmpriseDeclaration.gml
```

## Et quand le fichier xml n'est pas fournie ? Analyse des différents fichiers fournis

direct_vlr : la géométrie est
 - 1 dans le fichier xml,
 - 2, dans le fichier \_emprise.pdf,
 - n'est pas dans le 3ème pdf

dictservices_air : la géométrie est :
 - 1 dans le fichier xml, et
 - 2, dans le fichier pdf


dictfr_safege : 1 fichier pdf à lire

dictfr_grdf : 1 fichier pdf à lire

dictfr_somelec : 1 fichier pdf à lire

protys_enedis : la geometrie est dans le fichier pdf

sogelink_betri : la geometrie est dans le fichier pdf

## Stratégie

 * Si le fichier xml est présent, alors nous préférons cette extraction.
   Attention, il y a au moins deux facons d'ecrire une géométrie en xml
   - du gml encapsulé (cf direct_vlr) : *Gml_A*
   - du posList (cf dictservices_air) : *Gml_B*

 * Si le fichier xml est absent, et si le fichier \_emprise.pdf existe, alors nous lisons le fichier \_emprise.pdf
   Le fichier pdf peut etre lu avec deux outils pdftotext et qpdf
   ces deux outils font apparaître que l'emprise est stockée selon deux formes
   - du gml : *Gml_C* ou *Gml_Cp*
   - un tableau de coordonnées : *Table_A* ou *Table_Ap*
   (cf direct_vlr)

 * Si le fichier xml est absent, et si le fichier \_emprise est absent, alors nous lisons le dernier fichier .pdf.
   Nous avons alors deux types de fichiers pdf :
   - ceux dont les coordonnées de l'emprise sont stockés deux fois dans le pdf (cf dictfr_safege),
     - du gml : *Gml_D* ou *Gml_Dp*
     - une liste de coordonnées : *Liste_A* ou *Liste_Ap*
   - ceux dont les coordonnées sont sous la forme d'une liste, appelé *Liste_B* ou *Liste_Bp* (cf dictfr_grdf, dictfr_somelec, sogelink_betri),
   - ceux dont les coordonnées sont sous la forme d'un tableau, appelé *Table_B* ou *Table_Bp* (cf protys_enedis)
   - ceux dont les coordonnées sont sous la forme d'un gml, appelé *Gml_E* ou *Gml_Ep* (cf dictservices_air)

## Les outils

Pour parser nous allons utiliser différents outils :
 - pour lire le fichier xsd
   - generateDS
     https://pypi.org/project/generateDS/
     https://www.davekuhlman.org/generateDS.html
 - pour lire le fichier xml
   - lxml.etree
     https://lxml.de/index.html
     https://lxml.de/parsing.html
 - pour lire les fichiers pdf
   - pdftotext
   - qpdf
 - pour parser les fichiers texte extraits des pdf
   - pyparsing
     https://github.com/pyparsing/pyparsing
     http://scipy-cookbook.readthedocs.io/items/Reading_Custom_Text_Files_with_Pyparsing.html
   - parsing selon expressions regulieres
     http://www.vipinajayakumar.com/parsing-text-with-python/
     https://codereview.stackexchange.com/questions/183668/parse-complex-text-files-using-python
   - parsing selon d'autres méthodes
     https://tomassetti.me/parsing-in-python/

## Extraction de la geométrie à partir du xml

### direct_vrl

On privilégie d'abord le xml : les coordonnées sont en CC46 EPSG:4326

```
cat direct_vlr_2018080100424T_DDC_description.xml
```

Gml_A
```
            <t:emprise>
                <t:geometrie srsName="urn:ogc:def:crs:EPSG::4171" srsDimension="2" gml:id="dtemprise0">
                    <gml:surfaceMembers>
                        <gml:Polygon gml:id="dt0">
                            <gml:exterior>
<gml:LinearRing>
    <gml:coordinates>-1.1503573288314963,46.17082584164174 -1.1511031074494937,46.16997869276238 -1.1511621259012776,46.16975947228694 -1.1508133805043725,46.169365616356366 -1.1499924874931953,46.169150109087376 -1.1496705686652828,46.16914267778717 -1.1494452254857437,46.16933960690319 -1.149021365695659,46.17023878371865 -1.1503573288314963,46.17082584164174</gml:coordinates>
</gml:LinearRing>
                            </gml:exterior>
                        </gml:Polygon>
                    </gml:surfaceMembers>
                </t:geometrie>
                <t:surface>19709.513648547636</t:surface>
                <t:referenceDelaCarte>Photographies aériennes: Géoportail Numérique 2010; Carte: 2012; Limites administratives: 2011</t:referenceDelaCarte>
            </t:emprise>

```

### dictservices

On privilégie d'abord le xml : les coordonnées sont en CC46 EPSG:4326

```

```

Gml_B
```
        <emprise>
            <geometrie srsName="urn:ogc:def:crs:EPSG::4326" srsDimension="2" ns2:id="DT-0">
                <ns2:surfaceMember ns3:type="simple">
                    <ns2:Polygon ns2:id="DT-0-0">
                        <ns2:exterior>
                            <ns2:LinearRing>
                                <ns2:posList srsDimension="2">-1.154034 46.15851 -1.153803 46.158551 -1.153776 46.158844 -1.153428 46.159903 -1.153658 46.159985 -1.154034 46.15851</ns2:posList>
                            </ns2:LinearRing>
                        </ns2:exterior>
                    </ns2:Polygon>
                </ns2:surfaceMember>
            </geometrie>
            <surface>2560.0</surface>
        </emprise>

```

2 ensuite le pdf : les coordonnées sont en 4171
pdftotext dictservices_air_DT.pdf -


## Extraction de deux emprises du fichier emprise.pdf

### direct_vrl

Dans le fichier \_emprise.pdf, les coordonnées sont à deux endroits


#### Extraction avec pdftotext
```
pdftotext direct_vlr_2018080100424T_DDC_emprise.pdf -  > pdftotext.txt
```

Gml_C et Table_A
```
Coordonnées géoréférencées de l'emprise du chantier:
Emprise au format GML :

<gml:MultiSurface srsName="EPSG:4171">
<gml:surfaceMember>
<gml:Polygon>
<gml:exterior>
<gml:LinearRing>
<gml:posList srsDimension="2">-1.150357 46.170826 -1.151103 46.169979
-1.151162 46.169759 -1.150813 46.169366 -1.149992 46.16915 -1.149671
46.169143 -1.149445 46.16934 -1.149021 46.170239 -1.150357 46.170826</
gml:posList>
</gml:LinearRing>
</gml:exterior>
</gml:Polygon>
</gml:surfaceMember>
</gml:MultiSurface>

Vous trouverez ci-dessous les coordonnées du ou des polygones de votre chantier sous le format Latitude/Longitude.
Les coordonnées sont affichées selon les règles suivantes :
• Le premier polygone est celui qui a le point le plus à gauche sur le plan
• Les autres polygones sont ensuite affichés dans le sens des aiguilles d’une montre

Emprise du chantier :
Polygone 1
Sommets

Latitude

Coordonnées sommet 1
Coordonnées sommet 2
Coordonnées sommet 3
Coordonnées sommet 4
Coordonnées sommet 5
Coordonnées sommet 6
Coordonnées sommet 7
Coordonnées sommet 8
Coordonnées sommet 9

46.17082584164174
46.16997869276238
46.16975947228694
46.169365616356366
46.169150109087376
46.16914267778717
46.16933960690319
46.17023878371865
46.17082584164174

Dossier n° 2018080100424T

Page 4 / 4

Longitude
-1.1503573288314963
-1.1511031074494937
-1.1511621259012776
-1.1508133805043725
-1.1499924874931953
-1.1496705686652828
-1.1494452254857437
-1.149021365695659
-1.1503573288314963


```


#### Extraction avec qpdf
```
qpdf --qdf --object-streams=disable direct_vlr_2018080100424T_DDC_emprise.pdf - | iconv -f 'latin1' -t 'utf-8' - | grep --binary-files=text ")Tj$" | sed -E -e 's/\)Tj$//g' -e 's/^\(//g' > qpdf.txt
```

Gml_Cp et Table_Ap
```
Coordonnées géoréférencées de l'emprise du chantier:
Emprise au format GML :
<gml:MultiSurface srsName="EPSG:4171">

<gml:surfaceMember>

<gml:Polygon>

<gml:exterior>

<gml:LinearRing>

<gml:posList srsDimension="2">-1.150357 46.170826 -1.151103 46.169979
-1.151162
46.169759 -1.150813 46.169366 -1.149992 46.16915 -1.149671
46.169143
-1.149445 46.16934 -1.149021 46.170239 -1.150357 46.170826</
gml:posList>

</gml:LinearRing>

</gml:exterior>

</gml:Polygon>

</gml:surfaceMember>

</gml:MultiSurface>
Vous trouverez ci-dessous les coordonnées du ou des polygones de votre chantier sous le format Latitude/Longitude.
Les
coordonnées sont affichées selon les rčgles suivantes :

\225 Le premier polygone est celui qui a le point le plus ŕ gauche sur le plan

\225 Les autres polygones sont ensuite affichés dans le sens des aiguilles d\222une montre
Emprise du chantier :
Polygone 1
Sommets
Latitude
Longitude
Coordonnées sommet 1
46.17082584164174
-1.1503573288314963
Coordonnées sommet 2
46.16997869276238
-1.1511031074494937
Coordonnées sommet 3
46.16975947228694
-1.1511621259012776
Coordonnées sommet 4
46.169365616356366
-1.1508133805043725
Coordonnées sommet 5
46.169150109087376
-1.1499924874931953
Coordonnées sommet 6
46.16914267778717
-1.1496705686652828
Coordonnées sommet 7
46.16933960690319
-1.1494452254857437
Coordonnées sommet 8
46.17023878371865
-1.149021365695659
Coordonnées sommet 9
46.17082584164174
-1.1503573288314963
```

## Extraction de deux emprises du fichier autres.pdf


### pour dictfr_safege

Les coordonnées se présentent en deux endroits dans le fichier pdf :
 - format gml, wgs84/4326 : attention le signe moins en fin de ligne n'est pas pris !
 - format liste_A


methode 1 : attention au signe moins
```
pdftotext dictfr_safege_DICT.309302313.4.document.pdf - > pdftotext.txt
```

Gml_D et Liste_A
```
LEGENDE
Système géodésique
WGS 84

EPSG
EPSG 4326

<gml:MultiPolygon xmlns:gml='http://www.opengis.net/gml'
srsName='EPSG:4326'><gml:polygonMember><gml:Polygon><gml:outerBoundaryIs><gml:LinearRing><gml:coordinates>1.134109,46.14098299999999 -1.133894,46.140961000000004 -1.133921,46.14082700000001 -1.134195,46.140838 1.135482,46.14097599999999 -1.136442,46.141102 -1.137596,46.14138899999999 -1.137794,46.14123199999999 -1.137644,46.141177 1.137789,46.14102099999999 -1.138046,46.141128 -1.1378800000000002,46.141377 -1.137665,46.14150799999998 -1.13729,46.141437
-1.136378,46.14123999999999 -1.136292,46.141365999999984 -1.135911,46.141284999999996 -1.135949,46.141147 1.134109,46.14098299999999</gml:coordinates></gml:LinearRing></gml:outerBoundaryIs></gml:Polygon></gml:polygonMember></gml:M
ultiPolygon>

Polygone 1
(46.140983 -1.134109);(46.140961 -1.133894);(46.140827 -1.133921);(46.140838 -1.134195);(46.140976 1.135482);(46.141102 -1.136442);(46.141389 -1.137596);(46.141232 -1.137794);(46.141177 -1.137644);(46.141021
-1.137789);(46.141128 -1.138046);(46.141377 -1.137880);(46.141508 -1.137665);(46.141437 1.137290);(46.141240 -1.136378);(46.141366 -1.136292);(46.141285 -1.135911);(46.141147 -1.135949);(46.140983
-1.134109);


```

methode 2 : plus complet, mais nettoyage a faire

qpdf --qdf --object-streams=disable dictfr_safege_DICT.309302313.4.document.pdf document1.pdf
```
qpdf --qdf --object-streams=disable dictfr_safege_DICT.309302313.4.document.pdf - | grep --binary-files=text ")Tj$" | sed -E -e 's/\)Tj$//g' -e 's/^\(//g' > qpdf.txt
```

```
qpdf --qdf --object-streams=disable dictfr_safege_DICT.309302313.4.document.pdf - | iconv -f 'latin1' -t 'utf-8' - | grep --binary-files=text ")Tj$" | sed -E -e 's/\)Tj$//g' -e 's/^\(//g' > qpdf.txt
```

Gml_Dp et Liste_Ap
```
<gml:MultiPolygon xmlns:gml='http://www.opengis.net/gml'
srsName='EPSG:4326'><gml:polygonMember><gml:Polygon><gml:outerBoundaryIs><gml:LinearRing><gml:coordinates>-
1.134109,46.14098299999999 -1.133894,46.140961000000004 -1.133921,46.14082700000001 -1.134195,46.140838 -
1.135482,46.14097599999999 -1.136442,46.141102 -1.137596,46.14138899999999 -1.137794,46.14123199999999 -1.137644,46.141177 -
1.137789,46.14102099999999 -1.138046,46.141128 -1.1378800000000002,46.141377 -1.137665,46.14150799999998 -1.13729,46.141437
-1.136378,46.14123999999999 -1.136292,46.141365999999984 -1.135911,46.141284999999996 -1.135949,46.141147 -
1.134109,46.14098299999999</gml:coordinates></gml:LinearRing></gml:outerBoundaryIs></gml:Polygon></gml:polygonMember></gml:M
ultiPolygon>

LEGENDE
Système géodésique
EPSG
WGS 84
EPSG 4326
Polygone 1
\(46.140983 -1.134109\);\(46.140961 -1.133894\);\(46.140827 -1.133921\);\(46.140838 -1.134195\);\(46.140976 -
1.135482\);\(46.141102 -1.136442\);\(46.141389 -1.137596\);\(46.141232 -1.137794\);\(46.141177 -1.137644\);\(46.141021
-1.137789\);\(46.141128 -1.138046\);\(46.141377 -1.137880\);\(46.141508 -1.137665\);\(46.141437 -
1.137290\);\(46.141240 -1.136378\);\(46.141366 -1.136292\);\(46.141285 -1.135911\);\(46.141147 -1.135949\);\(46.140983
-1.134109\);
3
=
```

## Extraction d'une emprise du fichier autres.pdf


### pour dictfr_grdf, dictfr_somelec et soglink_betri
Les coordonnées se présentent sous la forme d'une liste type Liste_B

```
pdftotext dictfr_grdf_DT_DICT.309370035.6.document.pdf -
```

Liste_B
```
La loi n° 78-17 du 6 janvier 1978 modifiée relative à l’informatique, aux fichiers et aux libertés, garantit un droit d’accès et de rectification des données auprès des organismes destinataires du formulaire.


(46.170225 -1.143014);(46.170136 -1.143057);(46.170058 -1.142821);(46.170147 -1.142762);(46.170225 -1.143014);

```

```
pdftotext dictfr_somelec_DT\ DICT.pdf -
```

Liste_B
```
La loi n° 78-17 du 6 janvier 1978 modifiée relative à l’informatique, aux fichiers et aux libertés, garantit un droit d’accès et de rectification des données auprès des organismes destinataires du formulaire.


(46.168652 -1.149113);(46.168619 -1.148153);(46.168503 -1.148135);(46.168524 -1.149143);(46.168652 -1.149113);

```


```
pdftotext sogelink_betri_DICT.309494286.5.envoi.pdf - > pdftotext.txt
```

Liste_B
```
La loi n° 78-17 du 6 janvier 1978 modifiée relative à l’informatique, aux fichiers et aux libertés, garantit un droit d’accès et de rectification des données auprès des organismes destinataires du formulaire.

(46.139931 -1.161349);(46.140053 -1.161531);(46.140381 -1.161429);(46.140496 -1.160860);(46.140425 -1.160893);(46.140355 -1.160887);(46.140284 -1.160817);(46.140247 -1.160758);(46.140206 1.160694);(46.140165 -1.160651);(46.140117 -1.160651);(46.140079 -1.160678);(46.140053 -1.160737);(46.139931 -1.161349);

Le 02/08/2018
```



## pour protys_enedis
```
pdftotext protys_enedis_DT.pdf - > pdftotext.txt
```

Table_B
```
Coordonnées (GPS) des sommets des polygones d'emprise :

-1,14151010795349
-1,14003697540314
-1,14016593768363
-1,14049644590599
-1,14032129562256
-1,14076074613037
-1,14107239056583
-1,14230592200756
-1,14170181381602
-1,14151010795349

46,14322214071620
46,14338884085210
46,14427701049493
46,14475979954948
46,14520724728102
46,14528803339987
46,14470113580159
46,14453778962294
46,14319900875633
46,14322214071620

(Emprise_Protys_v1.3)
```

```
qpdf --qdf --object-streams=disable protys_enedis_DT.pdf - | iconv -f 'latin1' -t 'utf-8' - | grep --binary-files=text ")Tj$" | sed -E -e 's/\)Tj$//g' -e 's/^\(//g' > qpdf.txt
```

Table_Bp
```
\(Emprise_Protys_v1.3\)
Référence Protys de ce document :
Coordonnées \(Lambert 93\) :
Coordonnées \(GPS\) des sommets des polygones d'emprise :
Numéro de consultation du GU :
Liste des communes concernées :
1831035231.183101DT01
6568807.07289635
380460.37182809314
-1,14151010795349 46,14322214071620
-1,14003697540314 46,14338884085210
-1,14016593768363 46,14427701049493
-1,14049644590599 46,14475979954948
-1,14032129562256 46,14520724728102
-1,14076074613037 46,14528803339987
-1,14107239056583 46,14470113580159
-1,14230592200756 46,14453778962294
-1,14170181381602 46,14319900875633
-1,14151010795349 46,14322214071620
2018080100582PUF
LA ROCHELLE
1831035231.183101DT01 - LA ROCHELLE 17000
1/2
2/2
```



## pour dictservices_air
```
pdftotext dictservices_air_DT.pdf - > pdftotext.txt
```

Gml_E

```
La loi n° 78-17 du 6 janvier 1978 modifiée relative à l’informatique, aux fichiers et aux libertés, garantit un droit d’accès et de rectification des données auprès des organismes destinataires du formulaire.

Coordonnées : <gml:Polygon srsName="EPSG:4171"><gml:exterior><gml:LinearRing><gml:posList srsDimensi
on="2">-1.154034 46.15851 -1.153803 46.158551 -1.153776 46.158844 -1.153428 46.159903 -1.153658 46.1
59985 -1.154034 46.15851</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>

```

```
qpdf --qdf --object-streams=disable dictservices_air_DT.pdf - | iconv -f 'latin1' -t 'utf-8' - | grep --binary-files=text ")Tj$" | sed -E -e 's/\)Tj$//g' -e 's/^\(//g' > qpdf.txt
```

Gml_Ep
```
Coordonnées : <gml:Polygon srsName="EPSG:4171"><gml:exterior><gml:LinearRing><gml:posList srsDimensi
on="2">-1.154034 46.15851 -1.153803 46.158551 -1.153776 46.158844 -1.153428 46.159903 -1.153658 46.1
59985 -1.154034 46.15851</gml:posList></gml:LinearRing></gml:exterior></gml:Polygon>
```
