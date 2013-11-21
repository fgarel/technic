
plantuml
========
#!/bin/sh
#
#
Téléchargement et installation de plantuml
==========================================
# sur le site http://plantuml.sourceforge.net/
wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar?r=http%3A%2F%2Fplantuml.sourceforge.net%2Fdownload.html&ts=1384375181&use_mirror=freefr

Utilisation en ligne de commande
==================================
# http://plantuml.sourceforge.net/command_line.html
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

1. ajout d'un bundle dans le fichier .vimrc.bundles.local
   https://github.com/gmarik/vundle
   vim ~/.spf13-vim-3/.vimrc.bundles.local
   Bundle 'aklt/plantuml-syntax'

2. faire en sorte que ce fichier .vimrc.bundles.local soit lu
   https://github.com/spf13/spf13-vim
   cd ~
   ln -s ~/.spf13-vim-3/.vimrc.bundles.local .vimrc.bundles.local

3. Procéder à l'installation du bundle
   https://github.com/gmarik/vundle
   vim +BundleInstall +qall

4. Creer un fichier executable /usr/local/bin/plantuml
   https://github.com/aklt/plantuml-syntax
   sudo vim /usr/local/bin/plantuml
   #!/bin/bash
   java -jar $HOME/install/plantuml/plantuml.jar -tsvg $@
   sudo chmod +x /usr/local/bin/plantuml

5. sous vim, ne pas oublier de taper 
   :set filetype=plantmul

6. reste de la configuration
   http://zbz5.net/sequence-diagrams-vim-and-plantuml

Autres configurations
=====================
plantuml et sphinx
------------------
https://pypi.python.org/pypi/sphinxcontrib-plantuml

Autres compagnon de plantuml
----------------------------
http://plantuml.sourceforge.net/running.html

Quelques exemples à récupérer
-----------------------------
https://github.com/ming13/generics/tree/master/uml

