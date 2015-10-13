******************************************
Versionning de ces projets à l'aide de git
******************************************

Sur une première machine,
=========================

Creation d'un environnement git lié à github et selon git-flow
--------------------------------------------------------------
Creation des branches master, develop, feature/, release/, hotfix/, support/

.. code::

  git flow init

Creation du depot sous gihub
----------------------------
.. code::

  git create report

Correction des adresses

.. code::

  git config --unset remote.origin.url
  git config --unset remote.origin.fetch
  git remote add origin https://github.com/fgarel/technic.git

Mettre en relations les branches locales et les branches distantes
------------------------------------------------------------------
Se mettre sous develop

.. code::

  git co develop
  git push -u origin develop

Se mettre sous master

.. code::

  git co master
  git push -u origin master

Lister les branches

.. code::

  git branch -a

Sur une seconde machine,
========================

Recuperation des depots github
------------------------------
.. code::

  cd ~/Travail/ecriture_sphinx/
  git clone https://github.com/fgarel/report.git
  git clone https://github.com/fgarel/technic.git

Mettre en relations les branches locales et les branches distantes
------------------------------------------------------------------
Se mettre sous develop

.. code::

  git co develop
  git pull origin develop

On peut aussi faire :

.. code::

  got co develop
  git fetch origin develop
  git diff ...FETCH_HEAD
  git pull origin develop

Se mettre sous master

.. code::

  git co master
  git pull origin master


