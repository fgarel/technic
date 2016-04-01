==================================================
Organisation envisagée pour la gouvernance du PCRS
==================================================

Mise en oeuvre de l'outil geogig
pour gerer la constitution et la mise à jour du Plan de Corps de Rue Simplifié (PCRS).


Après avoir présenté les acteurs, c'est à dire les personnes concernées par ce projet,
nous proposerons un modèle de branches, puis nous verrons l'utilisation de ces concepts.


Définition des acteurs
======================

Nous pouvons concevoir deux voire trois niveaux d'acteurs.

Les acteurs "départementaux" (niveau 1) sont les personnes qui vont échanger les informations
et dont ces échanges devront être quantifiées (comptabilisées)
(Combien de "cases" ont été apportées par l'acteur A, combien de cases ont été exploitées par l'acteur B, ...)

Les acteurs "locaux" (niveau 2) sont les personnes travaillant sur le PCRS à un niveau qui,
vu de l'extérieur, peuvent être regroupées en 1 seul acteur de niveau 1.

Git est un système de gestion de versions distribué.
Dans les systèmes distribués, il n'est pas nécessaire d'avoir un dépot central.
Chaque intervenant dispose d'une copie complète du dépot avec tout l'historique et
peut effectuer autant de changements locaux qu'il le souhaite, sans devoir en référer au "serveur".
En pratique, on conserve des dépots entraux pour faciliter les échanges et servir de référence commune.
Mais les développeurs sont maitres de ce qu'ils envoient sur ces dépots, car le partage des changements
est une opération totalement découplée de leur enregistrement.

Nous allons donc inserer un acteur qui sera charger de gérer le dépot central.

Les acteurs départementaux du PCRS (niveau 1)
---------------------------------------------

Définissons la liste des acteurs pouvant jouer un role dans la consitution, la mise à jour et l'utilisation du PCRS.

- dep17 ERDF                            = Groupe des partenaires "GT reseaux"
- dep17 CDA La Rochelle                 = Groupe des partenaires "GT reseaux"
- dep17 Ville de La Rochelle            = Groupe des partenaires "GT reseaux"
- dep17 SDEER                           = Groupe des partenaires "GT reseaux"
- dep17 SDE                             = Groupe des partenaires "GT reseaux"
- dep17 SI                              = Groupe des partenaires "GT reseaux"
- dep17 Département                     = Groupe des partenaires "GT reseaux"

Chaque acteur est propriétaire (gestionnaire) d'au moins un dépot PCRS_public.

C'est dans ce dépot, qu'il mettra ses données en lecture pour les partenaires du groupement.

Un dépot public et éventuellement un dépot privé
................................................
Un acteur n'est pas contraint de partager l'ensemble de son patrimoine numérique :
il ne doit mettre dans son depot PCRS_public que les données (cases)
qu'il souhaite mettre à disposition des autres partenaires.

Si l'acteur décide d'utiliser geogig en interne pour controler son depot privé,
il pourra créer un deuxième dépot qui ne sera pas accessible aux partenaires.

Une procédure particulière doit permettre a cet acteur de passer un extrait de plan topo
(une case) du dépot private vers le depot public.

Si l'acteur n'utilise pas geogig en interne, il partagera ses données
via un simple glisser-deposer dans le depot PCRS_public

Pour ERDF, les deux dépots pourraient être :

https://github.com/dep17erdf/PCRS_public sera un depot qui pourra être lu par tous les partenaires
https://git.erdf.fr/AgenceCartoPoitouCharentes/PoleCharenteMaritime/PCRS_private sera un depot qui servira aux acteurs de niveau 2 d'erdf (usage interne uniquement)

Deux dépots sont gérés par le service cartographie de la Ville de La Rochelle :
le premier est à usage départemantale, le second est à usage interne.

https://github.com/dep17vlr/PCRS_public
https://git.ville-larochelle.fr/Carto/PCRS_private

Si l'acteur n'utilise pas geogig en interne, il partagera ses données
via un simple glisser-deposer dans le depot PCRS_public

Au final, les depots publics de chacun des partenaires seront donc :

https://github.com/dep17erdf/PCRS_public
https://github.com/dep17cda/PCRS_public
https://github.com/dep17vlr/PCRS_public
https://github.com/dep17sdeer/PCRS_public
https://github.com/dep17sde/PCRS_public
https://github.com/dep17si/PCRS_public
https://github.com/dep17departement/PCRS_public


Les acteurs locaux (niveau 2)
-----------------------------

Au sein de la Ville de La Rochelle, il est possible aussi de définir une liste d'acteurs de niveau 2.
C'est le service Cartographie qui assure la gestion du PCRS au niveau de la Ville vis à vis des partenaires extérieurs.

- VLR AC    = Aménagement et Construction = Service interne de la Ville de La Rochelle
- VLR Carto = Cartographie                = Service interne de la Ville de La Rochelle
- VLR DSI   = DSI                         = Service interne de la Ville de La Rochelle
- VLR EAU   = Eau                         = Service interne de la Ville de La Rochelle
- VLR ECL   = Eclairage                   = Service interne de la Ville de La Rochelle
- VLR Geom  = Géomètres                   = Groupement des géomètres titulaire du Marché de prestations topographiques Ville de La Rochelle
- VLR P     = Pluviales                   = Service interne de la Ville de La Rochelle
- VLR TP1   = Entreprise TP 1             = Entreprise de TP réalisant une prestation pour la Ville de La Rochelle
- VLR TP2   = Entreprise TP 2             = Entreprise de TP réalisant une prestation pour la Ville de La Rochelle
- VLR U     = Urbanisme                   = Service interne de le Ville de La Rochelle
- VLR V     = Voirie                      = Service interne de la Ville de La Rochelle

Deux dépots sont gérés par le service carto : le premier est à usage départemantale, le second est à usage interne.
https://github.com/dep17vlr/PCRS_public
https://git.ville-larochelle.fr/Carto/PCRS_private

Le geometre exterieur à la ville de geometre a aussi son ou ses dépots :
https://github.com/dep17VlrGeom/PCRS_public
https://git.geometre.fr/SocieteA/PCRS_private

Des services de la Ville ont laissé la gestion de leur dépot au service cartographie

Définition des branches
=======================

Ce n'est pas obligatoire, mais un depot peut avoir ces différentes branches :

- PlanTopoControle    = Plan Topo dont la géométrie des objets a été validée par une personne qui veille à un niveau de qualité et qui garantit une certaine précision
- Controle            = Plan contenant des objets dont la position sert à valider un plan topo
- PlanTopoNonControle = Plan de Recolement (après travaux) ou Plan Topo, mais non controlé
- PlanExecution       = Plan d'Execution (avant Travaux)
- PlanProjetA         = Plan Projet Variante A


Gestion des branches et des acteurs
===================================

Gestion au niveau du département (niveau 1)
-------------------------------------------

Chaque acteur est propriétaire d'un dépot "PCRS_public", qui compte une branche appelée PlanTopoControle
La Ville de La Rochelle est propriétaire de son dépot PCRS_public avec la branche "PlanTopoControle"

https://github.com/dep17vlr/PCRS_public PlanTopoControle

Non Obligatoire : Chaque acteur peut avoir un dépot PCRS_private, avec différentes branches

https://git.ville-larochelle.fr/Carto/PCRS_private PlanTopoControle
https://git.ville-larochelle.fr/Carto/PCRS_private Controle
https://git.ville-larochelle.fr/Carto/PCRS_private PlanTopoNonControle
https://git.ville-larochelle.fr/Carto/PCRS_private PlanExecution
https://git.ville-larochelle.fr/Carto/PCRS_private PlanProjetA

Gestion au niveau local (niveau 2)
----------------------------------

Point de vue du service Cartographie

- Le propriétaire du dépot est "VLR Carto" (le service cartographie)
- Les collaborateurs sont "VLR AC" et "VLR Eau"
- les autres sont des contributeurs

Point de vue du service Aménagement et Construction

- Le propriétaire est "VLR AC" (le service Aménagement et Construction)
- Les collaborateurs sont "VLR Carto" et "VLR Eau"
- les autres sont des contributeurs
