
********************************************
Explication de la chaine csv vers postgresql
********************************************

Le developpement est en python et est basé sur sqlalchemy

.. code::

  workon csvpython

Mise en place de l'environnement python
=======================================

.. code::

  workon csvpython

  pip install pylint
  pip install sqlalchemy
  pip install psycopg2
  pip install GeoAlchemy
  pip install GeoAlchemy2
  pip install sadisplay==0.3.6dev


Le premier programme connection.py
==================================

Modif de la chaine de connection

.. code::

  self.engine = sqlalchemy.create_engine(
      'postgresql://user:password@host:port/base', echo=True)


