# GUP / (Relation Demandeur-Prestataire)

Il existe plusieurs logiciels de gestion de relation usager

Dans un première partie, nous allons essayer de faire un état des lieux des logiciels existants.
En particulier, le logiciel entrouvert sera installé pour être testé.

Dans une seconde partie, nous allons essayer d'analyser les différents logiciels déjà en place

Dans une troisième partie, nous allons comparer ces différents outils



## Logiciel Gestion Relation Usager

https://www.entrouvert.com/fr/e-administration/
https://publik.entrouvert.com/
http://www.modernisation.gouv.fr/la-qualite-des-services-publics-sameliore/en-fixant-des-referentiels/relation-entre-usagers-et-agents-les-services-publics-partagent-leurs-pratiques-innovantes
http://www.modernisation.gouv.fr/sites/default/files/fichiers-attaches/cahierusagers.pdf
http://www.modernisation.gouv.fr/sites/default/files/fichiers-attaches/referentiel_marianne_vf_juin_2013.pdf
http://www.modernisation.gouv.fr/sites/default/files/fichiers-attaches/mariannekitdeploiement_0913.pdf

https://www.entrouvert.com/fr/e-administration/les-logiciels/
http://authentic2.readthedocs.org/en/stable/index.html
http://www.cegid.fr/secteurpublic/la-gestion-de-la-relation-citoyen-grc-cegid-public/r1-4456.aspx


https://publik.entrouvert.com/
http://www.entrouvert.com/fr/e-administration/les-logiciels/
https://deb.entrouvert.org/
https://dev.entrouvert.org/projects/wcs
http://doc.entrouvert.org/wcs/dev/

demo
https://portail-citoyen-publik.entrouvert.com/
https://demarches-publik.entrouvert.com/


autres outils :
publik  : https://portail-citoyen-publik.entrouvert.com/
opengst : http://www.opengst.fr/  http://www.opengst.fr/logiciel-services-techniques-ou-fichier-excel/
taiga-docker (back et front) : https://github.com/htdvisser/taiga-docker  https://hub.docker.com/r/htdvisser/taiga-front-dist/
cf aussi fichier ~/Documents/documentation/Gup/taiga_et_gup.ods
odoo : https://www.odoo.com/fr_FR/
openmairie : http://www.openmairie.org/


### Installation de combo et de wcs dans un environnemenet virtuel

pew new -p $(pythonz locate 2.7.10) gup

git clone git://repos.entrouvert.org/combo.git
cd combo
pip install --upgrade pip
pip install -r requirements.txt
pip install XStatic-ChartNew.js
python manage.py createsuperuser
python manage.py migrate
./manage.py runserver

git clone git://repos.entrouvert.org/wds.git
cd wcs
python setup.py install
...

## Les différents logiciels déjà en place

### spec_1_mobile_balade : outil mobile pour les balades urbaines
cf repertoire Documents\documentation\Gup\0_gup
<<<
/mnt/dsifichiers02/services2_all/DIRECTION_DES_SYSTEMES_D_INFORMATION/POLE_GEOMATIQUE_ET_DECISIONNEL/
RESP POLE/0_gup/data_6

un "incident" contient les informations suivantes :
id
commentaire
date
categorie
sous-categorie
photo
x
y
adresse

Comment sont transférés/traduits les incidents en demande d'intervention ? (e-atal, atal, portail-citoyen ?)

Qui reçoit et comment sont reçues les demandes ? est ce que le destinataire peut les corriger, les réorienter ?
Qui transmet et comment sont transmises les demandes destinées à la CDA, à l'OPH ?

comment sont restituées (à l'usager) les informations concernant la prise en charge de l'incident : date de la prise en charge, date prévue de l'intervention, motif de l'acceptation ou du refus, ...?

### spec_2_astreintes : l'outil de gestion des demandes et des suivi d'intervention (astreintes)
cf document ot et jmv

### spec_3_ev : les demandes pour les espaces verts
cf fichier demande_minimes.xls

### spec_4_ecoles : le portail des écoles
http://extranet.ecoles.larochelle.fr/extranet
prenom.nom
vlr

### spec_5_eat : e-atal
http://e-atal.larochelle.fr/awa/home/index.jsp
prenom.nom | admin
fg | fb140355



### spec_6_pc : Le Portail Citoyen

## Comparaison des outils

### la composition des formulaires

### la liste des mots clés à utiliser
la comparaison e_atal | extranet des ecoles se trouve dans le fichier "etiquetage_demandes.ods"

### la circulation de l'information, les destinataires
