.. Patrimoine documentation master file, created by
   sphinx-quickstart on Tue Nov 12 16:21:02 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

******
Sphinx
******

#. Installation
#. Creation de deux projets sphinx
#. Installation des extensions (plugins) et paramètrage des extensions dans les projets

Gestion de nos documents source, et utilisation conjointe d'un environnement python et de git
=============================================================================================
Les documents que nous écrivons sont regroupés par projet.

Par exemple, un projet travail regroupe les documents liés aux trucs et astuces concernant le boulot.
le sous repertoire perso regroupe les documents liés aux informations personnelles
le sous repertoire report regroupe les documents correspondant aux présentations.

Nous allons installer sphinx et quelques extensions dans un environnement virtuel python.

Sphinx est un outil qui permet de séparer un projet en deux sous-dossiers :
un sous-dossier source et un sous-dossier build

Avec git, nous allons faire la gestion des versions de fichiers uniquement sur le sous-repertoire source.


Environnement virtuel python avec l'outil sphinx
================================================

Environnement virtuel python
----------------------------
ecriture_sphinx


Creation d'un environnement python
----------------------------------
.. code::

  mkvirtualenv ecriture_sphinx
  pip install sphinx

Utilisation de cet environnement
--------------------------------
.. code::

  workon ecriture_sphinx


Deux projets sphinx
===================
Se positionner dans le bon répertoire
et executer la commande

.. code::

  sphinx-quickstart

Les deux projets sont

 * ~/travail/ecriture_sphinx/report/
 * ~/travail/ecriture_sphinx/technic/

Configuration d'un premier projet
---------------------------------
C'est le projet technic qui sera configuré en premier

La configuration est détaillée dans les paragraphes suivants.

Il est rappelé ici que la mise en place de l'environnement de travail sphinx se joue sur 4 niveaux :
 - le système : l'installation est à faire une fois pour toute
 - l'environnement python : celui-ci est commun aux deux projets sphinx, donc pour le second projet, il n'y a pas besoin de refaire un pip install
 - le fichier Makefile : il y a un fichier makefile par projet sphinx
 - le fichier conf.py : ce fichier doit donc finir par ces lignes :

1er niveau

.. code::

  sudo aptitude install texlive-latex-recommended \
                        texlive-latex-extra \
                        texlive-fonts-recommended

  sudo aptitude install texlive-font-utils
  sudo aptitude install libxslt-dev

2d niveau

.. code::

  pip install sphinxcontrib-plantuml
  pip install hieroglyph
  pip install hovercraft
  pip install sphinxcontrib-googlemaps

  cdvirtualenv
  vi lib/python2.7/site-packages/sphinxcontrib/googlemaps.py
  lang = 'fr'
  baseurl = "http://maps.google.fr/maps?"

  pip install aafigure
  pip install sphinxcontrib-aafig
  pip install reportlab

3eme niveau

.. code::

  vi makefile

  help:
      @echo "  latexpdf   to make LaTeX files and run them through pdflatex"
      @echo "  slides     to make slides (hieroglyph)"
      @echo "  text       to make text files" 

  latexpdf:
      $(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
      @echo "Running LaTeX files through pdflatex..."
      $(MAKE) -C $(BUILDDIR)/latex all-pdf
      @echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

  slides:
      $(SPHINXBUILD) -b slides $(ALLSPHINXOPTS) $(BUILDDIR)/slides
      @echo "Build finished. The HTML slides are in $(BUILDDIR)/slides."

  text:
      $(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
      @echo
      @echo "Build finished. The text files are in $(BUILDDIR)/text."


4ème niveau

.. code::

  vi source/conf.py
  
  extensions = ['sphinx.ext.autodoc', 'sphinx.ext.doctest', 'sphinx.ext.intersphinx', \
                'sphinx.ext.todo', 'sphinx.ext.coverage', 'sphinx.ext.mathjax', \
                'sphinx.ext.ifconfig', 'sphinx.ext.viewcode', \
                'sphinxcontrib.plantuml', \
                # 'sphinxcontrib.googlemaps', \
                'sphinxcontrib.aafig', \
                'hieroglyph']

  # -- Options for plantuml ---------------------------------------------------
  # configuration pour l'extension sphinxcontrib-plantuml
  # attention, cette extension necessite l'outil epstopdf qui est disponible
  # dans le paquet texlive-font-utils
  plantuml = 'plantuml'
  plantuml_output_format = 'svg'
  plantuml_latex_output_format = 'pdf'
  plantuml_epstopdf = 'epstopdf'
  #plantuml_output_format = 'svg'

  # -- Options for hieroglyph ---------------------------------------------------
  #slide_theme = 'slides'
  slide_theme = 'single-level'
  slide_theme_options = {'custom_css': 'custom.css'}

  # -- Options for hieroglyph ---------------------------------------------------
  aafig_format = dict(latex='pdf', html='svg', text=None)
  aafig_default_options = dict(scale=1.5, aspect=0.5, proportional=True)

Complément d'installation
-------------------------
.. code::

  pip install sphinx
  pip install sphinxcontrib-plantuml
  pip install aafigure
  pip install sphinxcontrib-aafig
  pip install hieroglyph

Attention, il semble qu'il y ait une erreur dans le fihcier aafig.py
En effet, quand on cherche à compiler un document pdf avec l'installation par defaut, on a cette erreur :

.. Code::
  Class AafigDirective(directives.images.Image):
  AttributeError: 'module' object has no attribute 'images'

Une correction semble avoir été faite (cf https://github.com/sphinx-doc/sphinx/issues/1595 ;
https://bitbucket.org/birkenfeld/sphinx-contrib/commits/f41632b346a569e2a6bcd0194ea491c2550ecf4d)

.. code::
  cdvirtualenv
  cd lib/python2.7/site-package/sphinxcontrib/
  wgets://bitbucket.org/birkenfeld/sphinx-contrib/raw/e3e989af7748e83bfb3833bd9a66c8ceb3e33408/aafig/sphinxcontrib/aafig.py

Configuration du second projet
------------------------------

Il suffit de faire les modifications dans le fichier Makefile et dans le fichier conf.py

Génération des builds à partir des sources
==========================================
La génération de la documentation se fait à l'aide d'un makefile

Les principales commandes qui seront utilisées seront

.. code::

  make html
  make slides
  make latexpdf

Nous le verrons ci-après, pour que la génération de slides fonctionne, il faut avoir installé un plugin à sphinx (hieroglyph)

De même, pour que la génération de pdf fonctionne, il faut avoir installé quelques paquets supplémentaires

https://github.com/davetron5000/scala-style/issues/18

.. code::

  sudo aptitude install texlive-latex-recommended \
                        texlive-latex-extra \
                        texlive-fonts-recommended

Installation et Configuration de quelques plugins
=================================================

Les extensions (ou plugins) permettent d'ajouter des fonctionnalités à Sphinx.

Par exemple, pour insérer un diagramme UML dans la documentation, on ajoute le plugin sphinxcontrib-plantuml

Pour générer une présentation (slides), on utilise soit hieroglyph, soit hovercraft.

Extension sphinxcontrib-plantuml
--------------------------------
Comme cela a été évoqué au paragraphe plantuml, ci-dessous la suite de l'installation et de la configuration de sphinxcontrib-plantuml

Ajout de sphinxcontrib-plantuml dans l'environnement python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code::

  pip search sphinxcontrib-plantuml
  pip install sphinxcontrib-plantuml

Enregistrement de sphinxcontrib-plantuml dans la config de sphinx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
https://pypi.python.org/pypi/sphinxcontrib-plantuml

.. code::

  vi conf.py
  extension = [ ...., \
                'sphinxcontrib.plantuml', \
                'hieroglyph']

Attention, il faut aussi ajouter quelques variables de configuration dans conf.py

.. code::

  vi conf.py
  
  # configuration pour l'extension sphinxcontrib-plantuml
  # attention, cette extension necessite l'outil epstopdf qui est disponible
  # dans le paquet texlive-font-utils
  plantuml = 'plantuml'
  plantuml_output_format = 'svg'
  plantuml_latex_output_format = 'pdf'
  plantuml_epstopdf = 'epstopdf'

Ajout d'un executable dans le path
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
https://pypi.python.org/pypi/sphinxcontrib-plantuml

La première partie de cette manip est expliquée au paragraphe plantuml

La seconde partie est d'installer l'utilitaire epstopdf

http://babilonline.blogspot.de/2008/07/wondering-what-happened-to-epstopdf-on.html

.. code::

  #aptitude install texlive-extra-utils
  aptitude install texlive-font-utils

Extension hieroglyph
--------------------

Ajout de hieroglyph dans l'environnement python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code::

  pip install hieroglyph

Enregistrement de hieroglyph dans la config de sphinx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
http://docs.hieroglyph.io/en/latest/getting-started.html#adding-hieroglyph-to-an-exiting-project

.. code::

  vi conf.py
  extension = [ ...., 'hieroglyph']

Attention, il faut aussi ajouter quelques variables de configuration dans conf.py

.. code::

  vi conf.py
  
  # configuration pour hieroglyph
  #slide_theme = 'slides'
  slide_theme = 'single-level'
  slide_theme_options = {'custom_css': 'custom.css'}


Ajout d'un builder dans le makefile
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
http://docs.hieroglyph.io/en/latest/builders.html

.. code::

  vi Makefile
  slides:
      $(SPHINXBUILD) -b slides $(ALLSPHINXOPTS) $(BUILDDIR)/slides
      @echo "Build finished. The HTML slides are in $(BUILDDIR)/slides."


Extension hovercraft
--------------------

Cette extension n'a pas l'air de fonctionner avec python2

https://pypi.python.org/pypi/hovercraft/

https://hovercraft.readthedocs.org/en/1.0/

Ajout de hovercraft dans l'environnement python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Normalement, l'installation devrait etre

.. code::

  pip install hovercraft

Cependant, on se rend compte qu'il faut un prérequis
le paquet libxslt-dev qui contient le fichier xmlversion.h

.. code::

  #sudo aptitude install libxml2-dev
  sudo aptitude install libxlst-dev

Cette fois-ci, l'installation ne pose plus de problème

.. code::

  pip install hovercraft


Extension googlemaps
--------------------

Cette extension n'a pas l'air de fonctionner avec latexpdf

Ajout de googlemaps dans l'environnement python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

  pip install sphinxcontrib-googlemaps

Enregistrement de sphinxcontrib-googlemaps dans la config de sphinx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
https://github.com/thewtex/sphinx-contrib/tree/master/googlemaps

.. code::

  vi conf.py
  extension = [ ...., \
                'sphinxcontrib.plantuml', \
                'sphinxcontrib.googlemaps', \
                'hieroglyph']

Modification de la langue par defaut
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
C'est un japonais qui a developpé ce plugin.
Il faut aller modifier le fichier source.

.. code::

  cdvirtualenv
  vi lib/python2.7/site-packages/sphinxcontrib/googlemaps.py
  lang = 'fr'
  baseurl = "http://maps.google.fr/maps?"

Extension aafig
---------------

http://pythonhosted.org/sphinxcontrib-aafig/

https://launchpad.net/aafigure

Ajout de aafig dans l'environnement python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code::

  pip install aafigure
  pip install sphinxcontrib-aafig
  pip install reportlab


Enregistrement de aafig dans la config de sphinx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

  vi conf.py
  extension = [ ...., \
                'sphinxcontrib.plantuml', \
                'sphinxcontrib.googlemaps', \
                'sphinxcontrib.aafig', \
                'hieroglyph']


Attention, il faut aussi ajouter quelques variables de configuration dans conf.py

.. code::

  vi conf.py
  
  # configuration pour l'extension aafig
  aafig_format = dict(latex='pdf', html='svg', text=None)
  aafig_default_options = dict(scale=1.5, aspect=0.5, proportional=True)


Autres extensions
-----------------
Les extensions sont listées ici

http://sphinx-doc.org/extensions.html

https://bitbucket.org/birkenfeld/sphinx-contrib


