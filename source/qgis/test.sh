#!/bin/zsh

# recherche de fichier
# cf http://unix.stackexchange.com/questions/28854/list-elements-with-spaces-in-zsh
# "${(@)$()}"
# on met le tout entre parenthese pour avoir un tableau
find_1=("${(@f)$(find "f/CARTOGRAPHIE/Fred/atlas/" -mindepth 1 -maxdepth 1 -type d | sort)}")
# on parcourt chaque element du tableau
for s in $find_1[@] ; \
    do #echo $s ; \
        find_2=$(find $s -mindepth 1 -maxdepth 1 -type d | sort | cat -n) ; \
        echo $find_2 ; \
    done | \
    cat -n #\
    #> listOfAtlnew.txt
