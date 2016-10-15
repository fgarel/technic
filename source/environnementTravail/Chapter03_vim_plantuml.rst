



***************
Vim et Plantuml
***************


vim
===
Utilisation de spf13-vim
https://github.com/spf13/spf13-vim



Plantuml est un outil permettant de dessiner des diagrammes UML

http://plantuml.sourceforge.net/


Téléchargement et installation de plantuml
============================================

Avant :

.. code::

  wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar?r=http%3A%2F%2Fplantuml.sourceforge.net%2Fdownload.html&ts=1384375181&use_mirror=freefr

Aujourd'hui :

.. code::

  aptitude install plantuml


Utilisation en ligne de commande
================================
http://plantuml.sourceforge.net/command_line.html

Avant :

.. code::

  # pour parser tous les fichiers du repertoire courant (".")
  java -jar plantuml.jar -config "./config.cfg" .
  java -jar plantuml.jar -tsvg sample.uml
  java -jar plantuml.jar -help

Aujourd'hui :

.. code::

  TODO


Configuration de plantuml avec vim
==================================

L'idée est de faire l'édition du fichier UML sous VI.
Sous cet editeur, en appuyant sur la touche F5,
alors, VI va interpréter cette touche pour lancer la commande :make

Or, grace au plugin plantuml-script, la commande :make revient à lancer
l'executable plantuml.

Donc, en appuyant sur F5 sous VI, alors on lance plantuml avec le fichier en cours

Les docs à l'origine
--------------------
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

  .. code::

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

  Avant :

  .. code::

    sudo vim /usr/local/bin/plantuml

  .. code::

    #!/bin/bash
    java -jar $HOME/install/plantuml/plantuml.jar -tsvg $@

  .. code::

    sudo chmod +x /usr/local/bin/plantuml

  Aujourd'hui : ce n'est plus nécessaire

#. Sous vim, ne pas oublier de taper

  Avant :

  .. code::

    :set filetype=plantmul

  Aujourd'hui : ce n'est plus nécessaire


#. Ajout d'un raccourci clavier dans le fichier .vimrc.local

  .. code::

    vim ~/.vimrc.local

  .. code::

    nnoremap <F5> :w<CR>:make<CR>
    inoremap <F5> <ESC>:w<CR>:make<CR>
    vnoremap <F5> :<C-U>:w<CR>:make<CR>


#. Utilisation des raccourcis vim avec byobu

  On a vu que, sous VI, l'appui sur la touche F5 provoque le lancement de la commande :make

  Or, quand on est sous VI, mais aussi dans Byobu, l'appui sur la touche F5 est d'abord
  attrapé par byobu : il faut désactiver temporairement les keybindings de byobu.

  If you cannot manage to disable specific keybindings,
  you can toggle Byobu's keybindings off/on using
  Shift+F12 

  http://askubuntu.com/questions/330374/disable-keybindings-in-byobu-using-tmux-backend

  .. code::

    Shift+F12 

Autres configurations
=====================
Plantuml et sphinx
------------------
https://pypi.python.org/pypi/sphinxcontrib-plantuml

Cette configuration est détaillée au paragraphe sphinx.
Cependant, il faut avoir créer l'utilitaire plantmul tel que décrit dans le paragraphe précédent.

.. code::

  sudo vim /usr/local/bin/plantuml

.. code::

  #!/bin/bash
  java -jar $HOME/install/plantuml/plantuml.jar -tsvg $@

.. code::

  sudo chmod +x /usr/local/bin/plantuml

Autres compagnons de plantuml
-----------------------------
http://plantuml.sourceforge.net/running.html

Quelques exemples à récupérer
-----------------------------
https://github.com/ming13/generics/tree/master/uml

