########################
Environnement de travail
########################

************
Introduction
************

L'idée est de créer et d'utiliser un environnment au sein duquel il
devient simple d'ecrire de la documentation.

https://github.com/icgood/continuous-docs

Objectifs
=========
Tout en restant simple, nous devons cependant trouver les fonctionnalités
que nous estimons indispensables.
L'outil principal de cet environnement sera sphinx http://sphinx-doc.org/
et autour de cet outil, nous allons ajouter quelques autres utilitaires.

Nous souhaitons :

#) écrire un document dans un format de départ (format "reStructuredText") et
   pouvoir générer plusieurs formats de sortie (html, pdf, ...) (sphinx)
#) pouvoir inclure des diagrammes uml (plantuml), des tableaux, des graphiques, ..
#) avoir un gestionnaire de version (git)

Mise en place de cet environnemnt
=================================

Pour répondre à ces besoins nous allons utiliser un environnement basé sur
sphinx, git et les environnements virtuels python.
Les fonctionnalités de sphinx peuvent être augmentées avec les extensions
sphinxcontrib (http://sphinx-doc.org/develop.html#extensions)
(https://bitbucket.org/birkenfeld/sphinx-contrib/)


Dans les paragraphes suivants, après avoir présenté une vue 
générale de l'environnement que l'on veut mettre en place, 
nous présentons l'utilisation et l'installation des
différentes briques qui composent cet environnement.

Les chapitres concernant le shell, les environnements virtuels python,
vim et platuml donnent des inforamtions assez générales.

Les chapitres concernant git et sphinx donnent plus d'informations sur
le cas d'utilisation.

Le dernier chapitre est un exemple de présentation utilisé avec sphinx.

.. include:: Chapter01_presentationEnvironnement.rst
.. include:: Chapter02_shell_python.rst
.. include:: Chapter03_vim_plantuml.rst
.. include:: Chapter04_git.rst
.. include:: Chapter05_sphinx.rst
.. include:: Chapter06_exemplePresentation.rst



