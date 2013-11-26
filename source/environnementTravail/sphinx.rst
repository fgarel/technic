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

Génération des builds à partir des sources
==========================================
La génération de la documentation se fait à l'aide d'un makefile

Les principales commandes qui seront utilisées seront

.. code::

  make html
  make slides
  make latexpdf


Pour que la génération de pdf fonctionne, il faut avoir installé quelques paquets supplémentaires

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
https://pypi.python.org/pypi/hovercraft/

https://hovercraft.readthedocs.org/en/1.0/

Ajout de hovercraft dans l'environnement python
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. code::

  pip install hovercraft

Autres extensions
-----------------
Les extensions sont listées ici

http://sphinx-doc.org/extensions.html

https://bitbucket.org/birkenfeld/sphinx-contrib


