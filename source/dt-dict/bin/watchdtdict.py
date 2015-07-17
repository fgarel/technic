#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
Surveillance d'un repertoire.

Script permettant de surveiller l'ajout de fichier dans
un repertoire.
Si un fichier est ajouté, alors un traitement est exécuté.

http://sametmax.com/reagir-a-un-changement-sur-un-fichier-avec-watchdog/

Réagir à un changement sur un fichier avec watchdog.

Il y a des tas de choses qu’on peut vouloir faire au
moment où un fichier change :

Faire un backup;
Lancer les tests unittaires;
Démarrer un build;
Recharger un contenu;
Envoyer un email;
Afficher une notification;
Mettre à jour un listing.
Et ce n’est même pas dur à faire en Python grace à la lib watchdog :

pip install watchdog

"""


from watchdog.events import FileSystemEventHandler
from watchdog.observers import Observer
import time
import zipfile
import re
import os
import pdfReader
import dtdict_appli1 as appl

u"""
D’abord, on créer un handler, une classe qui va contenir le code à
lancer quand il arrive quelque chose à nos fichiers :
"""


class MonHandler(FileSystemEventHandler):

    # cette méthode sera appelée à chaque fois qu'un fichier
    # est modifié
    def on_created(self, event):
        print("Le fichier %s a été créé" % event.src_path)
        f = zipfile.ZipFile(event.src_path)
        print "filename = " + f.filename
        repertoiretemporaire = re.sub(r'\.zip', '', f.filename)
        #print "repertoiretemporaire = " + repertoiretemporaire
        repertoiretemporaire = re.sub(r'in\/', '', repertoiretemporaire)
        print "repertoiretemporaire = " + repertoiretemporaire
        os.mkdir(repertoiretemporaire)
        f.extractall(repertoiretemporaire)
        for ffile in f.namelist():
            extension = re.sub(r'(.*)\.', '', ffile)
            ffile = repertoiretemporaire + '/' + ffile
            if extension == 'pdf':
                if re.search(r'_.*_.*\.', ffile):
                    # le fichier est du type *_DT_?.pdf
                    print "pdf_1 : " + ffile
                    __myPdfReader = pdfReader.PdfReader(ffile, 'metadata.txt')
                    __typePdf = __myPdfReader.simplify()
                    __myPdfReader.teleservice()
                else:
                    # le fichier est du type *_emprise.pdf
                    print "pdf_2 : " + ffile
                    #__myPdfReader = pdfReader.PdfReader(ffile, 'metadata.txt')
                    #__typePdf = __myPdfReader.simplify()
                    #__myPdfReader.teleservice()

            if extension == 'zip':
                fxmlzip = zipfile.ZipFile(ffile)
                print "fxmlzip = " + fxmlzip.filename
                repertoiretemporairexml = re.sub(r'\.zip', '', fxmlzip.filename)
                print "repertoiretemporairexml = " + repertoiretemporairexml
                os.mkdir(repertoiretemporairexml)
                fxmlzip.extractall(repertoiretemporairexml)
                for ffilexml in fxmlzip.namelist():
                    ffilexml = repertoiretemporaire + '/' + ffilexml
                    #print "filexml : " + ffilexml
                    if re.search(r'_.*_.*\.', ffilexml):
                        # le fichier est du type Signature_*_description.xml
                        print "xml_1 : " + ffilexml
                    else:
                        # le fichier est du type *_description.xml
                        print "xml_2 : " + ffilexml
                        rootNode = appl.parse(ffilexml)
                        print 'numero = ' + rootNode.DT.noConsultationDuTeleserviceSeize
                        print 'taille des plans = ' + rootNode.DT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans
                        print 'souhaitLesPlansDesReseauxElectriqueAeriens = ' + str(rootNode.DT.projetEtSonCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens)
                        for i, val in enumerate(rootNode.listeDesOuvrages.ouvrage):
                            #print '  rootNode.listeDesOuvrages.ouvrage.contact.societe :'
                            print '  societe  = ' + rootNode.listeDesOuvrages.ouvrage[i].contact.societe
                            #print ' ' * 2 + '-' * 50
                            #print '  rootNode.listeDesOuvrages.ouvrage.contact.courriel :'
                            print '  courriel = ' + rootNode.listeDesOuvrages.ouvrage[i].contact.courriel
                            print ' ' * 2 + '-' * 50                        

    def on_modified(self, event):
        #print("Ah, le fichier %s a été modifé" % event.src_path)
        pass

    def on_moved(self, event):
        #print("Ah, le fichier %s a été renommé" % event.src_path)
        pass

    def on_deleted(self, event):
        print("AAAAGGhhhh, le fichier %s a été supprimé" % event.src_path)

    def on_any_event(self, event):
        #print("Ah, le fichier %s a été touché" % event.src_path)
        pass

    # On peut aussi implémenter les méthodes suivantes :
    # - on_any_event(self, event)
    # - on_moved(self, event)
    # - on_created(self, event)
    # - on_deleted(self, event)
    # - on_modified(self, event)


def main():
    u"""
    Fonction principale.

    Après avoir créer un Handler, Ensuite on créé un observer,
    qui va lancer un thread
    dans lequel il va… observer :

    """
    observer = Observer()
    # Surveiller récursivement tous les événements du dossier /tmp
    # et appeler les méthodes de MonHandler quand quelque chose
    # se produit
    observer.schedule(MonHandler(), path='../data/in', recursive=True)

    u"""
    On démarre tout ça :
    """
    observer.start()

    # L'observer travaille dans un thread séparé donc on fait une
    # boucle infinie pour maintenir le thread principal
    # actif dans cette démo mais dans un vrai programme,
    # vous mettez votre taff ici.
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        # Ctrl + C arrête tout
        observer.stop()
    # on attend que tous les threads se terminent proprement
    observer.join()

if __name__ == '__main__':
    #import pdb; pdb.set_trace()
    main()
