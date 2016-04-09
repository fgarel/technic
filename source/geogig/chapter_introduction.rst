
============
Introduction
============


Les données topographiques sont produites et manipulées par différents acteurs sur un même territoire.

Un plan topographique correspond à une prestation dont les caractéristiques sont précisées dans un cahier des charges.
Entre un plan topo fourni par un acteur A avec son cahier des charges et un autre plan topo fourni par un acteur B qui aura son propre cahier des charges,
si on compare ces deux fichiers, alors on se rend compte que l'organisation des données, la répresentation des objets ne sont pas identiques.

Outre le fait d'adopter une structuration et une définition communes entre les différents acteurs, ce document aborde les techniques pour la manipulation de la donnée topographique.


Des données
===========
Le **Plan Corps de Rue Simplifié (PCRS)** est un plan topographique.

Il constitue le socle commun minimal de base décrivant à très grande échelle
les limites apparentes de la voirie.

Le **Référentiel à très Grande Echelle (RTGE)** est aussi un plan topographique.

Il correspond au PCRS, complété des objets qui n'appartiennent pas au socle commun (mobilier urbain, signalisation, ...)


Des outils
==========
**GeoGig** is an open source tool that draws inspiration from Git, but adapts its core concepts to handle distributed versioning of geospatial data.
http://geogig.org/

.. image:: ../_static/logo.png

La gouvernance du PCRS
======================
Ce document a pour objectif de présenter les différents aspects techniques, organisationnels et financiers,
relatifs à la manipulation des données topographiques, et plus particulièrement le PCRS, à l'aide de l'outil "geogig".
