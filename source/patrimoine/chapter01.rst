
*********
Rangement
*********


Rangement dans le système de fichiers
=====================================

Nettoyage du repertoire /projets_transversaux/gestion_du_patrimoine

Plusieurs opérations sont à réaliser :

 - il faut créer les sous-repertoires en respectant l'arborescence qui a été définie sous ATL
 - il faut déplacer les fichiers de leurs anciens emplacements vers le nouveau

Création des sous-répertoires à la chaine
-----------------------------------------

La liste des sous-repertoires a créer, c'esta à dire la liste du patrimoine est liste_patrimoine.txt

Ensuite, un petit script, lecture_csv.py, va lire le contenu de cette liste, et pour chaque ligne (chacun des patrimoine), nous allons générer un fichier de commande shell qui contiendra toutes les instructions adéquates.

.. code::

  vi liste_aptrimoine.txt

  vi fichier_commande_tpl.sh

  ./lecture_csv.py

  chmod +x fichier_commande.sh

  ./fichier_commande.sh

Déplacement des fichiers
------------------------

Pour lister les plans du repertoire /home/t/GESTION_DU_PATRIMOINE

.. code::

  cd source/patrimoine/bin
  ./parcours_repertoire.py




Rangemant dans la base de données
=================================


Audit des paramètres ATAL
-------------------------

Etat de l'existant
------------------

Proposition d'amelioration
--------------------------
