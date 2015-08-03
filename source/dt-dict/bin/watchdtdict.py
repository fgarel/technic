#!/usr/bin/env python
# -*- coding: utf-8 -*-

u"""
Surveillance d'un repertoire.

Script permettant de surveiller l'ajout de fichier dans
un repertoire.
Si un fichier est ajouté, alors un traitement est exécuté.

Le squelette du script est largement inspiré de l'article publié ici :
http://sametmax.com/reagir-a-un-changement-sur-un-fichier-avec-watchdog/

et dont le tire est :
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
import shutil
import pdfReader
import dtdict_appli1 as xmlReader
# Import smtplib for the actual sending function
import smtplib
# Import the email modules we'll need
from email import encoders
#from email.message import Message
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.utils import COMMASPACE, formatdate
#from email.mime.text import MIMEText


u"""
D’abord, on créer un handler, une classe qui va contenir le code à
lancer quand il arrive quelque chose à nos fichiers :
"""


class MonHandler(FileSystemEventHandler):

    u"""
    Classe regroupant les sous-routines liées à la surveillance.

    On peut implémenter les méthodes suivantes :
      - on_any_event(self, event)
      - on_moved(self, event)
      - on_created(self, event)
      - on_deleted(self, event)
      - on_modified(self, event)
    .

    """

    def __init__(self):
        u"""
        Méthode pour initialiser l'objet.

        Lorque l'objet est instancié, c'est cette méthode qui est executée.

        """
        self.dico_exploitant_nomPdf = {}
        self.dico_exploitant_courriel = {}
        # mail de l'expediteur du message
        self.sender = 'dt-dict@ville-larochelle.fr'
        # mail de la personne qui recevra une copie du message
        #self.receivers = 'fred@VLR6180.mairie.fr'
        self.receivers = 'frederic.garel@gmail.com'
        # corps du message
        text = \
            "Bonjour,\n" + \
            "Veuillez trouver ci-joint " + \
            "notre déclaration.\n" + \
            "Cordialement\n\n" + \
            "--\nLe service Cartographie " + \
            "de la Ville de La Rochelle\n" + \
            ""
        self.bodytext = text.decode('utf-8')
        #print self.bodytext
        self.zipfile_to_join = ''
        self.pdfemprise_to_join = ''
        self.numero_dtdict = ''

    def on_modified(self, event):
        u"""
        Méthode exécutée à la modification d'un fichier.

        Cette méthode sera appelée à chaque fois qu'un fichier
        est modifié.

        """
        #print("Ah, le fichier %s a été modifé" % event.src_path)
        pass

    def on_moved(self, event):
        u"""
        Méthode exécutée au renommage d'un fichier.

        Cette méthode sera appelée à chaque fois qu'un fichier
        est renommé.

        """
        #print("Ah, le fichier %s a été renommé" % event.src_path)
        pass

    def on_deleted(self, event):
        u"""
        Méthode exécutée à la suppression d'un fichier.

        Cette méthode sera appelée à chaque fois qu'un fichier
        est supprimé.

        """
        #print("AAAAGGhhhh, le fichier %s a été supprimé" % event.src_path)
        pass

    def on_any_event(self, event):
        u"""
        Méthode exécutée à chaque intervention sur un fichier.

        Cette méthode sera appelée à chaque fois qu'un fichier
        est manipulé.

        """
        #print("Ah, le fichier %s a été touché" % event.src_path)
        pass

    def on_created(self, event):
        u"""
        Méthode exécutée à la création d'un fichier.

        Cette méthode sera appelée à chaque fois qu'un fichier
        est créé.

        """
        print("Le fichier %s a été créé" % event.src_path)
        self.analyse_fichier_zip_initial(event.src_path)
        #print '' * 2 + '-' * 50
        #print 'dico_exploitant_nomPdf'
        #print self.dico_exploitant_nomPdf
        #print 'dico_exploitant_courriel'
        #print self.dico_exploitant_courriel
        #print '' * 2 + '-' * 50
        self.send_x_mails()
        self.nettoyage(event.src_path)

    def analyse_fichier_zip_initial(self, zipfilename):
        u"""
        Cette analyse a pour objectif de completer deux dictionnaires.

        La lecture de chacun des pdf va permettre de fabriquer
          - un premier dictionnaire qui fait la relation entre :
            - le nom de l'exploitant
            - le nom du pdf qui doit lui etre transmis
        La lecture du fichier xml permet de fabriquer
          - un second dictionnaire qui fait la relation entre :
            - le nom de l'exploitant
            - son courriel
        .

        """
        f = zipfile.ZipFile(zipfilename)
        ##print "filename = " + f.filename
        repertoiretemporaire = re.sub(r'\.zip', '', f.filename)
        #print "repertoiretemporaire = " + repertoiretemporaire
        ## on remonte la fhs d'un niveau
        ##repertoiretemporaire = re.sub(r'in\/', '', repertoiretemporaire)
        repertoiretemporaire = re.sub(r'dt-dict\/', '', repertoiretemporaire)
        ##print "repertoiretemporaire = " + repertoiretemporaire
        self.numero_dtdict = re.sub(r'.*/', '', repertoiretemporaire)
        ##print "numero_dtdict = " + self.numero_dtdict
        try:
            os.mkdir(repertoiretemporaire)
        except:
            print 'Le répertoire existe déjà....'
        f.extractall(repertoiretemporaire)
        for ffile in f.namelist():
            extension = re.sub(r'(.*)\.', '', ffile)
            ffile = repertoiretemporaire + '/' + ffile
            if extension == 'pdf':
                if re.search(r'_.*_.*\.', ffile):
                    # le fichier est du type *_DT_?.pdf
                    ##print "pdf_1 : " + ffile
                    __myPdfReader = pdfReader.PdfReader(ffile, 'metadata.txt')
                    #__typePdf = __myPdfReader.simplify()
                    __myPdfReader.simplify()
                    self.dico_exploitant_nomPdf[__myPdfReader.teleservice()] = \
                        ffile
                    ##print self.dico_exploitant_nomPdf
                elif re.search(r'.*_emprise\.', ffile):
                    # le fichier est du type *_DT_?.pdf
                    ##print "pdf_1 : " + ffile
                    self.pdfemprise_to_join = ffile
                    ##print "pdfemprise_to_join = " + self.pdfemprise_to_join
                else:
                    # le fichier est du type *_emprise.pdf
                    ##print "pdf_2 : " + ffile
                    #__myPdfReader = pdfReader.PdfReader(ffile, 'metadata.txt')
                    #__typePdf = __myPdfReader.simplify()
                    #__myPdfReader.teleservice()
                    pass

            if extension == 'zip':
                fxmlzip = zipfile.ZipFile(ffile)
                ##print "fxmlzip = " + fxmlzip.filename
                self.zipfile_to_join = fxmlzip.filename
                repertoiretemporairexml = re.sub(r'\.zip',
                                                 '',
                                                 fxmlzip.filename)
                #print "repertoiretemporairexml = " + repertoiretemporairexml
                try:
                    os.mkdir(repertoiretemporairexml)
                except:
                    #print 'Le répertoire existe déjà....'
                    pass
                fxmlzip.extractall(repertoiretemporairexml)
                for ffilexml in fxmlzip.namelist():
                    ffilexml = repertoiretemporairexml + '/' + ffilexml
                    #print "filexml : " + ffilexml
                    if re.search(r'Signature_.*\.', ffilexml):
                        # le fichier est du type Signature_*_description.xml
                        ##print "xml_1 : " + ffilexml
                        pass
                    else:
                        # le fichier est du type *_description.xml
                        ##print "xml_2 : " + ffilexml
                        rootNode = xmlReader.parse(ffilexml)
                        ##print 'numero = ' + rootNode.DT.noConsultationDuTeleserviceSeize
                        ##print 'taille des plans = ' + rootNode.DT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans
                        ##print 'souhaitLesPlansDesReseauxElectriqueAeriens = ' + str(rootNode.DT.projetEtSonCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens)
                        for i, val in enumerate(rootNode.listeDesOuvrages.ouvrage):
                            #print '  rootNode.listeDesOuvrages.ouvrage.contact.societe :'
                            ##print '  societe  = ' + rootNode.listeDesOuvrages.ouvrage[i].contact.societe
                            #print ' ' * 2 + '-' * 50
                            #print '  rootNode.listeDesOuvrages.ouvrage.contact.courriel :'
                            ##print '  courriel = ' + rootNode.listeDesOuvrages.ouvrage[i].contact.courriel
                            ##print ' ' * 2 + '-' * 50
                            self.dico_exploitant_courriel[rootNode.listeDesOuvrages.ouvrage[i].contact.societe] = rootNode.listeDesOuvrages.ouvrage[i].contact.courriel


    def send_x_mails(self):
        u"""
        Méthode pour générer les x mails (1 par exploitant).

        Après analyse des pdf et du xml,
        on peut faire la correspondance entre un exploitant et :
         - le pdf qui lui est destiné (pièce jointe)
         - son adresse de destination (courriel)
        bref, on prépare les messages destinées aux exploitants.

        """
        ##print '' * 2 + '-' * 50
        ##for key, value in self.dico_exploitant_nomPdf.iteritems():
        ##    print key, value, self.dico_exploitant_courriel[key]
        ##print '' * 2 + '-' * 50

        # réinitialisation des courriels pour les tests
        for key, value in self.dico_exploitant_nomPdf.iteritems():
            if key == 'ERDF DR POITOU-CHARENTES':
                self.dico_exploitant_courriel[key] = 'pierre.combres@ville-larochelle.fr'
            elif key == 'VILLE DE LA ROCHELLE':
                self.dico_exploitant_courriel[key] = 'francois.chagneau@ville-larochelle.fr'
            elif key == 'ORANGE DT DICT':
                self.dico_exploitant_courriel[key] = 'michel.ricchiuto@ville-larochelle.fr'			
            elif key == 'OPH de la CDA de LA ROCHELLE':
                self.dico_exploitant_courriel[key] = 'frederic.garel@ville-larochelle.fr'
            else:
                self.dico_exploitant_courriel[key] = 'frederic.garel@ville-larochelle.fr'

        ##print '' * 2 + '-' * 50
        for key, value in self.dico_exploitant_nomPdf.iteritems():
            ##print key, value, self.dico_exploitant_courriel[key]
            self.send_one_mail([self.dico_exploitant_courriel[key]], value)
            #pass
        ##print '' * 2 + '-' * 50


    def send_one_mail(self, to_person, pdffile_to_join):
        u"""
        Méthode pour envoyer 1 mail.

        Utilisation de la librairie smtplib
        pour envoyer un message.

        """
        #print "from_person = "
        #print self.sender
        #print "to_person = "
        #print to_person
        to_person.append(self.receivers)
        #print "to_person = "
        #print to_person
        #print "pdffile_to_join = " + pdffile_to_join
        #print "zipfile_to_join = " + self.zipfile_to_join

        msg = MIMEMultipart()

        msg['From'] = self.sender
        msg['To'] = COMMASPACE.join(to_person)
        msg['Date'] = formatdate(localtime=True)
        msg['Subject'] = u"Déclaration " + self.numero_dtdict

        #print msg['Subject']
        msg.preamble = 'Veuillez trouver ci joint la déclaration %s' % self.numero_dtdict
        # attachement du fichier zip
        zipFile = open(self.zipfile_to_join, 'rb')
        msgZip = MIMEBase('application', 'zip')
        msgZip.set_payload(zipFile.read())
        encoders.encode_base64(msgZip)
        msgZip.add_header('Content-Disposition',
                          'attachment; filename="{0}"'.format(os.path.basename(self.zipfile_to_join)))
        msg.attach(msgZip)

        # attachement du fichier declaration pdf
        pdfDeclarationFile = open(pdffile_to_join, 'rb')
        msgPdfDeclaration = MIMEBase('application', 'pdf')
        msgPdfDeclaration.set_payload(pdfDeclarationFile.read())
        encoders.encode_base64(msgPdfDeclaration)
        msgPdfDeclaration.add_header('Content-Disposition',
                          'attachment; filename="{0}"'.format(os.path.basename(pdffile_to_join)))
        msg.attach(msgPdfDeclaration)

        # attachement du fichier emprise pdf
        pdfEmpriseFile = open(self.pdfemprise_to_join, 'rb')
        msgPdfEmprise = MIMEBase('application', 'pdf')
        msgPdfEmprise.set_payload(pdfEmpriseFile.read())
        encoders.encode_base64(msgPdfEmprise)
        msgPdfEmprise.add_header('Content-Disposition',
                          'attachment; filename="{0}"'.format(os.path.basename(self.pdfemprise_to_join)))
        msg.attach(msgPdfEmprise)

        # corps du message
        # Create the body of the message (a plain-text).
        #text = u"Bonjour,\nVeuillez trouver ci-joint notre déclaration.\nCordialement\n"

        # Record the MIME types the part - text/plain.
        part1 = MIMEText(self.bodytext, 'plain', 'utf-8')

        # Attach parts into message container.
        msg.attach(part1)

        #print msg
        try:
            smtpObj = smtplib.SMTP('localhost')
            smtpObj = smtplib.SMTP('mail.ville-larochelle.fr')
            smtpObj.sendmail(self.sender, \
                             to_person, \
                             msg.as_string())
            print "Successfully sent email"
        except smtplib.SMTPException:
            print "Error: unable to send email"


    def nettoyage(self, zipfilename):
        u"""
        Méthode nettoyer les fichiers.

        Suppression des fichiers après traitement.

        """
        f = zipfile.ZipFile(zipfilename)
        ##print "filename = " + f.filename
        repertoiretemporaire = re.sub(r'\.zip', '', f.filename)
        #print "repertoiretemporaire = " + repertoiretemporaire
        ## on remonte la fhs d'un niveau
        ##repertoiretemporaire = re.sub(r'in\/', '', repertoiretemporaire)
        repertoiretemporaire = re.sub(r'dt-dict\/', '', repertoiretemporaire)
        #print "repertoiretemporaire = " + repertoiretemporaire
        try:
            shutil.rmtree(repertoiretemporaire)
        except:
            print 'Le répertoire n a pas pu etre supprimé'
        try:
            os.remove(zipfilename)
        except:
            print 'Le fichier n a pas pu etre supprimé'

        
def main():
    u"""
    Fonction principale.

    Après avoir créer un Handler, Ensuite on créé un "observer",
    qui va lancer un thread
    dans lequel il va, comme son nom l'indique, ... observer :

    """
    observer = Observer()
    # Surveiller récursivement tous les événements du dossier /tmp
    # et appeler les méthodes de MonHandler quand quelque chose
    # se produit
    ##observer.schedule(MonHandler(), path='../data/in', recursive=True)
    observer.schedule(MonHandler(), path='/home/fred/h/cartographie/dt-dict', recursive=True)

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
