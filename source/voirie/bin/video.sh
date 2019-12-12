#!/bin/zsh


PATH_INI=~/h/cartographie/travaux
echo "set OLDPWDFG=$(pwd)"
      set OLDPWDFG=$(pwd)
echo $OLDPWDFG

# variables pour les textes à placer sur les images
# les 4 dates doivent correspondre à des lundis
DATE_FIRST="2019-01-07"      # Attention, doit correspondre à un lundi, à forcer, correspond à la variable "time frame start" dans time manager
DATE_INI="2019-05-06"        # date de la première diapo de la video
DATE_FIN="2020-03-23"        # date de la dernière diapo de la video
DATE_BEFORELAST="2023-01-02" # date de l'avant dernière diapo (elle peut etre postérieure à la date de fin de timemanager)

# variables pour l'assemblage des images sous la forme d'un film
# Les numéros des diapos doivent correpndre aux dates mentionnées ci-dessous
FRAME_FIRST=0               #
FRAME_INI=17                # la frame 0017 correspond au 2019 05 06
FRAME_FIN=63                # la frame 0063 correspond au 2020 03 23
FRAME_BEFORELAST=208        # la frame 0208 corresponde au 2023 01 02

TITLE= # voir en bas, les annotatiuons
MOVIE=amovie.mp4

framerate=30
framerate=1  # 1 image par seconde


#
# Attention, les annotations sont définies après la focntion
#



#
# definition d'une fonction annotation
#

function annotation ()
{

#echo "-------------------------"
#echo "Pour chaque frame devant etre annotée, ecriture d'une annotation"
#echo "-------------------------"
ANNOTATION_LIBELLE=$1
ANNOTATION_FONT=$2
ANNOTATION_POINTSIZE=$3
ANNOTATION_STROKE_WIDTH=$4
ANNOTATION_COLOR=$5
ANNOTATION_COLOR_STROKE=$6
ANNOTATION_COLOR_BACKGROUND=$7
ANNOTATION_FRAME_INI=$8
ANNOTATION_FRAME_FIN=$9
ANNOTATION_GRAVITY=${10}
ANNOTATION_X=${11}
ANNOTATION_Y=${12}

# loop
# on initiailise quelques compteurs :
# on initialise un compteur de frame
ANNOTATION_FRAME_CURRENT=$(( $ANNOTATION_FRAME_INI-1 ))

# loop sur les frames
for ((annotation_i = $ANNOTATION_FRAME_INI; annotation_i <= $ANNOTATION_FRAME_FIN; annotation_i++));
do
  ANNOTATION_FRAME_CURRENT=$(( $ANNOTATION_FRAME_CURRENT+1 ))
  #echo "annotation : ANNOTATION_FRAME_INI = "$ANNOTATION_FRAME_INI" ; FRAME_CURRENT = "$ANNOTATION_FRAME_CURRENT" ; ANNOTATION_FRAME_FIN = "$ANNOTATION_FRAME_FIN
  TEXTE_A_ECRIRE=$ANNOTATION_LIBELLE
  #echo "annotation : TEXTE_A_ECRIRE = "$TEXTE_A_ECRIRE
  COMMANDE_IM="convert -background '$ANNOTATION_COLOR_BACKGROUND' -font $ANNOTATION_FONT -pointsize $ANNOTATION_POINTSIZE -stroke $ANNOTATION_COLOR_STROKE -strokewidth $ANNOTATION_STROKE_WIDTH -fill $ANNOTATION_COLOR label:'$TEXTE_A_ECRIRE' miff:- | \
               composite -gravity $ANNOTATION_GRAVITY -geometry +$ANNOTATION_X+$ANNOTATION_Y \
                         - \
                         frame00$ANNOTATION_FRAME_CURRENT.png \
                         annotedframe00$ANNOTATION_FRAME_CURRENT.png"
  #echo "annotation : COMMANDE_IM = "$COMMANDE_IM
  result=$(sh -c "$COMMANDE_IM")
  #echo "annotation : result = "$result
  rm frame00$ANNOTATION_FRAME_CURRENT.png
  mv annotedframe00$ANNOTATION_FRAME_CURRENT.png frame00$ANNOTATION_FRAME_CURRENT.png
done

}


# On commence par se placer dans le bon repertoire
cd $PATH_INI


# Effacement des dates de timeManager
echo "-------------------------"
echo "Blanco sur les dates de timeManager"
echo "-------------------------"
annotation "____________" Arial 17 1 White White '#ffffffff' $(( $FRAME_INI-4 )) $(( $FRAME_INI-1 )) North 0 10
echo "..."
annotation "____________" Arial 17 1 White White '#ffffffff' $(( $FRAME_INI )) $(( $FRAME_FIN )) North 0 10

# Ajout d'un titre de dossier "Travaux...."
echo "-------------------------"
echo "Ajout d'un titre de dossier Travaux...."
echo "-------------------------"
annotation "Avenue Grasset" Arial-Black 40 1 Black Black '#ffffff80' $(( $FRAME_INI-4 )) $(( $FRAME_INI-1 )) center 0 0

# Ajout des titres de frames (date)
#cf ci dessous

# Ajout des annotations
echo "-------------------------"
echo "Ajout des annotations"
echo "-------------------------"
annotation "Travaux terminés le 12 juillet 2019" Arial-Black 15 1 Blue Blue '#ffffff80' $FRAME_INI 27 northWest 500 250
echo "..."
annotation 'Travaux du 8 juillet 2019\nau 15 mars 2020' Arial-Black 15 1 Blue Blue '#ffffff80' 26 61 northWest 800 300
echo "..."
annotation 'Travaux du 1er Novembre 2019\nau 28 février 2020' Arial-Black 15 1 Blue Blue '#ffffff80' 42 59 northWest 200 150
echo "..."

# 0. Introduction
# ---------------

# Time manager (plugin de qgis) génère une serie d'images

# Nous allons modifier les images une par une (ajout d'un texte),
# puis les assembler pour faire un film visible dans powerpoint

# 1. Génération des images avec un outil externe
# ---------------
# 1.1. Utilisation de Google earth studio pour
# faire un projet point à point,
# appelé LR-BA (en resolution 1920x1080)
# on obtinet un fichier zip qui contient 270 images

# Ou alors, 1.2. utilisation de time manager pour génerer des frames



# 2. Utilisation d'image magick pour manipuler chaque frame
# ---------------
# 2.1. Redecoupage de chacune des images pour supprimer le logo google
#les definitions d'acran
#2560x1440
#1920x1080
#1280x720
#cd ~/Documents/perso2/Argentine/LR-BA/footage/
#mogrify -gravity Center  -crop 1280x720+0+0 +repage *.jpeg
#cd ~/Documents/perso2/Argentine/

# 2.2. Placement d'un watermark (date)
#
# on resoud ici deux problèmes :
# 2.2.1. problème shell : manipulation des dates
#        https://www.commentcamarche.net/forum/affich-34924755-script-shell-afficher-la-date
#        - 1er besoin par rapprt aux dates : affichage correct
#          date +"%A %d %B %Y"
#          les options sont :
#            %W = numero de la semaine
#            %A = mardi
#            %d = 25
#            %B = juin
#            %Y = 2019
#          pour afficher la date de la veille
#            date -d "2019-06-24" +"%A %d %B %Y"
#            date -d "2019-06-26" +"semaine %W : %A %d %B %Y"
#            export DATE_INI='2019-06-28' ; date -d $DATE_INI +"semaine %W : %A %d %B %Y"
#
#        - 2d besoin par rapport aux dates : faire une boucle
#          loop tous les jours, ou toutes les semaines
#            https://abs.traduc.org/abs-5.0-fr/ch15s03.html
#            Conversion d'une date en variable epoch
#              Calcul de EPOCH_DAY_INI, la date initiale en nombre de jour depuis le 01/01/1970
#              calcul de EPOCH_DAY_FIN, la date finale en nombre de jour depuis le 01/01/1970
#              calcul de EPOCH_WEEK_INI, la date initiale en nombre de semaine depuis le 01/01/1970


# pour faire le loop, on a besoin de travailler en jour
echo "Jour de départ = "$(date -d $DATE_INI +"%A %d %B %Y")
echo "Jour de fin = "$(date -d $DATE_FIN +"%A %d %B %Y")
#
EPOCH_SECOND_INI=$(date -d $DATE_INI +"%s")
EPOCH_SECOND_FIN=$(date -d $DATE_FIN +"%s")
EPOCH_DAY_INI=$(( $EPOCH_SECOND_INI/3600/24 ))
EPOCH_DAY_FIN=$(( $EPOCH_SECOND_FIN/3600/24 ))
EPOCH_WEEK_INI=$(( $EPOCH_SECOND_INI/3600/24/7 ))
EPOCH_WEEK_FIN=$(( $EPOCH_SECOND_FIN/3600/24/7 ))
#echo "EPOCH_WEEK_INI = "$EPOCH_WEEK_INI
#echo "EPOCH_WEEK_FIN = "$EPOCH_WEEK_FIN

#
# 2.2.2. utilisation d'image magick pour placer des annotations
#
# sous image magick : compose
# https://imagemagick.org/Usage/annotating/
# #


# Ajout des titres de frames (date)
echo "-------------------------"
echo "Ajout des titres de frames (date)"
echo "-------------------------"
echo "-------------------------"
echo "Pour chaque frame (de DATE_INI a DATE_FIN), ecriture d'un titre de frame"
echo "-------------------------"
# loop
# on initiailise quelques compteurs :
# on initialise un compteur de frame
FRAME_CURRENT=$(( $FRAME_INI-1 ))
# on initialise un compteur de seconde
SECOND_CURRENT_INI=$(( $EPOCH_SECOND_INI - 7*24*3600 + 12*3600)) # le lundi, on rajoute 12 heures pour eviter les problèmes de changments d'heure pour l'heure locale

# loop sur les semaines
for ((i = $EPOCH_WEEK_INI; i <= $EPOCH_WEEK_FIN; i++));
do
  FRAME_CURRENT=$(( $FRAME_CURRENT+1 ))
  SECOND_CURRENT_INI=$(( $SECOND_CURRENT_INI + 7*24*3600))
  SECOND_CURRENT_FRIDAY=$(( $SECOND_CURRENT_INI + 4*24*3600))
  #echo "titre_frame : EPOCH_WEEK_INI = "$EPOCH_WEEK_INI" ; i = "$i" ; FRAME_CURRENT = "$FRAME_CURRENT" ; EPOCH_WEEK_FIN = "$EPOCH_WEEK_FIN
  #echo "titre_frame : semaine, jour, heure = "$(date -d @$SECOND_CURRENT +"Année %Y, Semaine %W, %A %d %B %Y, %H:%M:%S")
  TEXTE_A_ECRIRE=$(date -d @$SECOND_CURRENT_INI +"Semaine %W : du %A %d %B %Y")$(date -d @$SECOND_CURRENT_FRIDAY +" au %A %d %B %Y")
  #echo "titre_frame : TEXTE_A_ECRIRE = "$TEXTE_A_ECRIRE

  annotation "$TEXTE_A_ECRIRE" Arial 17 1 black black '#ffffff80' $FRAME_CURRENT $FRAME_CURRENT North 0 10

done


echo "-------------------------"
echo "Nettoyage, suppresion de frame"
echo "-------------------------"

# 3. travaux : creation de la video à partir de la serie d'image

# 3.1. Suppression des images (frame)
# loop pour supprimer les images de 0 à 9
for ((i = 0; i < 10; i++));
do
#echo "frame000"$i
rm -f frame000$i.png
rm -f frame000$i.pgw
done

echo "-------------------------"
# loop pour supprimer les images de 10 à 14
for ((i = 10; i <= $(( $FRAME_INI-4 )); i++));
do
#echo "frame00"$i
rm -f frame00$i.png
rm -f frame00$i.pgw
done

echo "-------------------------"
# loop pour supprimer les images de 65 à 99
for ((i = $(( $FRAME_FIN+1 )); i < 100; i++));
do
#echo "frame00"$i
rm -f frame00$i.png
rm -f frame00$i.pgw
done

echo "-------------------------"
# loop pour supprimer les images de 100 à 999
for ((i = 100; i < 999; i++));
do
#echo "FRAME0"$i
rm -f frame0$i.png
rm -f frame0$i.pgw
done

echo "-------------------------"



# 3.2. assemblage des images en film gràce à ffmpeg
#
# Quelques options sont a ajouter pour avoir un film compatible avec powerpoint :
#
# 1. probleme de compatibilité avec powerpoint
# https://stackoverflow.com/questions/44130350/convert-videos-with-ffmpeg-to-powerpoint-2016-compatible-video-format
# -preset slow  -profile:v high -level:v 4.0 -pix_fmt yuv420p -crf 22

# 2. probleme de taille multiple de 2
# https://stackoverflow.com/questions/20847674/ffmpeg-libx264-height-not-divisible-by-2
# -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2"



rm -f $MOVIE
ffmpeg -r $framerate -framerate $framerate -pattern_type glob -i 'frame*.png' -c:v libx264 -preset slow -profile:v high -level:v 4.0 -pix_fmt yuv420p -crf 22 -vf "pad=ceil(iw/2)*2:ceil(ih/2)*2" $MOVIE

echo 'cd $OLDPWD'
      cd $OLDPWD
