***********************************
Utilisation de geogit à La Rochelle
***********************************


Les acteurs
===========


Les niveaux d'acteurs
---------------------
extrait de la doc (https://github.com/boundlessgeo/GeoGit/wiki/requirements)

Acteur
Pour être en mesure d'identifier les principales exigences et les cas d'utilisation pour les fonctions de GeoGit et de l'environnement,
il est nécessaire d'identifier les principaux «acteurs» ou types d'utilisateurs qui interagissent avec GeoGit sur une base régulière.
Certains acteurs ont des rôles majeurs ou significatifs et devront interagir avec GeoGit sur une base fréquente.
Les autres utilisateurs ou acteurs vont interagir avec GeoGit sur une base moins fréquente et / ou auront des capacités limitées
avec les concepts opérationnels de GeoGit.
Il existe trois principaux acteurs étant abordés dans les récits utilisateur décrits dans cette section.
Ils sont : le propriétaire, le contributeur, et le collaborateur.

Propriétaire

Lorsqu'un utilisateur crée son propre référentiel, cet utilisateur devient le «propriétaire» de ce référentiel.
En tant que tel, un propriétaire peut créer et gérer des référentiels, les rendre disponibles en ligne pour le partage,
et peut accorder l'accès à ce dépôt aux collaborateurs.
Si besoin, les propriétaires ont également le pouvoir de révoquer l'accès aux collaborateurs.

Contributeur

Un contributeur est un propriétaire qui a accès en lecture seule à d'autres propriétaires de dépôts.
En tant que tel, il peut cloner, "sparse-cloner", ou récupérer les données à partir des dépôts distants non détenues par lui.
Un contributeur peut intégrer les autres modifications à son propre référentiel, c'est à dire, 
les modifications effectuées par un collaborateur ou autre tiers autorisé à apporter des modifications aux données.
En aucune façon, un contributeur n'est autorisé à modifier un dépôt distant qu'il ne possède pas.
Un contributeur peut envoyer des correctifs au propriétaire du référentiel, et quand/si elle est appliquée,
on désigne le contributeur comme "auteur", tandis que la personne qui fait le commit devient le "committer"".

Collaborateur

Un collaborateur est un contributeur à un dépôt distant non détenu par lui-même,
qui a l'autorisation de modifier directement le dépôt distant par le biais d'une opération «push».
Les Opérations de "push" vers des dépôts distants sont utilisés pour appliquer de modifications à des branches 
du référentiel local vers des branches des dépôts distants.
Les opérations de "push" sont également utilisés pour télécharger de nouvelles branches et les étiquettes,
et peuvent être utilisés pour supprimer des branches dans les dépôts distants.
Notez que ces dépôts partagent une histoire commune pour que ces opérations soient applicables.



Les acteurs locaux
------------------

Définissons la liste des acteurs potentiels

- A = Aménagement et Construction = Service Interne de la Ville
- B = Boutges et autres Géomètres = Groupe des géomètres
- C = Cartographie                = Service Interne de la Ville
- D = Dufour Frères               = Groupe des entreprises de TP
- E = ERDF                        = Groupe des partenaires "GT reseaux"
- F = CDA                         = Groupe des partenaires "GT reseaux"
- G = Geouest                     = Groupe des géomètres
- H = H2O Eau                     = Service interne de la Ville
- I = iseo                        = Groupe des entreprises de TP

Point de vue du service Carto

- Le propriétaire est C (le service carto)
- Les collaborateurs sont A et H
- les autres sont des contributeurs

Point de vue du service Aménagement et Construction

- Le propriétaire est A (le service Aménagement et Construction)
- Les collaborateurs sont C et H
- les autres sont des contributeurs

Tutorial
--------
http://geogit.org/docs/start/tutorial.html


GeoGit est un système distribué de contrôle de version (DVCS) pour les données géospatiales.

Ce document est une brève introduction aux principales idées de GeoGit.
Il explique comment configurer et utiliser GeoGit pour le gestion des versions des données spatiales,
en introduisant les opérations suivantes:

  - Importer des données spatiales non versionnés dans GeoGit
  - Apporter des changements et stocker des instantanés ("commit")
  - Maintenir de lignes indépendantes de modifications («de branche»)
  - Intégrer les changements de branches distinctes («fusionner»)
  - Résoudre les modifications contradictoires
  - Synchroniser des données à travers un réseau («push» et «pull»)
  - Marquer des versions spécifiques de données ("tag")
  - Exporter des données de GeoGit vers un shapefile

Ce tutoriel suppose aucune expérience préalable avec GeoGit.
Plus de détails peuvent être trouvés dans les sections suivantes.

Installation
------------

Configuration
-------------
(UC32 Configure Owner's Identity) https://github.com/boundlessgeo/GeoGit/wiki/uc32
Avant de commencer à travailler avec des données géospatiales dans GeoGit, 
vous devez fournir GeoGit avec un nom d'utilisateur et e-mail,
en utilisant la commande de configuration,
en substituant votre nom et votre e-mail:

.. code::

  geogit config --global user.name "Author"
  geogit config --global user.email "author@example.com"

Initialisation
--------------
(UC01 Create Repository) https://github.com/boundlessgeo/GeoGit/wiki/uc01
Tout d'abord, nous devons créer un nouveau référentiel.
Créez un dossier de répertoire qui contiendra le référentiel,
s'y installer et initialiser le typage GeoGit de référentiel.

.. code::

  geogit init

Maintenant, votre repertoire GeoGit est prêt à gérer le versionning de vos données géospatiales.
Notez que le répertoire .geogit a été créé.


Exemple/Simulation
------------------
Cette archive contient plusieurs répertoires, nommés de snapshot1 à snapshot5.
Chaque répertoire contient un seul fichier shapefile,
qui contiennent tous de légères variations.
Pour les besoins de ce didacticiel, chaque fichier shapefile sera considéré
comme un «instantané» des données dans le temps.
Nous allons utiliser ces clichés pour simuler la création et l'édition des données dans GeoGit.

Extraire l'archive dans le répertoire de dépôt créé à l'étape précédente.

Importer les données
--------------------
(UC06 Import FeatureType) https://github.com/boundlessgeo/GeoGit/wiki/uc06
(UC34 Check modification status) https://github.com/boundlessgeo/GeoGit/wiki/uc34


Ajouter des données
-------------------
( ? ) 

Commiter les données
--------------------
(UC10 Commit Changes) https://github.com/boundlessgeo/GeoGit/wiki/uc10


Faire des Modifications
-----------------------
(UC34 Check modification status) https://github.com/boundlessgeo/GeoGit/wiki/uc34
()
(UC10 Commit Changes) https://github.com/boundlessgeo/GeoGit/wiki/uc10


Consulter l'historique
----------------------
(UC25 List changesets) https://github.com/boundlessgeo/GeoGit/wiki/uc25

Créer une branche
-----------------
(UC16 Manage branches) https://github.com/boundlessgeo/GeoGit/wiki/uc16

Fusionner deux branches
-----------------------
(UC20 Switch branch) https://github.com/boundlessgeo/GeoGit/wiki/uc20
(UC17 Merge branch with no conflicts) https://github.com/boundlessgeo/GeoGit/wiki/uc17

Résoudre les problèmes de fusion
--------------------------------
(UC11 Review Changeset) https://github.com/boundlessgeo/GeoGit/wiki/uc11
(UC42 Resolve conflicts) https://github.com/boundlessgeo/GeoGit/wiki/uc42


Etiquetter une version
----------------------
(UC40 Create tag) https://github.com/boundlessgeo/GeoGit/wiki/uc40

Exporter à partir d'un répertoire geogit
----------------------------------------
(UC07 Export FeatureType) https://github.com/boundlessgeo/GeoGit/wiki/uc07

Synchroniser des répertoires
----------------------------
(UC02 Clone Repository) https://github.com/boundlessgeo/GeoGit/wiki/uc02
(UC03 Pull from remote) https://github.com/boundlessgeo/GeoGit/wiki/uc03
(UC04 Push to remote) https://github.com/boundlessgeo/GeoGit/wiki/uc04






Le service Aménagement et Construction est missionné pour conduire un projet sur une zone couvrant
un carrfour et deux voies perpendiculaires

Le service carto ne dispose d'aucun plan topographique.

ErDF dispose d'un plan avec une voie et une partie du carrefour
La CDA dispose d'un plan avec une partie de l'autre voie et du carrefour en entier

User Story 


Point de vue du service Carto

- 
