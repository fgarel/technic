***********************************
Les notions d'acteurs et de branches
***********************************

Les acteurs
===========

Les niveaux d'acteurs
---------------------
extrait de la doc (https://github.com/boundlessgeo/GeoGit/wiki/requirements)

Acteur
Pour être en mesure d'identifier les principales exigences et les cas d'utilisation pour les fonctions de GeoGig et de l'environnement,
il est nécessaire d'identifier les principaux «acteurs» ou types d'utilisateurs qui interagissent avec GeoGig sur une base régulière.
Certains acteurs ont des rôles majeurs ou significatifs et devront interagir avec GeoGig sur une base fréquente.
Les autres utilisateurs ou acteurs vont interagir avec GeoGig sur une base moins fréquente et / ou auront des capacités limitées
avec les concepts opérationnels de GeoGig.
Il existe trois principaux acteurs étant abordés dans les récits utilisateur décrits dans cette section.
Ils sont : le propriétaire, le collaborateur et le contributeur.

Propriétaire

Lorsqu'un utilisateur crée son propre référentiel, cet utilisateur devient le «propriétaire» de ce référentiel.
En tant que tel, un propriétaire peut créer et gérer des référentiels, les rendre disponibles en ligne pour le partage,
et peut accorder l'accès à ce dépôt aux collaborateurs.
Si besoin, les propriétaires ont également le pouvoir de révoquer l'accès aux collaborateurs.

Collaborateur

A collaborator is a person with read and write access to a repository who has been invited to contribute by the repository owner.

Un collaborateur est un contributeur à un dépôt distant non détenu par lui-même,
qui a l'autorisation de modifier directement le dépôt distant par le biais d'une opération «push».
Les Opérations de "push" vers des dépôts distants sont utilisés pour appliquer de modifications à des branches 
du référentiel local vers des branches des dépôts distants.
Les opérations de "push" sont également utilisés pour télécharger de nouvelles branches et les étiquettes,
et peuvent être utilisés pour supprimer des branches dans les dépôts distants.
Notez que ces dépôts partagent une histoire commune pour que ces opérations soient applicables.

Contributeur

A contributor is someone who has contributed to a project by having a pull request merged but does not have collaborator access.

Un contributeur est un propriétaire qui a accès en lecture seule à d'autres propriétaires de dépôts.
En tant que tel, il peut cloner, "sparse-cloner", ou récupérer les données à partir des dépôts distants non détenues par lui.
Un contributeur peut intégrer les autres modifications à son propre référentiel, c'est à dire, 
les modifications effectuées par un collaborateur ou autre tiers autorisé à apporter des modifications aux données.
En aucune façon, un contributeur n'est autorisé à modifier un dépôt distant qu'il ne possède pas.
Un contributeur peut envoyer des correctifs au propriétaire du référentiel, et quand/si elle est appliquée,
on désigne le contributeur comme "auteur", tandis que la personne qui fait le commit devient le "committer"".


Les branches
============

