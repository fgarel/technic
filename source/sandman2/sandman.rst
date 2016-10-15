

Installation d'un environnement python que l'on appelera sandman2

.. code::
  pew new -p `pythonz locate 3.4.3` sandman2

Mise à jour de pip

.. code::
  pip install --upgrade pip

Installation de sandman2 dans cet environnement
https://github.com/jeffknupp/sandman2

.. code::
  pip install sandman2
  pew show

Installation de psycopg2

.. code::
  pip install psycopg2

Utilisation pour mettre à disposition la base

.. code::
  sandman2ctl postgresql://fred:fred@localhost/sandbox
  sandman2ctl postgresql://VLR:VLR@localhost/sandbox

Visualisation da la page web

.. code::
  http://127.0.0.1:5000/admin/



Installation de flask-admin

.. code::
  pip install flask-admin

.. code::
  pip install nose


