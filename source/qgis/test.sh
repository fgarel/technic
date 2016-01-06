#!/bin/zsh


# Liste des atlas / folios avec en plus un décompte de folios par atlas
# cf http://unix.stackexchange.com/questions/28854/list-elements-with-spaces-in-zsh
# "${(@)$()}"
# on met le tout entre parenthese pour avoir un tableau
find_1=("${(@f)$(find "f/CARTOGRAPHIE/Fred/atlas/" -mindepth 1 -maxdepth 1 -type d | sort)}")
# on parcourt chaque element du tableau
NGRPATL=0
NNATL=0
NNPIC=0
for GRPATL in $find_1[@] ; \
    do #echo $s ; \
        (( NGRPATL = NGRPATL + 1 ));
        #find_2=$(find $s -mindepth 1 -maxdepth 1 -type d | sort -t ';' -k 1 | cat -n) ; \
        #echo $find_2 $GRPATL ; \
        find_2=("${(@f)$(find $GRPATL -mindepth 1 -maxdepth 1 -type d | sort)}") ;
        #echo $find_2[@] $NGRPATL ; \
        NATL=0
        for ATL in $find_2[@] ;
        do
            (( NATL = NATL + 1 ))
            (( NNATL = NNATL + 1 ))
            #find_3=$(find $ATL -type f | sort) ;
            find_3=("${(@f)$(find $ATL -type f | sort)}") ;
            #echo $GRPATL;$ATL;
            NPIC=0
            for PIC in $find_3[@] ;
            do
                (( NPIC = NPIC + 1 ))
                (( NNPIC = NNPIC + 1 ))
                echo $NGRPATL";"$GRPATL";"$NATL";"$NNATL";"$NGRPATL"_"$NATL";"$ATL";"$NPIC";"$NNPIC";"$NGRPATL"_"$NATL"_"$NPIC";"$PIC ;
            done
        done
    done  \
    > listOfAtl.txt
