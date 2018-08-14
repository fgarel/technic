#!/usr/bin/env python3
# -*- coding: utf-8 -*-

class ParametresRecepisse(object):

    u""" Cette classe correspont aux paramètres du recepisse. """

    def __init__(self):
        u""" Fonction lancée au moment de l'instanciation. """
        # les parametres pour la creation

        self.dict_fieldName_fieldValue = {
                     'Denomination':                 'ENEDIS-DRPCH-ExploitationPérigny',
                     'ComplementAdresse':            'Jérémy TRICHET',
                     'NoVoie':                       '5 rue aristide berges',
                     'LieuditBP':                    '',
                     'CodePostal':                   '17180',
                     'Commune':                      'PERIGNY',
                     'Pays':                         '',
                     'NoGU':                         '2018080900268P',
                     'ReferenceExploitant':          '',
                     'NoAffaireDeclarant':           '',
                     'Personne_Contacter':           '',
                     'JourReception':                '09',
                     'MoisReception':                '08',
                     'AnneeReception':               '2018',
                     'CommuneTravaux':               'La Rochelle',
                     'AdresseTravaux':               'Jean Eiffel',
                     'RaisonSocialeExploitant':      'Ville de La Rochelle',
                     'ContactExploitant':            'Direction de la Voirie / Unité Topographie',
                     'NoVoieExploitant':             '8 Place Jean Baptiste Marcet',
                     'LieuditBPExploitant':          '',
                     'CodePostalExploitant':         '17086',
                     'CommuneExploitant':            'La Rochelle',
                     'TelExploitant':                '0546511433',
                     'FaxExploitant':                '0546377111',
                     'RepImpossible':                '',
                     'InfoPreciser':                 '',
                     'PasConcerne':                  '',
                     'DistanceReseau':               '',
                     'Concerne':                     'Oui',
                     'CategorieReseau1':             'E',
                     'CategorieReseau2':             'I',
                     'CategorieReseau3':             'J',
                     'ModifPrevue':                  '',
                     'ModifEnCours':                 '',
                     'RepresentantExploitant':       '',
                     'TelModification':              '',
                     'PlansJoints':                  'Oui',
                     'Ref1':                         'Éclairage Public',
                     'Echelle1':                     '200',
                     'JourEditionPlan1':             '09',
                     'MoisEditionPlan1':             '08',
                     'AnneeEdition1':                '2018',
                     'Sensible1':                    'Oui',
                     'Profondeur1':                  '40',
                     'Materiau1':                    '',
                     'Ref2':                         'Eau',
                     'Echelle2':                     '200',
                     'JourEditionPlan2':             '09',
                     'MoisEditionPlan2':             '08',
                     'AnneeEdition2':                '2018',
                     'Sensible2':                    '',
                     'Profondeur2':                  '40',
                     'Materiau2':                    '',
                     'ReunionChantierCase':          '',
                     'DateRDV':                      '',
                     'JourReunion':                  '',
                     'MoisReunion':                  '',
                     'AnneeReunion':                 '',
                     'HeureReunion':                 '',
                     'MinuteReunion':                '',
                     'RDVparDeclarant':              '',
                     'AppelNonConcl_Jour':           '',
                     'AppelNonConcl_Mois':           '',
                     'AppelNonConcl_Annee':          '',
                     'ServitudeCase':                '',
                     'PasClasseACase':               '',
                     'BranchementsCase':             '',
                     'Recommandations':              '',
                     'RubriquesGuide':               '',
                     'MiseHorsTension':              'HT_Possible',
                     'MesuresSecurite':              '',
                     'MesuresSecurite2':             '',
                     'DispositifsSecurite':          '',
                     'TelEndommagement':             '0546511433',
                     'Endommagement':                '',
                     'NomResponsableDossier':        u'Frédéric GAREL'.encode('utf-8').decode('utf-8'),
                     'DésignationService':           'Direction de la Voirie / Unité Topographie',
                     'TelResponsableDossier':        '0546515323',
                     'NomSignataire':                'Frédéric GAREL',
                     'JourRecepisse':                '09',
                     'MoisRecepisse':                '08',
                     'AnneeRecepisse':               '2018',
                     'NbPJ':                         '1',
                     'Recepisse_DICT':               '',
                     'Recepisse_DT':                 'Oui',
                     'Recepisse_DC':                 ''}

def main():
    u""" Fonction appelée par défaut. """
    __myParametres = ParametresRecepisse()

    print('dict_fieldName_fieldValue  = {}'.format(__myParametres.dict_fieldName_fieldValue))

    for fieldName, fieldValue in __myParametres.dict_fieldName_fieldValue.items():
        print(f'Name = {fieldName} ; Value = {fieldValue}')

if __name__ == '__main__':
    main()
