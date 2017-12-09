#!/usr/bin/env python3
# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility

# Utilisation du site
# https://regex101.com/codegen?language=python

import re
import base64

def regexReplace(finput, foutput, regex, replace):
    """
    lit un fichier, applique une expression reguliere, ecrit le fichier
    """
    #print("{} ; {} ; {} ; {}".format(finput, foutput, regex, replace))
    #print("{} ; {}".format(regex, replace))
    with open(finput) as file_input:
        texte_00 = file_input.read()
        #print(read_data)
        with open(foutput, 'w') as file_output:
            texte_01 = re.sub(regex,
                             replace,
                             texte_00)
            file_output.write(texte_01)
            #print(nouveau_texte)
    file_input.closed
    file_output.closed

def regexDecodeReplace(finput, foutput, regex, replace1, replace2):
    """
    lit un fichier, applique une expression reguliere, ecrit le fichier
    """
    #print("{} ; {} ; {} ; {}".format(finput, foutput, regex, replace))
    print("{} ; {} ; {}".format(regex, replace1, replace2))
    with open(finput) as file_input:
        texte_00 = file_input.read()
        #print(read_data)
        with open(foutput, 'w') as file_output:
            print(re.sub(regex,
                         replace2,
                         texte_00) + '\n')
            print(base64.b64decode(re.sub(regex,
                                          replace2,
                                          texte_00)))
            # print(str(base64.b64decode(re.sub(regex,
            #                                   replace2,
            #                                   texte_00)))[2:-1])
            # print(base64.b64encode(re.sub(regex,
            #                            replace2,
            #                            texte_00)))
            # print(str(base64.b64encode(re.sub(regex,
            #                            replace2,
            #                            texte_00)))[2:-1])
            texte_01 = re.sub(regex,
                              replace1 +
                              str(base64.b64decode(re.sub(regex,
                                                          replace2,
                                                          texte_00) + '\n')),
                             texte_00)
            file_output.write(texte_01)
            #print(nouveau_texte)
    file_input.closed
    file_output.closed

# Nettoygae du fichier agents1.ldif
# #################################

# Dans le fichier ldif, des lignes sont a supprimer :
# Suppression des lignes dont l'info commence par ObjectClass:
# La suite de la ligne contient tous les caractères sauf "\n" ou ":"
regex_01 = r"(objectClass):([^:\n]*)\n"
# Suppression des lignes dont l'info commence par jpegPhoto:: et
# continue sur 0, 1 ou plusieurs lignes
# La suite de la ligne, derrière "jpegPhoto::" contient tous les caractères
# sauf ":" ou "#"
regex_02 = r"(jpegPhoto):: ([^:#]*)\n\n"
regex_03 = r"(jpegPhoto):: ([^:#]*)\n"
# Conversion/décodage des lignes dont l'info commence par ....:: et
# continue sur 0, 1 ou plusieurs lignes
# La suite de la ligne, derrière ".....::" contient des infos en base 64
# et il faut les décoder
# sauf ":" ou "#"
regex_04 = r"(.*):: ([^:#]*)\n\n"
#regex_05 = r"(.*):: ([^:#]*)\n"

regexReplace('agents1.ldif', 'agents2.ldif', regex_01, '')
regexReplace('agents2.ldif', 'agents3.ldif', regex_02, '')
regexReplace('agents3.ldif', 'agents4.ldif', regex_03, '')
regexDecodeReplace('agents4.ldif', 'agents5.ldif', regex_04, '\\1: ', '\\2\n\n')
#regexDecodeReplace('agents5.ldif', 'agents6.ldif', regex_05, '\\1: ', '\\2\n')

# Nettoygae du fichier serviceAgents1.ldif
# #################################
regex_01 = r"(.*)::([^:#]*)\n\n"
regex_02 = r"(.*)::([^:#]*)\n"
regexReplace('serviceAgents1.ldif', 'serviceAgents2.ldif', regex_01, '\n')
regexReplace('serviceAgents2.ldif', 'serviceAgents3.ldif', regex_02, '\n')

# Nettoygae du fichier service1.ldif
# #################################
regex_01 = r"(.*)::([^:#]*)\n\n"
regex_02 = r"(.*)::([^:#]*)\n"
regexReplace('service1.ldif', 'service2.ldif', regex_01, '\n')
regexReplace('service2.ldif', 'service3.ldif', regex_02, '\n')
