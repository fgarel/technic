#!/usr/bin/env python
# -+- coding: utf-8 -+-

u"""
Ce script permet de d'exploiter des données csv.

"""
import re


class Csvtoshell(object):

    u"""
    Cette classe inclut une methode pour generer un fichier de commande shell.

    Cette classe permet la lecture d'un fichier csv, d'un fichier tpl
    et la generation d'un fichier destination.
    La lecture du fichier csv
    la lecture d'un template
    l'ecriture du fihcier de commande.

    """

    def __init__(self, src_file, src_delimiter, tpl_file, dst_file):
        u"""
        Initialisation de l'objet.

        """
        self.src_file = src_file
        self.src_delimiter = src_delimiter
        self.tpl_file = tpl_file
        self.dst_file = dst_file
        #with open(src_file, 'r') as self.csvinputfile:
        #    self.csvreader = csv.reader(self.csvinputfile,
        #                                delimiter=src_delimiter)
        self.src = open(src_file, "r")
        #entete = src.readline().rstrip('\n\r').split(",")
        #self.tpl = open(tpl_file, "r")
        self.dst = open(dst_file, "w")

    def make_dest(self):
        u"""Fonction de traitement.

        Lit et traite ligne par ligne le fichier source (src).
        Le résultat est écrit au fur et à mesure dans le
        fichier destination (dst).

        """
        # Ecrit l'en-tête
        self.dst.write("#!/bin/sh\n\n")
        self.dst.write("#\n")
        self.dst.write("\n")
        self.dst.write("# Script généré automatiquement \n")
        self.dst.write("#   à l'aide de l'utilitaire :\n")
        self.dst.write("#     %s\n" % (self.src_file))
        self.dst.write("#   à partir des fichiers :\n")
        self.dst.write("#     %s\n" % (self.src_file))
        self.dst.write("#     %s\n" % (self.tpl_file))
        self.dst.write("#     %s\n" % (self.dst_file))
        self.dst.write("#     \n")
        self.dst.write("\n")

        # Lit l'en-tête, élimine la fin de ligne, et extrait les
        # champs séparés par une virgule
        entete = self.src.readline().rstrip('\n\r').split(self.src_delimiter)

        # Détermine l'index des différents champs qui nous sont utiles
        #_ivar1 = entete.index("Var1")
        #_ivar2 = entete.index("Var2")

        # Puis les données
        for ligne_source in self.src:
            # Extraction des données de la ligne séparées par une virgule
            donnees_source = ligne_source.rstrip('\n\r').split(
                self.src_delimiter)
            #self.dst.write("# %s, %s\n" % (donnees_source[_ivar1],
            #                               donnees_source[_ivar2]))
            self.dst.write("# %s, %s\n" % (donnees_source[0],
                                           donnees_source[1]))

            # Ouverture du fichier template
            tpl = open(self.tpl_file, "r")
            # lit le fichier template
            for ligne_template in tpl:
                donnees_template = ligne_template.rstrip('\n\r')
                #print len(donnees_source)
                ligne_a_ecrire = re.sub('#VAR1#',
                                        donnees_source[0],
                                        donnees_template)
                ligne_a_ecrire = re.sub('#VAR2#',
                                        donnees_source[1],
                                        ligne_a_ecrire)

                # en fonction du nombre de variables lues dans le fichier csv
                if len(donnees_source) > 2:
                    ligne_a_ecrire = re.sub('#VAR3#',
                                            donnees_source[2],
                                            ligne_a_ecrire)
                else:
                    ligne_a_ecrire = re.sub('#VAR3#',
                                            donnees_source[1],
                                            ligne_a_ecrire)
                if len(donnees_source) > 3:
                    ligne_a_ecrire = re.sub('#VAR4#',
                                            donnees_source[3],
                                            ligne_a_ecrire)
                else:
                    ligne_a_ecrire = re.sub('#VAR4#',
                                            donnees_source[1],
                                            ligne_a_ecrire)
                if len(donnees_source) > 4:
                    ligne_a_ecrire = re.sub('#VAR5#',
                                            donnees_source[4],
                                            ligne_a_ecrire)
                else:
                    ligne_a_ecrire = re.sub('#VAR5#',
                                            donnees_source[1],
                                            ligne_a_ecrire)
                if len(donnees_source) > 5:
                    ligne_a_ecrire = re.sub('#VAR6#',
                                            donnees_source[5],
                                            ligne_a_ecrire)
                else:
                    ligne_a_ecrire = re.sub('#VAR6#',
                                            donnees_source[1],
                                            ligne_a_ecrire)

                self.dst.write("%s\n" % (ligne_a_ecrire))
                #self.dst.write("%s\n" % (self.__deux()))

            # Fermerture du fichier template
            self.dst.write("\n")
            tpl.close()


def main():
    u"""
    Lecture d'un fichier.

    Lecture d'un fichier csv et ecriture d'un fichier de commande shell.

    """
    _source_file = 'liste_patrimoine.txt'
    _source_delimiter = ';'
    _template_file = 'fichier_commande_tpl.sh'
    _destination_file = 'fichier_commande.sh'
    _mycsvtoshell = Csvtoshell(_source_file,
                               _source_delimiter,
                               _template_file,
                               _destination_file)
    _mycsvtoshell.make_dest()
    #with open('liste_patrimoine.txt', 'r') as csvinputfile:
    #    csvreader = csv.reader(csvinputfile, delimiter=';')
    #    with open('dataout.txt', 'w') as csvoutputfile:
    #        csvwriter = csv.writer(csvoutputfile,
    #                               delimiter='-',
    #                               lineterminator='\n')
    #        fichier_commande = open('fichier_commande.sh', 'w')
    #        fichier_commande.write('#!/bin/sh\n')
    #        fichier_commande.write('\n')
    #        fichier_commande.write('ls -al\n')
    #        for row in csvreader:
    #            print ', '.join(row)

    #            print('row={}'.format(row))
    #            csvwriter.writerow(row)


if __name__ == '__main__':
    main()
