Les types de fichiers pour la gestion des atlas

PIC = liste des photos
NOD = liste des noeuds
BOX = liste de boites autour des noeuds
FOL = liste des folios pour imprimer les box

le principe
pour chacun des types de fichiers, on ajoute deux sous types :
auto et manuel
auto quand le fichier est généré de manière automatique
manuel quand le fichier est controlé par l'homme

AutoPic = liste des photos qui est construite automatiquement en lisant un reertoire via l'utilitaire Rep2Pic
ManuPic = Correction manuel de cette liste de photo
AutoNod = liste des noeuds qui est genéré automatiquement à partir de ManuPIC par l'utilitaire Pic2Nod
ManuNod = Correction manuel de cette liste de noeuds (on ajoute l'information taille de la boite)
AutoBox = liste des boites qui est généré automatiquement à partir de ManuNod par l'utilitaire Nod2Box
ManuBox = Correction manul de cette liste de boite (on ajoute l'information)
AutoFol = liste des folios qui est générés automatiquement à partir de ManuBox par l'utilitaire Box2Fol


les utilitaires
Rep2Pic = pour parcourir un repertoire et ses sous-repertoires afin d'obtenir une liste de photos

Pic2Nod = pour passer d'une liste d'images à une liste de points

Nod2Box = pour passer d'une liste de points à une liste de boites

Box2Fol = pour passer d'une liste de boites à une liste de folios


