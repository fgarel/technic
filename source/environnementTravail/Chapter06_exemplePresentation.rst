.. Patrimoine documentation master file, created by
   sphinx-quickstart on Tue Nov 12 16:21:02 2013.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

************************
Titre de la présentation
************************

Premiere Diapo
==============

Une documentation, ecrite au format Restful, peut être transformée en plusieurs formats de sortie.

Seconde Diapo
=============

Les formats qui peuvent être générés sont :

  * html
  * pdf
  * presentation (hieroglyph)
  * presentation (hovercraft)

Troisième Diapo
===============

Une documentation peut contenir :

  * liste
  * diagramme
  * tableau
  * graphique
  * code

Quatrième Diapo
===============

Exemple de diagramme

.. uml::
  :alt: Alice and Bob

  Alice -> Bob: Hello
  Alice <- Bob: Hi

Cinquieme Diapo
===============

Exemple de code

.. code::

  vi ~/.vimrc

Sixième Diapo
=============

Exemple de tableau

+-------------+---------------+---------------+---------------+
|  Colonne 1  |     Titre pour 2 colonnes     |               |
+  Colonne 1  +---------------+---------------+     Total     +
|  Colonne 1  |   Colonne 2   |   Colonne 3   |               |
+=============+===============+===============+===============+
|   cel 1.1.  |    cel 1.2.   |    cel 1.3.   | **Tot lig 1** |
+-------------+---------------+---------------+---------------+
|   cel 2.1.  |    cel 2.2.   |    cel 2.3.   | **Tot lig 2** |
+-------------+---------------+---------------+---------------+
|   cel 3.1.  |     cellules 3.2. et 3.3.     | **Tot lig 3** |
+-------------+---------------+---------------+---------------+
|             |               |               |               |
+-------------+---------------+---------------+---------------+
|   cel 6.1.  |    cel 6.2.   |    cel 6.3.   | **Tot lig 6** |
+-------------+---------------+---------------+---------------+
|  **Total**  | **Tot col 2** | **Tot col 3** |   **Total**   |
+-------------+---------------+---------------+---------------+

Septième Diapo
==============

Un extrait de carte

.. .. googlemaps::
..    19 rue des roseaux, 17000 La Rochelle

Huitième Diapo
==============

.. code::

  cd source/_static
  convert logo: logo.png

Une image existante

.. .. image:: ../.static/logo.png

.. image:: ../_static/logo.png
   :height: 300px
   :scale: 50 %

Neuvième Diapo
==============

Une image dessinée à la volée

.. .. aafig::

..   DD o--->

