************************************************
Présentation générale l'environnement de Travail
************************************************

Gestion de nos documents source, et utilisation conjointe d'un environnement python et de git
=============================================================================================
Les documents que nous écrivons sont regroupés par projet (c'est à dire par sous-repertoire). Par exemple, 

 - le sous-repertoire "technic" regroupe les documents liés aux trucs et astuces concernant le boulot.
 - le sous repertoire "perso" regroupe les documents liés aux informations personnelles
 - le sous repertoire "report" regroupe les documents correspondant aux présentations.

Ces projets (ou sous-repertoire) sont créés à l'aide d'une commande de sphinx : sphinx-quickstart.

En choisissant la bonne option, Sphinx permet de séparer un projet en deux sous-dossiers :
un sous-dossier source et un sous-dossier build

Avec git, nous allons faire la gestion des versions de fichiers uniquement sur le sous-repertoire source.

La racine de tout cet environnement est 

.. code::
  ~/Travail/ecriture_sphinx

Voici donc l'arborescence que nous allons obtenir

.. code::

  ~/Travail/ecriture_sphinx
                           /technic
                                   /build
                                   /.git
                                   /Makefile
                                   /README.md
                                   /source
                                          /conf.py
                           /perso
                                   /build
                                   /.git
                                   /Makefile
                                   /README.md
                                   /source
                                          /conf.py
                           /projet_00
                                   /build
                                   /.git
                                   /Makefile
                                   /README.md
                                   /source
                                          /conf.py

