
****************************************
Notes concernant le developpement python
****************************************

Pour developper sous python, nous avons utiliser quelques utilitaires
mypylint.py qui permet de verifier le code python

Utilisation de mypylint.py
==========================

Le fichier source se trouve dans patrimoine/bin
il a été recopié dans le repertoire /usr/local/bin/

pour que son appel soit possible, il faut que :
l'environnement en cours contiennnet le module argparse et pylint :

.. code::

  workon ecriture_sphinx

.. code::

  pip install pylint


.. code::

  mypylint connexion.py

Un autre utilitaire est continuous.py

Utilisation de conitnuous.py
============================

Attention l'utilite de cet outil avec latex, notamment avec autolatex, n'est peut-etre plus vraiment utile
