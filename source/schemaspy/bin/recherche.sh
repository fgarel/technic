#!/bin/bash

# recherche d'informations dans les dump

### siecle
# acte de décès
DEFUNT_NOM="GAREL"
DEFUNT_PRENOM="Carmen"
DECLARANT="POUVREAU"
OFFICIER="BOZEC"
ACTE_DATE=" 3 avril 2007 à 11 heures sur"
ACTE_NOTO_DATE="27 janvier 2009"
ACTE_NOTO_MAITRE="Jean-Christophe LABB"


#rgrep -n -E --color -s -e "$DEFUNT_NOM" *.dump | rgrep -E --color -e "$DEFUNT_PRENOM"
#rgrep -n -E --color -s -e "$DECLARANT" *.dump | rgrep -E --color -e "$OFFICIER" | rgrep -E --color -e "$ACTE_DATE"
#rgrep -n -E --color -s -e "$ACTE_NOTO_DATE" *.dump | rgrep -E --color -e "$ACTE_NOTO_MAITRE"

# acte de naissance
PERS_NOM="GAREL"
PERS_PRENOM="Alexandre"
DECLARANT="NOUREAU"
OFFICIER="LIBERGE"
ACTE_DATE="27 juin 2002 à 11 heures 10 minutes sur"


rgrep -n -E --color -s -e "$PERS_NOM" *.dump | rgrep -E --color -e "$PERS_PRENOM"
rgrep -n -E --color -s -e "$DECLARANT" *.dump | rgrep -E --color -e "$OFFICIER" | rgrep -E --color -e "$ACTE_DATE"

# acte de mariage
PERS_NOM="CARTIER"
PERS_PRENOM="Philippe"
DECLARANT=""
OFFICIER="LIBERT"
ACTE_DATE="Le dix neuf mai deux mil sept à"


rgrep -n -E --color -s -e "$PERS_NOM" *.dump | rgrep -E --color -e "$PERS_PRENOM"
rgrep -n -E --color -s -e "$DECLARANT" *.dump | rgrep -E --color -e "$OFFICIER" | rgrep -E --color -e "$ACTE_DATE"
