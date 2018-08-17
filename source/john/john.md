

# Hashcat ou John The Ripper pour cracker un fichier zip, un fichier office ou un fichier pdf


## Installation des outils

### Installation de Jotn The Ripper

Attention la commande suivante ne focntionne pas !
```
aptitude install john john-data
```

en effet, il est preferable de faire l'installation a partir des sources
L'installation de john the ripper se fait dans le repertoire

~/Install/john

en fait, il faut installer la version community (jumbo), car elle contient
des utilitaires qui ne sont pas présents dans la version officielle

http://www.openwall.com/john/



L'installation de john the ripper est détaillée dans cette page

https://github.com/magnumripper/JohnTheRipper/blob/bleeding-jumbo/doc/INSTALL-UBUNTU

Attention, il faut preferer l'installation par github, car la procedure consitant a
telecharger l'archive sur le site openwall ne fonctionne pas.

Attention cette 'installation de john the ripper qui est  détaillé dans ce blog ne fonctionne pas

http://www.bytebang.at/Blog/Crack+(ZIP)+passwords+with+John+the+Ripper

```
$ sudo apt-get install libssl-dev
$ wget http://www.openwall.com/john/j/john-1.8.0-jumbo-1.tar.xz
$ tar -xvf ./john-1.8.0-jumbo-1.tar.xz
$ cd john-1.8.0-jumbo-1/src
$ ./configure
$ make
```

A "make install" is not necessary for JTR.

If you start JTR without arguments then it prints its help and some configuration information:

```
./john-1.8.0-jumbo-1/run/john
```

### Installation de Hascat

Est ce un outil complementaire ou un outil concurrent JohnTheRipper ?

Ce programme se télécharge ici
https://hashcat.net/hashcat/

Une fois décompressé, on test son utilisation
```
cd ~
cd Documents/technic/source/john/hashcat-3.10
./hashcat64.bin --help
```

Attention, on verra un peu plus tard en essayant de l'utiliser, qu'il faut :

 - 1. Ajouter un paquet

   ```
   sudo aptitude install ocl-icd-libopencl1  
   ```

 - 2. Il faut aussi installer les drivers opencl

   En effet, quand on visite la page de hashcat,

   https://hashcat.net/hashcat/

   On s'aperçoit qu'il faut installer les drivers

   ```
   GPU Driver requirements:
     AMD users require AMD drivers 14.9 or later (recommended 15.12 exact)
     Intel users require Intel OpenCL Runtime 14.2 or later (recommended 16.1 or later)
     NVidia users require NVidia drivers 346.59 or later (recommended 367.27 or later)
   ```

   Nous suivons les instructions vu ici,

   https://hashcat.net/forum/archive/index.php?thread-5589.html

   La solution, c'est donc le téléchargement de drivers opencl, qui sont ici

   http://registrationcenter-download.intel.com/akdlm/irc_nas/9019/opencl_runtime_16.1_x64_ubuntu_5.2.0.10002.tgz



## Utilisation

### Utilisation pour cracker un fichier zip

```
~/Install/john/run/zip2john francolinuscapensis07.zip > francolinuscapensis07.john
~/Install/john/run/john --incremental francolinuscapensis07.john
```

### Utilisation pour cracker un fichier pdf
https://blog.didierstevens.com/2017/12/26/cracking-encrypted-pdfs-part-1/
a tester ....


### Utilisation pour cracker un fichier office

Plusieurs éléments sont nécessaires pour cracker un document office

#### Documentation

La doc est ici

http://pentestcorner.com/cracking-microsoft-office-97-03-2007-2010-2013-password-hashes-with-hashcat/

il faut :

 - office2john.py

  https://github.com/kholia/RC4-40-brute-office/blob/master/office2john.py

   ```
   # wget - - - - - https://raw.githubusercontent.com/kholia/RC4-40-brute-office/master/office2john.py
   ```

 - hashcat

 ou

 - john


#### Cas pratique


Le fichier à cracker est

```
FichierAOuvrir.docx
```

#### Extraction du hash avec office2john.py

```
office2john.py FichierAOuvrir.docx > FichierAOuvrir.hash
```

```
~/Install/john/run/office2john.py Propositions\ évaluation\ DSI\ 2015_modif_al.xlsx > Propositions\ évaluation\ DSI\ 2015_modif_al.hash

```

2 choses à savoir :

 - la version du document office :

   We can see that in the beginning of the hash we can identify the version Office used by this hash
   ($office$*2013*)

   Cette version détermine le paramètre à utiliser pour l'utilitaire hashcat, ici -m 9600

   Le tableau de correspondance version <-> flag est ici

   http://pentestcorner.com/cracking-microsoft-office-97-03-2007-2010-2013-password-hashes-with-hashcat/

   Office 97-03(MD5+RC4,oldoffice$0,oldoffice$1)  : flag -m 9700
   Office 97-03(MD5+RC4,collider-mode#1)          : flag -m 9710
   Office 97-03(MD5+RC4,collider-mode#2)          : flag -m 9720
   Office 97-03(SHA1+RC4,oldoffice$3,oldoffice$4) : flag -m 9800
   Office 97-03(SHA1+RC4,collider-mode#1)         : flag -m 9810
   Office 97-03(SHA1+RC4,collider-mode#2)         : flag -m 9820
   Office 2007                                    : flag -m 9400
   Office 2010                                    : flag -m 9500
   Office 2013                                    : flag -m 9600

 - la présence du nom du fichier word dans le fichier hash

   soit, il faut modifier le fichier hash à la main,
   soit, on utilise le paramètre --username au lancement de hashcat (voir paragraphe suivant)

#### Utilisation de hashcat pour trouver le mot de passe à partir du hash

Now that we have retrieved our hash, its time to start the cracking! For hashcat to be able to recognise the hash as an office document, we have to use one of the following two options:

 - Remove the name of the document from the hash (up till the “:” symbol)
 - Add the --username switch during the call of the hashcat,
   so that the name of the document will be treated as a username


Première option donc, si on supprime le nom du fichier office dans le fichier hash

```
vi FichierAOuvrir.hash
```
alors la commande est (sans l'option --username)

```
sudo ./hashcat64.bin -a 3 -m 9600 --status -o ../FichierAOuvrir.crack ../FichierAOuvrir.hash
```

Mais, seconde option, on peut aussi essayer de lancer hashcat directement, c'est à dire, sans editer le fichier .hash
(avec l'option --username)

```
sudo ./hashcat64.bin -a 3 -m 9600 --username --status -o ../FichierAOuvrir.crack ../FichierAOuvrir.hash
```

Si nous avons des erreurs au lancement de hashcat, voici les pistes pour résoudre les problèmes...

La première erreur est vite corrigée (installation du paquet ocl-icd-libopencl1), mais ....

Nous avons encore une erreur...

Nous suivons les instructions vu ici,

https://hashcat.net/forum/archive/index.php?thread-5589.html

La solution, c'est le téléchargement de drivers opencl, qui sont ici

http://registrationcenter-download.intel.com/akdlm/irc_nas/9019/opencl_runtime_16.1_x64_ubuntu_5.2.0.10002.tgz

```
cd /home/fred/Documents/technic/source/john/hashcat-3.10
```

```
sudo ./hashcat64.bin -a 3 -m 9600 \
                     --username \
                     --status \
                     -o FichierAOuvrir4.crack \
                     FichierAOuvrir4.hash
```

#### utilisation de hascat avec un dictionnaire

Les dictionnaires sont ici :
https://wiki.skullsecurity.org/Passwords

```
wget http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
```

```
wget http://downloads.skullsecurity.org/passwords/facebook-names-withcount.txt.bz2
```

```
bzip2 -d rockyou.txt.bz2
bzip2 -d facebook-names-withcount.txt.bz2
```

```
sudo ./hashcat64.bin -a 0 -m 9600 \
                     --username \
                     --status \
                     -o FichierAOuvrir4.crack \
                     FichierAOuvrir4.hash \
                     rockyou.txt
```

La doc complementaire sur haschcat est ici

http://fhack.troptop.net/?BruteForce_%26amp%3B_Rainbow_%26amp%3B_Dico___Outils___Hashcat


#### utilisation de john

```
cd /home/fred/Documents/technic/source/john
```

```
~/Install/john/run/john --incremental Propositions\ évaluation\ DSI\ 2015_modif_al.hash
```


