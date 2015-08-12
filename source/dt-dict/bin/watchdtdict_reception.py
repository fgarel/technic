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

Reprise des explications de cette page :

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

        Lorque la classe est instanciée (pour créer un objet),
        c'est cette méthode qui est executée.

        Deux dictionnaires sont initialisés,
        les répertoires sont définis ici.
        Les mails pour les exploitants ainsi que le mail de notification
        pour l'émetteur sont définis dans cette méthode __init__().

        """
        self.dico_exploitant_nomPdf = {}
        self.dico_exploitant_courriel = {}
        self.numero_dtdict = ''

        # sous-repertoire des données initiales
        self.initpath = 'dt-dict'
        # sous-repertoire ou sera stocké les dt-dict émises après traitement
        self.savpath = '/home/fred/f/CARTOGRAPHIE/DT DICT EMISES'

        #self.zipfile_to_join = ''
        self.xmlfile_to_join = ''
        self.pdfemprise_to_join = ''

        # mail de l'expediteur du message
        self.mail_sender = 'dt.dict@ville-larochelle.fr'

        # mail de la personne qui recevra une copie des messages
        #self.mail_receivers = 'fred@VLR6180.mairie.fr'
        #self.mail_receivers = 'frederic.garel@gmail.com'
        #self.mail_receivers = 'cartographie@ville-larochelle.fr'
        self.mail_receivers = ''

        # sujet du message
        self.mail_subject = \
            u"Déclaration préalable aux travaux, Numéro "

        # preambule du message (?)
        self.mail_preamble = \
            u"Veuillez trouver ci joint la déclaration préalable aux travaux "

        # corps du message
        self.mail_body_text1 = \
            u"Bonjour,\n\n" + \
            u"Veuillez trouver ci-joint " + \
            u"la déclaration préalable aux travaux " + \
            u"portant le numéro de consultation "

        self.mail_body_text2 = \
            u", accompagnée du fichier " + \
            u"XML correspondant.\n\n" + \
            u"Important : Ne répondez pas à cet email.\n" + \
            u"Pour répondre à l'émetteur, utilisez les coordonnées " + \
            u"présentes dans le document.\n\n" + \
            u"Cordialement,\n\n" + \
            u"--\nLe service Cartographie " + \
            u"de la Ville de La Rochelle\n" + \
            u""

        # mail de la personne qui recevra une notification indiquant
        #   que l'émission a bien eté réalisée
        self.mail_notif_receivers = ''

        # corps du message
        self.mail_notif_body_text1 = \
            u"Bonjour,\n\n" + \
            u"" + \
            u"La déclaration préalable aux travaux " + \
            u"portant le numéro de consultation "

        self.mail_notif_body_text2 = \
            u" a été transmises aux exploitants.\n\n" + \
            u"Important : Ne répondez pas à cet email.\n\n" + \
            u"Cordialement,\n\n" + \
            u"--\nLe service Cartographie " + \
            u"de la Ville de La Rochelle\n" + \
            u""


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
        print("Ah, le fichier %s a été renommé" % event.src_path)
        #pass

    def on_deleted(self, event):
        u"""
        Méthode exécutée à la suppression d'un fichier.

        Cette méthode sera appelée à chaque fois qu'un fichier
        est supprimé.

        """
        print("AAAAGGhhhh, le fichier %s a été supprimé" % event.src_path)
        #pass

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
        #self.analyse_fichier_zip_initial(event.src_path)
        #self.send_x_mails()
        #self.nettoyage(event.src_path)

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

        La première étape consiste à déziper le fichier zip initial
        cette décompression doit se faire dans un répertoire parent
        (sinon les nouveaux fichiers formeraient à leur tour une cible
        potentiele pour notre observer....)

        Un traitement est ensuite effectué en fonction du type
        de fichier.

        """
        f = zipfile.ZipFile(zipfilename)
        repertoiretemporaire = re.sub(r'\.zip', '', f.filename)
        # on remonte la fhs d'un niveau
        repertoiretemporaire = re.sub(self.initpath, '', repertoiretemporaire)
        self.numero_dtdict = re.sub(r'.*/', '', repertoiretemporaire)
        print "numero_dtdict = " + self.numero_dtdict
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
                    __myPdfReader = pdfReader.PdfReader(ffile, 'metadata.txt')
                    __myPdfReader.simplify()
                    self.dico_exploitant_nomPdf[__myPdfReader.teleservice()] = \
                        ffile
                elif re.search(r'.*_emprise\.', ffile):
                    # le fichier est du type *_emprise.pdf
                    self.pdfemprise_to_join = ffile
                else:
                    # le fichier est du type *resume.pdf, ou *notice.pdf
                    pass

            if extension == 'zip':
				# deux fichiers xml sont contenus dans un zip
                fxmlzip = zipfile.ZipFile(ffile)
                repertoiretemporairexml = re.sub(r'\.zip',
                                                 '',
                                                 fxmlzip.filename)
                try:
                    os.mkdir(repertoiretemporairexml)
                except:
                    #print 'Le répertoire existe déjà....'
                    pass
                fxmlzip.extractall(repertoiretemporairexml)
                for ffilexml in fxmlzip.namelist():
                    ffilexml = repertoiretemporairexml + '/' + ffilexml
                    if re.search(r'Signature_.*\.', ffilexml):
                        # le fichier est du type Signature_*_description.xml
                        pass
                    else:
                        # le fichier est du type *_description.xml
                        self.xmlfile_to_join = ffilexml
                        rootNode = xmlReader.parse(ffilexml)

                        # récupération du mail du redacteur/emetteur
                        #   de la déclaration
                        #   attention : le chemin xml dépend
                        #   du type de la déclaration
                        try:
                            self.mail_notif_receivers = rootNode.DT.representantDuResponsableDeProjet.courriel
                            ##print 'taille des plans = ' + rootNode.DT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans
                            ##print 'souhaitLesPlansDesReseauxElectriqueAeriens = ' + str(rootNode.DT.projetEtSonCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens)
                        except:
                            pass
                        try:
                            self.mail_notif_receivers = rootNode.DICT.executantDesTravaux.courriel
                        except:
                            pass
                        try:
                            self.mail_notif_receivers = rootNode.dtDictConjointes.partieDICT.executantDesTravaux.courriel
                        except:
                            pass
                        try:
                            self.mail_notif_receivers = rootNode.ATU.personneOrdonnantLesTravauxUrgents.courriel
                        except:
                            pass

                        for i, val in enumerate(rootNode.listeDesOuvrages.ouvrage):
                            # contrairement aux fichiers pdf qui utilise
                            # l'encodage "CP1250" (windows)
                            # ici, dans le xml, il faut utiliser
                            # l'encodage "utf-8"
                            self.dico_exploitant_courriel[rootNode.listeDesOuvrages.ouvrage[i].contact.societe.encode("utf-8")] = rootNode.listeDesOuvrages.ouvrage[i].contact.courriel


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
            ##print  "societe, pdf, courriel = " + key, value, self.dico_exploitant_courriel[key]
        ##print '' * 2 + '-' * 50

        ##for key, value in self.dico_exploitant_courriel.iteritems():
            ##print "societe, courriel, pdf = " + key, value, self.dico_exploitant_nomPdf[key]
        ##print '' * 2 + '-' * 50

        # réinitialisation des courriels pour les tests
        ##for key, value in self.dico_exploitant_nomPdf.iteritems():
            #if key == 'ERDF DR POITOU-CHARENTES':
            #    self.dico_exploitant_courriel[key] = 'pierre.combres@ville-larochelle.fr'
            #elif key == 'VILLE DE LA ROCHELLE':
            #    self.dico_exploitant_courriel[key] = 'francois.chagneau@ville-larochelle.fr'
            #elif key == 'ORANGE DT DICT':
            #    self.dico_exploitant_courriel[key] = 'michel.ricchiuto@ville-larochelle.fr'
            #elif key == 'OPH de la CDA de LA ROCHELLE':
            #    self.dico_exploitant_courriel[key] = 'frederic.garel@ville-larochelle.fr'
            #else:
            #    self.dico_exploitant_courriel[key] = 'frederic.garel@ville-larochelle.fr'
            ##self.dico_exploitant_courriel[key] = 'frederic.garel@ville-larochelle.fr'

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

        Attentino, to_person doit être une liste [crochet].

        """

        # on ajoute un destinataire supplémentaire
        to_person.append(self.mail_receivers)

        msg = MIMEMultipart()

        msg['From'] = self.mail_sender
        msg['To'] = COMMASPACE.join(to_person)
        msg['Date'] = formatdate(localtime=True)
        msg['Subject'] = self.mail_subject + self.numero_dtdict

        msg.preamble = 'Veuillez trouver ci joint la déclaration %s' % self.numero_dtdict
        #msg.preamble = self.mail_preamble + self.numero_dtdict

        # attachement du fichier xml
        xmlFile = open(self.xmlfile_to_join, 'rb')
        msgXml = MIMEBase('application', 'xml')
        msgXml.set_payload(xmlFile.read())
        encoders.encode_base64(msgXml)
        msgXml.add_header('Content-Disposition',
                          'attachment; filename="{0}"'.format(os.path.basename(self.xmlfile_to_join)))
        msg.attach(msgXml)

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
        mail_body_text = self.mail_body_text1 + self.numero_dtdict + self.mail_body_text2
        # pour avoir les caractères accentuées, utilisation de l'utf-8.
        part1 = MIMEText(mail_body_text, 'plain', 'utf-8')
        # Attach parts into message container.
        msg.attach(part1)

        try:
            #smtpObj = smtplib.SMTP('localhost')
            smtpObj = smtplib.SMTP('mail.ville-larochelle.fr')
            smtpObj.sendmail(self.mail_sender, \
                             to_person, \
                             msg.as_string())
            print "Successfully sent email to " + to_person.__str__()
        except smtplib.SMTPException:
            print "Error: unable to send email to " + to_person


    def nettoyage(self, zipfilename):
        u"""
        Méthode pour nettoyer et ranger à la fin du traitement.

        Suppression ou sauveagarde des fichiers après traitement.

        Les fichiers temporaires sont supprimés.
        (on parle ici des fichiers résultant de la décompression
        du fichier initial dans un sous-repertoire temporaire)

        Le fichier zip initial est déplacé vers le repertoire
        self.savpath

        Envoi d'un mail de notification à l'emetteur

        Certaines variables sont réinitialisées.

        """
        f = zipfile.ZipFile(zipfilename)
        destfilename = self.savpath + "/" + re.sub(r'^.*\/', '', zipfilename)
        repertoiretemporaire = re.sub(r'\.zip', '', f.filename)
        ## on remonte la fhs d'un niveau
        repertoiretemporaire = re.sub(self.initpath, '', repertoiretemporaire)

        try:
            shutil.rmtree(repertoiretemporaire)
        except:
            print 'Le répertoire n a pas pu etre supprimé'
        try:
            shutil.move(zipfilename, destfilename)
            #os.remove(zipfilename)
        except:
            print 'Le fichier n a pas pu etre sauvegardé'

        # envoi d'un mail de notification à l'emetteur
        msg = MIMEMultipart()
        msg['From'] = self.mail_sender
        msg['To'] = self.mail_notif_receivers
        msg['Date'] = formatdate(localtime=True)
        msg['Subject'] = self.mail_subject + self.numero_dtdict

        mail_notif_body_text = self.mail_notif_body_text1 + self.numero_dtdict + self.mail_notif_body_text2
        part1 = MIMEText(mail_notif_body_text, 'plain', 'utf-8')
        msg.attach(part1)

        try:
            #smtpObj = smtplib.SMTP('localhost')
            smtpObj = smtplib.SMTP('mail.ville-larochelle.fr')
            smtpObj.sendmail(self.mail_sender, \
                             self.mail_notif_receivers, \
                             msg.as_string())
            print "Successfully sent notification email to " + self.mail_notif_receivers
        except smtplib.SMTPException:
            print "Error: unable to send notification email to " + self.mail_notif_receivers

        # remise à zero des deux dictionnaires
        self.dico_exploitant_nomPdf = {}
        self.dico_exploitant_courriel = {}
        # et remise à zéro du mail de l'auteur/émetteur de la demande
        self.mail_notif_receivers = ''

def main():
    u"""
    Fonction principale.

    Après avoir créer un Handler, Ensuite on créé un "observer",
    qui va lancer un thread
    dans lequel il va, comme son nom l'indique, ... observer :

    """
    observer = Observer()

    # Surveille récursivement tous les événements du dossier
    # /home/fred/h/cartographie/dt-dict
    # et appele les méthodes de MonHandler quand quelque chose
    # se produit
    observer.schedule(MonHandler(), path='/home/fred/h/cartographie/tmp', recursive=True)

    u"""
    On démarre tout ça :
    """
    observer.start()

    # L'observer travaille dans un thread séparé donc on fait une
    # boucle infinie pour maintenir le thread principal actif
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
