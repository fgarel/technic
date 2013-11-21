========================
Environnement de travail
========================

Environnement virtuel python avec l'outil sphinx
================================================
Creation d'un environnement virtuel python
ecriture_sphinx


2 projets sphinx
================

se positionner dans le bon répertoire
~/travail/ecriture_sphinx/report/
~/travail/ecriture_sphinx/technic/

versionning de ces projets à l'aide de git
==========================================
Sur une première machine,
Creation d'un environnement git lié à github et selon git-flow
Creation des branches master, develop, feature/, release/, hotfix/, support/
git flow init

Creation du depot sous gihub
git create report

Correction des adresses
git config --unset remote.origin.url
git config --unset remote.origin.fetch
git remote add origin https://github.com/fgarel/technic.git

Mettre en relations les branches locales et les branches distantes
Se mettre sous develop
git co develop
git push -u origin develop
Se mettre sous master
git co master
git push -u origin master

Lister les branches
git branch -a

Sur une seconde machine,
Recuperation des depots github
cd ~/Travail/ecriture_sphinx/
git clone https://github.com/fgarel/report.git
git clone https://github.com/fgarel/technic.git

Suite de l'environnement pour completer sphinx
==============================================
installation de plugin à sphinx
workon ecriture_sphinx

installation de hieroglyph

plantuml
#!/bin/sh
#
#
# 1. Téléchargement et installation de plantuml
# sur le site http://plantuml.sourceforge.net/
wget -O plantuml.jar http://downloads.sourceforge.net/project/plantuml/plantuml.jar?r=http%3A%2F%2Fplantuml.sourceforge.net%2Fdownload.html&ts=1384375181&use_mirror=freefr

# 2. Utilisation en ligne de commande
# http://plantuml.sourceforge.net/command_line.html
# pour parser tous les fichiers du repertoire courant (".")
java -jar plantuml.jar -config "./config.cfg" .
java -jar plantuml.jar -tsvg sample.uml
java -jar plantuml.jar -help

# plantuml et vim
http://www.vim.org/scripts/script.php?script_id=3538
http://zbz5.net/sequence-diagrams-vim-and-plantuml
https://github.com/aklt/plantuml-syntax
#configuration de spf13 pour que le plugin plantuml.vim soit installé
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

#plantuml et sphinx
https://pypi.python.org/pypi/sphinxcontrib-plantuml

# autres companion de plantuml
http://plantuml.sourceforge.net/running.html

# quelques exemples à récupérer
https://github.com/ming13/generics/tree/master/uml




Ecriture en respectant la syntaxe restructured Text
===================================================



