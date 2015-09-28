########################
Environnement de travail
########################

*************************************************
Présentation rapide de l'environnement de Travail
*************************************************

L'idée est de créer et d'utiliser un environnment qui permet d'ecrire de la documentation.

Objectifs
=========
Nous voulons :

#) écrire un document dans un format de départ (restful) et pouvoir générer plusieurs formats de sortie
#) pouvoir dessiner des diagrammes uml (plantuml), des tableaux, des graphiques, ..
#) avoir un gestionnaire de version (git)

Mise en place de cet environnemnt
=================================

Pour répondre à ces besoins nous allons utiliser un environnement basé sur sphinx, git et les environnements virtuels python.
Les fonctionnalités de sphinx peuvent être augmentées avec les extensions sphinxcontrib.

Dans les paragraphes suivants, nous présentons les différentes briques.

#) Diagramme UML avec plantuml
#) Ecriture principale au format restful et build en différents formats
#) Versionning avec git
#) Exemple de présentation

.. include:: environnementTravail/plantuml.rst
.. include:: environnementTravail/sphinx.rst
.. include:: environnementTravail/git.rst
.. include:: environnementTravail/presentation.rst


