#!/usr/bin/env python3
# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility

# Utilisation du site
# https://regex101.com/codegen?language=python

import re

# Des chaines sont a supprimer :
# l'info commence par ....::, continue sur 0, 1 ou plusieurs lignes)
# les infos derriere les doubles "::" ne contiennent pas d'autre caractère ":"
# ni de #
#regex_01 = r"(.*)::([^:]*)\n([^:]*\n)*"
regex_01 = r"(.*)::([^:#]*)\n\n"
regex_03 = r"(.*)::([^:#]*)\n"
# l'info commence par ObjectClass:
regex_04 = r"(objectClass):([^:\n]*)\n"



with open('agents1.ldif') as file_input:
    texte_00 = file_input.read()
    #print(read_data)
    with open('annuaire2.ldif', 'w') as file_output:
        texte_01 = re.sub(regex_01,
                         '\n',
                         texte_00)
        texte_02 = re.sub(regex_01,
                         '\n',
                         texte_01)
        texte_03 = re.sub(regex_03,
                         '',
                         texte_02)
        texte_04 = re.sub(regex_04,
                         '',
                         texte_03)
        file_output.write(texte_04)
        #print(nouveau_texte)
file_input.closed
file_output.closed
