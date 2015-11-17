.. Sphinx documentation master file, created by
   sphinx-quickstart on Tue Nov 12 16:21:02 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

******
Sphinx
******

Introduction
============

Dans ce chapitre nous allons détailler l'installation de sphinx dans un environnement
virtuel python, puis comment utiliser cet outil pour documenter plusieurs projets.

Ainsi, plusieurs aspects de l'outil seront abordés :

#. Installation
#. Gestion plusieurs projets sphinx
#. Installation des extensions (plugins) et paramètrage des extensions dans les projets

Plusieurs depots git = plusieurs projets sphinx
-----------------------------------------------

A chacun des depots git, nous allons faire correspondre un projet sphinx

 - install
 - perso
 - report
 - technic

Le répertoire racine de ces 4 dépots est

.. code::

  cd ~/Documents/

Les projets sphinx seront :

 * ~/Documents/install/
 * ~/Documents/perso/
 * ~/Documents/report/
 * ~/Documents/technic/

 Pour chacun de ces projets sphinx, nous allons avoir :
 
  - deux sous-repertoires :
    - source, qui contiendra les fichiers editables (.rst, .py, jupyter) et à suivre avec git
    - build, qui contiendra les fichiers non-editables (.pdf, ...) et non suivis avec git (.gitignore)
 - un fichier conf.py
 - un fichier makefile

L'installation et la configuration est détaillée dans les paragraphes suivants.

Il est rappelé ici que la mise en place de l'environnement de travail se réalise en plusieurs étapes :
 - le système : l'installation est à faire une fois pour toute
 - l'environnement python : celui-ci est commun aux projets sphinx.
   Dans un environnement virtuel, grace à `pip`, on va installer sphinx et ses extensions
 - création d'un fichier `Makefile` et d'un ficher `source/conf.py` pour le premier projet
   On va paramétrer un premier projet, grace à `sphinx-quickstart`.
   Puis on va modifier légèrement les fichiers `Makefile` et `source/conf.py`
 - recopie des fichiers `Makefile` et `source/conf.py` vers les autres projets sphinx
   Il faudra faire quelques modifications (nom de projet), mais les fichiers
   sont quasi-identiques d'un projet à l'autre

1ere étape : Installation des paquets debian
============================================

Pour info, libxslt1-dev fourni l'utilitaire xslt-config qui est necessaire pour hovercraft
Et python3-dev est aussi nécessaire pour construire lxml qui est utilisé par hovercraft

Les paquets texlive-* fournissent des utilitaires tels que pdflatex, qui
est utilisé lorsque l'on fait un build pour générer un pdf :`make pdflatex`

.. code::

  sudo aptitude install texlive-latex-recommended \
                        texlive-latex-extra \
                        texlive-fonts-recommended

  sudo aptitude install texlive-font-utils
  sudo aptitude install libxslt1-dev
  sudo aptitude install python3-dev

2de étape : Environnement virtuel python avec l'outil sphinx
============================================================
Création d'un environnement python ecriture_sphinx, qui sera commun aux différents projets

Nous allons installer sphinx et quelques extensions dans un environnement virtuel python.

Environnement virtuel python
----------------------------
Pour créer cet environnement virtuel, à la place de virtualenvwrapper, on
pourra utiliser pew
http://sametmax.com/mieux-que-python-virtualenvwrapper-pew/

Creation d'un environnement python
----------------------------------

Attention, nous allons créer un environnement avec une version spécifique de python.
En, effet, nous verrons que pour une question de dépendance, on ne peut pas utiliser
n'importe quelle version.
En particulier, pour pouvoir faire une installation d'hovercraft,
et donc une installation de lxml,
il faut que la version de python de l'environnement corresponde à celle de python3-dev

.. code::

  aptitude show python3-dev

On peut lire que la verison de python est 3.4.3

.. code::

  pew new -p $(pythonz locate 3.4.3) ecriture_sphinx
  #pew new ecriture_sphinx

Installation de sphinx dans cet environnement
---------------------------------------------

On peut d'abord vérifier que l'on peut construire hovercraft dans l'envionnement

.. code::
  pew workon ecriture_sphinx
  pip wheel lxml

et si tout fonctionne, alors rulez....

.. code::

  pew workon ecriture_sphinx
  #workon ecriture_sphinx
  pip freeze
  pip search sphinx
  pip install sphinx


Installation des extensions sphinx
----------------------------------

Pour info, hovercraft est pour python3, tandis que hieroglyph est pour python2 et 3
https://pypi.python.org/pypi/hovercraft
https://pypi.python.org/pypi/hieroglyph

.. code::

  pip install sphinxcontrib-plantuml
  pip install hieroglyph
  pip install hovercraft
  pip install aafigure
  pip install sphinxcontrib-aafig
  pip install reportlab
  pip install sphinxcontrib-googlemaps

Pour sphinxcontrib-googlemaps, il y a une petite manipulation à faire en plus...
(pour passer du japonais au francais...)

.. code::

  cd $(pew sitepackages_dir)
  vi ~/.local/share/virtualenvs/ecriture_sphinx/lib/python3.4/site-packages/sphinxcontrib/googlemaps.py

  lang = 'fr'
  baseurl = "http://maps.google.fr/maps?"


3ème étape : Pour le premier répertoire, création d'un projet sphinx
====================================================================
Pour le premier de nos projets parmi install, perso, report et technic,
nous allons initialiser le projet avec `sphinx-quickstart`.

Puis, nous allons modifier le fichier `makefile` et `source/conf.py`

On se place dans le bon répertoire

.. code::

  cd ~/Documents/install

et eventuellement dans la bonne branche git

.. code::

  gcd # git checkout develop
  gcm # git checkout master

On active l'environnement virtuel python

.. code::

  pew workon ecriture_sphinx

Et enfin on execute la commande interactive `sphinx-quickstart`
qui va générer 3 fichiers :

  ./source/conf.py
  ./source/index.rst
  ./Makefile

.. code::

  sphinx-quickstart

Voici les réponses à donner :
.. code::

  Welcome tu the Sphinx 1.3.1 quickstart utility.

  ...

  Enter the root path for documentation.
  > Root path for documentation [.]:

  You have two options for placing the build directory for Sphinx output.
  Either, you use a directory "_build" within the root path, or you separate
  "source" and "build" directories within the root path.
  > Separate source and build directories (y/N) [n]: y

  Inside the root directory, two more directories will be created; "_templates"
  for custom HTML templates and "_static" for custom stylesheets and other static
  files. You can enter another prefix (such as ".") to replace the underscore.
  > Name prefix for templates and static dir [_]:

  The project name will occur in several places in the built documentation.
  > Project name: yourproject
  > Author name(s): Your Name

  Sphinx has the notion of a "version" and a "release" for the
  software. Each version can have multiple releases. For example, for
  Python the version is something like 2.5 or 3.0, while the release is
  something like 2.5.1 or 3.0a1.  If you don't need this dual structure,
  just set both to the same value.
  > Project version: 0.1
  > Project release [0.1]:

  If the documents are to be written in a language other than English,
  you can select a language here by its language code. Sphinx will then
  translate text that it generates into that language.

  For a list of supported codes, see
  http://sphinx-doc.org/config.html#confval-language
  > Project Language [en]: fr

  The file name suffix for source files. Commonly, this is either ".txt"
  or ".rst".  Only files with this suffix are considered documents.
  > Source file suffix [.rst]:

  One document is special in that it is considered the top node of the
  "contents tree", that is, it is the root of the hierarchical structure
  of the documents. Normally, this is "index", but if your "index"
  document is a custom template, you can also set this to another filename.
  > Name of your master document (without suffix) [index]:

  Sphinx can also add configuration for epub output:
  > Do you want to use the epub builder (y/n) [n]:

  Please indicate if you want to use one of the following Sphinx extensions:
  > autodoc: automatically insert docstrings from modules (y/N) [n]: y
  > doctest: automatically insert test code snippets in doctest blocks (y/n) [n]: y
  > intersphinx: link between Sphinx documentation of different projects (y/N) [n]: y
  > todo: write "todo" enties that can be shown or hidden on build (y/n) [n]: y
  > coverage: checks for documentation coverage (y/n) [n]: y
  > pngmath:include math, rendered as PNG images (y/n) [n]:
  > mathjax: include math, rendered in the browser by MathJax (y/n) [n]: y
  > ifconfig: conditional inclusion of content based on config values (y/n) [n]: y
  > viewcode: include links to the source code of documented Python objects (y/n) [n]: y

  A Makefile and a Windows command file can be generated for you so that you
  only have to run e.g. `make html` instead of invoking sphinx-build
  directly.
  > Create Makefile? (y/n) [y]:
  > Create Windows command file? (y/n) [y]: n

  creating file ./source/conf.py
  creating file ./source/index.rst
  creating file ./Makefile

  Finished: An initial directory structure has been created.

  You should now populate your master file ./source/index.rst and create other documentation
  source files. Use the Makefile to build the docs, like so:
     make builder
  where "builder" is one of the supported builders, e.g. html, latex or linkcheck.

Nous allons modifier le fichier `Makefile` qui vient d'être fabriqué,
afin de rajouter des directives supplémentaires
afin de rajouter les fonctionnalités apportés par les extensions.

.. code::

  vi Makefile

.. code::

  help:
      @echo "  latexpdf   to make LaTeX files and run them through pdflatex"
      @echo "  slideshie  to make slides (hieroglyph)"
      @echo "  slideshov  to make slides (hovercraft)"
      @echo "  text       to make text files" 

  latexpdf:
      $(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(BUILDDIR)/latex
      @echo "Running LaTeX files through pdflatex..."
      $(MAKE) -C $(BUILDDIR)/latex all-pdf
      @echo "pdflatex finished; the PDF files are in $(BUILDDIR)/latex."

  slideshie:
      $(SPHINXBUILD) -b slides $(ALLSPHINXOPTS) $(BUILDDIR)/slides
      @echo "Build finished. The HTML slides are in $(BUILDDIR)/slides."

  slideshov:
      $(SPHINXBUILD) -b slides $(ALLSPHINXOPTS) $(BUILDDIR)/slides
      @echo "Build finished. The HTML slides are in $(BUILDDIR)/slides."

  text:
      $(SPHINXBUILD) -b text $(ALLSPHINXOPTS) $(BUILDDIR)/text
      @echo
      @echo "Build finished. The text files are in $(BUILDDIR)/text."


4ème niveau
===================

Nous allons ausso modifier le fichier `source/Makefile` qui vient d'être fabriqué,
afin de rajouter les fonctionnalités apportés par les extensions.

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

4ème étape : configuration du second projet sphinx
==================================================

Il faut recopier les fichiers `Makefile` et `source/conf.py` vers le second projet

.. code::

  cp ~/Documents/install/Makefile ~/Documents/technic/Makefile
  cp ~/Documents/install/source/conf.py ~/Documents/technic/source/conf.py

Puis faire les modifications dans le fichier Makefile et dans le fichier conf.py

Génération des builds à partir des sources
==========================================
La génération de la documentation se fait à l'aide d'un makefile

Les principales commandes qui seront utilisées seront

.. code::

  make html
  make slideshie
  make slideshov
  make latexpdf

Premier essai d'un build
------------------------

On va lancer la commande la premiere fois

.. code::

  cd ~/Documents/install
  make html

Automatiquement, le sous-repertoire ~/Documents/install/build va être créé.

.. code::

  gst

.. code::
  Fichiers non suivis:
    (utilisez "git add <fichier>..." pour inclure dans ce qui sera validé)

         build/

Pour que ce sous-répertoire soit exclu du suivi git, il faut penser à créer un fichier .gitignore

.. code::

  cd ~/Documents/install
  vi .gitignore

et le contenu de ce fichier est tout simplement

.. code::

  build/

Alors, on ajoute le fichier .gitignore à git

.. code::

  git add .gitignore

et, dorénavant, la commande git status fait apparaitre que le répoertoire build n'est plus suivi

.. code::

  gst

.. code::

  ....

Des règlages à faire pour certains builds
-----------------------------------------
Nous le verrons ci-après, pour que la génération de slides fonctionne,
il faut avoir installé un plugin à sphinx (hieroglyph)

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

https://pypi.python.org/pypi/sphinxcontrib-plantuml

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


