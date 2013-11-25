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

Installation et Configuration de quelques plugins
=================================================

Extension sphinxcontrib-plantuml
--------------------------------
.. code::

  pip search sphinxcontrib-plantuml
  pip install sphinxcontrib-plantuml


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


Extension ???
-------------


Autres extensions
-----------------
Les extensions sont listées ici

http://sphinx-doc.org/extensions.html

https://bitbucket.org/birkenfeld/sphinx-contrib


