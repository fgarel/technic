.. Patrimoine documentation master file, created by
   sphinx-quickstart on Tue Nov 12 16:21:02 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

======
Sphinx
======

Installation de l'environnement de Travail
==========================================

Creation d'un environnement python incluant
mkvirtualenv ecriture_sphinx
pip install sphinx

Extension hieroglyph
====================

Ajout de hieroglyph dans l'environnement python
pip install hieroglyph

Enregistrement de hieroglyph dans la config de sphinx
http://docs.hieroglyph.io/en/latest/getting-started.html#adding-hieroglyph-to-an-exiting-project
vi conf.py
extension = [ ...., 'hieroglyph']

Ajout d'un builder dans le makefile
http://docs.hieroglyph.io/en/latest/builders.html
vi Makefile
slides:
    $(SPHINXBUILD) -b slides $(ALLSPHINXOPTS) $(BUILDDIR)/slides
    @echo "Build finished. The HTML slides are in $(BUILDDIR)/slides."


Extension sphinxcontrib-plantuml
================================
pip search sphinxcontrib-plantuml
pip install sphinxcontrib-plantuml
Installation de plantuml



Autres extensions
=================
Les extensions sont listées ici
http://sphinx-doc.org/extensions.html
https://bitbucket.org/birkenfeld/sphinx-contrib

