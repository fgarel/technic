Possibilité de lire des tuiles avec qgis
========================================

Serveur de tuile
----------------

C'est tilecloud qui sera utilisé comme serveur de tuiles

Documentation concernant l'utilisation de tilecloud dans l'espoir de pouvoir l'utiliser avec qgis

le but est de voir comment qgis peut lire des tuiles (protocole TMS) (pyramid)

Avec gdal, on a vu comment convertir un raster et construire une pyramide de tuile.
On obtient un fichier tilemapresource.xml mais comment faire pour charger ce fichie ous qgis ?



Installation de tilecloud
^^^^^^^^^^^^^^^^^^^^^^^^^

$ cd ~/Travail
$ git clone https://github.com/twpayne/tilecloud.git
$ cd tilecloud
$ virtualenv .
$ . bin/activate
$ pip install -r requirements.txt
$ ./tc-viewer --root=3/4/2 'http://gsp2.apple.com/tile?api=1&style=slideshow&layers=default&lang=en_GB&z=%(z)d&x=%(x)d&y=%(y)d&v=9'
$ export PYTHONPATH=~/Install/tilecloud

# telechargement d'un example
$ ./examples/download.py
$ ./tc-info -t count local.mbtiles
$ ./tc-info -t bounding-pyramid -r local.mbtiles
# visualisation de 3 couches
$ ./tc-viewer tiles.openstreetmap_org local.mbtiles tiles.debug.black

# modification de l'example pour telecharger les tuiles de la rochelle
# dans le fichier examples/download.py, faire quelques petites modifs dont :
bounding_pyramid = boundingPyramid.from_string('10/508/363:+4/+1/+1')
# visualisation de 3 couches
$ ./tc-viewer tiles.openstreetmap_org vlr.mbtiles tiles.debug.black

# amelioration de la vitesse du serveur
# installation de tornado
$ pip freeze
$ pip install tornado

# lancement du server bottle qui ecoute sur toutes les adresses
$ ./tc-viewer --host='0.0.0.0' tiles.openstreetmap_org vlr.mbtiles tiles.debug.black

# visualisation d'une tuile de la seconde couche (1)
http://localhost:8080/tiles/1/tiles/10/508/363
"""
A cheap-and-cheerful tile server
tc-viewer can be used as a lightweight tile server, which can be useful for development, debugging and off-line demos. The TileStores passed as arguments to tc-viewer are available at the URL:
http://localhost:8080/tiles/{index}/tiles/{z}/{x}/{y}
where {index} is the index of the TileStore on the command line (starting from 0 for the first tile store), and {z}, {x} and {y} are the components of the tile coordinate. 
"""

Retour a notre problème initial
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Notre souci, c'est de charger la pyramide de tuile

1er problème
""""""""""""
Faut-il charger un raster ou se connecter a un service wms/wmts ?
pas vraiment réussi a faire marcher le service wmts sous qgis 1.9...
De plus, il semble qu'il  ait une différence entr TMS et WMTS
http://mapfishblog.blogspot.fr/2010/05/from-tilecache-to-wmts.html
http://benjamin.chartier.free.fr/pro/?p=1747
Sous qgis, j'utilise donc l'ouverture d'un fichier raster avec gdal qui lit du wms...
http://www.gdal.org/frmt_wms.html
http://www.3liz.com/blog/rldhont/index.php?post/2012/07/17/OpenStreetMap-Tiles-in-QGIS

2d problème
"""""""""""
Conversion de la photo aerienne en tuiles lisibles sous qgis ?
essai avec le troisième cas d'utilisation ci dessous

les cas d'utilisation
"""""""""""""""""""""
1. Lancer un serveur qui est capable de suivre le protocole TMS
$ ./tc-viewer --host='0.0.0.0' tiles.openstreetmap_org vlr.mbtiles tiles.debug.black
il y a 3 couches
openstreetmap
notre couche local vlr.mbtiles
une couche de debug
pour tester ce serveur,
http://localhost:8080/
http://localhost:8080/tiles/{index}/tiles/{z}/{x}/{y}
http://localhost:8080/tiles/1/tiles/10/508/363

2. Fabriquer 4 fichiers de configuration
ces fichiers de configuration sont inspirés de cette doc
https://help.openstreetmap.org/questions/400/how-to-get-openstreetmap-as-a-raster-layer-in-qgis

 - openstreetmap_direct.xml :
   le premier pour tester que l'on est capable de lire les tuiles d'openstreetmap directement

 - openstreetmap_tilecloud.xml :
   le second pour tester que l'on est capable de lire les tuiles d'openstreetmap
   via notre serveur tilecloud qui fait relais

 - metacarta_direct.xml :
   le troisième pour tester que l'on est capable de lire les tuiles de la couche local
   sur notre serveur tilecloud en coordonnées tuiles

utilisation de ces fichiers xml :
sous qgis, ajouter une couche raster
en se mettant sous qgis à l'echelle du 1/36000, on peut voir les tuiles !!!!



3. Test avec la photo aerienne

http://lists.osgeo.org/pipermail/qgis-developer/2012-October/022418.html
http://lists.osgeo.org/pipermail/qgis-developer/2012-October/022428.html
http://www.procrastinatio.org/posts/2012-10-14-various-was-to-use-geo.admin.ch-wmts-tiles.html

<GDAL_WMS>
    <Service name="TMS">
        <ServerUrl>file:///home/fred/public_html/orthocc46/${z}/${x}/${y}.png</ServerUrl>
    </Service>
    <DataWindow>
        <UpperLeftX>5222390.05558550916612</UpperLeftX>
        <UpperLeftY>1383939.97601266601123</UpperLeftY>
        <LowerRightX>5230230.10415765643120</LowerRightX>
        <LowerRightY>1371982.23552697803825</LowerRightY>
        <TileLevel>10</TileLevel>
        <TileCountX>1</TileCountX>
        <TileCountY>1</TileCountY>
        <YOrigin>top</YOrigin>
    </DataWindow>
    <Projection>EPSG:3946</Projection>
    <BlockSizeX>256</BlockSizeX>
    <BlockSizeY>256</BlockSizeY>
    <BandsCount>3</BandsCount>
    <Cache />
</GDAL_WMS>

Sous qgis
---------
http://osgeo-org.1560.x6.nabble.com/loading-Web-Map-Tile-Service-in-QGIS-td4997302.html

https://wiki.sit.earthdata.nasa.gov/display/GIBS/GIBS+Supported+Clients#GIBSSupportedClients-Script-levelaccesstoimagery


Un plugin qui permet de lire des tuiles :
https://github.com/minorua/TileLayerPlugin


Connexion d'un GPS à qgis
=========================

La doc se trouve ici

http://www.qgis.org/fr/docs/user_manual/working_with_gps/live_GPS_tracking.html


