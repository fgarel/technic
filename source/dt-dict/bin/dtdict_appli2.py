#!/usr/bin/env python

#
# Generated Thu Jul 16 14:28:23 2015 by generateDS.py version 2.16a.
#
# Command line options:
#   ('-f', '')
#   ('-o', 'dtdict_api.py')
#   ('-s', 'dtdict_appli1.py')
#   ('--super', 'dtdict_api')
#   ('--member-specs', 'dict')
#   ('--external-encoding', 'utf-8')
#   ('--export', 'write literal etree')
#   ('--user-methods', 'gends_user_methods')
#
# Command line arguments:
#   schemaTeleservice_2_1.xsd
#
# Command line:
#   /usr/local/bin/generateDS.py -f -o "dtdict_api.py" -s "dtdict_appli1.py" --super="dtdict_api" --member-specs="dict" --external-encoding="utf-8" --export="write literal etree" --user-methods="gends_user_methods" schemaTeleservice_2_1.xsd
#
# Current working directory (os.getcwd()):
#   bin
#



import sys
#import upcase_names_appl as appl
import dtdict_appli1 as appl
counter = 0

def parse_dict(inFilename, silence=False):
    rootNode = appl.parse(inFilename)
    #rootTag, rootClass = get_root_tag(rootNode)
    #if rootClass is None:
    #    rootTag = 'dossierConsultation'
    #    rootClass = supermod.dossierConsultation
    #rootObj = rootClass.factory()
    #rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    doc = None
    if not silence:
        #sys.stdout.write('#from dtdict_api import *\n\n')
        #sys.stdout.write('import dtdict_api as model_\n\n')
        #sys.stdout.write('rootObj = model_.rootClass(\n')
        #rootObj.exportLiteral(sys.stdout, 0, name_=rootTag)
        #sys.stdout.write(')\n')
        print rootNode
        #print rootObj
    return rootNode
    #return rootObj

USAGE_TEXT = """
Usage: python ???.py <infilename>
"""


def usage():
    print(USAGE_TEXT)
    sys.exit(1)


def main():
    args = sys.argv[1:]
    if len(args) != 1:
        usage()
    infilename = args[0]
    rootNode = parse_dict(infilename, True)

    print '=' * 50
    #print 'rootNode.DICT.noConsulatationDuTeleservice :'
    print 'numero = ' + rootNode.DICT.noConsultationDuTeleservice
    #print '-' * 50
    #print 'rootNode.DICT.emprise : ' + \
    #      rootNode.DICT.emprise
    #print '-' * 50
    # print 'rootNode.DICT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans :'
    print 'taille des plans = ' + rootNode.DICT.souhaitsPourLeRecepisse.modeReceptionElectronique.tailleDesPlans
    #print '-' * 50
    #print 'rootNode.DICT.travauxEtLeurCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens :'
    print 'souhaitLesPlansDesReseauxElectriqueAeriens = ' + str(rootNode.DICT.travauxEtLeurCalendrier.souhaitLesPlansDesReseauxElectriqueAeriens)
    print '=' * 50
    for i, val in enumerate(rootNode.listeDesOuvrages.ouvrage):
        #print '  rootNode.listeDesOuvrages.ouvrage.contact.societe :'
        print '  societe  = ' + rootNode.listeDesOuvrages.ouvrage[i].contact.societe
        #print ' ' * 2 + '-' * 50
        #print '  rootNode.listeDesOuvrages.ouvrage.contact.courriel :'
        print '  courriel = ' + rootNode.listeDesOuvrages.ouvrage[i].contact.courriel
        print ' ' * 2 + '-' * 50

if __name__ == '__main__':
    #import pdb; pdb.set_trace()
    main()
