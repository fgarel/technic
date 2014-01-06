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

if __name__ == "main":
    """procedural

    Lit et traite ligne par ligne le fichier source (src).
    Le résultat est écrit au fur et à mesure dans le
    fichier destination (dst).
    """

    # Ouverture du fichier source en lecture
    _source_file = "../data/liste_patrimoine.txt"
    _source = open(_source_file, "r")

    # Ouverture du fichier template en lecture
    _template_file = "../etc/template/00_database.sql"
    #_template = open(_template_file, "r")

    # Ouverture du fichier destination
    _destination_file = "../data/00_database.sql"
    _destination = open(_destination_file, "w")


    try:
        # Appeler la fonction de traitement
        filtrer(_source, _template_file, _destination)
    finally:
        # Fermeture du fichier destination
        _destination.close()

        # Fermerture du fichier source
        _source.close()


