#!/usr/bin/env python3
# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility

import re

# deux chaines sont a supprimer (l'info commence par jpegPhoto, continue sur plusieurs lignes)
# la dernière ligne se termine par les deux caractères ==
regex_1 = r"jpegPhoto::(.*)\n( .*\n)*(.*=)\n"
# - la dernière ligne se termine par les trois caractères //Z
regex_2 = r"jpegPhoto::(.*)\n( .*\n)*(.*Z)\n"


test_str = ("homeDirectory: /home/aline.allochon\n"
            "title: Madame\n"
            "jpegPhoto:: /9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw\n"
            " 8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRw\n"
            " 8UHRofHh0aHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRw\n"
            " 6Upk+XaOuQetFFYHSRlC7hV5PHTrRRRQFz//2Q==\n"
            "ouDisplayName:: RGlyZWN0aW9uIHZpZSBkZXMgcXVhcnRpZXJzLCB2aWUgYXNzb2NpYXRpdmUsIG\n"
            " NpdG95ZW5uZXTDqQ==\n\n"
            "# daniel.ambrosino, people, larochelle.fr")

matches = re.finditer(regex_1, test_str)
nouveau_texte = re.sub(regex_1,
                       '',
                       test_str)

#print(nouveau_texte)

#for matchNum, match in enumerate(matches):
#    print(matchNum)
#    matchNum = matchNum + 1
#    print ("Match {matchNum} was found at {start}-{end}: {match}".format(matchNum = matchNum, start = match.start(), end = match.end(), match = match.group()))


with open('annuaire1.ldif') as file_input:
    texte_0 = file_input.read()
    #print(read_data)
    with open('annuaire2.ldif', 'w') as file_output:
        texte_1 = re.sub(regex_1,
                         '',
                         texte_0)
        texte_2 = re.sub(regex_2,
                         '',
                         texte_1)
        file_output.write(texte_2)
        #print(nouveau_texte)
file_input.closed
file_output.closed
