****************
ConvertDaoSig.sh
****************
Comment communiquer entre le monde de la DAO, ou le format DXF est roi, et la monde SIG, ou les données sont structurées ?

La première des étapes pour répondre à cette question consiste déja à trouver la procédure permettant de passer les données d'un monde à l'autre.

Conversion du dwg vers dxf
==========================
La conversion du dwg vers le format dxf peut être réalisé via un utilitaire appelé

.. code::

  TeighaFileConverter

Cet utilitaire a été trouvé sur cette page

.. code::

  https://www.opendesign.com/guestfiles/TeighaFileConverter
  https://download.opendesign.com/guestfiles/TeighaFileConverter/TeighaFileConverter_QT5_lnxX86_4.7dll.deb

Une fois que cet utilitaire est installé grace à la commande :

.. code::

  dpkg -i TeighaFileConverter_QT5_lnxX86_4.7dll.deb

Il est alors possible de lancer l'utilitaire grace à la commande

.. code::

  /usr/bin/TeighaFileConverter

Conversion du dxf vers postgis
==============================
L'utilitaire ogr2ogr est maintenant capable de lire et écrire du dxf.

Nous allons donc essayer cet outil dans le cas d'un import de données du DXF vers PostGIS, puis nous allons tester ce même outil pour exporter les données de PostGIS vers le format DXF.

Une fois que les données sont dans Postgis, nous pouvons réaliser quelques traitements de controle.



Dans ce sous repertoire, on trouve quatre scripts
convertDaoSig.sh :
c'est ce script qui est à utiliser
(utilisation d'arguments, et conversion dans les deux sens)
il remplace les deux scripts suivants
Usage
./convertDaoSig.sh --dxftodxf data/01/Plan_2_2011.dxf

psqltodxf :
pour passer de postgresql vers dxf

dxftopsql :
pour passer de dxf vers postgresql

test.sh :
ce script a permis de trouver, par tatonnement, quelle devait être la conversion d'encodage à adopter pour passer du DXF windows à un postgis UTF8


