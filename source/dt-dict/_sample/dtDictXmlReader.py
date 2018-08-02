#!/usr/bin/env python3
# -*- coding: utf-8 -*-

u"""
Lexture d'un fichier xml.

Script permettant de lire un ficchier xml.

"""


import re
import os
import shutil
import dtdict_appli1 as xmlReader




u"""
D’abord, on créé une classe qui va contenir le code à
executer quand il arrive quelque chose à nos fichiers :
"""


class Parseur(object):

    u"""
    Classe regroupant les sous-routines liées au parsing.

    .

    """

    def __init__(self):
        u"""
        Méthode pour initialiser l'objet.

        Lorsque la classe est instanciée (pour créer un objet),
        c'est cette méthode qui est executée.

        """
        print "__init__"
        self.numero_dtdict = ''
        self.xmlfile_to_join = ''


    def parse_fichier_xml(self, xmlfilename):
        u"""
        Cette analyse a pour objectif de recuperer la geometrie de l'emprise.

        """
                        # le fichier est du type *_description.xml
                        self.xmlfile_to_join = xmlfilename
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
                            #
                            # Attention, ici on traite le cas des demandes ou
                            # le courriel de l'exploitant n'est pas connu !!!!
                            #
                            #print('courriel = {}'.format(rootNode.listeDesOuvrages.ouvrage[i].contact.courriel))
                            if rootNode.listeDesOuvrages.ouvrage[i].contact.courriel is None:
                                courriel = rootNode.listeDesOuvrages.ouvrage[i].contact.fax + "@fax.net"
                            else:
                                courriel = rootNode.listeDesOuvrages.ouvrage[i].contact.courriel
                            #print('courriel = {}'.format(courriel))
                            #self.dico_exploitant_courriel[rootNode.listeDesOuvrages.ouvrage[i].contact.societe.encode("utf-8")] = rootNode.listeDesOuvrages.ouvrage[i].contact.courriel
                            self.dico_exploitant_courriel[rootNode.listeDesOuvrages.ouvrage[i].contact.societe.encode("utf-8")] = courriel


def main():
    u"""
    Fonction principale.

    """
    myParser = Parseur()

    print "start"
    myparseur.parse_fichier_xml()



if __name__ == '__main__':
    #import pdb; pdb.set_trace()
    main()

