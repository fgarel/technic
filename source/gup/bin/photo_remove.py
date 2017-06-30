#!/usr/bin/env python3
# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility

import re

# Des chaines sont a supprimer :
# l'info commence par ....::, continue sur 0, 1 ou plusieurs lignes)
# les infos derriere les doubles "::" ne contiennent pas d'autre caractère ":"
regex_01 = r"(.*)::([^:]*)\n([^:]*\n)*"
# l'info commence par ObjectClass:
regex_02 = r"(objectClass):([^:]*)*\n"



with open('annuaire1.ldif') as file_input:
    texte_00 = file_input.read()
    #print(read_data)
    with open('annuaire2.ldif', 'w') as file_output:
        texte_01 = re.sub(regex_01,
                         '',
                         texte_00)
        texte_02 = re.sub(regex_02,
                         '',
                         texte_01)
        file_output.write(texte_02)
        #print(nouveau_texte)
file_input.closed
file_output.closed
