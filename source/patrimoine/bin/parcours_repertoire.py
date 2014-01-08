#!/usr/bin/env python
# *-* encoding: utf-8 *-*

# ici, le but est de trouver les images d'un repertoire
# puis d'ecrire le code latex permettant de constituer un
# catalogue de ces images.

# le parcours d'un repertoire est détaillé ici
# http://www.pythonforbeginners.com/systems-programming/
# os-walk-and-fnmatch-in-python/

""" Recherche de fichiers.

Ce petit script permet de parcourir un repertoire
dans le but de trouver des fichiers selon un critere de recherche

"""


import fnmatch
import os


class ParcoursRepertoire(object):

    u""" Parcours une liste de répertoire donnée à la recherche de fichiers.

    Cette classe correspont à la cible
    en argument, on done :
      - une liste de repertoire à parcourir
      - une liste d'extension de fichier correpondant aux critères de recherche

    """

    def __init__(self, repertoire, liste_extension):
        u""" Initialisation.

        La fonction __init__ d'une classe est apellée
        lorque un objet est instancié

        """
        self._repertoire = repertoire
        # les images sont des fichiers qui ont une extension
        # parmi cette liste
        if not liste_extension:
            # si la liste est vide
            self._liste_extension = ['*.jpg', '*.jpeg',
                                     '*.png',
                                     '*.tif', '*.tiff',
                                     ]
        else:
            self._liste_extension = liste_extension
        print(self._repertoire)

    def __call__(self):
        u""" fonction call.

        La fonction __call__ d'une classe est apellée
        lorque la classe est appellée....

        """
        pass

    def get_files(self):
        u""" Retourne la liste des fichiers répiondant aux critères.

        Retourne la liste des fichiers qui matchent les critères de sélection.

        """

        # matches sera la liste des fichiers qui correspondent au critère
        matches = []
        print("self._repertoire {}".format(self._repertoire))
        print("self._liste_extension {}".format(
            self._liste_extension.__str__()))

        # on remplit la liste matches avec le nom des fichiers
        # ayant la bonne extension.
        for root, dirs, filenames in os.walk(self._repertoire):
            #print('dir = '.format(dirs.__str__()))
            for extensions in self._liste_extension:
                for filename in fnmatch.filter(filenames, extensions):
                    matches.append(os.path.join(root, filename))
                    #print("os.path.join = {}".format(os.path.join(root)))

        #print('matches = ' + matches.__str__())
        return matches


def main():
    u""" Fonction principale.

    Création d'un objet et utilisation de la fonction getFiles

    """
    # creation d'un objet
    plan_pdf = ["*.pdf"]
    plan_autocad = ['*.dxf', '*.dwg']
    plan_archicad = ['*.pla', '*.pln']
    plan = plan_pdf
    plan.extend(plan_archicad)
    plan.extend(plan_autocad)
    #print("plan {}".format(plan.__str__()))
    #print("plan_autocad {}".format(plan_autocad.__str__()))
    #print("plan_archicad {}".format(plan_archicad.__str__()))

    #python = ["*.py", '*.sh', "*.*"]
    __monparcours__ = ParcoursRepertoire(
        '/home/fred/t/GESTION_DU_PATRIMOINE/', plan)
    #__monparcours__ = ParcoursRepertoire('.', python)

    print ('matches = {}'.format(__monparcours__.get_files().__repr__()))
    #print ('matches = {}'.format(__monparcours__.get_files().__str__().decode('utf-8')))


if __name__ == "__main__":
    main()
