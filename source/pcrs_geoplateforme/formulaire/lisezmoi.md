
# Creation de formulaire utilisant bootstrap

## Introduction

Pour commencer avec bootstrap, et en particulier pour confectionner des
formulaires, il y a plusieurs possibilités.

### Assistant, service web
La première de ces possibilités, c'est d'utiliser un service web qui va nous
assister à concevoir le formulaire.

service formden
https://formden.com/manage/sRHN9Mwr/form-builder/

service bootsnipp
http://bootsnipp.com/forms

### Exemples
La deuxième possibilité, c'est de s'inspirer d'exemples.

Les sources d'inspiration sont :

service bootstrap-template
http://getbootstrap.com/getting-started/#examples

http://getbootstrap.com/components/

service bootsnipp
http://bootsnipp.com/

service prebootstrap
http://www.prepbootstrap.com/bootstrap-template/contact-form-map

http://www.prepbootstrap.com/bootstrap-template

service shieldui
http://www.shieldui.com/documentation

## Réalisation de notre 1er formulaire

Nous allons concevoir notre premier formulaire à partir d'un exemple

### Téléchargement des zip

1.1. Bootstrap
http://getbootstrap.com/getting-started/#download

1.2. Font
http://fontawesome.io/

1.3. Jquery
https://jquery.com/download/

1.4. Exemple
Template-ContactFormMap

http://www.prepbootstrap.com/bootstrap-template/contact-form-map

### Organisation, recopie

Creation d'un sous repertoire "bac à sable" (sandbox)

Un fichier a été créer pour automatiser le démarrage de notre premier projet bootstrap

```
installation_bootstrap.sh
```

```
#!/bin/sh


# Nettoyage
echo "Nettoyage"
rm -rf sandbox/bootstrap
rm -rf sandbox/font-awesome

# Recopie de bootstrap
echo "Recopie de bootstrap"
cp -r bootstrap-3.3.7-dist sandbox
mv sandbox/bootstrap-3.3.7-dist sandbox/bootstrap

# Recopie de font-awesome
echo "Recopie de font-awesome"
cp -r font-awesome-4.6.3 sandbox
mv sandbox/font-awesome-4.6.3 sandbox/font-awesome

# Recopie de jquery
echo "Recopie de jquery"
mkdir sandbox/js
cp jquery-3.1.0.min.js sandbox/js

# Recopie de l'exemple
echo "Recopie de l'exemple"
cp Template-ContactFormMap/Template-ContactFormMap\\index.html sandbox/index.html


```


### Formulaire acteur_1_contact.html

1. Recopie du fichier index.html en contact.html

```
sandbox/acteur_1_contact.html
```

2. Edition
recherche
```
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
```

remplace
```
    <script type="text/javascript" src="js/jquery-3.1.0.min.js"></script>
```

### Formulaire acteur_1_demande.html

1. Recopie du fichier index.html en acteur_1_demande.html

```
sandbox/acteur_1_demande.html
```

2. Edition

remplacement du contenu

```

```

par ce qui a été commencé grace au service formden
https://formden.com/manage/sRHN9Mwr/form-builder/

Le code se trouve ici :
```
https://formden.com/manage/sRHN9Mwr/form-builder/

bouton builder

onglet code
```
