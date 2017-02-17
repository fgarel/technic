#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# This file is part of Mapnik (c++ mapping toolkit)
#
# Copyright (C) 2006 Jean-Francois Doyon
#
# Mapnik is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#


import re
import os
from os.path import join, getsize


def filtrer(src, tpl_file, dst):
    """Fonction de traitement.

    Lit et traite ligne par ligne le fichier source (src).
    Le résultat est écrit au fur et à mesure dans le
    fichier destination (dst).
    """

    # Lit l'en-tête, élimine la fin de ligne, et extrait les
    # champs séparés par une virgule
    entete = src.readline().rstrip('\n\r').split(",")

    # Détermine l'index des différents champs qui nous sont utiles
    #domaine = entete.index("Domaine")
    #classe = entete.index("Classe")
    couleur = entete.index("Couleur")
    calque = entete.index("Nom du calque")
    typeligne = entete.index("LIN_Style_Generique")
    epaisseurligne = entete.index("LIN_Style_Epaisseur")

    # Ecrit l'en-tête
    dst.write(";;; \n")
    dst.write(";;; Script pour la creation des calques\n")
    dst.write(";;; \n")

    # Puis les données
    for ligne_source in src:
        # Extraction des données de la ligne séparées par une virgule
        donnees_source = ligne_source.rstrip('\n\r').split(",")
        dst.write(";;; %s, %s\n" % (donnees_source[calque], donnees_source[couleur]))

        # Ouverture du fichier template
        tpl = open(tpl_file, "r")
        # lit le fichier template
        for ligne_template in tpl:
            donnees_template = ligne_template.rstrip('\n\r')
            ligne_a_ecrire = re.sub('NOM_DU_CALQUE', donnees_source[calque], donnees_template)
            ligne_a_ecrire = re.sub('NUMERO_COULEUR', donnees_source[couleur], ligne_a_ecrire)
            if donnees_source[typeligne]:
                ligne_a_ecrire = re.sub('TYPE_DE_LIGNE', donnees_source[typeligne], ligne_a_ecrire)
            else:
                ligne_a_ecrire = re.sub('TYPE_DE_LIGNE', 'Continuous', ligne_a_ecrire)
                #print("+++%s,%s,%s" % (donnees_source[calque], donnees_source[typeligne],ligne_a_ecrire))
            #if (donnees_source[epaisseurligne] is not None):
            if donnees_source[epaisseurligne]:
                ligne_a_ecrire = re.sub('EPAISSEUR_DE_LIGNE', donnees_source[epaisseurligne], ligne_a_ecrire)
            else:
                #print("%s,%s\n" % (donnees_source[calque], donnees_source[epaisseurligne]))
                ligne_a_ecrire = re.sub('EPAISSEUR_DE_LIGNE', "0", ligne_a_ecrire)
            # Ecriture des données dans le fichier destination
            dst.write("%s\n" % (ligne_a_ecrire))

        # Fermerture du fichier template
        #print("+++%s, %s, %s" % (donnees_source[calque], donnees_source[typeligne], donnees_source[epaisseurligne]))
        tpl.close()


# Ouverture du repertoire source en lecture
_directory_src = "../data/logos_source/fred/"


# Ouverture du repertoire destination
_directory_dst = "../data/Theme/Client/VLR/Icone/"


try:
    # Appeler la fonction de traitement
    #filtrer(_source, _template_file, _destination)
    os.walk(_directory_src)
    #print "root prints out directories only from what you specified"
    #print "dirs prints out sub-directories from root"
    #print "files prints out all files from root and directories"
    #print "*" * 20
    for root, dirs, files in os.walk(_directory_src):
        print("root = %s\n" % root)
        print("dirs = %s\n" % dirs)
        print("files = %s\n" % files)
        for name in files:
            print("name = %s\n" % name)
            print("size = %s\n" % getsize(join(root, name)))
            print(name[:-4])
        #print root, "consumes",
        #print sum([getsize(join(root, name)) for name in files]),
        #print "bytes in", len(files), "non-directory files"

finally:
    #
    print("repertoire initial : %s , repertoire final : %s\n" % (_directory_src, _directory_dst))



