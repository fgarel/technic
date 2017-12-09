# Creation d'organigramme

Deux outils peuvent être utilisés pour dessiner des diagrammes.
Ils fonctionnent sur le même principe : un fichier contient des instructions,
un programme parse ces instructions pour produire une image.

Le premier, c'est plantuml, une surcouche a grahviz
et le deuxième, c'est dot, un outil de graphviz

## Utilisation de plantuml

Le fichier source est organigrammeVoirie.uml

L'appel à l'outil plantuml est plus ou moins transparente :

  - Lancement manuel de l'outil
    Avec la commande pour convertir le fichier .uml en fichier .svg ou .png
    ```

    ```

  - Vim et son plugin plantuml
    Un bundle pour vim permet d’éditer le fichier .uml et de voir en direct le résultat
    avec la commande :make ou <F5> si le raccouric claivier a eté configuré

  - Webservice
    On peut copier coller le contenu dans le formulaire du webservice plantuml.com


## Utilisation de graphviz

Le fichier source est graphviz/organigram.dot

Un script a été créé pour lancer le programme dot (qui fait partie du paquet graphviz)

Ce programme, c'est technic/source/environementTravail/graphviz/dot2png.sh


## Utilisation plus avancée : recupération de l'annuaire ldap et dessin de l'organigramme avec graphviz

l’idée ici est de lire le contenu de l'annuaire ldap, d'en fabriquer un fichier .ldif,
(que l'on epure un peu)
de parser ce fichier ldif pour le transformer en fichier .dot
pour enfin utiliser graphviz (dot) pour transformer ce fichier dot en fichier .png ou .svg
Le fichier qui fait tout ça, c'est
~/Documents/technic/source/gup/bin/sync_ldap_atal.sh

Ce script est à améliorer pour récuperer à la fois :
 - les informations des services (filières)
 - et les informations des personnes (people)
et compiler tout ça dans un graphe : amélioration de ldif2dot.py

le fichier photo_remove.py est aussi à améliorer :
Il faut qu'il :
- supprime les photos
- recupere le ouDisplayName, le decode en base 64, et complete un liste d'aasociation ou_ouDisplayName
