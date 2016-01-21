.. :title: Contrôle des Plans Topographiques
.. :data-transition-duration: 1500
.. :css: geogig_hovercraft.css

.. ----

Contrôle des Plans Topographiques
=================================

.. ----

Vérification / Contrôle Qualité
-------------------------------

.. rst-class:: build

- Il s'agit de vérifier si les données sont conformes à ses spécifications ou exigences préétablies

- Pour effectuer un contrôle, il faut au préalable en déterminer les caractéristiques 

- et choisir les limites (tolérances) à l'intérieur desquelles les données sont conformes.


.. note::

  Ce controle peut etre un controle interne
  ou peut être confié à un autre partenaire

Contrôle
--------

.. image:: ./Logigramme_controle.svg
  :height: 500px

Le Plan Topographique
---------------------

.. rst-class:: build

- Plusieurs critères pour qualifier les données :

  - actualité
  - exhaustivité
  - précision sémantique
  - cohérence logique
  - ...

- Le critère principal de la qualité d'un plan topographique :

  - précision planimétrique et altimétique : l'arrêté du 16 septembre 2003

Confiance et contrôle entre partenaires
---------------------------------------

.. rst-class:: build

- Une confiance qui peut être basée sur 

  - des spécifications claires
  - un contrôle entre partenaires

- Plusieurs cas de figures peuvent être rencontrés

.. note::

  Pour qu'une personne puisse travailler avec les données produites
  par quelqu'un d'autre, il faut qu'elle puisse avoir confiance

.. ----

Cas N°1 : les données sont validées
-----------------------------------

.. uml::

  actor  "Intervenant 1"
  actor  "Intervenant 2"
  Participant "PCRS 17\nnon contrôlé"
  Participant "PCRS 17\ncontrôlé"

  "Intervenant 1" <- "PCRS 17\nnon contrôlé"
  activate "Intervenant 1"
  note left: Si elles existent,\nchargement initial des données

  "Intervenant 1" -> "PCRS 17\nnon contrôlé"
  deactivate "Intervenant 1"
  note left: Création ou Modification,\nEnvoi des données

  "Intervenant 2" <- "PCRS 17\nnon contrôlé"
  activate "Intervenant 2"

  "Intervenant 2" -> "PCRS 17\ncontrôlé" : Le contrôle est OK
  deactivate "Intervenant 2"
  note left: Contrôle des données


.. ----

Cas N°2 : les données ne sont pas conformes
-------------------------------------------

.. ----

.. :data-x: r-500
.. :data-y: r1000

.. on se deplace vers le haut

.. uml::

  actor  "Intervenant 1"
  actor  "Intervenant 2"
  Participant "PCRS 17\nnon contrôlé"
  Participant "PCRS 17\ncontrôlé"

  "Intervenant 1" <- "PCRS 17\nnon contrôlé"
  activate "Intervenant 1"
  note left: Si elles existent,\nchargement initial des données

  "Intervenant 1" -> "PCRS 17\nnon contrôlé"
  deactivate "Intervenant 1"
  note left: Création ou Modification,\nEnvoi des données

  "Intervenant 2" <- "PCRS 17\nnon contrôlé"
  activate "Intervenant 2"

  "Intervenant 1" <- "Intervenant 2" : Le contrôle est KO
  deactivate "Intervenant 2"
  activate "Intervenant 1"

  "Intervenant 1" -> "PCRS 17\nnon contrôlé"
  deactivate "Intervenant 1"
  note left: Correction,\nEnvoi des données

  "Intervenant 2" <- "PCRS 17\nnon contrôlé"
  activate "Intervenant 2"

  "Intervenant 2" -> "PCRS 17\ncontrôlé"  : Le contrôle est OK
  deactivate "Intervenant 2"
  note left: 2d contrôle des données

Cas N°3 : les données sont corrigées
------------------------------------

La personne qui effectue le contrôle effectue aussi des modifications

.. uml::

  actor  "Intervenant 1"
  actor  "Intervenant 2"
  Participant "PCRS 17\nnon contrôlé"
  Participant "PCRS 17\ncontrôlé"

  "Intervenant 1" <- "PCRS 17\nnon contrôlé"
  activate "Intervenant 1"
  note left: Si elles existent,\nchargement initial des données

  "Intervenant 1" -> "PCRS 17\nnon contrôlé"
  deactivate "Intervenant 1"
  note left: Création ou Modification,\nEnvoi des données

  "Intervenant 2" <- "PCRS 17\nnon contrôlé"
  activate "Intervenant 2"
  note left: Contrôle et Correction des données

  "Intervenant 2" -> "PCRS 17\nnon contrôlé"
  deactivate "Intervenant 2"
  note left: Les données sont à\ncontrôler de nouveau

