********
Plantuml
********

Plantuml est un outil permettant de dessiner des diagrammes UML

http://plantuml.sourceforge.net/


Téléchargement et installation de plantuml
============================================
.. code::

  wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar?r=http%3A%2F%2Fplantuml.sourceforge.net%2Fdownload.html&ts=1384375181&use_mirror=freefr

Utilisation en ligne de commande
================================
http://plantuml.sourceforge.net/command_line.html

.. code::

  # pour parser tous les fichiers du repertoire courant (".")
  java -jar plantuml.jar -config "./config.cfg" .
  java -jar plantuml.jar -tsvg sample.uml
  java -jar plantuml.jar -help

Configuration de plantuml avec vim
==================================
Plantuml et vim
---------------
http://www.vim.org/scripts/script.php?script_id=3538

http://zbz5.net/sequence-diagrams-vim-and-plantuml

https://github.com/aklt/plantuml-syntax

Confiuration de vim spf13
-------------------------
Configuration de spf13 pour que le plugin plantuml.vim soit installé

#. Ajout d'un bundle dans le fichier .vimrc.bundles.local

   https://github.com/gmarik/vundle

   .. code::

     vim ~/.spf13-vim-3/.vimrc.bundles.local
     Bundle 'aklt/plantuml-syntax'

#. Faire en sorte que ce fichier .vimrc.bundles.local soit lu

   https://github.com/spf13/spf13-vim

   .. code::

     cd ~
     ln -s ~/.spf13-vim-3/.vimrc.bundles.local .vimrc.bundles.local

#. Procéder à l'installation du bundle

   https://github.com/gmarik/vundle

   .. code::

     vim +BundleInstall +qall

#. Creer un fichier executable /usr/local/bin/plantuml

   https://github.com/aklt/plantuml-syntax

   .. code::

     sudo vim /usr/local/bin/plantuml
     #!/bin/bash
     java -jar $HOME/install/plantuml/plantuml.jar -tsvg $@
     sudo chmod +x /usr/local/bin/plantuml

#. Sous vim, ne pas oublier de taper

   .. code::

     :set filetype=plantmul

#. Reste de la configuration

   http://zbz5.net/sequence-diagrams-vim-and-plantuml

Autres configurations
=====================
Plantuml et sphinx
------------------
https://pypi.python.org/pypi/sphinxcontrib-plantuml

Cette configuration est détaillée au paragraphe sphinx.

Autres compagnons de plantuml
-----------------------------
http://plantuml.sourceforge.net/running.html

Quelques exemples à récupérer
-----------------------------
https://github.com/ming13/generics/tree/master/uml

