#!/bin/zsh

# Cet utilitaire doit permettre de creer un fichier csv contenant une liste de fichier
#
# Contenu du fichier csv au final
# nous souhaitons obtenir les colonnes suivantes :
# 1 - CodGrpAtl = CodeGroupeAtlas  = un numéro qui identifie le Groupe Atlas,
#                                    c'est à dire, l'identifiant de l'atlas
# 2 - TitGrpAtl = TitreGroupeAtlas = Le nom du groupe Atlas
# 3 - CodAtl    = CodeAtlas        = un numéro qui identifie la page, le folio
# 4 - TitAtl    = TitreAtlas       = le nom de la page
# 5 - CodPic    = CodePicture      = le code de l'image
# 6 - TitPic    = TitreImage       = le titre de l'image
# 7 - UriPic    = UriPicture       = l'URI de l'image
#
# Pour fabriquer ce fichier csv, on va parcourir le sous repertoire
# f/CARTOGRAPHIE/Fred/atlas/
#
# Chaque sous-repertoire de ce dossier sera considéré comme un atlas
# chaque sous/sous-repertorie sera une page / un folio
# chaque fichier dans ces sous/sous-repertoire sera une image a placer sur la page
#
# Sous Qgis, nous ajouterons cette couche de données de type CSV

# Premier exemple, obsolete,  pour le parcours des photos du repertoire t/GESTION_DU_PATRIMOINE/photo
# Ce fichier csv contiendra le nom des images qui sont dans le repertoire t/GESTION DU PATRIMOINE/photo/*
#find "t/GESTION_DU_PATRIMOINE/photo" -type f | grep -v Thumbs.db | grep -v ZbThumbnail.info | grep -v pspbrwse.jbf | grep -v desktop.ini \
#    | grep -v .ini | grep -v .lnk | grep -v .bak \
#    > listOfPictures.txt


# liste des groupes d'atlas
#find "f/CARTOGRAPHIE/Fred/atlas" -mindepth 1 -maxdepth 1 -type d | cat -n > listOfGrpAtl.txt
find "f/CARTOGRAPHIE/Fred/atlas" -mindepth 1 -maxdepth 1 -type d | sort -t ';' -k 1 | cat -n > listOfGrpAtl.txt

# liste des atlas
#find "f/CARTOGRAPHIE/Fred/atlas" -mindepth 2 -maxdepth 2 -type d | cat -n > listOfAtl.txt
find "f/CARTOGRAPHIE/Fred/atlas" -mindepth 2 -maxdepth 2 -type d | sort -t ';' -k 1 | cat -n > listOfAtl.txt

# Liste des atlas / folios avec en plus un décompte de folios par atlas
# cf http://unix.stackexchange.com/questions/28854/list-elements-with-spaces-in-zsh
# "${(@)$()}"
# on met le tout entre parenthese pour avoir un tableau
find_1=("${(@f)$(find "f/CARTOGRAPHIE/Fred/atlas/" -mindepth 1 -maxdepth 1 -type d | sort -t ';' -k 1)}")
# on parcourt chaque element du tableau
for s in $find_1[@] ; \
    do #echo $s ; \
        find_2=$(find $s -mindepth 1 -maxdepth 1 -type d | sort -t ';' -k 1 | cat -n) ; \
        echo $find_2 ; \
    done | \
    cat -n \
    > listOfAtl.txt

# liste des photos
# parcours du repertoire ~/f/CARTOGRAPHIE/Fred/atlas/
find "f/CARTOGRAPHIE/Fred/atlas/" -type f | grep -v Thumbs.db | grep -v ZbThumbnail.info | grep -v pspbrwse.jbf | grep -v desktop.ini \
    | grep -v .ini | grep -v .lnk | grep -v .bak \
    | grep -v .pdf | grep -v .PDF \
    | grep -v .kml | grep -v .kmz \
    | grep -v .txt \
    | grep -v .doc | grep -v .docx \
    | grep -v .xls | grep -v .xlsx \
    | sort -t ';' -k 1 \
    | cat -n \
    > listOfPic.txt

# Une fois que les 3 listes ont été créés, nous allons travailler ces trois listes
# cad fairie quelques modifications avant de les fusionner
# sur les GrpAtl, nous allons faire une correpondance TitGrpAtl;CodGrpAtl
sed -i -r 's|[  ]+([0-9]+).+f/CARTOGRAPHIE/Fred/atlas/(.*)|\1;\2|' listOfGrpAtl.txt
# sur les Atl, nous allons faire une correpondance TitAtl;CodAtl On ajoute le TitGrpAtl
#sed -i -r 's|[  ]+([0-9]+).+f/CARTOGRAPHIE/Fred/atlas/([^/]+)/(.*)|\2;\1;\3|' listOfAtl.txt
sed -i -r 's|[  ]+([0-9]+)[  |\t]+([0-9]+).+f/CARTOGRAPHIE/Fred/atlas/([^/]+)/(.*)|\3;\1;\2;\4|' listOfAtl.txt
# sur les Pictures, nous allons faire une correspondance TitPic;CodPic On ajoute TitAtl et TitGrpAtl
sed -i -r 's|[  ]+([0-9]+).+f/CARTOGRAPHIE/Fred/atlas/([^/]+)/([^/]+)/(.*)|\2;\3;\1;\4;f/CARTOGRAPHIE/Fred/atlas/\2/\3/\4|' listOfPic.txt

# Maintenant que nos trois listes ont été retravaillées, nous allons procéder a des join
# la documentation de join est ici
# 
# http://code.snipcademy.com/tutorials/linux-command-line/text-processing/cut-paste-join
# 
# join entre GrpAtl et Atl
#join -t ';' -a 2 -1 2 -2 1 listOfGrpAtl.txt listOfAtl.txt > listOfAtl2.txt
join -t ';' -a 2 -1 2 -2 1 listOfGrpAtl.txt listOfAtl.txt > listOfAtl2.txt
rm listOfAtl.txt
sed -i -r 's|([^;]+);([^;]+);([^;]+);([^;])|\2;\1;\3;\4|' listOfAtl2.txt

# join entre GrpAtl, Atl et Pic
# 
join -t ';' -a 2 -1 4 -2 2 listOfAtl2.txt listOfPic.txt > listOfPic2.txt
 ####rm listOfPic.txt
# on en profite pour calculer des colonnes
# - CodGA = CodGrpAtl + "_" + CodAtl
# - CodGAP = CodGrpAtl + "_" + CodAtl + "_" + CodPic
sed -i -r 's|([^;]+);([^;]+);([^;]+);([^;]+);([^;]+);([^;]+);([^;]+);([^;]+)|\2;\3;\4;\2_\4;\4;\1;\6;\2_\4_\6;\7;\8|' listOfPic2.txt

# Nous avons maintenant un ficher qui a été généré de manière automatique
# il faut que nous y ajoutons des informations que nous allons devoir ajouter à la main
# ces informations sont :
# l'orientation de la photo,
# une légende pour la photo,
# des coordonnées,
# ...
#
# Pour nous faciliter cette tache, nous allons porcéder de la facçon suivante :
# - le script génère un fichier listOfPicToChange.txt
# - l'utilisateur travaille sur un fichier listOfEditedPic.txt (avec par exemple l'outil diff ...)
# - en relancant le script une deuxième fois, le script lit le fichier listOfEditedPid.txt
#   un genere un fichier definitif listOfPic3.txt

# 1. Generation de listOfPicToChange.txt
# On ajoute quelques colonnes :
# - orientation
# - X_Folio
# - Y_Folio
# - Largeur
# - Hauteur
# - Legende
# - X_Terrain
# - Y_Terrain


sed -r 's|(.*)|\1;0;0;0;100;140;Legende;0;0|' listOfPic2.txt > listOfPicToChange.txt

# 2. etape manuelle : modification du fichier listOfEditedPic.txt à partir du fichier précédent
# ici, pour les tests, on fait une simple copie
# mais, cette ligne sera à supprimer
#
######     cp listOfPicToChange.txt listOfEditedPic.txt

# 3. Jointure pour générer le fichier final

join -t ';' -a 2 -1 8 -2 8 listOfPic2.txt listOfEditedPic.txt > listOfPic3.txt
rm listOfPic2.txt

# suppression des colonnes redondantes

sed -i -r 's|([^;]+);(([^;]+;){9})|\1;|' listOfPic3.txt
sed -i -r 's|([^;]+);(([^;]+;){7})|\2\1;|' listOfPic3.txt
