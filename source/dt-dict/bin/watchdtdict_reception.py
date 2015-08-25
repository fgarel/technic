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
import dtdict_appli1 as xmlReader

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
        
        Les répertoires sont définis ici.
        Le fichier défini par la variable self.generalGml
        contiendra toutes les emprises de toutes les dict

        """

        self.numero_dtdict = ''

        # sous-repertoire des données initiales
        self.initpath = 'xml'
        # sous-repertoire ou sera stocké les dt-dict émises après traitement
        self.savpath = '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/data/out/xml'
        # chaine de caractères, qui sera ecrite dans le fichier gml
        # avant les coordonnées des emprises
        self.beforeCoordinates = ''
        self.headerGml = 'header.gml'
        self.footerGml = 'footer.gml'
        self.generalGml = '/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/data/out/xml/dtdict.gml'


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
        #print "Oh ! le fichier : {0}\n a été renommé en : {1}".format(
        #    event.src_path,
        #    event.dest_path)
        self.analyse_fichier_xml_initial(event.dest_path)
        #pass

    def on_deleted(self, event):
        u"""
        Méthode exécutée à la suppression d'un fichier.

        Cette méthode sera appelée à chaque fois qu'un fichier
        est supprimé.

        """
        #print("AAAAGGhhhh ! le fichier %s a été supprimé" % event.src_path)
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
        #print "Hi ! Le fichier : {0} a été créé".format(event.src_path)
        self.beforeCoordinates = ''
        self.analyse_fichier_xml_initial(event.src_path)
        #self.nettoyage(event.src_path)

    def analyse_fichier_xml_initial(self, xmlfilename):
        u"""
        Cette analyse a pour objectif de stocker les informations.

        le fichier xml sera transformé en fichier gml :
         - la geometrie est récupérée grace à l'utilisation
           d'expressions régulières
         - mais les informations non géométriques sont récupérées
           plus simplement en parsant le xml.
           la seule contrainte, c'est la différence de syntaxe entre
           les 4 types de dt-dict

        """
        extension = re.sub(r'(.*)\.', '', xmlfilename)
        path = re.sub(r'[^/]*$', '', xmlfilename)
        basenameextension = re.sub(r'.*/', '', xmlfilename)
        if extension == 'xml':
            u"""
            On lit le fichier xml dans le but de
            recueillir les informations que l'on va
            ensuite réécrire dans le fichier gml.
            La variable beforeCoordinates contiendra les
            lignes qu'il faudra ensuite injecter dans le gml.
            """

            # chargement du xml et lecture des infos
            rootNode = xmlReader.parse(xmlfilename)
            try:
                u"""
                Tentative de lecture d'un xml :
                 - OK si c'est une DT
                 - KO sinon
                """

                self.beforeCoordinates += \
                    "<ogr:DtNoConsultationDuTeleservice>" \
                    + rootNode.DT.noConsultationDuTeleserviceSeize \
                    + "</ogr:DtNoConsultationDuTeleservice>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:DtDateDeLaDeclaration>" \
                    + str(rootNode.DT.dateDeLaDeclaration) \
                    + "</ogr:DtDateDeLaDeclaration>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:responsableDuProjet>" \
                    + rootNode.DT.responsableDuProjet.denomination \
                    + "</ogr:responsableDuProjet>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:representantDuResponsableDeProjet>" \
                    + rootNode.DT.representantDuResponsableDeProjet.denomination \
                    + "</ogr:representantDuResponsableDeProjet>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:courriel>" \
                    + rootNode.DT.representantDuResponsableDeProjet.courriel \
                    + "</ogr:courriel>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:tailleDesPlans>" \
                    + rootNode.DT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans \
                    + "</ogr:tailleDesPlans>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:souhaitDePlansVectoriels>" \
                    + str(rootNode.DT.souhaitsPourLeRecepisse.modeReceptionElectronique.souhaitDePlansVectoriels) \
                    + "</ogr:souhaitDePlansVectoriels>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:formatDesPlansVectoriels>" \
                    + rootNode.DT.souhaitsPourLeRecepisse.modeReceptionElectronique.formatDesPlansVectoriels \
                    + "</ogr:formatDesPlansVectoriels>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:decrivezLeProjet>" \
                    + rootNode.DT.projetEtSonCalendrier.decrivezLeProjet \
                    + "</ogr:decrivezLeProjet>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:souhaitLesPlansDesReseauxElectriqueAeriens>" \
                    + str(rootNode.DT.projetEtSonCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens) \
                    + "</ogr:souhaitLesPlansDesReseauxElectriqueAeriens>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:datePrevuePourLeCommencementDesTravaux>" \
                    + str(rootNode.DT.projetEtSonCalendrier.datePrevuePourLeCommencementDesTravaux) \
                    + "</ogr:datePrevuePourLeCommencementDesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:dureeDuChantierEnJours>" \
                    + str(rootNode.DT.projetEtSonCalendrier.dureeDuChantierEnJours) \
                    + "</ogr:dureeDuChantierEnJours>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:TypeDeclaration>" \
                    + 'DT' \
                    + "</ogr:TypeDeclaration>" + '\n'
            except:
                pass

            try:
                u"""
                Tentative de lecture d'un xml :
                 - OK si c'est une DICT
                 - KO sinon
                """

                self.beforeCoordinates += \
                    "<ogr:DictNoConsultationDuTeleservice>" \
                    + rootNode.DICT.noConsultationDuTeleservice \
                    + "</ogr:DictNoConsultationDuTeleservice>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:DictDateDeLaDeclaration>" \
                    + str(rootNode.DICT.dateDeLaDeclaration) \
                    + "</ogr:DictDateDeLaDeclaration>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:executantDesTravaux>" \
                    + rootNode.DICT.executantDesTravaux.denomination \
                    + "</ogr:executantDesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:courriel>" \
                    + rootNode.DICT.executantDesTravaux.courriel \
                    + "</ogr:courriel>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:tailleDesPlans>" \
                    + rootNode.DICT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans \
                    + "</ogr:tailleDesPlans>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:souhaitDePlansVectoriels>" \
                    + str(rootNode.DICT.souhaitsPourLeRecepisse.modeReceptionElectronique.souhaitDePlansVectoriels) \
                    + "</ogr:souhaitDePlansVectoriels>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:formatDesPlansVectoriels>" \
                    + rootNode.DICT.souhaitsPourLeRecepisse.modeReceptionElectronique.formatDesPlansVectoriels \
                    + "</ogr:formatDesPlansVectoriels>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:decrivezLesTravaux>" \
                    + rootNode.DICT.travauxEtLeurCalendrier.decrivezLesTravaux \
                    + "</ogr:decrivezLesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:souhaitLesPlansDesReseauxElectriqueAeriens>" \
                    + str(rootNode.DICT.travauxEtLeurCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens) \
                    + "</ogr:souhaitLesPlansDesReseauxElectriqueAeriens>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:datePrevuePourLeCommencementDesTravaux>" \
                    + str(rootNode.DICT.travauxEtLeurCalendrier.datePrevuePourLeCommencementDesTravaux) \
                    + "</ogr:datePrevuePourLeCommencementDesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:dureeDuChantierEnJours>" \
                    + str(rootNode.DICT.travauxEtLeurCalendrier.dureeDuChantierEnJours) \
                    + "</ogr:dureeDuChantierEnJours>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:DtNoConsultationDuTeleservice>" \
                    + str(rootNode.DICT.DtLiee.noConsultationDuTeleserviceSeize) \
                    + "</ogr:DtNoConsultationDuTeleservice>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:DtDateDeLaDeclaration>" \
                    + str(rootNode.DICT.DtLiee.dateDeLaDeclaration) \
                    + "</ogr:DtDateDeLaDeclaration>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:responsableDuProjet>" \
                    + rootNode.DICT.DtLiee.responsableDuProjet.denomination \
                    + "</ogr:responsableDuProjet>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:representantDuResponsableDeProjet>" \
                    + rootNode.DICT.DtLiee.representantDuResponsableDeProjet.denomination \
                    + "</ogr:representantDuResponsableDeProjet>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:TypeDeclaration>" \
                    + 'DICT' \
                    + "</ogr:TypeDeclaration>" + '\n'
            except:
                pass

            try:
                u"""
                Tentative de lecture d'un xml :
                 - OK si c'est une DT-DICT Conjointe
                 - KO sinon
                """

                self.beforeCoordinates += \
                    "<ogr:DictNoConsultationDuTeleservice>" \
                    + rootNode.dtDictConjointes.partieDICT.noConsultationDuTeleservice \
                    + "</ogr:DictNoConsultationDuTeleservice>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:DictDateDeLaDeclaration>" \
                    + str(rootNode.dtDictConjointes.partieDICT.dateDeLaDeclaration) \
                    + "</ogr:DictDateDeLaDeclaration>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:responsableDuProjet>" \
                    + rootNode.dtDictConjointes.partieDT.responsableDuProjet.denomination \
                    + "</ogr:responsableDuProjet>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:representantDuResponsableDeProjet>" \
                    + rootNode.dtDictConjointes.partieDT.representantDuResponsableDeProjet.denomination \
                    + "</ogr:representantDuResponsableDeProjet>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:executantDesTravaux>" \
                    + rootNode.dtDictConjointes.partieDICT.executantDesTravaux.denomination \
                    + "</ogr:executantDesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:courriel>" \
                    + rootNode.dtDictConjointes.partieDICT.executantDesTravaux.courriel \
                    + "</ogr:courriel>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:tailleDesPlans>" \
                    + rootNode.dtDictConjointes.partieDICT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans \
                    + "</ogr:tailleDesPlans>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:souhaitDePlansVectoriels>" \
                    + str(rootNode.dtDictConjointes.partieDICT.souhaitsPourLeRecepisse.modeReceptionElectronique.souhaitDePlansVectoriels) \
                    + "</ogr:souhaitDePlansVectoriels>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:formatDesPlansVectoriels>" \
                    + rootNode.dtDictConjointes.partieDICT.souhaitsPourLeRecepisse.modeReceptionElectronique.formatDesPlansVectoriels \
                    + "</ogr:formatDesPlansVectoriels>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:decrivezLesTravaux>" \
                    + rootNode.dtDictConjointes.partieDICT.travauxEtLeurCalendrier.decrivezLesTravaux \
                    + "</ogr:decrivezLesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:souhaitLesPlansDesReseauxElectriqueAeriens>" \
                    + str(rootNode.dtDictConjointes.partieDICT.travauxEtLeurCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens) \
                    + "</ogr:souhaitLesPlansDesReseauxElectriqueAeriens>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:datePrevuePourLeCommencementDesTravaux>" \
                    + str(rootNode.dtDictConjointes.partieDICT.travauxEtLeurCalendrier.datePrevuePourLeCommencementDesTravaux) \
                    + "</ogr:datePrevuePourLeCommencementDesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:dureeDuChantierEnJours>" \
                    + str(rootNode.dtDictConjointes.partieDICT.travauxEtLeurCalendrier.dureeDuChantierEnJours) \
                    + "</ogr:dureeDuChantierEnJours>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:TypeDeclaration>" \
                    + 'DT-DICT' \
                    + "</ogr:TypeDeclaration>" + '\n'
            except:
                pass

            try:
                u"""
                Tentative de lecture d'un xml :
                 - OK si c'est un ATU
                 - KO sinon
                """

                self.beforeCoordinates += \
                    "<ogr:AtuNoConsultationDuTeleservice>" \
                    + rootNode.ATU.noConsultationDuTeleservice \
                    + "</ogr:AtuNoConsultationDuTeleservice>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:AtuDate>" \
                    + str(rootNode.ATU.date) \
                    + "</ogr:AtuDate>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:pasDeReponseAFournirChantierTermine>" \
                    + str(rootNode.ATU.chantierTermineOuChantierAVenir.pasDeReponseAFournirChantierTermine) \
                    + "</ogr:pasDeReponseAFournirChantierTermine>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:reponseAttendueChantierAVenir>" \
                    + str(rootNode.ATU.chantierTermineOuChantierAVenir.reponseAttendueChantierAVenir) \
                    + "</ogr:reponseAttendueChantierAVenir>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:personneOrdonnantLesTravauxUrgents>" \
                    + rootNode.ATU.personneOrdonnantLesTravauxUrgents.nom \
                    + "</ogr:personneOrdonnantLesTravauxUrgents>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:courriel>" \
                    + rootNode.ATU.personneOrdonnantLesTravauxUrgents.courriel \
                    + "</ogr:courriel>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:entrepriseChargeeDeLExecutionDesTravaux>" \
                    + rootNode.ATU.entrepriseChargeeDeLExecutionDesTravaux.nom \
                    + "</ogr:entrepriseChargeeDeLExecutionDesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:travauxEtMoyensMisEnOeuvre>" \
                    + rootNode.ATU.travauxEmplacementDureeDescription.travauxEtMoyensMisEnOeuvre \
                    + "</ogr:travauxEtMoyensMisEnOeuvre>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:dateDebutDesTravaux>" \
                    + str(rootNode.ATU.travauxEmplacementDureeDescription.dateDebutDesTravaux) \
                    + "</ogr:dateDebutDesTravaux>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:dureeTravauxDemiJournees>" \
                    + str(rootNode.ATU.travauxEmplacementDureeDescription.dureeTravauxDemiJournees) \
                    + "</ogr:dureeTravauxDemiJournees>" + '\n'
                self.beforeCoordinates += \
                    "<ogr:TypeDeclaration>" \
                    + 'ATU' \
                    + "</ogr:TypeDeclaration>" + '\n'
            except:
                pass

            # on renomme le fichier xml en tmp
            self.numero_dtdict = re.sub(r'\_description.xml',
                                        '',
                                        basenameextension)
            tmpfilename = path + self.numero_dtdict + '.tmp1'
            try:
                shutil.move(xmlfilename, tmpfilename)
            except:
                print 'Le fichier n a pas pu etre sauvegardé'


        elif extension == 'tmp1':
            # on lit le fichier .tmp1
            self.numero_dtdict = re.sub(r'\.tmp1', '', basenameextension)
            tmpfilename = path + self.numero_dtdict + '.tmp2'
            finput = open(xmlfilename, 'r')
            fheader = open(self.headerGml, 'r')
            ffooter = open(self.footerGml, 'r')
            #et on ecrit dans les fichiers tmp2, qui deviendra gml
            #et le fichier general.gml
            foutput = open(tmpfilename, 'w')
            foutputG = open(self.generalGml, 'r+')
            
            # ecriture de l'entete
            for line in fheader:
                foutput.write(line)
            fheader.close()
            foutput.write('\n')

            # On positionne le pointeur du fichier general.gml une ligne avant la fin
            # la chaine "</ogr:FeatureCollection>" fait 25 caracteres
            foutputG.seek(-25, 2);

		    # ecriture du corps
            for line in finput:
                if re.search(r'</t:emprise>', line):
                    break
                elif re.search(r'<t:.*>', line) \
                    or re.search(r'</t:.*>', line):
                    pass
                elif re.search(r'<ie:.*>', line):
                    pass
                elif re.search(r'<\?xml.*>', line):
                    pass
                elif re.search(r'<gml:surfaceMembers>', line):
                    foutput.write('<gml:featureMember>\n')
                    foutputG.write('<gml:featureMember>\n')
                elif re.search(r'</gml:surfaceMembers>', line):
                    foutput.write('</gml:featureMember>\n')
                    foutputG.write('</gml:featureMember>\n')
                elif re.search(r'<gml:Polygon', line):
                    partial = re.sub(r'<gml:Polygon gml:id="', \
                        '', \
                        line)
                    partial = re.sub(r'">', \
                        '', \
                        partial)
                    partial = re.sub(r' *', \
                        '', \
                        partial)
                    partial = re.sub(r'\n', \
                        '', \
                        partial)
                    foutput.write('<ogr:DTDICT>\n')
                    foutputG.write('<ogr:DTDICT>\n')
                    foutput.write('<ogr:gml_id>' + partial + '</ogr:gml_id>\n')
                    foutputG.write('<ogr:gml_id>' + partial + '</ogr:gml_id>\n')
                    foutput.write(self.beforeCoordinates.encode("utf-8"))
                    foutputG.write(self.beforeCoordinates.encode("utf-8"))
                elif re.search(r'</gml:Polygon>', line):
                    foutput.write('</ogr:DTDICT>\n')
                    foutputG.write('</ogr:DTDICT>\n')
                elif re.search(r'<gml:exterior>', line):
                    foutput.write('<ogr:geometryProperty>\n')
                    foutputG.write('<ogr:geometryProperty>\n')
                    foutput.write('<gml:Polygon srsName="EPSG:4326">\n')
                    foutputG.write('<gml:Polygon srsName="EPSG:4326">\n')
                    foutput.write('<gml:outerBoundaryIs>\n')
                    foutputG.write('<gml:outerBoundaryIs>\n')
                elif re.search(r'</gml:exterior>', line):
                    foutput.write('</gml:outerBoundaryIs>\n')
                    foutputG.write('</gml:outerBoundaryIs>\n')
                    foutput.write('</gml:Polygon>\n')
                    foutputG.write('</gml:Polygon>\n')
                    foutput.write('</ogr:geometryProperty>\n')
                    foutputG.write('</ogr:geometryProperty>\n')
                else:
                    foutput.write(line)
                    foutputG.write(line)
            #foutputG.write('top\n')
            finput.close()
            # ecriture du pied
            for line in ffooter:
				foutput.write(line)
				foutputG.write(line)
            ffooter.close()
            foutput.close()
            foutputG.close()
            
            # puis on renomme le fichier tmp2 en gml
            #self.numero_dtdict = re.sub(r'\.tmp1', '', basenameextension)

            gmlfilename = path + self.numero_dtdict + '.gml'
            try:
                shutil.move(tmpfilename, gmlfilename)
            except:
                print 'Le fichier n a pas pu etre sauvegardé'

            # et enfin on supprime le fichier tmp1
            try:
                os.remove(xmlfilename)
            except:
                print 'Le fichier n a pas pu etre supprimé'

        elif extension == 'gml':
            # on fait un traitement sur le fichier gml
            #print "gml = \n---\n" + self.beforeCoordinates
            self.numero_dtdict = re.sub(r'\.gml', '', basenameextension)
            destfilename = self.savpath + "/" + self.numero_dtdict + '.gml'
            try:
                shutil.move(xmlfilename, destfilename)
            except:
                print 'Le fichier n a pas pu etre sauvegardé'

        else:
            pass



    def nettoyage(self, gmlfilename):
        u"""
        Méthode pour nettoyer et ranger à la fin du traitement.

        Suppression ou sauveagarde des fichiers après traitement.

        Les fichiers temporaires sont supprimés.
        (on parle ici des fichiers résultant de la décompression
        du fichier initial dans un sous-repertoire temporaire)

        Le fichier gml final est déplacé vers le repertoire
        self.savpath

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
    #observer.schedule(MonHandler(), path='/home/fred/h/cartographie/tmp', recursive=True)
    observer.schedule(MonHandler(), path='/home/fred/Travail/ecriture_sphinx/technic/source/dt-dict/data/in/xml', recursive=True)

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
