************************
Les versions de notebook
************************

Il existe des différences de format entre les versions .12 et .13.

Il existe aussi un utilitaire pour convertir des notebooks.

.. code::

  git clone https://gist.github.com/1935808.git
  cd 1935808
  chmod +x downgradenb.py
  cd ..


./1935808/downgradenb.py ipython-notebook.ipynb
