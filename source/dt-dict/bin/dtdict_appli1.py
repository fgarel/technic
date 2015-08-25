#!/usr/bin/env python

#
# Generated Thu Jul 16 17:09:59 2015 by generateDS.py version 2.16a.
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
#   ('--silence', '')
#
# Command line arguments:
#   schemaTeleservice_2_1.xsd
#
# Command line:
#   /usr/local/bin/generateDS.py -f -o "dtdict_api.py" -s "dtdict_appli1.py" --super="dtdict_api" --member-specs="dict" --external-encoding="utf-8" --export="write literal etree" --user-methods="gends_user_methods" --silence schemaTeleservice_2_1.xsd
#
# Current working directory (os.getcwd()):
#   bin
#

import sys
from lxml import etree as etree_

import dtdict_api as supermod

def parsexml_(infile, parser=None, **kwargs):
    if parser is None:
        # Use the lxml ElementTree compatible parser so that, e.g.,
        #   we ignore comments.
        parser = etree_.ETCompatXMLParser()
    doc = etree_.parse(infile, parser=parser, **kwargs)
    return doc

#
# Globals
#

ExternalEncoding = 'utf-8'

#
# Data representation classes
#


class dossierConsultationSub(supermod.dossierConsultation):
    def __init__(self, DT=None, DICT=None, dtDictConjointes=None, ATU=None, listeDesOuvrages=None):
        super(dossierConsultationSub, self).__init__(DT, DICT, dtDictConjointes, ATU, listeDesOuvrages, )
supermod.dossierConsultation.subclass = dossierConsultationSub
# end class dossierConsultationSub


class informationsDTSub(supermod.informationsDT):
    def __init__(self, noConsultationDuTeleserviceSeize=None, noConsultationDuTeleservice=None, noAffaireDuResponsableDuProjet=None, dateDeLaDeclaration=None, typeEntite=None, declarationConjointeDTDICT=None, responsableDuProjet=None, representantDuResponsableDeProjet=None, emplacementDuProjet=None, emprise=None, souhaitsPourLeRecepisse=None, projetEtSonCalendrier=None, investigationsComplementaires=None, signatureDuResponsableDuProjetOuDeSonRepresentant=None):
        super(informationsDTSub, self).__init__(noConsultationDuTeleserviceSeize, noConsultationDuTeleservice, noAffaireDuResponsableDuProjet, dateDeLaDeclaration, typeEntite, declarationConjointeDTDICT, responsableDuProjet, representantDuResponsableDeProjet, emplacementDuProjet, emprise, souhaitsPourLeRecepisse, projetEtSonCalendrier, investigationsComplementaires, signatureDuResponsableDuProjetOuDeSonRepresentant, )
supermod.informationsDT.subclass = informationsDTSub
# end class informationsDTSub


class informationsDTsimplifieeSub(supermod.informationsDTsimplifiee):
    def __init__(self, noConsultationDuTeleserviceSeize=None, noConsultationDuTeleservice=None, noAffaireDuResponsableDuProjet=None, dateDeLaDeclaration=None, typeEntite=None, declarationConjointeDTDICT=None, responsableDuProjet=None, representantDuResponsableDeProjet=None, emplacementDuProjet=None, emprise=None, souhaitsPourLeRecepisse=None, projetEtSonCalendrier=None, investigationsComplementaires=None, signatureDuResponsableDuProjetOuDeSonRepresentant=None):
        super(informationsDTsimplifieeSub, self).__init__(noConsultationDuTeleserviceSeize, noConsultationDuTeleservice, noAffaireDuResponsableDuProjet, dateDeLaDeclaration, typeEntite, declarationConjointeDTDICT, responsableDuProjet, representantDuResponsableDeProjet, emplacementDuProjet, emprise, souhaitsPourLeRecepisse, projetEtSonCalendrier, investigationsComplementaires, signatureDuResponsableDuProjetOuDeSonRepresentant, )
supermod.informationsDTsimplifiee.subclass = informationsDTsimplifieeSub
# end class informationsDTsimplifieeSub


class informationsDICTSub(supermod.informationsDICT):
    def __init__(self, noConsultationDuTeleservice=None, noAffaireDeLexecutantDesTravaux=None, dateDeLaDeclaration=None, natureDeLaDeclaration=None, executantDesTravaux=None, emplacementDesTravaux=None, emprise=None, souhaitsPourLeRecepisse=None, travauxEtLeurCalendrier=None, signatureDeLExecutantDesTravauxOuDeSonRepresentant=None, DtLiee=None):
        super(informationsDICTSub, self).__init__(noConsultationDuTeleservice, noAffaireDeLexecutantDesTravaux, dateDeLaDeclaration, natureDeLaDeclaration, executantDesTravaux, emplacementDesTravaux, emprise, souhaitsPourLeRecepisse, travauxEtLeurCalendrier, signatureDeLExecutantDesTravauxOuDeSonRepresentant, DtLiee, )
supermod.informationsDICT.subclass = informationsDICTSub
# end class informationsDICTSub


class informationsDtDictConjointesSub(supermod.informationsDtDictConjointes):
    def __init__(self, noConsultationDuTeleservice=None, dateDeLaDeclaration=None, partieDT=None, partieDICT=None, nomDuSignataire=None, nombrePagesJointes=None):
        super(informationsDtDictConjointesSub, self).__init__(noConsultationDuTeleservice, dateDeLaDeclaration, partieDT, partieDICT, nomDuSignataire, nombrePagesJointes, )
supermod.informationsDtDictConjointes.subclass = informationsDtDictConjointesSub
# end class informationsDtDictConjointesSub


class informationsATUSub(supermod.informationsATU):
    def __init__(self, noConsultationDuTeleservice=None, date=None, chantierTermineOuChantierAVenir=None, justificationDeLUrgence=None, personneOrdonnantLesTravauxUrgents=None, emprise=None, entrepriseChargeeDeLExecutionDesTravaux=None, travauxEmplacementDureeDescription=None, nomDuSignataire=None):
        super(informationsATUSub, self).__init__(noConsultationDuTeleservice, date, chantierTermineOuChantierAVenir, justificationDeLUrgence, personneOrdonnantLesTravauxUrgents, emprise, entrepriseChargeeDeLExecutionDesTravaux, travauxEmplacementDureeDescription, nomDuSignataire, )
supermod.informationsATU.subclass = informationsATUSub
# end class informationsATUSub


class investigationsComplementairesDTSub(supermod.investigationsComplementairesDT):
    def __init__(self, realisationDInvestigationsComplementaires=None, motifDeRealisationOuNonDInvestigation=None, dateDesInvestigationsComplementaires=None, InvestigationsSusceptibleDeNecessiterUneDICT=None, envoiDesResultatsAuxExploitantsDOuvragesEtAuxEntreprises=None):
        super(investigationsComplementairesDTSub, self).__init__(realisationDInvestigationsComplementaires, motifDeRealisationOuNonDInvestigation, dateDesInvestigationsComplementaires, InvestigationsSusceptibleDeNecessiterUneDICT, envoiDesResultatsAuxExploitantsDOuvragesEtAuxEntreprises, )
supermod.investigationsComplementairesDT.subclass = investigationsComplementairesDTSub
# end class investigationsComplementairesDTSub


class projetEtSonCalendrierSub(supermod.projetEtSonCalendrier):
    def __init__(self, natureDesTravaux=None, decrivezLeProjet=None, emploiDeTechniquesSansTranchees=None, distanceMinimaleEntreLesTravauxEtLaLigneElectrique=None, souhaitLesPlansDesReseauxElectriqueAeriens=None, datePrevuePourLeCommencementDesTravaux=None, dureeDuChantierEnJours=None, positionnementDesTravauxPrevusParLeDeclarant=None):
        super(projetEtSonCalendrierSub, self).__init__(natureDesTravaux, decrivezLeProjet, emploiDeTechniquesSansTranchees, distanceMinimaleEntreLesTravauxEtLaLigneElectrique, souhaitLesPlansDesReseauxElectriqueAeriens, datePrevuePourLeCommencementDesTravaux, dureeDuChantierEnJours, positionnementDesTravauxPrevusParLeDeclarant, )
supermod.projetEtSonCalendrier.subclass = projetEtSonCalendrierSub
# end class projetEtSonCalendrierSub


class projetEtSonCalendrierNonObligatoireSub(supermod.projetEtSonCalendrierNonObligatoire):
    def __init__(self, natureDesTravaux=None, decrivezLeProjet=None, emploiDeTechniquesSansTranchees=None, distanceMinimaleEntreLesTravauxEtLaLigneElectrique=None, souhaitLesPlansDesReseauxElectriqueAeriens=None, datePrevuePourLeCommencementDesTravaux=None, dureeDuChantierEnJours=None, positionnementDesTravauxPrevusParLeDeclarant=None):
        super(projetEtSonCalendrierNonObligatoireSub, self).__init__(natureDesTravaux, decrivezLeProjet, emploiDeTechniquesSansTranchees, distanceMinimaleEntreLesTravauxEtLaLigneElectrique, souhaitLesPlansDesReseauxElectriqueAeriens, datePrevuePourLeCommencementDesTravaux, dureeDuChantierEnJours, positionnementDesTravauxPrevusParLeDeclarant, )
supermod.projetEtSonCalendrierNonObligatoire.subclass = projetEtSonCalendrierNonObligatoireSub
# end class projetEtSonCalendrierNonObligatoireSub


class travauxEtLeurCalendrierSub(supermod.travauxEtLeurCalendrier):
    def __init__(self, natureDesTravaux=None, decrivezLesTravaux=None, techniquesUtilisees=None, autreTechnique=None, profondeurMaxDExcavation=None, modificationProfilTerrain=None, communicationResultatsInvestigations=None, distanceMinimaleEntreLesTravauxEtLaLigneElectrique=None, souhaitLesPlansDesReseauxElectriqueAeriens=None, datePrevuePourLeCommencementDesTravaux=None, dureeDuChantierEnJours=None, positionnementDesTravauxPrevusParLeDeclarant=None):
        super(travauxEtLeurCalendrierSub, self).__init__(natureDesTravaux, decrivezLesTravaux, techniquesUtilisees, autreTechnique, profondeurMaxDExcavation, modificationProfilTerrain, communicationResultatsInvestigations, distanceMinimaleEntreLesTravauxEtLaLigneElectrique, souhaitLesPlansDesReseauxElectriqueAeriens, datePrevuePourLeCommencementDesTravaux, dureeDuChantierEnJours, positionnementDesTravauxPrevusParLeDeclarant, )
supermod.travauxEtLeurCalendrier.subclass = travauxEtLeurCalendrierSub
# end class travauxEtLeurCalendrierSub


class responsableDuProjetSub(supermod.responsableDuProjet):
    def __init__(self, denomination=None, noSiret=None, pays=None):
        super(responsableDuProjetSub, self).__init__(denomination, noSiret, pays, )
supermod.responsableDuProjet.subclass = responsableDuProjetSub
# end class responsableDuProjetSub


class responsableDuProjetNonObligatoireSub(supermod.responsableDuProjetNonObligatoire):
    def __init__(self, denomination=None, noSiret=None, pays=None):
        super(responsableDuProjetNonObligatoireSub, self).__init__(denomination, noSiret, pays, )
supermod.responsableDuProjetNonObligatoire.subclass = responsableDuProjetNonObligatoireSub
# end class responsableDuProjetNonObligatoireSub


class responsableDuProjetSimplifieeSub(supermod.responsableDuProjetSimplifiee):
    def __init__(self, denomination=None, noSiret=None, pays=None):
        super(responsableDuProjetSimplifieeSub, self).__init__(denomination, noSiret, pays, )
supermod.responsableDuProjetSimplifiee.subclass = responsableDuProjetSimplifieeSub
# end class responsableDuProjetSimplifieeSub


class representantDuResponsableDeProjetSub(supermod.representantDuResponsableDeProjet):
    def __init__(self, denomination=None, complementService=None, numero=None, voie=None, lieuDitBP=None, codePostal=None, commune=None, personneAcontacter=None, tel=None, fax=None, courriel=None):
        super(representantDuResponsableDeProjetSub, self).__init__(denomination, complementService, numero, voie, lieuDitBP, codePostal, commune, personneAcontacter, tel, fax, courriel, )
supermod.representantDuResponsableDeProjet.subclass = representantDuResponsableDeProjetSub
# end class representantDuResponsableDeProjetSub


class representantDuResponsableDeProjetNonObligatoireSub(supermod.representantDuResponsableDeProjetNonObligatoire):
    def __init__(self, denomination=None, complementService=None, numero=None, voie=None, lieuDitBP=None, codePostal=None, commune=None, personneAcontacter=None, tel=None, fax=None, courriel=None):
        super(representantDuResponsableDeProjetNonObligatoireSub, self).__init__(denomination, complementService, numero, voie, lieuDitBP, codePostal, commune, personneAcontacter, tel, fax, courriel, )
supermod.representantDuResponsableDeProjetNonObligatoire.subclass = representantDuResponsableDeProjetNonObligatoireSub
# end class representantDuResponsableDeProjetNonObligatoireSub


class signatureDuResponsableDuProjetSub(supermod.signatureDuResponsableDuProjet):
    def __init__(self, nomDuSignataire=None, nombrePagesJointes=None):
        super(signatureDuResponsableDuProjetSub, self).__init__(nomDuSignataire, nombrePagesJointes, )
supermod.signatureDuResponsableDuProjet.subclass = signatureDuResponsableDuProjetSub
# end class signatureDuResponsableDuProjetSub


class signatureDeLExecutantDesTravauxSub(supermod.signatureDeLExecutantDesTravaux):
    def __init__(self, nomDuSignataire=None, nombrePagesJointes=None):
        super(signatureDeLExecutantDesTravauxSub, self).__init__(nomDuSignataire, nombrePagesJointes, )
supermod.signatureDeLExecutantDesTravaux.subclass = signatureDeLExecutantDesTravauxSub
# end class signatureDeLExecutantDesTravauxSub


class signatureDeLExecutantDesTravauxNonObligatoireSub(supermod.signatureDeLExecutantDesTravauxNonObligatoire):
    def __init__(self, nomDuSignataire=None, nombrePagesJointes=None):
        super(signatureDeLExecutantDesTravauxNonObligatoireSub, self).__init__(nomDuSignataire, nombrePagesJointes, )
supermod.signatureDeLExecutantDesTravauxNonObligatoire.subclass = signatureDeLExecutantDesTravauxNonObligatoireSub
# end class signatureDeLExecutantDesTravauxNonObligatoireSub


class travauxEmplacementDureeDescriptionATUSub(supermod.travauxEmplacementDureeDescriptionATU):
    def __init__(self, adresse=None, codePostal=None, commune=None, dateDebutDesTravaux=None, heureDebutDesTravaux=None, dureeTravauxDemiJournees=None, travauxEtMoyensMisEnOeuvre=None, positionnementDesTravauxPrevusParLeDeclarant=None, listeDesEmplacementsDesCommunesConcerneesATU=None):
        super(travauxEmplacementDureeDescriptionATUSub, self).__init__(adresse, codePostal, commune, dateDebutDesTravaux, heureDebutDesTravaux, dureeTravauxDemiJournees, travauxEtMoyensMisEnOeuvre, positionnementDesTravauxPrevusParLeDeclarant, listeDesEmplacementsDesCommunesConcerneesATU, )
supermod.travauxEmplacementDureeDescriptionATU.subclass = travauxEmplacementDureeDescriptionATUSub
# end class travauxEmplacementDureeDescriptionATUSub


class entrepriseChargeeDeLExecutionDesTravauxATUSub(supermod.entrepriseChargeeDeLExecutionDesTravauxATU):
    def __init__(self, nom=None, adresse=None, codePostal=None, commune=None):
        super(entrepriseChargeeDeLExecutionDesTravauxATUSub, self).__init__(nom, adresse, codePostal, commune, )
supermod.entrepriseChargeeDeLExecutionDesTravauxATU.subclass = entrepriseChargeeDeLExecutionDesTravauxATUSub
# end class entrepriseChargeeDeLExecutionDesTravauxATUSub


class pourLesReseauxSensiblesPourLaSecuriteReponseAttendueOuNonAttendueSub(supermod.pourLesReseauxSensiblesPourLaSecuriteReponseAttendueOuNonAttendue):
    def __init__(self, pasDeReponseAFournirChantierTermine=None, reponseAttendueChantierAVenir=None):
        super(pourLesReseauxSensiblesPourLaSecuriteReponseAttendueOuNonAttendueSub, self).__init__(pasDeReponseAFournirChantierTermine, reponseAttendueChantierAVenir, )
supermod.pourLesReseauxSensiblesPourLaSecuriteReponseAttendueOuNonAttendue.subclass = pourLesReseauxSensiblesPourLaSecuriteReponseAttendueOuNonAttendueSub
# end class pourLesReseauxSensiblesPourLaSecuriteReponseAttendueOuNonAttendueSub


class pourLesReseauxSensiblesATUSub(supermod.pourLesReseauxSensiblesATU):
    def __init__(self, nomDuRepresentantDeLExploitantContacte=None, dateDuContactTelephonique=None, heureDuContactTelephonique=None):
        super(pourLesReseauxSensiblesATUSub, self).__init__(nomDuRepresentantDeLExploitantContacte, dateDuContactTelephonique, heureDuContactTelephonique, )
supermod.pourLesReseauxSensiblesATU.subclass = pourLesReseauxSensiblesATUSub
# end class pourLesReseauxSensiblesATUSub


class justificationDeLUrgenceATUSub(supermod.justificationDeLUrgenceATU):
    def __init__(self, securite=None, continuiteDuServicePublic=None, sauvegardeDesPersonnesEtDesBiens=None, casDeForceMajeure=None):
        super(justificationDeLUrgenceATUSub, self).__init__(securite, continuiteDuServicePublic, sauvegardeDesPersonnesEtDesBiens, casDeForceMajeure, )
supermod.justificationDeLUrgenceATU.subclass = justificationDeLUrgenceATUSub
# end class justificationDeLUrgenceATUSub


class empriseSub(supermod.emprise):
    def __init__(self, geometrie=None, surface=None, referenceDelaCarte=None):
        super(empriseSub, self).__init__(geometrie, surface, referenceDelaCarte, )
supermod.emprise.subclass = empriseSub
# end class empriseSub


class empriseNonObligatoireSub(supermod.empriseNonObligatoire):
    def __init__(self, geometrie=None, surface=None, referenceDelaCarte=None):
        super(empriseNonObligatoireSub, self).__init__(geometrie, surface, referenceDelaCarte, )
supermod.empriseNonObligatoire.subclass = empriseNonObligatoireSub
# end class empriseNonObligatoireSub


class identificationPersonneSub(supermod.identificationPersonne):
    def __init__(self, denomination=None, complementService=None, numero=None, voie=None, lieuDitBP=None, codePostal=None, commune=None, pays=None, noSiret=None, nomDeLaPersonneAContacter=None, tel=None, fax=None, courriel=None):
        super(identificationPersonneSub, self).__init__(denomination, complementService, numero, voie, lieuDitBP, codePostal, commune, pays, noSiret, nomDeLaPersonneAContacter, tel, fax, courriel, )
supermod.identificationPersonne.subclass = identificationPersonneSub
# end class identificationPersonneSub


class identificationPersonneATUSub(supermod.identificationPersonneATU):
    def __init__(self, nom=None, complementDAdresse=None, numero=None, voie=None, lieuDitBP=None, codePostal=None, commune=None, pays=None, noSiret=None, nomDeLaPersonneAContacter=None, tel=None, fax=None, courriel=None):
        super(identificationPersonneATUSub, self).__init__(nom, complementDAdresse, numero, voie, lieuDitBP, codePostal, commune, pays, noSiret, nomDeLaPersonneAContacter, tel, fax, courriel, )
supermod.identificationPersonneATU.subclass = identificationPersonneATUSub
# end class identificationPersonneATUSub


class localisationChantierSub(supermod.localisationChantier):
    def __init__(self, adresse=None, CP=None, communePrincipale=None, codeINSEE=None, nombreDeCommunes=None, listeDesEmplacementsDesCommunesConcernees=None):
        super(localisationChantierSub, self).__init__(adresse, CP, communePrincipale, codeINSEE, nombreDeCommunes, listeDesEmplacementsDesCommunesConcernees, )
supermod.localisationChantier.subclass = localisationChantierSub
# end class localisationChantierSub


class localisationChantierNonObligatoireSub(supermod.localisationChantierNonObligatoire):
    def __init__(self, adresse=None, CP=None, communePrincipale=None, codeINSEE=None, nombreDeCommunes=None, listeDesEmplacementsDesCommunesConcernees=None):
        super(localisationChantierNonObligatoireSub, self).__init__(adresse, CP, communePrincipale, codeINSEE, nombreDeCommunes, listeDesEmplacementsDesCommunesConcernees, )
supermod.localisationChantierNonObligatoire.subclass = localisationChantierNonObligatoireSub
# end class localisationChantierNonObligatoireSub


class emplacementSub(supermod.emplacement):
    def __init__(self, emplacementDeLaCommuneConcernee=None):
        super(emplacementSub, self).__init__(emplacementDeLaCommuneConcernee, )
supermod.emplacement.subclass = emplacementSub
# end class emplacementSub


class souhaitsPourLeRecepisseSub(supermod.souhaitsPourLeRecepisse):
    def __init__(self, souhaiteRecevoirLeRecepisse=None, modeReceptionElectronique=None, modeReceptionCourrier=None, modeReceptionFax=None):
        super(souhaitsPourLeRecepisseSub, self).__init__(souhaiteRecevoirLeRecepisse, modeReceptionElectronique, modeReceptionCourrier, modeReceptionFax, )
supermod.souhaitsPourLeRecepisse.subclass = souhaitsPourLeRecepisseSub
# end class souhaitsPourLeRecepisseSub


class souhaitsPourLeRecepisseDICTSub(supermod.souhaitsPourLeRecepisseDICT):
    def __init__(self, modeReceptionElectronique=None, modeReceptionCourrier=None, modeReceptionFax=None):
        super(souhaitsPourLeRecepisseDICTSub, self).__init__(modeReceptionElectronique, modeReceptionCourrier, modeReceptionFax, )
supermod.souhaitsPourLeRecepisseDICT.subclass = souhaitsPourLeRecepisseDICTSub
# end class souhaitsPourLeRecepisseDICTSub


class modeReceptionElectroniqueSub(supermod.modeReceptionElectronique):
    def __init__(self, tailleDesPlans=None, couleurDesPlans=None, souhaitDePlansVectoriels=None, formatDesPlansVectoriels=None):
        super(modeReceptionElectroniqueSub, self).__init__(tailleDesPlans, couleurDesPlans, souhaitDePlansVectoriels, formatDesPlansVectoriels, )
supermod.modeReceptionElectronique.subclass = modeReceptionElectroniqueSub
# end class modeReceptionElectroniqueSub


class modeReceptionCourrierSub(supermod.modeReceptionCourrier):
    def __init__(self):
        super(modeReceptionCourrierSub, self).__init__()
supermod.modeReceptionCourrier.subclass = modeReceptionCourrierSub
# end class modeReceptionCourrierSub


class modeReceptionFaxSub(supermod.modeReceptionFax):
    def __init__(self):
        super(modeReceptionFaxSub, self).__init__()
supermod.modeReceptionFax.subclass = modeReceptionFaxSub
# end class modeReceptionFaxSub


class contactSub(supermod.contact):
    def __init__(self, nom=None, prenom=None, societe=None, agence=None, complement=None, numero=None, voie=None, lieuDitBP=None, codePostal=None, commune=None, codePays=None, fax=None, courriel=None, telephone=None, telephoneUrgence=None, faxUrgence=None, mailUrgence=None, telEndommagement=None, consigne=None, referenceInterne=None, site=None, gestionDesFichiersDematerialises=None):
        super(contactSub, self).__init__(nom, prenom, societe, agence, complement, numero, voie, lieuDitBP, codePostal, commune, codePays, fax, courriel, telephone, telephoneUrgence, faxUrgence, mailUrgence, telEndommagement, consigne, referenceInterne, site, gestionDesFichiersDematerialises, )
supermod.contact.subclass = contactSub
# end class contactSub


class ouvrageSub(supermod.ouvrage):
    def __init__(self, contact=None, pourLesReseauxSensiblesPourLaSecuriteUniquement=None, categorieOuvrage=None, classeOuvrage=None, positionnementOuvrage=None, codeOuvrage=None, denominationOuvrage=None, statut=None, dateCreation=None, polygoneConcerne=None):
        super(ouvrageSub, self).__init__(contact, pourLesReseauxSensiblesPourLaSecuriteUniquement, categorieOuvrage, classeOuvrage, positionnementOuvrage, codeOuvrage, denominationOuvrage, statut, dateCreation, polygoneConcerne, )
supermod.ouvrage.subclass = ouvrageSub
# end class ouvrageSub


class gestionDesFichiersDematerialisesSub(supermod.gestionDesFichiersDematerialises):
    def __init__(self, gereLesFichiersDematerialises=None, formatDesFichiersDematerialises=None):
        super(gestionDesFichiersDematerialisesSub, self).__init__(gereLesFichiersDematerialises, formatDesFichiersDematerialises, )
supermod.gestionDesFichiersDematerialises.subclass = gestionDesFichiersDematerialisesSub
# end class gestionDesFichiersDematerialisesSub


class ouvragesSub(supermod.ouvrages):
    def __init__(self, ouvrage=None):
        super(ouvragesSub, self).__init__(ouvrage, )
supermod.ouvrages.subclass = ouvragesSub
# end class ouvragesSub


class IndividuTypeSub(supermod.IndividuType):
    def __init__(self, Noms=None, Prenoms=None, Naissance=None, Sexe=None, Deces=None, Filiation=None):
        super(IndividuTypeSub, self).__init__(Noms, Prenoms, Naissance, Sexe, Deces, Filiation, )
supermod.IndividuType.subclass = IndividuTypeSub
# end class IndividuTypeSub


class IndividuSansFiliationTypeSub(supermod.IndividuSansFiliationType):
    def __init__(self, Noms=None, Prenoms=None, Naissance=None, Sexe=None, Deces=None, Filiation=None):
        super(IndividuSansFiliationTypeSub, self).__init__(Noms, Prenoms, Naissance, Sexe, Deces, Filiation, )
supermod.IndividuSansFiliationType.subclass = IndividuSansFiliationTypeSub
# end class IndividuSansFiliationTypeSub


class NomsEtatCivilTypeSub(supermod.NomsEtatCivilType):
    def __init__(self, NomFamille=None, NomUsage=None, Pseudonyme=None):
        super(NomsEtatCivilTypeSub, self).__init__(NomFamille, NomUsage, Pseudonyme, )
supermod.NomsEtatCivilType.subclass = NomsEtatCivilTypeSub
# end class NomsEtatCivilTypeSub


class NomDeFamilleSeulTypeSub(supermod.NomDeFamilleSeulType):
    def __init__(self, NomFamille=None):
        super(NomDeFamilleSeulTypeSub, self).__init__(NomFamille, )
supermod.NomDeFamilleSeulType.subclass = NomDeFamilleSeulTypeSub
# end class NomDeFamilleSeulTypeSub


class PrenomsEtatCivilTypeSub(supermod.PrenomsEtatCivilType):
    def __init__(self, PrenomUsuel=None, Prenom=None):
        super(PrenomsEtatCivilTypeSub, self).__init__(PrenomUsuel, Prenom, )
supermod.PrenomsEtatCivilType.subclass = PrenomsEtatCivilTypeSub
# end class PrenomsEtatCivilTypeSub


class PrenomsOfficielsSeulsTypeSub(supermod.PrenomsOfficielsSeulsType):
    def __init__(self, Prenom=None):
        super(PrenomsOfficielsSeulsTypeSub, self).__init__(Prenom, )
supermod.PrenomsOfficielsSeulsType.subclass = PrenomsOfficielsSeulsTypeSub
# end class PrenomsOfficielsSeulsTypeSub


class NaissanceTypeSub(supermod.NaissanceType):
    def __init__(self, DateNaissance=None, LieuNaissance=None, NumeroActeNaissance=None):
        super(NaissanceTypeSub, self).__init__(DateNaissance, LieuNaissance, NumeroActeNaissance, )
supermod.NaissanceType.subclass = NaissanceTypeSub
# end class NaissanceTypeSub


class DecesTypeSub(supermod.DecesType):
    def __init__(self, TypeDeces=None, DateDeces=None, LieuDeces=None, NumeroActeDeces=None):
        super(DecesTypeSub, self).__init__(TypeDeces, DateDeces, LieuDeces, NumeroActeDeces, )
supermod.DecesType.subclass = DecesTypeSub
# end class DecesTypeSub


class LieuTypeSub(supermod.LieuType):
    def __init__(self, Localite=None, DivisionTerritoriale=None, Pays=None):
        super(LieuTypeSub, self).__init__(Localite, DivisionTerritoriale, Pays, )
supermod.LieuType.subclass = LieuTypeSub
# end class LieuTypeSub


class ElementLieuTypeSub(supermod.ElementLieuType):
    def __init__(self, code=None, valueOf_=None):
        super(ElementLieuTypeSub, self).__init__(code, valueOf_, )
supermod.ElementLieuType.subclass = ElementLieuTypeSub
# end class ElementLieuTypeSub


class PaysTypeSub(supermod.PaysType):
    def __init__(self, code=None, valueOf_=None):
        super(PaysTypeSub, self).__init__(code, valueOf_, )
supermod.PaysType.subclass = PaysTypeSub
# end class PaysTypeSub


class AdresseGeopostaleTypeSub(supermod.AdresseGeopostaleType):
    def __init__(self, AdresseGeographique=None, AdressePostale=None):
        super(AdresseGeopostaleTypeSub, self).__init__(AdresseGeographique, AdressePostale, )
supermod.AdresseGeopostaleType.subclass = AdresseGeopostaleTypeSub
# end class AdresseGeopostaleTypeSub


class AdresseGeographiqueTypeSub(supermod.AdresseGeographiqueType):
    def __init__(self, PointRemise=None, Complement=None, NumeroVoie=None, Extension=None, TypeVoie=None, NomVoie=None, LieuDit=None, MentionDistribution=None, Cedex=None, LibelleBureauCedex=None, CodePostal=None, Localite=None, DivisionTerritoriale=None, Pays=None):
        super(AdresseGeographiqueTypeSub, self).__init__(PointRemise, Complement, NumeroVoie, Extension, TypeVoie, NomVoie, LieuDit, MentionDistribution, Cedex, LibelleBureauCedex, CodePostal, Localite, DivisionTerritoriale, Pays, )
supermod.AdresseGeographiqueType.subclass = AdresseGeographiqueTypeSub
# end class AdresseGeographiqueTypeSub


class AdressePostaleTypeSub(supermod.AdressePostaleType):
    def __init__(self, LigneUne=None, LigneDeux=None, LigneTrois=None, LigneQuatre=None, LigneCinq=None, LigneSix=None, LigneSept=None):
        super(AdressePostaleTypeSub, self).__init__(LigneUne, LigneDeux, LigneTrois, LigneQuatre, LigneCinq, LigneSix, LigneSept, )
supermod.AdressePostaleType.subclass = AdressePostaleTypeSub
# end class AdressePostaleTypeSub


class SIRETStructureTypeSub(supermod.SIRETStructureType):
    def __init__(self, SIREN=None, NIC=None):
        super(SIRETStructureTypeSub, self).__init__(SIREN, NIC, )
supermod.SIRETStructureType.subclass = SIRETStructureTypeSub
# end class SIRETStructureTypeSub


class SIRET_ctypeSub(supermod.SIRET_ctype):
    def __init__(self, SIREN=None, NIC=None):
        super(SIRET_ctypeSub, self).__init__(SIREN, NIC, )
supermod.SIRET_ctype.subclass = SIRET_ctypeSub
# end class SIRET_ctypeSub


class HistoryPropertyTypeSub(supermod.HistoryPropertyType):
    def __init__(self, owns='false', AbstractTimeSlice=None):
        super(HistoryPropertyTypeSub, self).__init__(owns, AbstractTimeSlice, )
supermod.HistoryPropertyType.subclass = HistoryPropertyTypeSub
# end class HistoryPropertyTypeSub


class FeaturePropertyTypeSub(supermod.FeaturePropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, AbstractFeature=None):
        super(FeaturePropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, AbstractFeature, )
supermod.FeaturePropertyType.subclass = FeaturePropertyTypeSub
# end class FeaturePropertyTypeSub


class BoundingShapeTypeSub(supermod.BoundingShapeType):
    def __init__(self, nilReason=None, Envelope=None, Null=None):
        super(BoundingShapeTypeSub, self).__init__(nilReason, Envelope, Null, )
supermod.BoundingShapeType.subclass = BoundingShapeTypeSub
# end class BoundingShapeTypeSub


class AbstractFeatureMemberTypeSub(supermod.AbstractFeatureMemberType):
    def __init__(self, owns='false', extensiontype_=None):
        super(AbstractFeatureMemberTypeSub, self).__init__(owns, extensiontype_, )
supermod.AbstractFeatureMemberType.subclass = AbstractFeatureMemberTypeSub
# end class AbstractFeatureMemberTypeSub


class MultiGeometryPropertyTypeSub(supermod.MultiGeometryPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractGeometricAggregate=None):
        super(MultiGeometryPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractGeometricAggregate, )
supermod.MultiGeometryPropertyType.subclass = MultiGeometryPropertyTypeSub
# end class MultiGeometryPropertyTypeSub


class MultiPointPropertyTypeSub(supermod.MultiPointPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, MultiPoint=None):
        super(MultiPointPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, MultiPoint, )
supermod.MultiPointPropertyType.subclass = MultiPointPropertyTypeSub
# end class MultiPointPropertyTypeSub


class MultiCurvePropertyTypeSub(supermod.MultiCurvePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, MultiCurve=None):
        super(MultiCurvePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, MultiCurve, )
supermod.MultiCurvePropertyType.subclass = MultiCurvePropertyTypeSub
# end class MultiCurvePropertyTypeSub


class MultiSurfacePropertyTypeSub(supermod.MultiSurfacePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, MultiSurface=None):
        super(MultiSurfacePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, MultiSurface, )
supermod.MultiSurfacePropertyType.subclass = MultiSurfacePropertyTypeSub
# end class MultiSurfacePropertyTypeSub


class MultiSolidPropertyTypeSub(supermod.MultiSolidPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, MultiSolid=None):
        super(MultiSolidPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, MultiSolid, )
supermod.MultiSolidPropertyType.subclass = MultiSolidPropertyTypeSub
# end class MultiSolidPropertyTypeSub


class AbstractCurveSegmentTypeSub(supermod.AbstractCurveSegmentType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', extensiontype_=None):
        super(AbstractCurveSegmentTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, extensiontype_, )
supermod.AbstractCurveSegmentType.subclass = AbstractCurveSegmentTypeSub
# end class AbstractCurveSegmentTypeSub


class CurveSegmentArrayPropertyTypeSub(supermod.CurveSegmentArrayPropertyType):
    def __init__(self, AbstractCurveSegment=None):
        super(CurveSegmentArrayPropertyTypeSub, self).__init__(AbstractCurveSegment, )
supermod.CurveSegmentArrayPropertyType.subclass = CurveSegmentArrayPropertyTypeSub
# end class CurveSegmentArrayPropertyTypeSub


class LineStringSegmentTypeSub(supermod.LineStringSegmentType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', interpolation=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None):
        super(LineStringSegmentTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, interpolation, pos, pointProperty, pointRep, posList, coordinates, )
supermod.LineStringSegmentType.subclass = LineStringSegmentTypeSub
# end class LineStringSegmentTypeSub


class ArcStringTypeSub(supermod.ArcStringType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', numArc=None, interpolation=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None):
        super(ArcStringTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, numArc, interpolation, pos, pointProperty, pointRep, posList, coordinates, )
supermod.ArcStringType.subclass = ArcStringTypeSub
# end class ArcStringTypeSub


class ArcTypeSub(supermod.ArcType):
    def __init__(self, numArc=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, extensiontype_=None):
        super(ArcTypeSub, self).__init__(numArc, pos, pointProperty, pointRep, posList, coordinates, extensiontype_, )
supermod.ArcType.subclass = ArcTypeSub
# end class ArcTypeSub


class CircleTypeSub(supermod.CircleType):
    def __init__(self, numArc=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None):
        super(CircleTypeSub, self).__init__(numArc, pos, pointProperty, pointRep, posList, coordinates, )
supermod.CircleType.subclass = CircleTypeSub
# end class CircleTypeSub


class ArcStringByBulgeTypeSub(supermod.ArcStringByBulgeType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', numArc=None, interpolation=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, bulge=None, normal=None):
        super(ArcStringByBulgeTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, numArc, interpolation, pos, pointProperty, pointRep, posList, coordinates, bulge, normal, )
supermod.ArcStringByBulgeType.subclass = ArcStringByBulgeTypeSub
# end class ArcStringByBulgeTypeSub


class ArcByBulgeTypeSub(supermod.ArcByBulgeType):
    def __init__(self, numArc=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, bulge=None, normal=None):
        super(ArcByBulgeTypeSub, self).__init__(numArc, pos, pointProperty, pointRep, posList, coordinates, bulge, normal, )
supermod.ArcByBulgeType.subclass = ArcByBulgeTypeSub
# end class ArcByBulgeTypeSub


class ArcByCenterPointTypeSub(supermod.ArcByCenterPointType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', numArc=None, interpolation=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, radius=None, startAngle=None, endAngle=None):
        super(ArcByCenterPointTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, numArc, interpolation, pos, pointProperty, pointRep, posList, coordinates, radius, startAngle, endAngle, )
supermod.ArcByCenterPointType.subclass = ArcByCenterPointTypeSub
# end class ArcByCenterPointTypeSub


class CircleByCenterPointTypeSub(supermod.CircleByCenterPointType):
    def __init__(self, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, radius=None):
        super(CircleByCenterPointTypeSub, self).__init__(pos, pointProperty, pointRep, posList, coordinates, radius, )
supermod.CircleByCenterPointType.subclass = CircleByCenterPointTypeSub
# end class CircleByCenterPointTypeSub


class CubicSplineTypeSub(supermod.CubicSplineType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', degree=None, interpolation=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, vectorAtStart=None, vectorAtEnd=None):
        super(CubicSplineTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, degree, interpolation, pos, pointProperty, pointRep, posList, coordinates, vectorAtStart, vectorAtEnd, )
supermod.CubicSplineType.subclass = CubicSplineTypeSub
# end class CubicSplineTypeSub


class BSplineTypeSub(supermod.BSplineType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', knotType=None, isPolynomial=None, interpolation='polynomialSpline', pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, degree=None, knot=None):
        super(BSplineTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, knotType, isPolynomial, interpolation, pos, pointProperty, pointRep, posList, coordinates, degree, knot, )
supermod.BSplineType.subclass = BSplineTypeSub
# end class BSplineTypeSub


class KnotTypeSub(supermod.KnotType):
    def __init__(self, value=None, multiplicity=None, weight=None):
        super(KnotTypeSub, self).__init__(value, multiplicity, weight, )
supermod.KnotType.subclass = KnotTypeSub
# end class KnotTypeSub


class KnotPropertyTypeSub(supermod.KnotPropertyType):
    def __init__(self, Knot=None):
        super(KnotPropertyTypeSub, self).__init__(Knot, )
supermod.KnotPropertyType.subclass = KnotPropertyTypeSub
# end class KnotPropertyTypeSub


class BezierTypeSub(supermod.BezierType):
    def __init__(self, knotType=None, isPolynomial=None, interpolation=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None, degree=None, knot=None):
        super(BezierTypeSub, self).__init__(knotType, isPolynomial, interpolation, pos, pointProperty, pointRep, posList, coordinates, degree, knot, )
supermod.BezierType.subclass = BezierTypeSub
# end class BezierTypeSub


class OffsetCurveTypeSub(supermod.OffsetCurveType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', offsetBase=None, distance=None, refDirection=None):
        super(OffsetCurveTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, offsetBase, distance, refDirection, )
supermod.OffsetCurveType.subclass = OffsetCurveTypeSub
# end class OffsetCurveTypeSub


class AffinePlacementTypeSub(supermod.AffinePlacementType):
    def __init__(self, location=None, refDirection=None, inDimension=None, outDimension=None):
        super(AffinePlacementTypeSub, self).__init__(location, refDirection, inDimension, outDimension, )
supermod.AffinePlacementType.subclass = AffinePlacementTypeSub
# end class AffinePlacementTypeSub


class ClothoidTypeSub(supermod.ClothoidType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', interpolation=None, refLocation=None, scaleFactor=None, startParameter=None, endParameter=None):
        super(ClothoidTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, interpolation, refLocation, scaleFactor, startParameter, endParameter, )
supermod.ClothoidType.subclass = ClothoidTypeSub
# end class ClothoidTypeSub


class GeodesicStringTypeSub(supermod.GeodesicStringType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', interpolation=None, posList=None, pos=None, pointProperty=None, extensiontype_=None):
        super(GeodesicStringTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, interpolation, posList, pos, pointProperty, extensiontype_, )
supermod.GeodesicStringType.subclass = GeodesicStringTypeSub
# end class GeodesicStringTypeSub


class GeodesicTypeSub(supermod.GeodesicType):
    def __init__(self, numDerivativesAtEnd='0', numDerivativeInterior='0', numDerivativesAtStart='0', interpolation=None, posList=None, pos=None, pointProperty=None):
        super(GeodesicTypeSub, self).__init__(numDerivativesAtEnd, numDerivativeInterior, numDerivativesAtStart, interpolation, posList, pos, pointProperty, )
supermod.GeodesicType.subclass = GeodesicTypeSub
# end class GeodesicTypeSub


class AbstractSurfacePatchTypeSub(supermod.AbstractSurfacePatchType):
    def __init__(self, extensiontype_=None):
        super(AbstractSurfacePatchTypeSub, self).__init__(extensiontype_, )
supermod.AbstractSurfacePatchType.subclass = AbstractSurfacePatchTypeSub
# end class AbstractSurfacePatchTypeSub


class SurfacePatchArrayPropertyTypeSub(supermod.SurfacePatchArrayPropertyType):
    def __init__(self, AbstractSurfacePatch=None):
        super(SurfacePatchArrayPropertyTypeSub, self).__init__(AbstractSurfacePatch, )
supermod.SurfacePatchArrayPropertyType.subclass = SurfacePatchArrayPropertyTypeSub
# end class SurfacePatchArrayPropertyTypeSub


class PolygonPatchTypeSub(supermod.PolygonPatchType):
    def __init__(self, interpolation=None, exterior=None, interior=None):
        super(PolygonPatchTypeSub, self).__init__(interpolation, exterior, interior, )
supermod.PolygonPatchType.subclass = PolygonPatchTypeSub
# end class PolygonPatchTypeSub


class TriangleTypeSub(supermod.TriangleType):
    def __init__(self, interpolation=None, exterior=None):
        super(TriangleTypeSub, self).__init__(interpolation, exterior, )
supermod.TriangleType.subclass = TriangleTypeSub
# end class TriangleTypeSub


class RectangleTypeSub(supermod.RectangleType):
    def __init__(self, interpolation=None, exterior=None):
        super(RectangleTypeSub, self).__init__(interpolation, exterior, )
supermod.RectangleType.subclass = RectangleTypeSub
# end class RectangleTypeSub


class RingPropertyTypeSub(supermod.RingPropertyType):
    def __init__(self, Ring=None):
        super(RingPropertyTypeSub, self).__init__(Ring, )
supermod.RingPropertyType.subclass = RingPropertyTypeSub
# end class RingPropertyTypeSub


class AbstractParametricCurveSurfaceTypeSub(supermod.AbstractParametricCurveSurfaceType):
    def __init__(self, aggregationType=None, extensiontype_=None):
        super(AbstractParametricCurveSurfaceTypeSub, self).__init__(aggregationType, extensiontype_, )
supermod.AbstractParametricCurveSurfaceType.subclass = AbstractParametricCurveSurfaceTypeSub
# end class AbstractParametricCurveSurfaceTypeSub


class AbstractGriddedSurfaceTypeSub(supermod.AbstractGriddedSurfaceType):
    def __init__(self, aggregationType=None, rows_attr=None, columns=None, rows=None, extensiontype_=None):
        super(AbstractGriddedSurfaceTypeSub, self).__init__(aggregationType, rows_attr, columns, rows, extensiontype_, )
supermod.AbstractGriddedSurfaceType.subclass = AbstractGriddedSurfaceTypeSub
# end class AbstractGriddedSurfaceTypeSub


class ConeTypeSub(supermod.ConeType):
    def __init__(self, aggregationType=None, rows_attr=None, columns=None, rows=None, horizontalCurveType=None, verticalCurveType=None):
        super(ConeTypeSub, self).__init__(aggregationType, rows_attr, columns, rows, horizontalCurveType, verticalCurveType, )
supermod.ConeType.subclass = ConeTypeSub
# end class ConeTypeSub


class CylinderTypeSub(supermod.CylinderType):
    def __init__(self, aggregationType=None, rows_attr=None, columns=None, rows=None, horizontalCurveType=None, verticalCurveType=None):
        super(CylinderTypeSub, self).__init__(aggregationType, rows_attr, columns, rows, horizontalCurveType, verticalCurveType, )
supermod.CylinderType.subclass = CylinderTypeSub
# end class CylinderTypeSub


class SphereTypeSub(supermod.SphereType):
    def __init__(self, aggregationType=None, rows_attr=None, columns=None, rows=None, horizontalCurveType=None, verticalCurveType=None):
        super(SphereTypeSub, self).__init__(aggregationType, rows_attr, columns, rows, horizontalCurveType, verticalCurveType, )
supermod.SphereType.subclass = SphereTypeSub
# end class SphereTypeSub


class LineStringSegmentArrayPropertyTypeSub(supermod.LineStringSegmentArrayPropertyType):
    def __init__(self, LineStringSegment=None):
        super(LineStringSegmentArrayPropertyTypeSub, self).__init__(LineStringSegment, )
supermod.LineStringSegmentArrayPropertyType.subclass = LineStringSegmentArrayPropertyTypeSub
# end class LineStringSegmentArrayPropertyTypeSub


class SolidPropertyTypeSub(supermod.SolidPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractSolid=None):
        super(SolidPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractSolid, )
supermod.SolidPropertyType.subclass = SolidPropertyTypeSub
# end class SolidPropertyTypeSub


class SolidArrayPropertyTypeSub(supermod.SolidArrayPropertyType):
    def __init__(self, owns='false', AbstractSolid=None):
        super(SolidArrayPropertyTypeSub, self).__init__(owns, AbstractSolid, )
supermod.SolidArrayPropertyType.subclass = SolidArrayPropertyTypeSub
# end class SolidArrayPropertyTypeSub


class ShellTypeSub(supermod.ShellType):
    def __init__(self, aggregationType=None, surfaceMember=None):
        super(ShellTypeSub, self).__init__(aggregationType, surfaceMember, )
supermod.ShellType.subclass = ShellTypeSub
# end class ShellTypeSub


class ShellPropertyTypeSub(supermod.ShellPropertyType):
    def __init__(self, Shell=None):
        super(ShellPropertyTypeSub, self).__init__(Shell, )
supermod.ShellPropertyType.subclass = ShellPropertyTypeSub
# end class ShellPropertyTypeSub


class SurfacePropertyTypeSub(supermod.SurfacePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractSurface=None):
        super(SurfacePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractSurface, )
supermod.SurfacePropertyType.subclass = SurfacePropertyTypeSub
# end class SurfacePropertyTypeSub


class SurfaceArrayPropertyTypeSub(supermod.SurfaceArrayPropertyType):
    def __init__(self, owns='false', AbstractSurface=None):
        super(SurfaceArrayPropertyTypeSub, self).__init__(owns, AbstractSurface, )
supermod.SurfaceArrayPropertyType.subclass = SurfaceArrayPropertyTypeSub
# end class SurfaceArrayPropertyTypeSub


class AbstractRingTypeSub(supermod.AbstractRingType):
    def __init__(self, extensiontype_=None):
        super(AbstractRingTypeSub, self).__init__(extensiontype_, )
supermod.AbstractRingType.subclass = AbstractRingTypeSub
# end class AbstractRingTypeSub


class AbstractRingPropertyTypeSub(supermod.AbstractRingPropertyType):
    def __init__(self, AbstractRing=None):
        super(AbstractRingPropertyTypeSub, self).__init__(AbstractRing, )
supermod.AbstractRingPropertyType.subclass = AbstractRingPropertyTypeSub
# end class AbstractRingPropertyTypeSub


class LinearRingTypeSub(supermod.LinearRingType):
    def __init__(self, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None):
        super(LinearRingTypeSub, self).__init__(pos, pointProperty, pointRep, posList, coordinates, )
supermod.LinearRingType.subclass = LinearRingTypeSub
# end class LinearRingTypeSub


class LinearRingPropertyTypeSub(supermod.LinearRingPropertyType):
    def __init__(self, LinearRing=None):
        super(LinearRingPropertyTypeSub, self).__init__(LinearRing, )
supermod.LinearRingPropertyType.subclass = LinearRingPropertyTypeSub
# end class LinearRingPropertyTypeSub


class GeometryPropertyTypeSub(supermod.GeometryPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractGeometry=None):
        super(GeometryPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractGeometry, )
supermod.GeometryPropertyType.subclass = GeometryPropertyTypeSub
# end class GeometryPropertyTypeSub


class GeometryArrayPropertyTypeSub(supermod.GeometryArrayPropertyType):
    def __init__(self, owns='false', AbstractGeometry=None):
        super(GeometryArrayPropertyTypeSub, self).__init__(owns, AbstractGeometry, )
supermod.GeometryArrayPropertyType.subclass = GeometryArrayPropertyTypeSub
# end class GeometryArrayPropertyTypeSub


class DirectPositionTypeSub(supermod.DirectPositionType):
    def __init__(self, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, valueOf_=None, extensiontype_=None):
        super(DirectPositionTypeSub, self).__init__(srsName, axisLabels, uomLabels, srsDimension, valueOf_, extensiontype_, )
supermod.DirectPositionType.subclass = DirectPositionTypeSub
# end class DirectPositionTypeSub


class DirectPositionListTypeSub(supermod.DirectPositionListType):
    def __init__(self, count=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, valueOf_=None):
        super(DirectPositionListTypeSub, self).__init__(count, srsName, axisLabels, uomLabels, srsDimension, valueOf_, )
supermod.DirectPositionListType.subclass = DirectPositionListTypeSub
# end class DirectPositionListTypeSub


class VectorTypeSub(supermod.VectorType):
    def __init__(self, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, valueOf_=None):
        super(VectorTypeSub, self).__init__(srsName, axisLabels, uomLabels, srsDimension, valueOf_, )
supermod.VectorType.subclass = VectorTypeSub
# end class VectorTypeSub


class EnvelopeTypeSub(supermod.EnvelopeType):
    def __init__(self, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, lowerCorner=None, upperCorner=None, pos=None, coordinates=None, extensiontype_=None):
        super(EnvelopeTypeSub, self).__init__(srsName, axisLabels, uomLabels, srsDimension, lowerCorner, upperCorner, pos, coordinates, extensiontype_, )
supermod.EnvelopeType.subclass = EnvelopeTypeSub
# end class EnvelopeTypeSub


class GeometricPrimitivePropertyTypeSub(supermod.GeometricPrimitivePropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, AbstractGeometricPrimitive=None):
        super(GeometricPrimitivePropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, AbstractGeometricPrimitive, )
supermod.GeometricPrimitivePropertyType.subclass = GeometricPrimitivePropertyTypeSub
# end class GeometricPrimitivePropertyTypeSub


class PointPropertyTypeSub(supermod.PointPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Point=None):
        super(PointPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, Point, )
supermod.PointPropertyType.subclass = PointPropertyTypeSub
# end class PointPropertyTypeSub


class PointArrayPropertyTypeSub(supermod.PointArrayPropertyType):
    def __init__(self, owns='false', Point=None):
        super(PointArrayPropertyTypeSub, self).__init__(owns, Point, )
supermod.PointArrayPropertyType.subclass = PointArrayPropertyTypeSub
# end class PointArrayPropertyTypeSub


class CurvePropertyTypeSub(supermod.CurvePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractCurve=None):
        super(CurvePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractCurve, )
supermod.CurvePropertyType.subclass = CurvePropertyTypeSub
# end class CurvePropertyTypeSub


class CurveArrayPropertyTypeSub(supermod.CurveArrayPropertyType):
    def __init__(self, owns='false', AbstractCurve=None):
        super(CurveArrayPropertyTypeSub, self).__init__(owns, AbstractCurve, )
supermod.CurveArrayPropertyType.subclass = CurveArrayPropertyTypeSub
# end class CurveArrayPropertyTypeSub


class UnitOfMeasureTypeSub(supermod.UnitOfMeasureType):
    def __init__(self, uom=None, extensiontype_=None):
        super(UnitOfMeasureTypeSub, self).__init__(uom, extensiontype_, )
supermod.UnitOfMeasureType.subclass = UnitOfMeasureTypeSub
# end class UnitOfMeasureTypeSub


class DerivationUnitTermTypeSub(supermod.DerivationUnitTermType):
    def __init__(self, uom=None, exponent=None):
        super(DerivationUnitTermTypeSub, self).__init__(uom, exponent, )
supermod.DerivationUnitTermType.subclass = DerivationUnitTermTypeSub
# end class DerivationUnitTermTypeSub


class ConversionToPreferredUnitTypeSub(supermod.ConversionToPreferredUnitType):
    def __init__(self, uom=None, factor=None, formula=None):
        super(ConversionToPreferredUnitTypeSub, self).__init__(uom, factor, formula, )
supermod.ConversionToPreferredUnitType.subclass = ConversionToPreferredUnitTypeSub
# end class ConversionToPreferredUnitTypeSub


class FormulaTypeSub(supermod.FormulaType):
    def __init__(self, a=None, b=None, c=None, d=None):
        super(FormulaTypeSub, self).__init__(a, b, c, d, )
supermod.FormulaType.subclass = FormulaTypeSub
# end class FormulaTypeSub


class DefinitionBaseTypeSub(supermod.DefinitionBaseType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, extensiontype_=None):
        super(DefinitionBaseTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, extensiontype_, )
supermod.DefinitionBaseType.subclass = DefinitionBaseTypeSub
# end class DefinitionBaseTypeSub


class DefinitionTypeSub(supermod.DefinitionType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, extensiontype_=None):
        super(DefinitionTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, extensiontype_, )
supermod.DefinitionType.subclass = DefinitionTypeSub
# end class DefinitionTypeSub


class DictionaryTypeSub(supermod.DictionaryType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, dictionaryEntry=None, indirectEntry=None):
        super(DictionaryTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, dictionaryEntry, indirectEntry, )
supermod.DictionaryType.subclass = DictionaryTypeSub
# end class DictionaryTypeSub


class AbstractObjectSub(supermod.AbstractObject):
    def __init__(self):
        super(AbstractObjectSub, self).__init__()
supermod.AbstractObject.subclass = AbstractObjectSub
# end class AbstractObjectSub


class AbstractGMLTypeSub(supermod.AbstractGMLType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, extensiontype_=None):
        super(AbstractGMLTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, extensiontype_, )
supermod.AbstractGMLType.subclass = AbstractGMLTypeSub
# end class AbstractGMLTypeSub


class AssociationRoleTypeSub(supermod.AssociationRoleType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, anytypeobjs_=None):
        super(AssociationRoleTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, anytypeobjs_, )
supermod.AssociationRoleType.subclass = AssociationRoleTypeSub
# end class AssociationRoleTypeSub


class ReferenceTypeSub(supermod.ReferenceType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None):
        super(ReferenceTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, )
supermod.ReferenceType.subclass = ReferenceTypeSub
# end class ReferenceTypeSub


class InlinePropertyTypeSub(supermod.InlinePropertyType):
    def __init__(self, owns='false', anytypeobjs_=None):
        super(InlinePropertyTypeSub, self).__init__(owns, anytypeobjs_, )
supermod.InlinePropertyType.subclass = InlinePropertyTypeSub
# end class InlinePropertyTypeSub


class AbstractMemberTypeSub(supermod.AbstractMemberType):
    def __init__(self, owns='false', extensiontype_=None):
        super(AbstractMemberTypeSub, self).__init__(owns, extensiontype_, )
supermod.AbstractMemberType.subclass = AbstractMemberTypeSub
# end class AbstractMemberTypeSub


class AbstractMetadataPropertyTypeSub(supermod.AbstractMetadataPropertyType):
    def __init__(self, owns='false'):
        super(AbstractMetadataPropertyTypeSub, self).__init__(owns, )
supermod.AbstractMetadataPropertyType.subclass = AbstractMetadataPropertyTypeSub
# end class AbstractMetadataPropertyTypeSub


class CodeTypeSub(supermod.CodeType):
    def __init__(self, codeSpace=None, valueOf_=None, extensiontype_=None):
        super(CodeTypeSub, self).__init__(codeSpace, valueOf_, extensiontype_, )
supermod.CodeType.subclass = CodeTypeSub
# end class CodeTypeSub


class CodeWithAuthorityTypeSub(supermod.CodeWithAuthorityType):
    def __init__(self, codeSpace=None, valueOf_=None):
        super(CodeWithAuthorityTypeSub, self).__init__(codeSpace, valueOf_, )
supermod.CodeWithAuthorityType.subclass = CodeWithAuthorityTypeSub
# end class CodeWithAuthorityTypeSub


class MeasureTypeSub(supermod.MeasureType):
    def __init__(self, uom=None, valueOf_=None, extensiontype_=None):
        super(MeasureTypeSub, self).__init__(uom, valueOf_, extensiontype_, )
supermod.MeasureType.subclass = MeasureTypeSub
# end class MeasureTypeSub


class CoordinatesTypeSub(supermod.CoordinatesType):
    def __init__(self, cs=',', decimal='.', ts=' ', valueOf_=None):
        super(CoordinatesTypeSub, self).__init__(cs, decimal, ts, valueOf_, )
supermod.CoordinatesType.subclass = CoordinatesTypeSub
# end class CoordinatesTypeSub


class CodeListTypeSub(supermod.CodeListType):
    def __init__(self, codeSpace=None, valueOf_=None):
        super(CodeListTypeSub, self).__init__(codeSpace, valueOf_, )
supermod.CodeListType.subclass = CodeListTypeSub
# end class CodeListTypeSub


class CodeOrNilReasonListTypeSub(supermod.CodeOrNilReasonListType):
    def __init__(self, codeSpace=None, valueOf_=None, extensiontype_=None):
        super(CodeOrNilReasonListTypeSub, self).__init__(codeSpace, valueOf_, extensiontype_, )
supermod.CodeOrNilReasonListType.subclass = CodeOrNilReasonListTypeSub
# end class CodeOrNilReasonListTypeSub


class MeasureListTypeSub(supermod.MeasureListType):
    def __init__(self, uom=None, valueOf_=None):
        super(MeasureListTypeSub, self).__init__(uom, valueOf_, )
supermod.MeasureListType.subclass = MeasureListTypeSub
# end class MeasureListTypeSub


class MeasureOrNilReasonListTypeSub(supermod.MeasureOrNilReasonListType):
    def __init__(self, uom=None, valueOf_=None, extensiontype_=None):
        super(MeasureOrNilReasonListTypeSub, self).__init__(uom, valueOf_, extensiontype_, )
supermod.MeasureOrNilReasonListType.subclass = MeasureOrNilReasonListTypeSub
# end class MeasureOrNilReasonListTypeSub


class simpleSub(supermod.simple):
    def __init__(self, title=None, arcrole=None, actuate=None, href=None, role=None, show=None, type_=None, anytypeobjs_=None, valueOf_=None, mixedclass_=None, content_=None):
        super(simpleSub, self).__init__(title, arcrole, actuate, href, role, show, type_, anytypeobjs_, valueOf_, mixedclass_, content_, )
supermod.simple.subclass = simpleSub
# end class simpleSub


class extendedSub(supermod.extended):
    def __init__(self, type_=None, role=None, title_attr=None, title=None, resource=None, locator=None, arc=None):
        super(extendedSub, self).__init__(type_, role, title_attr, title, resource, locator, arc, )
supermod.extended.subclass = extendedSub
# end class extendedSub


class titleEltTypeSub(supermod.titleEltType):
    def __init__(self, lang=None, type_=None, anytypeobjs_=None, valueOf_=None, mixedclass_=None, content_=None):
        super(titleEltTypeSub, self).__init__(lang, type_, anytypeobjs_, valueOf_, mixedclass_, content_, )
supermod.titleEltType.subclass = titleEltTypeSub
# end class titleEltTypeSub


class resourceTypeSub(supermod.resourceType):
    def __init__(self, type_=None, title=None, role=None, label=None, anytypeobjs_=None, valueOf_=None, mixedclass_=None, content_=None):
        super(resourceTypeSub, self).__init__(type_, title, role, label, anytypeobjs_, valueOf_, mixedclass_, content_, )
supermod.resourceType.subclass = resourceTypeSub
# end class resourceTypeSub


class locatorTypeSub(supermod.locatorType):
    def __init__(self, title_attr=None, label=None, href=None, role=None, type_=None, title=None):
        super(locatorTypeSub, self).__init__(title_attr, label, href, role, type_, title, )
supermod.locatorType.subclass = locatorTypeSub
# end class locatorTypeSub


class arcTypeSub(supermod.arcType):
    def __init__(self, from_=None, title_attr=None, arcrole=None, actuate=None, to=None, show=None, type_=None, title=None):
        super(arcTypeSub, self).__init__(from_, title_attr, arcrole, actuate, to, show, type_, title, )
supermod.arcType.subclass = arcTypeSub
# end class arcTypeSub


class AbstractTimeObjectTypeSub(supermod.AbstractTimeObjectType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, extensiontype_=None):
        super(AbstractTimeObjectTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, extensiontype_, )
supermod.AbstractTimeObjectType.subclass = AbstractTimeObjectTypeSub
# end class AbstractTimeObjectTypeSub


class AbstractTimePrimitiveTypeSub(supermod.AbstractTimePrimitiveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, relatedTime=None, extensiontype_=None):
        super(AbstractTimePrimitiveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, relatedTime, extensiontype_, )
supermod.AbstractTimePrimitiveType.subclass = AbstractTimePrimitiveTypeSub
# end class AbstractTimePrimitiveTypeSub


class TimePrimitivePropertyTypeSub(supermod.TimePrimitivePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractTimePrimitive=None, extensiontype_=None):
        super(TimePrimitivePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractTimePrimitive, extensiontype_, )
supermod.TimePrimitivePropertyType.subclass = TimePrimitivePropertyTypeSub
# end class TimePrimitivePropertyTypeSub


class RelatedTimeTypeSub(supermod.RelatedTimeType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractTimePrimitive=None, relativePosition=None):
        super(RelatedTimeTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractTimePrimitive, relativePosition, )
supermod.RelatedTimeType.subclass = RelatedTimeTypeSub
# end class RelatedTimeTypeSub


class AbstractTimeComplexTypeSub(supermod.AbstractTimeComplexType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, extensiontype_=None):
        super(AbstractTimeComplexTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, extensiontype_, )
supermod.AbstractTimeComplexType.subclass = AbstractTimeComplexTypeSub
# end class AbstractTimeComplexTypeSub


class AbstractTimeGeometricPrimitiveTypeSub(supermod.AbstractTimeGeometricPrimitiveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, relatedTime=None, frame='#ISO-8601', extensiontype_=None):
        super(AbstractTimeGeometricPrimitiveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, relatedTime, frame, extensiontype_, )
supermod.AbstractTimeGeometricPrimitiveType.subclass = AbstractTimeGeometricPrimitiveTypeSub
# end class AbstractTimeGeometricPrimitiveTypeSub


class TimeInstantTypeSub(supermod.TimeInstantType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, relatedTime=None, frame='#ISO-8601', timePosition=None):
        super(TimeInstantTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, relatedTime, frame, timePosition, )
supermod.TimeInstantType.subclass = TimeInstantTypeSub
# end class TimeInstantTypeSub


class TimeInstantPropertyTypeSub(supermod.TimeInstantPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TimeInstant=None):
        super(TimeInstantPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, TimeInstant, )
supermod.TimeInstantPropertyType.subclass = TimeInstantPropertyTypeSub
# end class TimeInstantPropertyTypeSub


class TimePeriodTypeSub(supermod.TimePeriodType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, relatedTime=None, frame='#ISO-8601', beginPosition=None, begin=None, endPosition=None, end=None, duration=None, timeInterval=None):
        super(TimePeriodTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, relatedTime, frame, beginPosition, begin, endPosition, end, duration, timeInterval, )
supermod.TimePeriodType.subclass = TimePeriodTypeSub
# end class TimePeriodTypeSub


class TimePeriodPropertyTypeSub(supermod.TimePeriodPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TimePeriod=None):
        super(TimePeriodPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, TimePeriod, )
supermod.TimePeriodPropertyType.subclass = TimePeriodPropertyTypeSub
# end class TimePeriodPropertyTypeSub


class TimePositionTypeSub(supermod.TimePositionType):
    def __init__(self, frame='#ISO-8601', indeterminatePosition=None, calendarEraName=None, valueOf_=None):
        super(TimePositionTypeSub, self).__init__(frame, indeterminatePosition, calendarEraName, valueOf_, )
supermod.TimePositionType.subclass = TimePositionTypeSub
# end class TimePositionTypeSub


class TimeIntervalLengthTypeSub(supermod.TimeIntervalLengthType):
    def __init__(self, radix=None, unit=None, factor=None, valueOf_=None):
        super(TimeIntervalLengthTypeSub, self).__init__(radix, unit, factor, valueOf_, )
supermod.TimeIntervalLengthType.subclass = TimeIntervalLengthTypeSub
# end class TimeIntervalLengthTypeSub


class DirectionPropertyTypeSub(supermod.DirectionPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, DirectionVector=None, DirectionDescription=None, CompassPoint=None, DirectionKeyword=None, DirectionString=None):
        super(DirectionPropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, DirectionVector, DirectionDescription, CompassPoint, DirectionKeyword, DirectionString, )
supermod.DirectionPropertyType.subclass = DirectionPropertyTypeSub
# end class DirectionPropertyTypeSub


class DirectionVectorTypeSub(supermod.DirectionVectorType):
    def __init__(self, vector=None, horizontalAngle=None, verticalAngle=None):
        super(DirectionVectorTypeSub, self).__init__(vector, horizontalAngle, verticalAngle, )
supermod.DirectionVectorType.subclass = DirectionVectorTypeSub
# end class DirectionVectorTypeSub


class DirectionDescriptionTypeSub(supermod.DirectionDescriptionType):
    def __init__(self, compassPoint=None, keyword=None, description=None, reference=None):
        super(DirectionDescriptionTypeSub, self).__init__(compassPoint, keyword, description, reference, )
supermod.DirectionDescriptionType.subclass = DirectionDescriptionTypeSub
# end class DirectionDescriptionTypeSub


class AbstractTopologyTypeSub(supermod.AbstractTopologyType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, extensiontype_=None):
        super(AbstractTopologyTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, extensiontype_, )
supermod.AbstractTopologyType.subclass = AbstractTopologyTypeSub
# end class AbstractTopologyTypeSub


class AbstractTopoPrimitiveTypeSub(supermod.AbstractTopoPrimitiveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, extensiontype_=None):
        super(AbstractTopoPrimitiveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, extensiontype_, )
supermod.AbstractTopoPrimitiveType.subclass = AbstractTopoPrimitiveTypeSub
# end class AbstractTopoPrimitiveTypeSub


class NodeOrEdgePropertyTypeSub(supermod.NodeOrEdgePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Node=None, Edge=None):
        super(NodeOrEdgePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, Node, Edge, )
supermod.NodeOrEdgePropertyType.subclass = NodeOrEdgePropertyTypeSub
# end class NodeOrEdgePropertyTypeSub


class NodePropertyTypeSub(supermod.NodePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Node=None):
        super(NodePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, Node, )
supermod.NodePropertyType.subclass = NodePropertyTypeSub
# end class NodePropertyTypeSub


class FaceOrTopoSolidPropertyTypeSub(supermod.FaceOrTopoSolidPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Face=None, TopoSolid=None):
        super(FaceOrTopoSolidPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, Face, TopoSolid, )
supermod.FaceOrTopoSolidPropertyType.subclass = FaceOrTopoSolidPropertyTypeSub
# end class FaceOrTopoSolidPropertyTypeSub


class TopoSolidPropertyTypeSub(supermod.TopoSolidPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TopoSolid=None):
        super(TopoSolidPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, TopoSolid, )
supermod.TopoSolidPropertyType.subclass = TopoSolidPropertyTypeSub
# end class TopoSolidPropertyTypeSub


class NodeTypeSub(supermod.NodeType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, container=None, directedEdge=None, pointProperty=None):
        super(NodeTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, container, directedEdge, pointProperty, )
supermod.NodeType.subclass = NodeTypeSub
# end class NodeTypeSub


class DirectedNodePropertyTypeSub(supermod.DirectedNodePropertyType):
    def __init__(self, nilReason=None, owns='false', orientation='+', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Node=None):
        super(DirectedNodePropertyTypeSub, self).__init__(nilReason, owns, orientation, title, show, actuate, href, role, arcrole, remoteSchema, type_, Node, )
supermod.DirectedNodePropertyType.subclass = DirectedNodePropertyTypeSub
# end class DirectedNodePropertyTypeSub


class EdgeTypeSub(supermod.EdgeType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, container=None, directedNode=None, directedFace=None, curveProperty=None):
        super(EdgeTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, container, directedNode, directedFace, curveProperty, )
supermod.EdgeType.subclass = EdgeTypeSub
# end class EdgeTypeSub


class DirectedEdgePropertyTypeSub(supermod.DirectedEdgePropertyType):
    def __init__(self, nilReason=None, owns='false', orientation='+', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Edge=None):
        super(DirectedEdgePropertyTypeSub, self).__init__(nilReason, owns, orientation, title, show, actuate, href, role, arcrole, remoteSchema, type_, Edge, )
supermod.DirectedEdgePropertyType.subclass = DirectedEdgePropertyTypeSub
# end class DirectedEdgePropertyTypeSub


class FaceTypeSub(supermod.FaceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, universal='false', isolated=None, directedEdge=None, directedTopoSolid=None, surfaceProperty=None):
        super(FaceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, universal, isolated, directedEdge, directedTopoSolid, surfaceProperty, )
supermod.FaceType.subclass = FaceTypeSub
# end class FaceTypeSub


class DirectedFacePropertyTypeSub(supermod.DirectedFacePropertyType):
    def __init__(self, nilReason=None, owns='false', orientation='+', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Face=None):
        super(DirectedFacePropertyTypeSub, self).__init__(nilReason, owns, orientation, title, show, actuate, href, role, arcrole, remoteSchema, type_, Face, )
supermod.DirectedFacePropertyType.subclass = DirectedFacePropertyTypeSub
# end class DirectedFacePropertyTypeSub


class TopoSolidTypeSub(supermod.TopoSolidType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, universal='false', isolated=None, directedFace=None, solidProperty=None):
        super(TopoSolidTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, universal, isolated, directedFace, solidProperty, )
supermod.TopoSolidType.subclass = TopoSolidTypeSub
# end class TopoSolidTypeSub


class DirectedTopoSolidPropertyTypeSub(supermod.DirectedTopoSolidPropertyType):
    def __init__(self, nilReason=None, owns='false', orientation='+', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TopoSolid=None):
        super(DirectedTopoSolidPropertyTypeSub, self).__init__(nilReason, owns, orientation, title, show, actuate, href, role, arcrole, remoteSchema, type_, TopoSolid, )
supermod.DirectedTopoSolidPropertyType.subclass = DirectedTopoSolidPropertyTypeSub
# end class DirectedTopoSolidPropertyTypeSub


class TopoPointTypeSub(supermod.TopoPointType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, directedNode=None):
        super(TopoPointTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, directedNode, )
supermod.TopoPointType.subclass = TopoPointTypeSub
# end class TopoPointTypeSub


class TopoPointPropertyTypeSub(supermod.TopoPointPropertyType):
    def __init__(self, owns='false', TopoPoint=None):
        super(TopoPointPropertyTypeSub, self).__init__(owns, TopoPoint, )
supermod.TopoPointPropertyType.subclass = TopoPointPropertyTypeSub
# end class TopoPointPropertyTypeSub


class TopoCurveTypeSub(supermod.TopoCurveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, directedEdge=None):
        super(TopoCurveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, directedEdge, )
supermod.TopoCurveType.subclass = TopoCurveTypeSub
# end class TopoCurveTypeSub


class TopoCurvePropertyTypeSub(supermod.TopoCurvePropertyType):
    def __init__(self, owns='false', TopoCurve=None):
        super(TopoCurvePropertyTypeSub, self).__init__(owns, TopoCurve, )
supermod.TopoCurvePropertyType.subclass = TopoCurvePropertyTypeSub
# end class TopoCurvePropertyTypeSub


class TopoSurfaceTypeSub(supermod.TopoSurfaceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, directedFace=None):
        super(TopoSurfaceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, directedFace, )
supermod.TopoSurfaceType.subclass = TopoSurfaceTypeSub
# end class TopoSurfaceTypeSub


class TopoSurfacePropertyTypeSub(supermod.TopoSurfacePropertyType):
    def __init__(self, owns='false', TopoSurface=None):
        super(TopoSurfacePropertyTypeSub, self).__init__(owns, TopoSurface, )
supermod.TopoSurfacePropertyType.subclass = TopoSurfacePropertyTypeSub
# end class TopoSurfacePropertyTypeSub


class TopoVolumeTypeSub(supermod.TopoVolumeType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, directedTopoSolid=None):
        super(TopoVolumeTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, directedTopoSolid, )
supermod.TopoVolumeType.subclass = TopoVolumeTypeSub
# end class TopoVolumeTypeSub


class TopoVolumePropertyTypeSub(supermod.TopoVolumePropertyType):
    def __init__(self, owns='false', TopoVolume=None):
        super(TopoVolumePropertyTypeSub, self).__init__(owns, TopoVolume, )
supermod.TopoVolumePropertyType.subclass = TopoVolumePropertyTypeSub
# end class TopoVolumePropertyTypeSub


class TopoComplexTypeSub(supermod.TopoComplexType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, isMaximal='false', maximalComplex=None, superComplex=None, subComplex=None, topoPrimitiveMember=None, topoPrimitiveMembers=None):
        super(TopoComplexTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, isMaximal, maximalComplex, superComplex, subComplex, topoPrimitiveMember, topoPrimitiveMembers, )
supermod.TopoComplexType.subclass = TopoComplexTypeSub
# end class TopoComplexTypeSub


class TopoPrimitiveMemberTypeSub(supermod.TopoPrimitiveMemberType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractTopoPrimitive=None):
        super(TopoPrimitiveMemberTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractTopoPrimitive, )
supermod.TopoPrimitiveMemberType.subclass = TopoPrimitiveMemberTypeSub
# end class TopoPrimitiveMemberTypeSub


class TopoPrimitiveArrayAssociationTypeSub(supermod.TopoPrimitiveArrayAssociationType):
    def __init__(self, owns='false', AbstractTopoPrimitive=None):
        super(TopoPrimitiveArrayAssociationTypeSub, self).__init__(owns, AbstractTopoPrimitive, )
supermod.TopoPrimitiveArrayAssociationType.subclass = TopoPrimitiveArrayAssociationTypeSub
# end class TopoPrimitiveArrayAssociationTypeSub


class TopoComplexPropertyTypeSub(supermod.TopoComplexPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TopoComplex=None):
        super(TopoComplexPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, TopoComplex, )
supermod.TopoComplexPropertyType.subclass = TopoComplexPropertyTypeSub
# end class TopoComplexPropertyTypeSub


class GeometricComplexPropertyTypeSub(supermod.GeometricComplexPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, GeometricComplex=None, CompositeCurve=None, CompositeSurface=None, CompositeSolid=None):
        super(GeometricComplexPropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, GeometricComplex, CompositeCurve, CompositeSurface, CompositeSolid, )
supermod.GeometricComplexPropertyType.subclass = GeometricComplexPropertyTypeSub
# end class GeometricComplexPropertyTypeSub


class DomainSetTypeSub(supermod.DomainSetType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, AbstractGeometry=None, AbstractTimeObject=None):
        super(DomainSetTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, AbstractGeometry, AbstractTimeObject, )
supermod.DomainSetType.subclass = DomainSetTypeSub
# end class DomainSetTypeSub


class RangeSetTypeSub(supermod.RangeSetType):
    def __init__(self, ValueArray=None, AbstractScalarValueList=None, DataBlock=None, File=None):
        super(RangeSetTypeSub, self).__init__(ValueArray, AbstractScalarValueList, DataBlock, File, )
supermod.RangeSetType.subclass = RangeSetTypeSub
# end class RangeSetTypeSub


class DataBlockTypeSub(supermod.DataBlockType):
    def __init__(self, rangeParameters=None, tupleList=None, doubleOrNilReasonTupleList=None):
        super(DataBlockTypeSub, self).__init__(rangeParameters, tupleList, doubleOrNilReasonTupleList, )
supermod.DataBlockType.subclass = DataBlockTypeSub
# end class DataBlockTypeSub


class FileTypeSub(supermod.FileType):
    def __init__(self, rangeParameters=None, fileName=None, fileReference=None, fileStructure=None, mimeType=None, compression=None):
        super(FileTypeSub, self).__init__(rangeParameters, fileName, fileReference, fileStructure, mimeType, compression, )
supermod.FileType.subclass = FileTypeSub
# end class FileTypeSub


class CoverageFunctionTypeSub(supermod.CoverageFunctionType):
    def __init__(self, MappingRule=None, CoverageMappingRule=None, GridFunction=None):
        super(CoverageFunctionTypeSub, self).__init__(MappingRule, CoverageMappingRule, GridFunction, )
supermod.CoverageFunctionType.subclass = CoverageFunctionTypeSub
# end class CoverageFunctionTypeSub


class MappingRuleTypeSub(supermod.MappingRuleType):
    def __init__(self, ruleDefinition=None, ruleReference=None):
        super(MappingRuleTypeSub, self).__init__(ruleDefinition, ruleReference, )
supermod.MappingRuleType.subclass = MappingRuleTypeSub
# end class MappingRuleTypeSub


class GridFunctionTypeSub(supermod.GridFunctionType):
    def __init__(self, sequenceRule=None, startPoint=None):
        super(GridFunctionTypeSub, self).__init__(sequenceRule, startPoint, )
supermod.GridFunctionType.subclass = GridFunctionTypeSub
# end class GridFunctionTypeSub


class SequenceRuleTypeSub(supermod.SequenceRuleType):
    def __init__(self, axisOrder=None, order=None, valueOf_=None):
        super(SequenceRuleTypeSub, self).__init__(axisOrder, order, valueOf_, )
supermod.SequenceRuleType.subclass = SequenceRuleTypeSub
# end class SequenceRuleTypeSub


class BooleanSub(supermod.Boolean):
    def __init__(self, nilReason=None, valueOf_=None):
        super(BooleanSub, self).__init__(nilReason, valueOf_, )
supermod.Boolean.subclass = BooleanSub
# end class BooleanSub


class CategorySub(supermod.Category):
    def __init__(self, codeSpace=None, nilReason=None, valueOf_=None):
        super(CategorySub, self).__init__(codeSpace, nilReason, valueOf_, )
supermod.Category.subclass = CategorySub
# end class CategorySub


class CountSub(supermod.Count):
    def __init__(self, nilReason=None, valueOf_=None):
        super(CountSub, self).__init__(nilReason, valueOf_, )
supermod.Count.subclass = CountSub
# end class CountSub


class QuantitySub(supermod.Quantity):
    def __init__(self, uom=None, nilReason=None, valueOf_=None):
        super(QuantitySub, self).__init__(uom, nilReason, valueOf_, )
supermod.Quantity.subclass = QuantitySub
# end class QuantitySub


class ValuePropertyTypeSub(supermod.ValuePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractValue=None, AbstractGeometry=None, AbstractTimeObject=None, Null=None):
        super(ValuePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractValue, AbstractGeometry, AbstractTimeObject, Null, )
supermod.ValuePropertyType.subclass = ValuePropertyTypeSub
# end class ValuePropertyTypeSub


class ValueArrayPropertyTypeSub(supermod.ValueArrayPropertyType):
    def __init__(self, owns='false', AbstractValue=None, AbstractGeometry=None, AbstractTimeObject=None, Null=None):
        super(ValueArrayPropertyTypeSub, self).__init__(owns, AbstractValue, AbstractGeometry, AbstractTimeObject, Null, )
supermod.ValueArrayPropertyType.subclass = ValueArrayPropertyTypeSub
# end class ValueArrayPropertyTypeSub


class CompositeValueTypeSub(supermod.CompositeValueType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, valueComponent=None, valueComponents=None, extensiontype_=None):
        super(CompositeValueTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, valueComponent, valueComponents, extensiontype_, )
supermod.CompositeValueType.subclass = CompositeValueTypeSub
# end class CompositeValueTypeSub


class ValueArrayTypeSub(supermod.ValueArrayType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, aggregationType=None, valueComponent=None, valueComponents=None, codeSpace=None, uom=None):
        super(ValueArrayTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, aggregationType, valueComponent, valueComponents, codeSpace, uom, )
supermod.ValueArrayType.subclass = ValueArrayTypeSub
# end class ValueArrayTypeSub


class CategoryExtentTypeSub(supermod.CategoryExtentType):
    def __init__(self, codeSpace=None, valueOf_=None):
        super(CategoryExtentTypeSub, self).__init__(codeSpace, valueOf_, )
supermod.CategoryExtentType.subclass = CategoryExtentTypeSub
# end class CategoryExtentTypeSub


class QuantityExtentTypeSub(supermod.QuantityExtentType):
    def __init__(self, uom=None, valueOf_=None):
        super(QuantityExtentTypeSub, self).__init__(uom, valueOf_, )
supermod.QuantityExtentType.subclass = QuantityExtentTypeSub
# end class QuantityExtentTypeSub


class BooleanPropertyTypeSub(supermod.BooleanPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Boolean=None):
        super(BooleanPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Boolean, )
supermod.BooleanPropertyType.subclass = BooleanPropertyTypeSub
# end class BooleanPropertyTypeSub


class CategoryPropertyTypeSub(supermod.CategoryPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Category=None):
        super(CategoryPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Category, )
supermod.CategoryPropertyType.subclass = CategoryPropertyTypeSub
# end class CategoryPropertyTypeSub


class QuantityPropertyTypeSub(supermod.QuantityPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Quantity=None):
        super(QuantityPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Quantity, )
supermod.QuantityPropertyType.subclass = QuantityPropertyTypeSub
# end class QuantityPropertyTypeSub


class CountPropertyTypeSub(supermod.CountPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Count=None):
        super(CountPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Count, )
supermod.CountPropertyType.subclass = CountPropertyTypeSub
# end class CountPropertyTypeSub


class GridLimitsTypeSub(supermod.GridLimitsType):
    def __init__(self, GridEnvelope=None):
        super(GridLimitsTypeSub, self).__init__(GridEnvelope, )
supermod.GridLimitsType.subclass = GridLimitsTypeSub
# end class GridLimitsTypeSub


class GridEnvelopeTypeSub(supermod.GridEnvelopeType):
    def __init__(self, low=None, high=None):
        super(GridEnvelopeTypeSub, self).__init__(low, high, )
supermod.GridEnvelopeType.subclass = GridEnvelopeTypeSub
# end class GridEnvelopeTypeSub


class SingleCRSPropertyTypeSub(supermod.SingleCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractSingleCRS=None):
        super(SingleCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractSingleCRS, )
supermod.SingleCRSPropertyType.subclass = SingleCRSPropertyTypeSub
# end class SingleCRSPropertyTypeSub


class CompoundCRSPropertyTypeSub(supermod.CompoundCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, CompoundCRS=None):
        super(CompoundCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, CompoundCRS, )
supermod.CompoundCRSPropertyType.subclass = CompoundCRSPropertyTypeSub
# end class CompoundCRSPropertyTypeSub


class GeodeticCRSPropertyTypeSub(supermod.GeodeticCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, GeodeticCRS=None):
        super(GeodeticCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, GeodeticCRS, )
supermod.GeodeticCRSPropertyType.subclass = GeodeticCRSPropertyTypeSub
# end class GeodeticCRSPropertyTypeSub


class VerticalCRSPropertyTypeSub(supermod.VerticalCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, VerticalCRS=None):
        super(VerticalCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, VerticalCRS, )
supermod.VerticalCRSPropertyType.subclass = VerticalCRSPropertyTypeSub
# end class VerticalCRSPropertyTypeSub


class ProjectedCRSPropertyTypeSub(supermod.ProjectedCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, ProjectedCRS=None):
        super(ProjectedCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, ProjectedCRS, )
supermod.ProjectedCRSPropertyType.subclass = ProjectedCRSPropertyTypeSub
# end class ProjectedCRSPropertyTypeSub


class DerivedCRSPropertyTypeSub(supermod.DerivedCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, DerivedCRS=None):
        super(DerivedCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, DerivedCRS, )
supermod.DerivedCRSPropertyType.subclass = DerivedCRSPropertyTypeSub
# end class DerivedCRSPropertyTypeSub


class EngineeringCRSPropertyTypeSub(supermod.EngineeringCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, EngineeringCRS=None):
        super(EngineeringCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, EngineeringCRS, )
supermod.EngineeringCRSPropertyType.subclass = EngineeringCRSPropertyTypeSub
# end class EngineeringCRSPropertyTypeSub


class ImageCRSPropertyTypeSub(supermod.ImageCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, ImageCRS=None):
        super(ImageCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, ImageCRS, )
supermod.ImageCRSPropertyType.subclass = ImageCRSPropertyTypeSub
# end class ImageCRSPropertyTypeSub


class TemporalCRSPropertyTypeSub(supermod.TemporalCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TemporalCRS=None):
        super(TemporalCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, TemporalCRS, )
supermod.TemporalCRSPropertyType.subclass = TemporalCRSPropertyTypeSub
# end class TemporalCRSPropertyTypeSub


class CoordinateSystemAxisPropertyTypeSub(supermod.CoordinateSystemAxisPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, CoordinateSystemAxis=None):
        super(CoordinateSystemAxisPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, CoordinateSystemAxis, )
supermod.CoordinateSystemAxisPropertyType.subclass = CoordinateSystemAxisPropertyTypeSub
# end class CoordinateSystemAxisPropertyTypeSub


class CoordinateSystemPropertyTypeSub(supermod.CoordinateSystemPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractCoordinateSystem=None):
        super(CoordinateSystemPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractCoordinateSystem, )
supermod.CoordinateSystemPropertyType.subclass = CoordinateSystemPropertyTypeSub
# end class CoordinateSystemPropertyTypeSub


class EllipsoidalCSPropertyTypeSub(supermod.EllipsoidalCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, EllipsoidalCS=None):
        super(EllipsoidalCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, EllipsoidalCS, )
supermod.EllipsoidalCSPropertyType.subclass = EllipsoidalCSPropertyTypeSub
# end class EllipsoidalCSPropertyTypeSub


class CartesianCSPropertyTypeSub(supermod.CartesianCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, CartesianCS=None):
        super(CartesianCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, CartesianCS, )
supermod.CartesianCSPropertyType.subclass = CartesianCSPropertyTypeSub
# end class CartesianCSPropertyTypeSub


class VerticalCSPropertyTypeSub(supermod.VerticalCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, VerticalCS=None):
        super(VerticalCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, VerticalCS, )
supermod.VerticalCSPropertyType.subclass = VerticalCSPropertyTypeSub
# end class VerticalCSPropertyTypeSub


class TimeCSPropertyTypeSub(supermod.TimeCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TimeCS=None):
        super(TimeCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, TimeCS, )
supermod.TimeCSPropertyType.subclass = TimeCSPropertyTypeSub
# end class TimeCSPropertyTypeSub


class LinearCSPropertyTypeSub(supermod.LinearCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, LinearCS=None):
        super(LinearCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, LinearCS, )
supermod.LinearCSPropertyType.subclass = LinearCSPropertyTypeSub
# end class LinearCSPropertyTypeSub


class UserDefinedCSPropertyTypeSub(supermod.UserDefinedCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, UserDefinedCS=None):
        super(UserDefinedCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, UserDefinedCS, )
supermod.UserDefinedCSPropertyType.subclass = UserDefinedCSPropertyTypeSub
# end class UserDefinedCSPropertyTypeSub


class SphericalCSPropertyTypeSub(supermod.SphericalCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, SphericalCS=None):
        super(SphericalCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, SphericalCS, )
supermod.SphericalCSPropertyType.subclass = SphericalCSPropertyTypeSub
# end class SphericalCSPropertyTypeSub


class PolarCSPropertyTypeSub(supermod.PolarCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, PolarCS=None):
        super(PolarCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, PolarCS, )
supermod.PolarCSPropertyType.subclass = PolarCSPropertyTypeSub
# end class PolarCSPropertyTypeSub


class CylindricalCSPropertyTypeSub(supermod.CylindricalCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, CylindricalCS=None):
        super(CylindricalCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, CylindricalCS, )
supermod.CylindricalCSPropertyType.subclass = CylindricalCSPropertyTypeSub
# end class CylindricalCSPropertyTypeSub


class AffineCSPropertyTypeSub(supermod.AffineCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AffineCS=None):
        super(AffineCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AffineCS, )
supermod.AffineCSPropertyType.subclass = AffineCSPropertyTypeSub
# end class AffineCSPropertyTypeSub


class IdentifiedObjectTypeSub(supermod.IdentifiedObjectType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, extensiontype_=None):
        super(IdentifiedObjectTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, extensiontype_, )
supermod.IdentifiedObjectType.subclass = IdentifiedObjectTypeSub
# end class IdentifiedObjectTypeSub


class AbstractCRSTypeSub(supermod.AbstractCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, extensiontype_=None):
        super(AbstractCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, extensiontype_, )
supermod.AbstractCRSType.subclass = AbstractCRSTypeSub
# end class AbstractCRSTypeSub


class domainOfValiditySub(supermod.domainOfValidity):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, EX_Extent=None):
        super(domainOfValiditySub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, EX_Extent, )
supermod.domainOfValidity.subclass = domainOfValiditySub
# end class domainOfValiditySub


class CRSPropertyTypeSub(supermod.CRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractCRS=None):
        super(CRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractCRS, )
supermod.CRSPropertyType.subclass = CRSPropertyTypeSub
# end class CRSPropertyTypeSub


class DS_Aggregate_PropertyTypeSub(supermod.DS_Aggregate_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDS_Aggregate=None):
        super(DS_Aggregate_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDS_Aggregate, )
supermod.DS_Aggregate_PropertyType.subclass = DS_Aggregate_PropertyTypeSub
# end class DS_Aggregate_PropertyTypeSub


class DS_DataSet_PropertyTypeSub(supermod.DS_DataSet_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_DataSet=None):
        super(DS_DataSet_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_DataSet, )
supermod.DS_DataSet_PropertyType.subclass = DS_DataSet_PropertyTypeSub
# end class DS_DataSet_PropertyTypeSub


class DS_OtherAggregate_PropertyTypeSub(supermod.DS_OtherAggregate_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_OtherAggregate=None):
        super(DS_OtherAggregate_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_OtherAggregate, )
supermod.DS_OtherAggregate_PropertyType.subclass = DS_OtherAggregate_PropertyTypeSub
# end class DS_OtherAggregate_PropertyTypeSub


class DS_Series_PropertyTypeSub(supermod.DS_Series_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_Series=None):
        super(DS_Series_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_Series, )
supermod.DS_Series_PropertyType.subclass = DS_Series_PropertyTypeSub
# end class DS_Series_PropertyTypeSub


class DS_Initiative_PropertyTypeSub(supermod.DS_Initiative_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_Initiative=None):
        super(DS_Initiative_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_Initiative, )
supermod.DS_Initiative_PropertyType.subclass = DS_Initiative_PropertyTypeSub
# end class DS_Initiative_PropertyTypeSub


class DS_Platform_PropertyTypeSub(supermod.DS_Platform_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_Platform=None):
        super(DS_Platform_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_Platform, )
supermod.DS_Platform_PropertyType.subclass = DS_Platform_PropertyTypeSub
# end class DS_Platform_PropertyTypeSub


class DS_Sensor_PropertyTypeSub(supermod.DS_Sensor_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_Sensor=None):
        super(DS_Sensor_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_Sensor, )
supermod.DS_Sensor_PropertyType.subclass = DS_Sensor_PropertyTypeSub
# end class DS_Sensor_PropertyTypeSub


class DS_ProductionSeries_PropertyTypeSub(supermod.DS_ProductionSeries_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_ProductionSeries=None):
        super(DS_ProductionSeries_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_ProductionSeries, )
supermod.DS_ProductionSeries_PropertyType.subclass = DS_ProductionSeries_PropertyTypeSub
# end class DS_ProductionSeries_PropertyTypeSub


class DS_StereoMate_PropertyTypeSub(supermod.DS_StereoMate_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_StereoMate=None):
        super(DS_StereoMate_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_StereoMate, )
supermod.DS_StereoMate_PropertyType.subclass = DS_StereoMate_PropertyTypeSub
# end class DS_StereoMate_PropertyTypeSub


class MD_Metadata_PropertyTypeSub(supermod.MD_Metadata_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Metadata=None):
        super(MD_Metadata_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Metadata, )
supermod.MD_Metadata_PropertyType.subclass = MD_Metadata_PropertyTypeSub
# end class MD_Metadata_PropertyTypeSub


class MD_GridSpatialRepresentation_PropertyTypeSub(supermod.MD_GridSpatialRepresentation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_GridSpatialRepresentation=None):
        super(MD_GridSpatialRepresentation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_GridSpatialRepresentation, )
supermod.MD_GridSpatialRepresentation_PropertyType.subclass = MD_GridSpatialRepresentation_PropertyTypeSub
# end class MD_GridSpatialRepresentation_PropertyTypeSub


class MD_VectorSpatialRepresentation_PropertyTypeSub(supermod.MD_VectorSpatialRepresentation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_VectorSpatialRepresentation=None):
        super(MD_VectorSpatialRepresentation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_VectorSpatialRepresentation, )
supermod.MD_VectorSpatialRepresentation_PropertyType.subclass = MD_VectorSpatialRepresentation_PropertyTypeSub
# end class MD_VectorSpatialRepresentation_PropertyTypeSub


class MD_SpatialRepresentation_PropertyTypeSub(supermod.MD_SpatialRepresentation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractMD_SpatialRepresentation=None):
        super(MD_SpatialRepresentation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractMD_SpatialRepresentation, )
supermod.MD_SpatialRepresentation_PropertyType.subclass = MD_SpatialRepresentation_PropertyTypeSub
# end class MD_SpatialRepresentation_PropertyTypeSub


class MD_Georeferenceable_PropertyTypeSub(supermod.MD_Georeferenceable_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Georeferenceable=None):
        super(MD_Georeferenceable_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Georeferenceable, )
supermod.MD_Georeferenceable_PropertyType.subclass = MD_Georeferenceable_PropertyTypeSub
# end class MD_Georeferenceable_PropertyTypeSub


class MD_Dimension_PropertyTypeSub(supermod.MD_Dimension_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Dimension=None):
        super(MD_Dimension_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Dimension, )
supermod.MD_Dimension_PropertyType.subclass = MD_Dimension_PropertyTypeSub
# end class MD_Dimension_PropertyTypeSub


class MD_Georectified_PropertyTypeSub(supermod.MD_Georectified_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Georectified=None):
        super(MD_Georectified_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Georectified, )
supermod.MD_Georectified_PropertyType.subclass = MD_Georectified_PropertyTypeSub
# end class MD_Georectified_PropertyTypeSub


class MD_GeometricObjects_PropertyTypeSub(supermod.MD_GeometricObjects_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_GeometricObjects=None):
        super(MD_GeometricObjects_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_GeometricObjects, )
supermod.MD_GeometricObjects_PropertyType.subclass = MD_GeometricObjects_PropertyTypeSub
# end class MD_GeometricObjects_PropertyTypeSub


class MD_PixelOrientationCode_PropertyTypeSub(supermod.MD_PixelOrientationCode_PropertyType):
    def __init__(self, nilReason=None, MD_PixelOrientationCode=None):
        super(MD_PixelOrientationCode_PropertyTypeSub, self).__init__(nilReason, MD_PixelOrientationCode, )
supermod.MD_PixelOrientationCode_PropertyType.subclass = MD_PixelOrientationCode_PropertyTypeSub
# end class MD_PixelOrientationCode_PropertyTypeSub


class MD_TopologyLevelCode_PropertyTypeSub(supermod.MD_TopologyLevelCode_PropertyType):
    def __init__(self, nilReason=None, MD_TopologyLevelCode=None):
        super(MD_TopologyLevelCode_PropertyTypeSub, self).__init__(nilReason, MD_TopologyLevelCode, )
supermod.MD_TopologyLevelCode_PropertyType.subclass = MD_TopologyLevelCode_PropertyTypeSub
# end class MD_TopologyLevelCode_PropertyTypeSub


class MD_GeometricObjectTypeCode_PropertyTypeSub(supermod.MD_GeometricObjectTypeCode_PropertyType):
    def __init__(self, nilReason=None, MD_GeometricObjectTypeCode=None):
        super(MD_GeometricObjectTypeCode_PropertyTypeSub, self).__init__(nilReason, MD_GeometricObjectTypeCode, )
supermod.MD_GeometricObjectTypeCode_PropertyType.subclass = MD_GeometricObjectTypeCode_PropertyTypeSub
# end class MD_GeometricObjectTypeCode_PropertyTypeSub


class MD_CellGeometryCode_PropertyTypeSub(supermod.MD_CellGeometryCode_PropertyType):
    def __init__(self, nilReason=None, MD_CellGeometryCode=None):
        super(MD_CellGeometryCode_PropertyTypeSub, self).__init__(nilReason, MD_CellGeometryCode, )
supermod.MD_CellGeometryCode_PropertyType.subclass = MD_CellGeometryCode_PropertyTypeSub
# end class MD_CellGeometryCode_PropertyTypeSub


class MD_DimensionNameTypeCode_PropertyTypeSub(supermod.MD_DimensionNameTypeCode_PropertyType):
    def __init__(self, nilReason=None, MD_DimensionNameTypeCode=None):
        super(MD_DimensionNameTypeCode_PropertyTypeSub, self).__init__(nilReason, MD_DimensionNameTypeCode, )
supermod.MD_DimensionNameTypeCode_PropertyType.subclass = MD_DimensionNameTypeCode_PropertyTypeSub
# end class MD_DimensionNameTypeCode_PropertyTypeSub


class CI_ResponsibleParty_PropertyTypeSub(supermod.CI_ResponsibleParty_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_ResponsibleParty=None):
        super(CI_ResponsibleParty_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_ResponsibleParty, )
supermod.CI_ResponsibleParty_PropertyType.subclass = CI_ResponsibleParty_PropertyTypeSub
# end class CI_ResponsibleParty_PropertyTypeSub


class CI_Citation_PropertyTypeSub(supermod.CI_Citation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_Citation=None):
        super(CI_Citation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_Citation, )
supermod.CI_Citation_PropertyType.subclass = CI_Citation_PropertyTypeSub
# end class CI_Citation_PropertyTypeSub


class CI_Address_PropertyTypeSub(supermod.CI_Address_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_Address=None):
        super(CI_Address_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_Address, )
supermod.CI_Address_PropertyType.subclass = CI_Address_PropertyTypeSub
# end class CI_Address_PropertyTypeSub


class CI_OnlineResource_PropertyTypeSub(supermod.CI_OnlineResource_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_OnlineResource=None):
        super(CI_OnlineResource_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_OnlineResource, )
supermod.CI_OnlineResource_PropertyType.subclass = CI_OnlineResource_PropertyTypeSub
# end class CI_OnlineResource_PropertyTypeSub


class CI_Contact_PropertyTypeSub(supermod.CI_Contact_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_Contact=None):
        super(CI_Contact_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_Contact, )
supermod.CI_Contact_PropertyType.subclass = CI_Contact_PropertyTypeSub
# end class CI_Contact_PropertyTypeSub


class CI_Telephone_PropertyTypeSub(supermod.CI_Telephone_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_Telephone=None):
        super(CI_Telephone_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_Telephone, )
supermod.CI_Telephone_PropertyType.subclass = CI_Telephone_PropertyTypeSub
# end class CI_Telephone_PropertyTypeSub


class CI_Date_PropertyTypeSub(supermod.CI_Date_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_Date=None):
        super(CI_Date_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_Date, )
supermod.CI_Date_PropertyType.subclass = CI_Date_PropertyTypeSub
# end class CI_Date_PropertyTypeSub


class CI_Series_PropertyTypeSub(supermod.CI_Series_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, CI_Series=None):
        super(CI_Series_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, CI_Series, )
supermod.CI_Series_PropertyType.subclass = CI_Series_PropertyTypeSub
# end class CI_Series_PropertyTypeSub


class URL_PropertyTypeSub(supermod.URL_PropertyType):
    def __init__(self, nilReason=None, URL=None):
        super(URL_PropertyTypeSub, self).__init__(nilReason, URL, )
supermod.URL_PropertyType.subclass = URL_PropertyTypeSub
# end class URL_PropertyTypeSub


class CI_RoleCode_PropertyTypeSub(supermod.CI_RoleCode_PropertyType):
    def __init__(self, nilReason=None, CI_RoleCode=None):
        super(CI_RoleCode_PropertyTypeSub, self).__init__(nilReason, CI_RoleCode, )
supermod.CI_RoleCode_PropertyType.subclass = CI_RoleCode_PropertyTypeSub
# end class CI_RoleCode_PropertyTypeSub


class CI_PresentationFormCode_PropertyTypeSub(supermod.CI_PresentationFormCode_PropertyType):
    def __init__(self, nilReason=None, CI_PresentationFormCode=None):
        super(CI_PresentationFormCode_PropertyTypeSub, self).__init__(nilReason, CI_PresentationFormCode, )
supermod.CI_PresentationFormCode_PropertyType.subclass = CI_PresentationFormCode_PropertyTypeSub
# end class CI_PresentationFormCode_PropertyTypeSub


class CI_OnLineFunctionCode_PropertyTypeSub(supermod.CI_OnLineFunctionCode_PropertyType):
    def __init__(self, nilReason=None, CI_OnLineFunctionCode=None):
        super(CI_OnLineFunctionCode_PropertyTypeSub, self).__init__(nilReason, CI_OnLineFunctionCode, )
supermod.CI_OnLineFunctionCode_PropertyType.subclass = CI_OnLineFunctionCode_PropertyTypeSub
# end class CI_OnLineFunctionCode_PropertyTypeSub


class CI_DateTypeCode_PropertyTypeSub(supermod.CI_DateTypeCode_PropertyType):
    def __init__(self, nilReason=None, CI_DateTypeCode=None):
        super(CI_DateTypeCode_PropertyTypeSub, self).__init__(nilReason, CI_DateTypeCode, )
supermod.CI_DateTypeCode_PropertyType.subclass = CI_DateTypeCode_PropertyTypeSub
# end class CI_DateTypeCode_PropertyTypeSub


class RS_Identifier_PropertyTypeSub(supermod.RS_Identifier_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, RS_Identifier=None):
        super(RS_Identifier_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, RS_Identifier, )
supermod.RS_Identifier_PropertyType.subclass = RS_Identifier_PropertyTypeSub
# end class RS_Identifier_PropertyTypeSub


class MD_ReferenceSystem_PropertyTypeSub(supermod.MD_ReferenceSystem_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_ReferenceSystem=None):
        super(MD_ReferenceSystem_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_ReferenceSystem, )
supermod.MD_ReferenceSystem_PropertyType.subclass = MD_ReferenceSystem_PropertyTypeSub
# end class MD_ReferenceSystem_PropertyTypeSub


class MD_Identifier_PropertyTypeSub(supermod.MD_Identifier_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Identifier=None):
        super(MD_Identifier_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Identifier, )
supermod.MD_Identifier_PropertyType.subclass = MD_Identifier_PropertyTypeSub
# end class MD_Identifier_PropertyTypeSub


class RS_ReferenceSystem_PropertyTypeSub(supermod.RS_ReferenceSystem_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractRS_ReferenceSystem=None):
        super(RS_ReferenceSystem_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractRS_ReferenceSystem, )
supermod.RS_ReferenceSystem_PropertyType.subclass = RS_ReferenceSystem_PropertyTypeSub
# end class RS_ReferenceSystem_PropertyTypeSub


class EX_TemporalExtent_PropertyTypeSub(supermod.EX_TemporalExtent_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, EX_TemporalExtent=None):
        super(EX_TemporalExtent_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, EX_TemporalExtent, )
supermod.EX_TemporalExtent_PropertyType.subclass = EX_TemporalExtent_PropertyTypeSub
# end class EX_TemporalExtent_PropertyTypeSub


class EX_VerticalExtent_PropertyTypeSub(supermod.EX_VerticalExtent_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, EX_VerticalExtent=None):
        super(EX_VerticalExtent_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, EX_VerticalExtent, )
supermod.EX_VerticalExtent_PropertyType.subclass = EX_VerticalExtent_PropertyTypeSub
# end class EX_VerticalExtent_PropertyTypeSub


class EX_BoundingPolygon_PropertyTypeSub(supermod.EX_BoundingPolygon_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, EX_BoundingPolygon=None):
        super(EX_BoundingPolygon_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, EX_BoundingPolygon, )
supermod.EX_BoundingPolygon_PropertyType.subclass = EX_BoundingPolygon_PropertyTypeSub
# end class EX_BoundingPolygon_PropertyTypeSub


class EX_Extent_PropertyTypeSub(supermod.EX_Extent_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, EX_Extent=None):
        super(EX_Extent_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, EX_Extent, )
supermod.EX_Extent_PropertyType.subclass = EX_Extent_PropertyTypeSub
# end class EX_Extent_PropertyTypeSub


class EX_GeographicExtent_PropertyTypeSub(supermod.EX_GeographicExtent_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractEX_GeographicExtent=None):
        super(EX_GeographicExtent_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractEX_GeographicExtent, )
supermod.EX_GeographicExtent_PropertyType.subclass = EX_GeographicExtent_PropertyTypeSub
# end class EX_GeographicExtent_PropertyTypeSub


class EX_GeographicBoundingBox_PropertyTypeSub(supermod.EX_GeographicBoundingBox_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, EX_GeographicBoundingBox=None):
        super(EX_GeographicBoundingBox_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, EX_GeographicBoundingBox, )
supermod.EX_GeographicBoundingBox_PropertyType.subclass = EX_GeographicBoundingBox_PropertyTypeSub
# end class EX_GeographicBoundingBox_PropertyTypeSub


class EX_SpatialTemporalExtent_PropertyTypeSub(supermod.EX_SpatialTemporalExtent_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, EX_SpatialTemporalExtent=None):
        super(EX_SpatialTemporalExtent_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, EX_SpatialTemporalExtent, )
supermod.EX_SpatialTemporalExtent_PropertyType.subclass = EX_SpatialTemporalExtent_PropertyTypeSub
# end class EX_SpatialTemporalExtent_PropertyTypeSub


class EX_GeographicDescription_PropertyTypeSub(supermod.EX_GeographicDescription_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, EX_GeographicDescription=None):
        super(EX_GeographicDescription_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, EX_GeographicDescription, )
supermod.EX_GeographicDescription_PropertyType.subclass = EX_GeographicDescription_PropertyTypeSub
# end class EX_GeographicDescription_PropertyTypeSub


class GM_Point_PropertyTypeSub(supermod.GM_Point_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, Point=None):
        super(GM_Point_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, Point, )
supermod.GM_Point_PropertyType.subclass = GM_Point_PropertyTypeSub
# end class GM_Point_PropertyTypeSub


class GM_Object_PropertyTypeSub(supermod.GM_Object_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractGeometry=None):
        super(GM_Object_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractGeometry, )
supermod.GM_Object_PropertyType.subclass = GM_Object_PropertyTypeSub
# end class GM_Object_PropertyTypeSub


class TypeName_PropertyTypeSub(supermod.TypeName_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, TypeName=None):
        super(TypeName_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, TypeName, )
supermod.TypeName_PropertyType.subclass = TypeName_PropertyTypeSub
# end class TypeName_PropertyTypeSub


class MemberName_PropertyTypeSub(supermod.MemberName_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MemberName=None):
        super(MemberName_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MemberName, )
supermod.MemberName_PropertyType.subclass = MemberName_PropertyTypeSub
# end class MemberName_PropertyTypeSub


class Multiplicity_PropertyTypeSub(supermod.Multiplicity_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, Multiplicity=None):
        super(Multiplicity_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, Multiplicity, )
supermod.Multiplicity_PropertyType.subclass = Multiplicity_PropertyTypeSub
# end class Multiplicity_PropertyTypeSub


class MultiplicityRange_PropertyTypeSub(supermod.MultiplicityRange_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MultiplicityRange=None):
        super(MultiplicityRange_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MultiplicityRange, )
supermod.MultiplicityRange_PropertyType.subclass = MultiplicityRange_PropertyTypeSub
# end class MultiplicityRange_PropertyTypeSub


class Measure_PropertyTypeSub(supermod.Measure_PropertyType):
    def __init__(self, nilReason=None, Measure=None):
        super(Measure_PropertyTypeSub, self).__init__(nilReason, Measure, )
supermod.Measure_PropertyType.subclass = Measure_PropertyTypeSub
# end class Measure_PropertyTypeSub


class Length_PropertyTypeSub(supermod.Length_PropertyType):
    def __init__(self, nilReason=None, Length=None):
        super(Length_PropertyTypeSub, self).__init__(nilReason, Length, )
supermod.Length_PropertyType.subclass = Length_PropertyTypeSub
# end class Length_PropertyTypeSub


class Angle_PropertyTypeSub(supermod.Angle_PropertyType):
    def __init__(self, nilReason=None, Angle=None):
        super(Angle_PropertyTypeSub, self).__init__(nilReason, Angle, )
supermod.Angle_PropertyType.subclass = Angle_PropertyTypeSub
# end class Angle_PropertyTypeSub


class Scale_PropertyTypeSub(supermod.Scale_PropertyType):
    def __init__(self, nilReason=None, Scale=None):
        super(Scale_PropertyTypeSub, self).__init__(nilReason, Scale, )
supermod.Scale_PropertyType.subclass = Scale_PropertyTypeSub
# end class Scale_PropertyTypeSub


class Distance_PropertyTypeSub(supermod.Distance_PropertyType):
    def __init__(self, nilReason=None, Distance=None):
        super(Distance_PropertyTypeSub, self).__init__(nilReason, Distance, )
supermod.Distance_PropertyType.subclass = Distance_PropertyTypeSub
# end class Distance_PropertyTypeSub


class CharacterString_PropertyTypeSub(supermod.CharacterString_PropertyType):
    def __init__(self, nilReason=None, CharacterString=None, extensiontype_=None):
        super(CharacterString_PropertyTypeSub, self).__init__(nilReason, CharacterString, extensiontype_, )
supermod.CharacterString_PropertyType.subclass = CharacterString_PropertyTypeSub
# end class CharacterString_PropertyTypeSub


class Boolean_PropertyTypeSub(supermod.Boolean_PropertyType):
    def __init__(self, nilReason=None, Boolean=None):
        super(Boolean_PropertyTypeSub, self).__init__(nilReason, Boolean, )
supermod.Boolean_PropertyType.subclass = Boolean_PropertyTypeSub
# end class Boolean_PropertyTypeSub


class GenericName_PropertyTypeSub(supermod.GenericName_PropertyType):
    def __init__(self, nilReason=None, AbstractGenericName=None):
        super(GenericName_PropertyTypeSub, self).__init__(nilReason, AbstractGenericName, )
supermod.GenericName_PropertyType.subclass = GenericName_PropertyTypeSub
# end class GenericName_PropertyTypeSub


class LocalName_PropertyTypeSub(supermod.LocalName_PropertyType):
    def __init__(self, nilReason=None, LocalName=None):
        super(LocalName_PropertyTypeSub, self).__init__(nilReason, LocalName, )
supermod.LocalName_PropertyType.subclass = LocalName_PropertyTypeSub
# end class LocalName_PropertyTypeSub


class ScopedName_PropertyTypeSub(supermod.ScopedName_PropertyType):
    def __init__(self, nilReason=None, ScopedName=None):
        super(ScopedName_PropertyTypeSub, self).__init__(nilReason, ScopedName, )
supermod.ScopedName_PropertyType.subclass = ScopedName_PropertyTypeSub
# end class ScopedName_PropertyTypeSub


class UomAngle_PropertyTypeSub(supermod.UomAngle_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UomAngle_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UomAngle_PropertyType.subclass = UomAngle_PropertyTypeSub
# end class UomAngle_PropertyTypeSub


class UomLength_PropertyTypeSub(supermod.UomLength_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UomLength_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UomLength_PropertyType.subclass = UomLength_PropertyTypeSub
# end class UomLength_PropertyTypeSub


class UomScale_PropertyTypeSub(supermod.UomScale_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UomScale_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UomScale_PropertyType.subclass = UomScale_PropertyTypeSub
# end class UomScale_PropertyTypeSub


class UnitOfMeasure_PropertyTypeSub(supermod.UnitOfMeasure_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UnitOfMeasure_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UnitOfMeasure_PropertyType.subclass = UnitOfMeasure_PropertyTypeSub
# end class UnitOfMeasure_PropertyTypeSub


class UomArea_PropertyTypeSub(supermod.UomArea_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UomArea_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UomArea_PropertyType.subclass = UomArea_PropertyTypeSub
# end class UomArea_PropertyTypeSub


class UomVelocity_PropertyTypeSub(supermod.UomVelocity_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UomVelocity_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UomVelocity_PropertyType.subclass = UomVelocity_PropertyTypeSub
# end class UomVelocity_PropertyTypeSub


class UomTime_PropertyTypeSub(supermod.UomTime_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UomTime_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UomTime_PropertyType.subclass = UomTime_PropertyTypeSub
# end class UomTime_PropertyTypeSub


class UomVolume_PropertyTypeSub(supermod.UomVolume_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, UnitDefinition=None):
        super(UomVolume_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, UnitDefinition, )
supermod.UomVolume_PropertyType.subclass = UomVolume_PropertyTypeSub
# end class UomVolume_PropertyTypeSub


class DateTime_PropertyTypeSub(supermod.DateTime_PropertyType):
    def __init__(self, nilReason=None, DateTime=None):
        super(DateTime_PropertyTypeSub, self).__init__(nilReason, DateTime, )
supermod.DateTime_PropertyType.subclass = DateTime_PropertyTypeSub
# end class DateTime_PropertyTypeSub


class Date_PropertyTypeSub(supermod.Date_PropertyType):
    def __init__(self, nilReason=None, Date=None, DateTime=None):
        super(Date_PropertyTypeSub, self).__init__(nilReason, Date, DateTime, )
supermod.Date_PropertyType.subclass = Date_PropertyTypeSub
# end class Date_PropertyTypeSub


class Number_PropertyTypeSub(supermod.Number_PropertyType):
    def __init__(self, nilReason=None, Real=None, Decimal=None, Integer=None):
        super(Number_PropertyTypeSub, self).__init__(nilReason, Real, Decimal, Integer, )
supermod.Number_PropertyType.subclass = Number_PropertyTypeSub
# end class Number_PropertyTypeSub


class Decimal_PropertyTypeSub(supermod.Decimal_PropertyType):
    def __init__(self, nilReason=None, Decimal=None):
        super(Decimal_PropertyTypeSub, self).__init__(nilReason, Decimal, )
supermod.Decimal_PropertyType.subclass = Decimal_PropertyTypeSub
# end class Decimal_PropertyTypeSub


class Real_PropertyTypeSub(supermod.Real_PropertyType):
    def __init__(self, nilReason=None, Real=None):
        super(Real_PropertyTypeSub, self).__init__(nilReason, Real, )
supermod.Real_PropertyType.subclass = Real_PropertyTypeSub
# end class Real_PropertyTypeSub


class Integer_PropertyTypeSub(supermod.Integer_PropertyType):
    def __init__(self, nilReason=None, Integer=None):
        super(Integer_PropertyTypeSub, self).__init__(nilReason, Integer, )
supermod.Integer_PropertyType.subclass = Integer_PropertyTypeSub
# end class Integer_PropertyTypeSub


class UnlimitedInteger_TypeSub(supermod.UnlimitedInteger_Type):
    def __init__(self, isInfinite=None, valueOf_=None):
        super(UnlimitedInteger_TypeSub, self).__init__(isInfinite, valueOf_, )
supermod.UnlimitedInteger_Type.subclass = UnlimitedInteger_TypeSub
# end class UnlimitedInteger_TypeSub


class UnlimitedInteger_PropertyTypeSub(supermod.UnlimitedInteger_PropertyType):
    def __init__(self, nilReason=None, UnlimitedInteger=None):
        super(UnlimitedInteger_PropertyTypeSub, self).__init__(nilReason, UnlimitedInteger, )
supermod.UnlimitedInteger_PropertyType.subclass = UnlimitedInteger_PropertyTypeSub
# end class UnlimitedInteger_PropertyTypeSub


class RecordSub(supermod.Record):
    def __init__(self):
        super(RecordSub, self).__init__()
supermod.Record.subclass = RecordSub
# end class RecordSub


class Record_PropertyTypeSub(supermod.Record_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, Record=None):
        super(Record_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, Record, )
supermod.Record_PropertyType.subclass = Record_PropertyTypeSub
# end class Record_PropertyTypeSub


class RecordType_TypeSub(supermod.RecordType_Type):
    def __init__(self, title=None, arcrole=None, actuate=None, href=None, role=None, show=None, type_=None, valueOf_=None):
        super(RecordType_TypeSub, self).__init__(title, arcrole, actuate, href, role, show, type_, valueOf_, )
supermod.RecordType_Type.subclass = RecordType_TypeSub
# end class RecordType_TypeSub


class RecordType_PropertyTypeSub(supermod.RecordType_PropertyType):
    def __init__(self, nilReason=None, RecordType=None):
        super(RecordType_PropertyTypeSub, self).__init__(nilReason, RecordType, )
supermod.RecordType_PropertyType.subclass = RecordType_PropertyTypeSub
# end class RecordType_PropertyTypeSub


class Binary_TypeSub(supermod.Binary_Type):
    def __init__(self, src=None, valueOf_=None):
        super(Binary_TypeSub, self).__init__(src, valueOf_, )
supermod.Binary_Type.subclass = Binary_TypeSub
# end class Binary_TypeSub


class Binary_PropertyTypeSub(supermod.Binary_PropertyType):
    def __init__(self, nilReason=None, Binary=None):
        super(Binary_PropertyTypeSub, self).__init__(nilReason, Binary, )
supermod.Binary_PropertyType.subclass = Binary_PropertyTypeSub
# end class Binary_PropertyTypeSub


class AbstractObject_TypeSub(supermod.AbstractObject_Type):
    def __init__(self, id=None, uuid=None, extensiontype_=None):
        super(AbstractObject_TypeSub, self).__init__(id, uuid, extensiontype_, )
supermod.AbstractObject_Type.subclass = AbstractObject_TypeSub
# end class AbstractObject_TypeSub


class ObjectReference_PropertyTypeSub(supermod.ObjectReference_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, extensiontype_=None):
        super(ObjectReference_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, extensiontype_, )
supermod.ObjectReference_PropertyType.subclass = ObjectReference_PropertyTypeSub
# end class ObjectReference_PropertyTypeSub


class CodeListValue_TypeSub(supermod.CodeListValue_Type):
    def __init__(self, codeList=None, codeSpace=None, codeListValue=None, valueOf_=None):
        super(CodeListValue_TypeSub, self).__init__(codeList, codeSpace, codeListValue, valueOf_, )
supermod.CodeListValue_Type.subclass = CodeListValue_TypeSub
# end class CodeListValue_TypeSub


class TM_Primitive_PropertyTypeSub(supermod.TM_Primitive_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractTimePrimitive=None):
        super(TM_Primitive_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractTimePrimitive, )
supermod.TM_Primitive_PropertyType.subclass = TM_Primitive_PropertyTypeSub
# end class TM_Primitive_PropertyTypeSub


class TM_PeriodDuration_PropertyTypeSub(supermod.TM_PeriodDuration_PropertyType):
    def __init__(self, nilReason=None, TM_PeriodDuration=None):
        super(TM_PeriodDuration_PropertyTypeSub, self).__init__(nilReason, TM_PeriodDuration, )
supermod.TM_PeriodDuration_PropertyType.subclass = TM_PeriodDuration_PropertyTypeSub
# end class TM_PeriodDuration_PropertyTypeSub


class SC_CRS_PropertyTypeSub(supermod.SC_CRS_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractCRS=None):
        super(SC_CRS_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractCRS, )
supermod.SC_CRS_PropertyType.subclass = SC_CRS_PropertyTypeSub
# end class SC_CRS_PropertyTypeSub


class MD_ExtendedElementInformation_TypeSub(supermod.MD_ExtendedElementInformation_Type):
    def __init__(self, id=None, uuid=None, name=None, shortName=None, domainCode=None, definition=None, obligation=None, condition=None, dataType=None, maximumOccurrence=None, domainValue=None, parentEntity=None, rule=None, rationale=None, source=None):
        super(MD_ExtendedElementInformation_TypeSub, self).__init__(id, uuid, name, shortName, domainCode, definition, obligation, condition, dataType, maximumOccurrence, domainValue, parentEntity, rule, rationale, source, )
supermod.MD_ExtendedElementInformation_Type.subclass = MD_ExtendedElementInformation_TypeSub
# end class MD_ExtendedElementInformation_TypeSub


class MD_ExtendedElementInformation_PropertyTypeSub(supermod.MD_ExtendedElementInformation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_ExtendedElementInformation=None):
        super(MD_ExtendedElementInformation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_ExtendedElementInformation, )
supermod.MD_ExtendedElementInformation_PropertyType.subclass = MD_ExtendedElementInformation_PropertyTypeSub
# end class MD_ExtendedElementInformation_PropertyTypeSub


class MD_MetadataExtensionInformation_TypeSub(supermod.MD_MetadataExtensionInformation_Type):
    def __init__(self, id=None, uuid=None, extensionOnLineResource=None, extendedElementInformation=None):
        super(MD_MetadataExtensionInformation_TypeSub, self).__init__(id, uuid, extensionOnLineResource, extendedElementInformation, )
supermod.MD_MetadataExtensionInformation_Type.subclass = MD_MetadataExtensionInformation_TypeSub
# end class MD_MetadataExtensionInformation_TypeSub


class MD_MetadataExtensionInformation_PropertyTypeSub(supermod.MD_MetadataExtensionInformation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_MetadataExtensionInformation=None):
        super(MD_MetadataExtensionInformation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_MetadataExtensionInformation, )
supermod.MD_MetadataExtensionInformation_PropertyType.subclass = MD_MetadataExtensionInformation_PropertyTypeSub
# end class MD_MetadataExtensionInformation_PropertyTypeSub


class MD_ObligationCode_PropertyTypeSub(supermod.MD_ObligationCode_PropertyType):
    def __init__(self, nilReason=None, MD_ObligationCode=None):
        super(MD_ObligationCode_PropertyTypeSub, self).__init__(nilReason, MD_ObligationCode, )
supermod.MD_ObligationCode_PropertyType.subclass = MD_ObligationCode_PropertyTypeSub
# end class MD_ObligationCode_PropertyTypeSub


class MD_DatatypeCode_PropertyTypeSub(supermod.MD_DatatypeCode_PropertyType):
    def __init__(self, nilReason=None, MD_DatatypeCode=None):
        super(MD_DatatypeCode_PropertyTypeSub, self).__init__(nilReason, MD_DatatypeCode, )
supermod.MD_DatatypeCode_PropertyType.subclass = MD_DatatypeCode_PropertyTypeSub
# end class MD_DatatypeCode_PropertyTypeSub


class MD_FeatureCatalogueDescription_PropertyTypeSub(supermod.MD_FeatureCatalogueDescription_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_FeatureCatalogueDescription=None):
        super(MD_FeatureCatalogueDescription_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_FeatureCatalogueDescription, )
supermod.MD_FeatureCatalogueDescription_PropertyType.subclass = MD_FeatureCatalogueDescription_PropertyTypeSub
# end class MD_FeatureCatalogueDescription_PropertyTypeSub


class MD_CoverageDescription_PropertyTypeSub(supermod.MD_CoverageDescription_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_CoverageDescription=None):
        super(MD_CoverageDescription_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_CoverageDescription, )
supermod.MD_CoverageDescription_PropertyType.subclass = MD_CoverageDescription_PropertyTypeSub
# end class MD_CoverageDescription_PropertyTypeSub


class MD_ImageDescription_PropertyTypeSub(supermod.MD_ImageDescription_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_ImageDescription=None):
        super(MD_ImageDescription_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_ImageDescription, )
supermod.MD_ImageDescription_PropertyType.subclass = MD_ImageDescription_PropertyTypeSub
# end class MD_ImageDescription_PropertyTypeSub


class AbstractMD_ContentInformation_TypeSub(supermod.AbstractMD_ContentInformation_Type):
    def __init__(self, id=None, uuid=None, extensiontype_=None):
        super(AbstractMD_ContentInformation_TypeSub, self).__init__(id, uuid, extensiontype_, )
supermod.AbstractMD_ContentInformation_Type.subclass = AbstractMD_ContentInformation_TypeSub
# end class AbstractMD_ContentInformation_TypeSub


class MD_ContentInformation_PropertyTypeSub(supermod.MD_ContentInformation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractMD_ContentInformation=None):
        super(MD_ContentInformation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractMD_ContentInformation, )
supermod.MD_ContentInformation_PropertyType.subclass = MD_ContentInformation_PropertyTypeSub
# end class MD_ContentInformation_PropertyTypeSub


class MD_RangeDimension_TypeSub(supermod.MD_RangeDimension_Type):
    def __init__(self, id=None, uuid=None, sequenceIdentifier=None, descriptor=None, extensiontype_=None):
        super(MD_RangeDimension_TypeSub, self).__init__(id, uuid, sequenceIdentifier, descriptor, extensiontype_, )
supermod.MD_RangeDimension_Type.subclass = MD_RangeDimension_TypeSub
# end class MD_RangeDimension_TypeSub


class MD_RangeDimension_PropertyTypeSub(supermod.MD_RangeDimension_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_RangeDimension=None):
        super(MD_RangeDimension_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_RangeDimension, )
supermod.MD_RangeDimension_PropertyType.subclass = MD_RangeDimension_PropertyTypeSub
# end class MD_RangeDimension_PropertyTypeSub


class MD_Band_TypeSub(supermod.MD_Band_Type):
    def __init__(self, id=None, uuid=None, sequenceIdentifier=None, descriptor=None, maxValue=None, minValue=None, units=None, peakResponse=None, bitsPerValue=None, toneGradation=None, scaleFactor=None, offset=None):
        super(MD_Band_TypeSub, self).__init__(id, uuid, sequenceIdentifier, descriptor, maxValue, minValue, units, peakResponse, bitsPerValue, toneGradation, scaleFactor, offset, )
supermod.MD_Band_Type.subclass = MD_Band_TypeSub
# end class MD_Band_TypeSub


class MD_Band_PropertyTypeSub(supermod.MD_Band_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Band=None):
        super(MD_Band_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Band, )
supermod.MD_Band_PropertyType.subclass = MD_Band_PropertyTypeSub
# end class MD_Band_PropertyTypeSub


class MD_CoverageContentTypeCode_PropertyTypeSub(supermod.MD_CoverageContentTypeCode_PropertyType):
    def __init__(self, nilReason=None, MD_CoverageContentTypeCode=None):
        super(MD_CoverageContentTypeCode_PropertyTypeSub, self).__init__(nilReason, MD_CoverageContentTypeCode, )
supermod.MD_CoverageContentTypeCode_PropertyType.subclass = MD_CoverageContentTypeCode_PropertyTypeSub
# end class MD_CoverageContentTypeCode_PropertyTypeSub


class MD_ImagingConditionCode_PropertyTypeSub(supermod.MD_ImagingConditionCode_PropertyType):
    def __init__(self, nilReason=None, MD_ImagingConditionCode=None):
        super(MD_ImagingConditionCode_PropertyTypeSub, self).__init__(nilReason, MD_ImagingConditionCode, )
supermod.MD_ImagingConditionCode_PropertyType.subclass = MD_ImagingConditionCode_PropertyTypeSub
# end class MD_ImagingConditionCode_PropertyTypeSub


class MD_ApplicationSchemaInformation_TypeSub(supermod.MD_ApplicationSchemaInformation_Type):
    def __init__(self, id=None, uuid=None, name=None, schemaLanguage=None, constraintLanguage=None, schemaAscii=None, graphicsFile=None, softwareDevelopmentFile=None, softwareDevelopmentFileFormat=None):
        super(MD_ApplicationSchemaInformation_TypeSub, self).__init__(id, uuid, name, schemaLanguage, constraintLanguage, schemaAscii, graphicsFile, softwareDevelopmentFile, softwareDevelopmentFileFormat, )
supermod.MD_ApplicationSchemaInformation_Type.subclass = MD_ApplicationSchemaInformation_TypeSub
# end class MD_ApplicationSchemaInformation_TypeSub


class MD_ApplicationSchemaInformation_PropertyTypeSub(supermod.MD_ApplicationSchemaInformation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_ApplicationSchemaInformation=None):
        super(MD_ApplicationSchemaInformation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_ApplicationSchemaInformation, )
supermod.MD_ApplicationSchemaInformation_PropertyType.subclass = MD_ApplicationSchemaInformation_PropertyTypeSub
# end class MD_ApplicationSchemaInformation_PropertyTypeSub


class MD_PortrayalCatalogueReference_TypeSub(supermod.MD_PortrayalCatalogueReference_Type):
    def __init__(self, id=None, uuid=None, portrayalCatalogueCitation=None):
        super(MD_PortrayalCatalogueReference_TypeSub, self).__init__(id, uuid, portrayalCatalogueCitation, )
supermod.MD_PortrayalCatalogueReference_Type.subclass = MD_PortrayalCatalogueReference_TypeSub
# end class MD_PortrayalCatalogueReference_TypeSub


class MD_PortrayalCatalogueReference_PropertyTypeSub(supermod.MD_PortrayalCatalogueReference_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_PortrayalCatalogueReference=None):
        super(MD_PortrayalCatalogueReference_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_PortrayalCatalogueReference, )
supermod.MD_PortrayalCatalogueReference_PropertyType.subclass = MD_PortrayalCatalogueReference_PropertyTypeSub
# end class MD_PortrayalCatalogueReference_PropertyTypeSub


class LI_ProcessStep_TypeSub(supermod.LI_ProcessStep_Type):
    def __init__(self, id=None, uuid=None, description=None, rationale=None, dateTime=None, processor=None, source=None):
        super(LI_ProcessStep_TypeSub, self).__init__(id, uuid, description, rationale, dateTime, processor, source, )
supermod.LI_ProcessStep_Type.subclass = LI_ProcessStep_TypeSub
# end class LI_ProcessStep_TypeSub


class LI_ProcessStep_PropertyTypeSub(supermod.LI_ProcessStep_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, LI_ProcessStep=None):
        super(LI_ProcessStep_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, LI_ProcessStep, )
supermod.LI_ProcessStep_PropertyType.subclass = LI_ProcessStep_PropertyTypeSub
# end class LI_ProcessStep_PropertyTypeSub


class LI_Source_TypeSub(supermod.LI_Source_Type):
    def __init__(self, id=None, uuid=None, description=None, scaleDenominator=None, sourceReferenceSystem=None, sourceCitation=None, sourceExtent=None, sourceStep=None):
        super(LI_Source_TypeSub, self).__init__(id, uuid, description, scaleDenominator, sourceReferenceSystem, sourceCitation, sourceExtent, sourceStep, )
supermod.LI_Source_Type.subclass = LI_Source_TypeSub
# end class LI_Source_TypeSub


class LI_Source_PropertyTypeSub(supermod.LI_Source_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, LI_Source=None):
        super(LI_Source_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, LI_Source, )
supermod.LI_Source_PropertyType.subclass = LI_Source_PropertyTypeSub
# end class LI_Source_PropertyTypeSub


class LI_Lineage_TypeSub(supermod.LI_Lineage_Type):
    def __init__(self, id=None, uuid=None, statement=None, processStep=None, source=None):
        super(LI_Lineage_TypeSub, self).__init__(id, uuid, statement, processStep, source, )
supermod.LI_Lineage_Type.subclass = LI_Lineage_TypeSub
# end class LI_Lineage_TypeSub


class LI_Lineage_PropertyTypeSub(supermod.LI_Lineage_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, LI_Lineage=None):
        super(LI_Lineage_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, LI_Lineage, )
supermod.LI_Lineage_PropertyType.subclass = LI_Lineage_PropertyTypeSub
# end class LI_Lineage_PropertyTypeSub


class DQ_ConformanceResult_PropertyTypeSub(supermod.DQ_ConformanceResult_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_ConformanceResult=None):
        super(DQ_ConformanceResult_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_ConformanceResult, )
supermod.DQ_ConformanceResult_PropertyType.subclass = DQ_ConformanceResult_PropertyTypeSub
# end class DQ_ConformanceResult_PropertyTypeSub


class DQ_QuantitativeResult_PropertyTypeSub(supermod.DQ_QuantitativeResult_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_QuantitativeResult=None):
        super(DQ_QuantitativeResult_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_QuantitativeResult, )
supermod.DQ_QuantitativeResult_PropertyType.subclass = DQ_QuantitativeResult_PropertyTypeSub
# end class DQ_QuantitativeResult_PropertyTypeSub


class AbstractDQ_Result_TypeSub(supermod.AbstractDQ_Result_Type):
    def __init__(self, id=None, uuid=None, extensiontype_=None):
        super(AbstractDQ_Result_TypeSub, self).__init__(id, uuid, extensiontype_, )
supermod.AbstractDQ_Result_Type.subclass = AbstractDQ_Result_TypeSub
# end class AbstractDQ_Result_TypeSub


class DQ_Result_PropertyTypeSub(supermod.DQ_Result_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDQ_Result=None):
        super(DQ_Result_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDQ_Result, )
supermod.DQ_Result_PropertyType.subclass = DQ_Result_PropertyTypeSub
# end class DQ_Result_PropertyTypeSub


class DQ_TemporalValidity_PropertyTypeSub(supermod.DQ_TemporalValidity_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_TemporalValidity=None):
        super(DQ_TemporalValidity_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_TemporalValidity, )
supermod.DQ_TemporalValidity_PropertyType.subclass = DQ_TemporalValidity_PropertyTypeSub
# end class DQ_TemporalValidity_PropertyTypeSub


class DQ_TemporalConsistency_PropertyTypeSub(supermod.DQ_TemporalConsistency_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_TemporalConsistency=None):
        super(DQ_TemporalConsistency_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_TemporalConsistency, )
supermod.DQ_TemporalConsistency_PropertyType.subclass = DQ_TemporalConsistency_PropertyTypeSub
# end class DQ_TemporalConsistency_PropertyTypeSub


class DQ_AccuracyOfATimeMeasurement_PropertyTypeSub(supermod.DQ_AccuracyOfATimeMeasurement_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_AccuracyOfATimeMeasurement=None):
        super(DQ_AccuracyOfATimeMeasurement_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_AccuracyOfATimeMeasurement, )
supermod.DQ_AccuracyOfATimeMeasurement_PropertyType.subclass = DQ_AccuracyOfATimeMeasurement_PropertyTypeSub
# end class DQ_AccuracyOfATimeMeasurement_PropertyTypeSub


class DQ_QuantitativeAttributeAccuracy_PropertyTypeSub(supermod.DQ_QuantitativeAttributeAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_QuantitativeAttributeAccuracy=None):
        super(DQ_QuantitativeAttributeAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_QuantitativeAttributeAccuracy, )
supermod.DQ_QuantitativeAttributeAccuracy_PropertyType.subclass = DQ_QuantitativeAttributeAccuracy_PropertyTypeSub
# end class DQ_QuantitativeAttributeAccuracy_PropertyTypeSub


class DQ_NonQuantitativeAttributeAccuracy_PropertyTypeSub(supermod.DQ_NonQuantitativeAttributeAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_NonQuantitativeAttributeAccuracy=None):
        super(DQ_NonQuantitativeAttributeAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_NonQuantitativeAttributeAccuracy, )
supermod.DQ_NonQuantitativeAttributeAccuracy_PropertyType.subclass = DQ_NonQuantitativeAttributeAccuracy_PropertyTypeSub
# end class DQ_NonQuantitativeAttributeAccuracy_PropertyTypeSub


class DQ_ThematicClassificationCorrectness_PropertyTypeSub(supermod.DQ_ThematicClassificationCorrectness_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_ThematicClassificationCorrectness=None):
        super(DQ_ThematicClassificationCorrectness_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_ThematicClassificationCorrectness, )
supermod.DQ_ThematicClassificationCorrectness_PropertyType.subclass = DQ_ThematicClassificationCorrectness_PropertyTypeSub
# end class DQ_ThematicClassificationCorrectness_PropertyTypeSub


class DQ_RelativeInternalPositionalAccuracy_PropertyTypeSub(supermod.DQ_RelativeInternalPositionalAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_RelativeInternalPositionalAccuracy=None):
        super(DQ_RelativeInternalPositionalAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_RelativeInternalPositionalAccuracy, )
supermod.DQ_RelativeInternalPositionalAccuracy_PropertyType.subclass = DQ_RelativeInternalPositionalAccuracy_PropertyTypeSub
# end class DQ_RelativeInternalPositionalAccuracy_PropertyTypeSub


class DQ_GriddedDataPositionalAccuracy_PropertyTypeSub(supermod.DQ_GriddedDataPositionalAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_GriddedDataPositionalAccuracy=None):
        super(DQ_GriddedDataPositionalAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_GriddedDataPositionalAccuracy, )
supermod.DQ_GriddedDataPositionalAccuracy_PropertyType.subclass = DQ_GriddedDataPositionalAccuracy_PropertyTypeSub
# end class DQ_GriddedDataPositionalAccuracy_PropertyTypeSub


class DQ_AbsoluteExternalPositionalAccuracy_PropertyTypeSub(supermod.DQ_AbsoluteExternalPositionalAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_AbsoluteExternalPositionalAccuracy=None):
        super(DQ_AbsoluteExternalPositionalAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_AbsoluteExternalPositionalAccuracy, )
supermod.DQ_AbsoluteExternalPositionalAccuracy_PropertyType.subclass = DQ_AbsoluteExternalPositionalAccuracy_PropertyTypeSub
# end class DQ_AbsoluteExternalPositionalAccuracy_PropertyTypeSub


class DQ_TopologicalConsistency_PropertyTypeSub(supermod.DQ_TopologicalConsistency_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_TopologicalConsistency=None):
        super(DQ_TopologicalConsistency_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_TopologicalConsistency, )
supermod.DQ_TopologicalConsistency_PropertyType.subclass = DQ_TopologicalConsistency_PropertyTypeSub
# end class DQ_TopologicalConsistency_PropertyTypeSub


class DQ_FormatConsistency_PropertyTypeSub(supermod.DQ_FormatConsistency_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_FormatConsistency=None):
        super(DQ_FormatConsistency_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_FormatConsistency, )
supermod.DQ_FormatConsistency_PropertyType.subclass = DQ_FormatConsistency_PropertyTypeSub
# end class DQ_FormatConsistency_PropertyTypeSub


class DQ_DomainConsistency_PropertyTypeSub(supermod.DQ_DomainConsistency_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_DomainConsistency=None):
        super(DQ_DomainConsistency_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_DomainConsistency, )
supermod.DQ_DomainConsistency_PropertyType.subclass = DQ_DomainConsistency_PropertyTypeSub
# end class DQ_DomainConsistency_PropertyTypeSub


class DQ_ConceptualConsistency_PropertyTypeSub(supermod.DQ_ConceptualConsistency_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_ConceptualConsistency=None):
        super(DQ_ConceptualConsistency_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_ConceptualConsistency, )
supermod.DQ_ConceptualConsistency_PropertyType.subclass = DQ_ConceptualConsistency_PropertyTypeSub
# end class DQ_ConceptualConsistency_PropertyTypeSub


class DQ_CompletenessOmission_PropertyTypeSub(supermod.DQ_CompletenessOmission_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_CompletenessOmission=None):
        super(DQ_CompletenessOmission_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_CompletenessOmission, )
supermod.DQ_CompletenessOmission_PropertyType.subclass = DQ_CompletenessOmission_PropertyTypeSub
# end class DQ_CompletenessOmission_PropertyTypeSub


class DQ_CompletenessCommission_PropertyTypeSub(supermod.DQ_CompletenessCommission_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_CompletenessCommission=None):
        super(DQ_CompletenessCommission_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_CompletenessCommission, )
supermod.DQ_CompletenessCommission_PropertyType.subclass = DQ_CompletenessCommission_PropertyTypeSub
# end class DQ_CompletenessCommission_PropertyTypeSub


class DQ_TemporalAccuracy_PropertyTypeSub(supermod.DQ_TemporalAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDQ_TemporalAccuracy=None):
        super(DQ_TemporalAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDQ_TemporalAccuracy, )
supermod.DQ_TemporalAccuracy_PropertyType.subclass = DQ_TemporalAccuracy_PropertyTypeSub
# end class DQ_TemporalAccuracy_PropertyTypeSub


class DQ_ThematicAccuracy_PropertyTypeSub(supermod.DQ_ThematicAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDQ_ThematicAccuracy=None):
        super(DQ_ThematicAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDQ_ThematicAccuracy, )
supermod.DQ_ThematicAccuracy_PropertyType.subclass = DQ_ThematicAccuracy_PropertyTypeSub
# end class DQ_ThematicAccuracy_PropertyTypeSub


class DQ_PositionalAccuracy_PropertyTypeSub(supermod.DQ_PositionalAccuracy_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDQ_PositionalAccuracy=None):
        super(DQ_PositionalAccuracy_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDQ_PositionalAccuracy, )
supermod.DQ_PositionalAccuracy_PropertyType.subclass = DQ_PositionalAccuracy_PropertyTypeSub
# end class DQ_PositionalAccuracy_PropertyTypeSub


class DQ_LogicalConsistency_PropertyTypeSub(supermod.DQ_LogicalConsistency_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDQ_LogicalConsistency=None):
        super(DQ_LogicalConsistency_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDQ_LogicalConsistency, )
supermod.DQ_LogicalConsistency_PropertyType.subclass = DQ_LogicalConsistency_PropertyTypeSub
# end class DQ_LogicalConsistency_PropertyTypeSub


class DQ_Completeness_PropertyTypeSub(supermod.DQ_Completeness_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDQ_Completeness=None):
        super(DQ_Completeness_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDQ_Completeness, )
supermod.DQ_Completeness_PropertyType.subclass = DQ_Completeness_PropertyTypeSub
# end class DQ_Completeness_PropertyTypeSub


class AbstractDQ_Element_TypeSub(supermod.AbstractDQ_Element_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None, extensiontype_=None):
        super(AbstractDQ_Element_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, extensiontype_, )
supermod.AbstractDQ_Element_Type.subclass = AbstractDQ_Element_TypeSub
# end class AbstractDQ_Element_TypeSub


class DQ_Element_PropertyTypeSub(supermod.DQ_Element_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractDQ_Element=None):
        super(DQ_Element_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractDQ_Element, )
supermod.DQ_Element_PropertyType.subclass = DQ_Element_PropertyTypeSub
# end class DQ_Element_PropertyTypeSub


class DQ_DataQuality_TypeSub(supermod.DQ_DataQuality_Type):
    def __init__(self, id=None, uuid=None, scope=None, report=None, lineage=None):
        super(DQ_DataQuality_TypeSub, self).__init__(id, uuid, scope, report, lineage, )
supermod.DQ_DataQuality_Type.subclass = DQ_DataQuality_TypeSub
# end class DQ_DataQuality_TypeSub


class DQ_DataQuality_PropertyTypeSub(supermod.DQ_DataQuality_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_DataQuality=None):
        super(DQ_DataQuality_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_DataQuality, )
supermod.DQ_DataQuality_PropertyType.subclass = DQ_DataQuality_PropertyTypeSub
# end class DQ_DataQuality_PropertyTypeSub


class DQ_Scope_TypeSub(supermod.DQ_Scope_Type):
    def __init__(self, id=None, uuid=None, level=None, extent=None, levelDescription=None):
        super(DQ_Scope_TypeSub, self).__init__(id, uuid, level, extent, levelDescription, )
supermod.DQ_Scope_Type.subclass = DQ_Scope_TypeSub
# end class DQ_Scope_TypeSub


class DQ_Scope_PropertyTypeSub(supermod.DQ_Scope_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DQ_Scope=None):
        super(DQ_Scope_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DQ_Scope, )
supermod.DQ_Scope_PropertyType.subclass = DQ_Scope_PropertyTypeSub
# end class DQ_Scope_PropertyTypeSub


class DQ_EvaluationMethodTypeCode_PropertyTypeSub(supermod.DQ_EvaluationMethodTypeCode_PropertyType):
    def __init__(self, nilReason=None, DQ_EvaluationMethodTypeCode=None):
        super(DQ_EvaluationMethodTypeCode_PropertyTypeSub, self).__init__(nilReason, DQ_EvaluationMethodTypeCode, )
supermod.DQ_EvaluationMethodTypeCode_PropertyType.subclass = DQ_EvaluationMethodTypeCode_PropertyTypeSub
# end class DQ_EvaluationMethodTypeCode_PropertyTypeSub


class AbstractMD_Identification_TypeSub(supermod.AbstractMD_Identification_Type):
    def __init__(self, id=None, uuid=None, citation=None, abstract=None, purpose=None, credit=None, status=None, pointOfContact=None, resourceMaintenance=None, graphicOverview=None, resourceFormat=None, descriptiveKeywords=None, resourceSpecificUsage=None, resourceConstraints=None, aggregationInfo=None, extensiontype_=None):
        super(AbstractMD_Identification_TypeSub, self).__init__(id, uuid, citation, abstract, purpose, credit, status, pointOfContact, resourceMaintenance, graphicOverview, resourceFormat, descriptiveKeywords, resourceSpecificUsage, resourceConstraints, aggregationInfo, extensiontype_, )
supermod.AbstractMD_Identification_Type.subclass = AbstractMD_Identification_TypeSub
# end class AbstractMD_Identification_TypeSub


class MD_Identification_PropertyTypeSub(supermod.MD_Identification_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, AbstractMD_Identification=None):
        super(MD_Identification_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, AbstractMD_Identification, )
supermod.MD_Identification_PropertyType.subclass = MD_Identification_PropertyTypeSub
# end class MD_Identification_PropertyTypeSub


class MD_BrowseGraphic_TypeSub(supermod.MD_BrowseGraphic_Type):
    def __init__(self, id=None, uuid=None, fileName=None, fileDescription=None, fileType=None):
        super(MD_BrowseGraphic_TypeSub, self).__init__(id, uuid, fileName, fileDescription, fileType, )
supermod.MD_BrowseGraphic_Type.subclass = MD_BrowseGraphic_TypeSub
# end class MD_BrowseGraphic_TypeSub


class MD_BrowseGraphic_PropertyTypeSub(supermod.MD_BrowseGraphic_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_BrowseGraphic=None):
        super(MD_BrowseGraphic_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_BrowseGraphic, )
supermod.MD_BrowseGraphic_PropertyType.subclass = MD_BrowseGraphic_PropertyTypeSub
# end class MD_BrowseGraphic_PropertyTypeSub


class MD_DataIdentification_TypeSub(supermod.MD_DataIdentification_Type):
    def __init__(self, id=None, uuid=None, citation=None, abstract=None, purpose=None, credit=None, status=None, pointOfContact=None, resourceMaintenance=None, graphicOverview=None, resourceFormat=None, descriptiveKeywords=None, resourceSpecificUsage=None, resourceConstraints=None, aggregationInfo=None, spatialRepresentationType=None, spatialResolution=None, language=None, characterSet=None, topicCategory=None, environmentDescription=None, extent=None, supplementalInformation=None):
        super(MD_DataIdentification_TypeSub, self).__init__(id, uuid, citation, abstract, purpose, credit, status, pointOfContact, resourceMaintenance, graphicOverview, resourceFormat, descriptiveKeywords, resourceSpecificUsage, resourceConstraints, aggregationInfo, spatialRepresentationType, spatialResolution, language, characterSet, topicCategory, environmentDescription, extent, supplementalInformation, )
supermod.MD_DataIdentification_Type.subclass = MD_DataIdentification_TypeSub
# end class MD_DataIdentification_TypeSub


class MD_DataIdentification_PropertyTypeSub(supermod.MD_DataIdentification_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_DataIdentification=None):
        super(MD_DataIdentification_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_DataIdentification, )
supermod.MD_DataIdentification_PropertyType.subclass = MD_DataIdentification_PropertyTypeSub
# end class MD_DataIdentification_PropertyTypeSub


class MD_ServiceIdentification_TypeSub(supermod.MD_ServiceIdentification_Type):
    def __init__(self, id=None, uuid=None, citation=None, abstract=None, purpose=None, credit=None, status=None, pointOfContact=None, resourceMaintenance=None, graphicOverview=None, resourceFormat=None, descriptiveKeywords=None, resourceSpecificUsage=None, resourceConstraints=None, aggregationInfo=None):
        super(MD_ServiceIdentification_TypeSub, self).__init__(id, uuid, citation, abstract, purpose, credit, status, pointOfContact, resourceMaintenance, graphicOverview, resourceFormat, descriptiveKeywords, resourceSpecificUsage, resourceConstraints, aggregationInfo, )
supermod.MD_ServiceIdentification_Type.subclass = MD_ServiceIdentification_TypeSub
# end class MD_ServiceIdentification_TypeSub


class MD_ServiceIdentification_PropertyTypeSub(supermod.MD_ServiceIdentification_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_ServiceIdentification=None):
        super(MD_ServiceIdentification_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_ServiceIdentification, )
supermod.MD_ServiceIdentification_PropertyType.subclass = MD_ServiceIdentification_PropertyTypeSub
# end class MD_ServiceIdentification_PropertyTypeSub


class MD_RepresentativeFraction_TypeSub(supermod.MD_RepresentativeFraction_Type):
    def __init__(self, id=None, uuid=None, denominator=None):
        super(MD_RepresentativeFraction_TypeSub, self).__init__(id, uuid, denominator, )
supermod.MD_RepresentativeFraction_Type.subclass = MD_RepresentativeFraction_TypeSub
# end class MD_RepresentativeFraction_TypeSub


class MD_RepresentativeFraction_PropertyTypeSub(supermod.MD_RepresentativeFraction_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_RepresentativeFraction=None):
        super(MD_RepresentativeFraction_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_RepresentativeFraction, )
supermod.MD_RepresentativeFraction_PropertyType.subclass = MD_RepresentativeFraction_PropertyTypeSub
# end class MD_RepresentativeFraction_PropertyTypeSub


class MD_Usage_TypeSub(supermod.MD_Usage_Type):
    def __init__(self, id=None, uuid=None, specificUsage=None, usageDateTime=None, userDeterminedLimitations=None, userContactInfo=None):
        super(MD_Usage_TypeSub, self).__init__(id, uuid, specificUsage, usageDateTime, userDeterminedLimitations, userContactInfo, )
supermod.MD_Usage_Type.subclass = MD_Usage_TypeSub
# end class MD_Usage_TypeSub


class MD_Usage_PropertyTypeSub(supermod.MD_Usage_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Usage=None):
        super(MD_Usage_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Usage, )
supermod.MD_Usage_PropertyType.subclass = MD_Usage_PropertyTypeSub
# end class MD_Usage_PropertyTypeSub


class MD_Keywords_TypeSub(supermod.MD_Keywords_Type):
    def __init__(self, id=None, uuid=None, keyword=None, type_=None, thesaurusName=None):
        super(MD_Keywords_TypeSub, self).__init__(id, uuid, keyword, type_, thesaurusName, )
supermod.MD_Keywords_Type.subclass = MD_Keywords_TypeSub
# end class MD_Keywords_TypeSub


class MD_Keywords_PropertyTypeSub(supermod.MD_Keywords_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Keywords=None):
        super(MD_Keywords_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Keywords, )
supermod.MD_Keywords_PropertyType.subclass = MD_Keywords_PropertyTypeSub
# end class MD_Keywords_PropertyTypeSub


class DS_Association_TypeSub(supermod.DS_Association_Type):
    def __init__(self, id=None, uuid=None):
        super(DS_Association_TypeSub, self).__init__(id, uuid, )
supermod.DS_Association_Type.subclass = DS_Association_TypeSub
# end class DS_Association_TypeSub


class DS_Association_PropertyTypeSub(supermod.DS_Association_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, DS_Association=None):
        super(DS_Association_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, DS_Association, )
supermod.DS_Association_PropertyType.subclass = DS_Association_PropertyTypeSub
# end class DS_Association_PropertyTypeSub


class MD_AggregateInformation_TypeSub(supermod.MD_AggregateInformation_Type):
    def __init__(self, id=None, uuid=None, aggregateDataSetName=None, aggregateDataSetIdentifier=None, associationType=None, initiativeType=None):
        super(MD_AggregateInformation_TypeSub, self).__init__(id, uuid, aggregateDataSetName, aggregateDataSetIdentifier, associationType, initiativeType, )
supermod.MD_AggregateInformation_Type.subclass = MD_AggregateInformation_TypeSub
# end class MD_AggregateInformation_TypeSub


class MD_AggregateInformation_PropertyTypeSub(supermod.MD_AggregateInformation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_AggregateInformation=None):
        super(MD_AggregateInformation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_AggregateInformation, )
supermod.MD_AggregateInformation_PropertyType.subclass = MD_AggregateInformation_PropertyTypeSub
# end class MD_AggregateInformation_PropertyTypeSub


class MD_Resolution_TypeSub(supermod.MD_Resolution_Type):
    def __init__(self, equivalentScale=None, distance=None):
        super(MD_Resolution_TypeSub, self).__init__(equivalentScale, distance, )
supermod.MD_Resolution_Type.subclass = MD_Resolution_TypeSub
# end class MD_Resolution_TypeSub


class MD_Resolution_PropertyTypeSub(supermod.MD_Resolution_PropertyType):
    def __init__(self, nilReason=None, MD_Resolution=None):
        super(MD_Resolution_PropertyTypeSub, self).__init__(nilReason, MD_Resolution, )
supermod.MD_Resolution_PropertyType.subclass = MD_Resolution_PropertyTypeSub
# end class MD_Resolution_PropertyTypeSub


class MD_TopicCategoryCode_PropertyTypeSub(supermod.MD_TopicCategoryCode_PropertyType):
    def __init__(self, nilReason=None, MD_TopicCategoryCode=None):
        super(MD_TopicCategoryCode_PropertyTypeSub, self).__init__(nilReason, MD_TopicCategoryCode, )
supermod.MD_TopicCategoryCode_PropertyType.subclass = MD_TopicCategoryCode_PropertyTypeSub
# end class MD_TopicCategoryCode_PropertyTypeSub


class MD_CharacterSetCode_PropertyTypeSub(supermod.MD_CharacterSetCode_PropertyType):
    def __init__(self, nilReason=None, MD_CharacterSetCode=None):
        super(MD_CharacterSetCode_PropertyTypeSub, self).__init__(nilReason, MD_CharacterSetCode, )
supermod.MD_CharacterSetCode_PropertyType.subclass = MD_CharacterSetCode_PropertyTypeSub
# end class MD_CharacterSetCode_PropertyTypeSub


class MD_SpatialRepresentationTypeCode_PropertyTypeSub(supermod.MD_SpatialRepresentationTypeCode_PropertyType):
    def __init__(self, nilReason=None, MD_SpatialRepresentationTypeCode=None):
        super(MD_SpatialRepresentationTypeCode_PropertyTypeSub, self).__init__(nilReason, MD_SpatialRepresentationTypeCode, )
supermod.MD_SpatialRepresentationTypeCode_PropertyType.subclass = MD_SpatialRepresentationTypeCode_PropertyTypeSub
# end class MD_SpatialRepresentationTypeCode_PropertyTypeSub


class MD_ProgressCode_PropertyTypeSub(supermod.MD_ProgressCode_PropertyType):
    def __init__(self, nilReason=None, MD_ProgressCode=None):
        super(MD_ProgressCode_PropertyTypeSub, self).__init__(nilReason, MD_ProgressCode, )
supermod.MD_ProgressCode_PropertyType.subclass = MD_ProgressCode_PropertyTypeSub
# end class MD_ProgressCode_PropertyTypeSub


class MD_KeywordTypeCode_PropertyTypeSub(supermod.MD_KeywordTypeCode_PropertyType):
    def __init__(self, nilReason=None, MD_KeywordTypeCode=None):
        super(MD_KeywordTypeCode_PropertyTypeSub, self).__init__(nilReason, MD_KeywordTypeCode, )
supermod.MD_KeywordTypeCode_PropertyType.subclass = MD_KeywordTypeCode_PropertyTypeSub
# end class MD_KeywordTypeCode_PropertyTypeSub


class DS_AssociationTypeCode_PropertyTypeSub(supermod.DS_AssociationTypeCode_PropertyType):
    def __init__(self, nilReason=None, DS_AssociationTypeCode=None):
        super(DS_AssociationTypeCode_PropertyTypeSub, self).__init__(nilReason, DS_AssociationTypeCode, )
supermod.DS_AssociationTypeCode_PropertyType.subclass = DS_AssociationTypeCode_PropertyTypeSub
# end class DS_AssociationTypeCode_PropertyTypeSub


class DS_InitiativeTypeCode_PropertyTypeSub(supermod.DS_InitiativeTypeCode_PropertyType):
    def __init__(self, nilReason=None, DS_InitiativeTypeCode=None):
        super(DS_InitiativeTypeCode_PropertyTypeSub, self).__init__(nilReason, DS_InitiativeTypeCode, )
supermod.DS_InitiativeTypeCode_PropertyType.subclass = DS_InitiativeTypeCode_PropertyTypeSub
# end class DS_InitiativeTypeCode_PropertyTypeSub


class MD_Constraints_TypeSub(supermod.MD_Constraints_Type):
    def __init__(self, id=None, uuid=None, useLimitation=None, extensiontype_=None):
        super(MD_Constraints_TypeSub, self).__init__(id, uuid, useLimitation, extensiontype_, )
supermod.MD_Constraints_Type.subclass = MD_Constraints_TypeSub
# end class MD_Constraints_TypeSub


class MD_Constraints_PropertyTypeSub(supermod.MD_Constraints_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Constraints=None):
        super(MD_Constraints_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Constraints, )
supermod.MD_Constraints_PropertyType.subclass = MD_Constraints_PropertyTypeSub
# end class MD_Constraints_PropertyTypeSub


class MD_LegalConstraints_TypeSub(supermod.MD_LegalConstraints_Type):
    def __init__(self, id=None, uuid=None, useLimitation=None, accessConstraints=None, useConstraints=None, otherConstraints=None):
        super(MD_LegalConstraints_TypeSub, self).__init__(id, uuid, useLimitation, accessConstraints, useConstraints, otherConstraints, )
supermod.MD_LegalConstraints_Type.subclass = MD_LegalConstraints_TypeSub
# end class MD_LegalConstraints_TypeSub


class MD_LegalConstraints_PropertyTypeSub(supermod.MD_LegalConstraints_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_LegalConstraints=None):
        super(MD_LegalConstraints_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_LegalConstraints, )
supermod.MD_LegalConstraints_PropertyType.subclass = MD_LegalConstraints_PropertyTypeSub
# end class MD_LegalConstraints_PropertyTypeSub


class MD_SecurityConstraints_TypeSub(supermod.MD_SecurityConstraints_Type):
    def __init__(self, id=None, uuid=None, useLimitation=None, classification=None, userNote=None, classificationSystem=None, handlingDescription=None):
        super(MD_SecurityConstraints_TypeSub, self).__init__(id, uuid, useLimitation, classification, userNote, classificationSystem, handlingDescription, )
supermod.MD_SecurityConstraints_Type.subclass = MD_SecurityConstraints_TypeSub
# end class MD_SecurityConstraints_TypeSub


class MD_SecurityConstraints_PropertyTypeSub(supermod.MD_SecurityConstraints_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_SecurityConstraints=None):
        super(MD_SecurityConstraints_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_SecurityConstraints, )
supermod.MD_SecurityConstraints_PropertyType.subclass = MD_SecurityConstraints_PropertyTypeSub
# end class MD_SecurityConstraints_PropertyTypeSub


class MD_ClassificationCode_PropertyTypeSub(supermod.MD_ClassificationCode_PropertyType):
    def __init__(self, nilReason=None, MD_ClassificationCode=None):
        super(MD_ClassificationCode_PropertyTypeSub, self).__init__(nilReason, MD_ClassificationCode, )
supermod.MD_ClassificationCode_PropertyType.subclass = MD_ClassificationCode_PropertyTypeSub
# end class MD_ClassificationCode_PropertyTypeSub


class MD_RestrictionCode_PropertyTypeSub(supermod.MD_RestrictionCode_PropertyType):
    def __init__(self, nilReason=None, MD_RestrictionCode=None):
        super(MD_RestrictionCode_PropertyTypeSub, self).__init__(nilReason, MD_RestrictionCode, )
supermod.MD_RestrictionCode_PropertyType.subclass = MD_RestrictionCode_PropertyTypeSub
# end class MD_RestrictionCode_PropertyTypeSub


class MD_Medium_TypeSub(supermod.MD_Medium_Type):
    def __init__(self, id=None, uuid=None, name=None, density=None, densityUnits=None, volumes=None, mediumFormat=None, mediumNote=None):
        super(MD_Medium_TypeSub, self).__init__(id, uuid, name, density, densityUnits, volumes, mediumFormat, mediumNote, )
supermod.MD_Medium_Type.subclass = MD_Medium_TypeSub
# end class MD_Medium_TypeSub


class MD_Medium_PropertyTypeSub(supermod.MD_Medium_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Medium=None):
        super(MD_Medium_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Medium, )
supermod.MD_Medium_PropertyType.subclass = MD_Medium_PropertyTypeSub
# end class MD_Medium_PropertyTypeSub


class MD_DigitalTransferOptions_TypeSub(supermod.MD_DigitalTransferOptions_Type):
    def __init__(self, id=None, uuid=None, unitsOfDistribution=None, transferSize=None, onLine=None, offLine=None):
        super(MD_DigitalTransferOptions_TypeSub, self).__init__(id, uuid, unitsOfDistribution, transferSize, onLine, offLine, )
supermod.MD_DigitalTransferOptions_Type.subclass = MD_DigitalTransferOptions_TypeSub
# end class MD_DigitalTransferOptions_TypeSub


class MD_DigitalTransferOptions_PropertyTypeSub(supermod.MD_DigitalTransferOptions_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_DigitalTransferOptions=None):
        super(MD_DigitalTransferOptions_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_DigitalTransferOptions, )
supermod.MD_DigitalTransferOptions_PropertyType.subclass = MD_DigitalTransferOptions_PropertyTypeSub
# end class MD_DigitalTransferOptions_PropertyTypeSub


class MD_StandardOrderProcess_TypeSub(supermod.MD_StandardOrderProcess_Type):
    def __init__(self, id=None, uuid=None, fees=None, plannedAvailableDateTime=None, orderingInstructions=None, turnaround=None):
        super(MD_StandardOrderProcess_TypeSub, self).__init__(id, uuid, fees, plannedAvailableDateTime, orderingInstructions, turnaround, )
supermod.MD_StandardOrderProcess_Type.subclass = MD_StandardOrderProcess_TypeSub
# end class MD_StandardOrderProcess_TypeSub


class MD_StandardOrderProcess_PropertyTypeSub(supermod.MD_StandardOrderProcess_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_StandardOrderProcess=None):
        super(MD_StandardOrderProcess_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_StandardOrderProcess, )
supermod.MD_StandardOrderProcess_PropertyType.subclass = MD_StandardOrderProcess_PropertyTypeSub
# end class MD_StandardOrderProcess_PropertyTypeSub


class MD_Distributor_TypeSub(supermod.MD_Distributor_Type):
    def __init__(self, id=None, uuid=None, distributorContact=None, distributionOrderProcess=None, distributorFormat=None, distributorTransferOptions=None):
        super(MD_Distributor_TypeSub, self).__init__(id, uuid, distributorContact, distributionOrderProcess, distributorFormat, distributorTransferOptions, )
supermod.MD_Distributor_Type.subclass = MD_Distributor_TypeSub
# end class MD_Distributor_TypeSub


class MD_Distributor_PropertyTypeSub(supermod.MD_Distributor_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Distributor=None):
        super(MD_Distributor_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Distributor, )
supermod.MD_Distributor_PropertyType.subclass = MD_Distributor_PropertyTypeSub
# end class MD_Distributor_PropertyTypeSub


class MD_Distribution_TypeSub(supermod.MD_Distribution_Type):
    def __init__(self, id=None, uuid=None, distributionFormat=None, distributor=None, transferOptions=None):
        super(MD_Distribution_TypeSub, self).__init__(id, uuid, distributionFormat, distributor, transferOptions, )
supermod.MD_Distribution_Type.subclass = MD_Distribution_TypeSub
# end class MD_Distribution_TypeSub


class MD_Distribution_PropertyTypeSub(supermod.MD_Distribution_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Distribution=None):
        super(MD_Distribution_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Distribution, )
supermod.MD_Distribution_PropertyType.subclass = MD_Distribution_PropertyTypeSub
# end class MD_Distribution_PropertyTypeSub


class MD_Format_TypeSub(supermod.MD_Format_Type):
    def __init__(self, id=None, uuid=None, name=None, version=None, amendmentNumber=None, specification=None, fileDecompressionTechnique=None, formatDistributor=None):
        super(MD_Format_TypeSub, self).__init__(id, uuid, name, version, amendmentNumber, specification, fileDecompressionTechnique, formatDistributor, )
supermod.MD_Format_Type.subclass = MD_Format_TypeSub
# end class MD_Format_TypeSub


class MD_Format_PropertyTypeSub(supermod.MD_Format_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_Format=None):
        super(MD_Format_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_Format, )
supermod.MD_Format_PropertyType.subclass = MD_Format_PropertyTypeSub
# end class MD_Format_PropertyTypeSub


class MD_DistributionUnits_PropertyTypeSub(supermod.MD_DistributionUnits_PropertyType):
    def __init__(self, nilReason=None, MD_DistributionUnits=None):
        super(MD_DistributionUnits_PropertyTypeSub, self).__init__(nilReason, MD_DistributionUnits, )
supermod.MD_DistributionUnits_PropertyType.subclass = MD_DistributionUnits_PropertyTypeSub
# end class MD_DistributionUnits_PropertyTypeSub


class MD_MediumFormatCode_PropertyTypeSub(supermod.MD_MediumFormatCode_PropertyType):
    def __init__(self, nilReason=None, MD_MediumFormatCode=None):
        super(MD_MediumFormatCode_PropertyTypeSub, self).__init__(nilReason, MD_MediumFormatCode, )
supermod.MD_MediumFormatCode_PropertyType.subclass = MD_MediumFormatCode_PropertyTypeSub
# end class MD_MediumFormatCode_PropertyTypeSub


class MD_MediumNameCode_PropertyTypeSub(supermod.MD_MediumNameCode_PropertyType):
    def __init__(self, nilReason=None, MD_MediumNameCode=None):
        super(MD_MediumNameCode_PropertyTypeSub, self).__init__(nilReason, MD_MediumNameCode, )
supermod.MD_MediumNameCode_PropertyType.subclass = MD_MediumNameCode_PropertyTypeSub
# end class MD_MediumNameCode_PropertyTypeSub


class MD_MaintenanceInformation_TypeSub(supermod.MD_MaintenanceInformation_Type):
    def __init__(self, id=None, uuid=None, maintenanceAndUpdateFrequency=None, dateOfNextUpdate=None, userDefinedMaintenanceFrequency=None, updateScope=None, updateScopeDescription=None, maintenanceNote=None, contact=None):
        super(MD_MaintenanceInformation_TypeSub, self).__init__(id, uuid, maintenanceAndUpdateFrequency, dateOfNextUpdate, userDefinedMaintenanceFrequency, updateScope, updateScopeDescription, maintenanceNote, contact, )
supermod.MD_MaintenanceInformation_Type.subclass = MD_MaintenanceInformation_TypeSub
# end class MD_MaintenanceInformation_TypeSub


class MD_MaintenanceInformation_PropertyTypeSub(supermod.MD_MaintenanceInformation_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, MD_MaintenanceInformation=None):
        super(MD_MaintenanceInformation_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, MD_MaintenanceInformation, )
supermod.MD_MaintenanceInformation_PropertyType.subclass = MD_MaintenanceInformation_PropertyTypeSub
# end class MD_MaintenanceInformation_PropertyTypeSub


class MD_ScopeDescription_TypeSub(supermod.MD_ScopeDescription_Type):
    def __init__(self, attributes=None, features=None, featureInstances=None, attributeInstances=None, dataset=None, other=None):
        super(MD_ScopeDescription_TypeSub, self).__init__(attributes, features, featureInstances, attributeInstances, dataset, other, )
supermod.MD_ScopeDescription_Type.subclass = MD_ScopeDescription_TypeSub
# end class MD_ScopeDescription_TypeSub


class MD_ScopeDescription_PropertyTypeSub(supermod.MD_ScopeDescription_PropertyType):
    def __init__(self, nilReason=None, MD_ScopeDescription=None):
        super(MD_ScopeDescription_PropertyTypeSub, self).__init__(nilReason, MD_ScopeDescription, )
supermod.MD_ScopeDescription_PropertyType.subclass = MD_ScopeDescription_PropertyTypeSub
# end class MD_ScopeDescription_PropertyTypeSub


class MD_MaintenanceFrequencyCode_PropertyTypeSub(supermod.MD_MaintenanceFrequencyCode_PropertyType):
    def __init__(self, nilReason=None, MD_MaintenanceFrequencyCode=None):
        super(MD_MaintenanceFrequencyCode_PropertyTypeSub, self).__init__(nilReason, MD_MaintenanceFrequencyCode, )
supermod.MD_MaintenanceFrequencyCode_PropertyType.subclass = MD_MaintenanceFrequencyCode_PropertyTypeSub
# end class MD_MaintenanceFrequencyCode_PropertyTypeSub


class MD_ScopeCode_PropertyTypeSub(supermod.MD_ScopeCode_PropertyType):
    def __init__(self, nilReason=None, MD_ScopeCode=None):
        super(MD_ScopeCode_PropertyTypeSub, self).__init__(nilReason, MD_ScopeCode, )
supermod.MD_ScopeCode_PropertyType.subclass = MD_ScopeCode_PropertyTypeSub
# end class MD_ScopeCode_PropertyTypeSub


class PT_FreeText_TypeSub(supermod.PT_FreeText_Type):
    def __init__(self, id=None, uuid=None, textGroup=None):
        super(PT_FreeText_TypeSub, self).__init__(id, uuid, textGroup, )
supermod.PT_FreeText_Type.subclass = PT_FreeText_TypeSub
# end class PT_FreeText_TypeSub


class PT_FreeText_PropertyTypeSub(supermod.PT_FreeText_PropertyType):
    def __init__(self, nilReason=None, CharacterString=None, PT_FreeText=None):
        super(PT_FreeText_PropertyTypeSub, self).__init__(nilReason, CharacterString, PT_FreeText, )
supermod.PT_FreeText_PropertyType.subclass = PT_FreeText_PropertyTypeSub
# end class PT_FreeText_PropertyTypeSub


class PT_Locale_TypeSub(supermod.PT_Locale_Type):
    def __init__(self, id=None, uuid=None, languageCode=None, country=None, characterEncoding=None):
        super(PT_Locale_TypeSub, self).__init__(id, uuid, languageCode, country, characterEncoding, )
supermod.PT_Locale_Type.subclass = PT_Locale_TypeSub
# end class PT_Locale_TypeSub


class PT_Locale_PropertyTypeSub(supermod.PT_Locale_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, PT_Locale=None):
        super(PT_Locale_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, PT_Locale, )
supermod.PT_Locale_PropertyType.subclass = PT_Locale_PropertyTypeSub
# end class PT_Locale_PropertyTypeSub


class LocalisedCharacterString_TypeSub(supermod.LocalisedCharacterString_Type):
    def __init__(self, locale=None, id=None, valueOf_=None):
        super(LocalisedCharacterString_TypeSub, self).__init__(locale, id, valueOf_, )
supermod.LocalisedCharacterString_Type.subclass = LocalisedCharacterString_TypeSub
# end class LocalisedCharacterString_TypeSub


class LocalisedCharacterString_PropertyTypeSub(supermod.LocalisedCharacterString_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, LocalisedCharacterString=None):
        super(LocalisedCharacterString_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, LocalisedCharacterString, )
supermod.LocalisedCharacterString_PropertyType.subclass = LocalisedCharacterString_PropertyTypeSub
# end class LocalisedCharacterString_PropertyTypeSub


class PT_LocaleContainer_TypeSub(supermod.PT_LocaleContainer_Type):
    def __init__(self, description=None, locale=None, date=None, responsibleParty=None, localisedString=None):
        super(PT_LocaleContainer_TypeSub, self).__init__(description, locale, date, responsibleParty, localisedString, )
supermod.PT_LocaleContainer_Type.subclass = PT_LocaleContainer_TypeSub
# end class PT_LocaleContainer_TypeSub


class PT_LocaleContainer_PropertyTypeSub(supermod.PT_LocaleContainer_PropertyType):
    def __init__(self, nilReason=None, uuidref=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, type_=None, PT_LocaleContainer=None):
        super(PT_LocaleContainer_PropertyTypeSub, self).__init__(nilReason, uuidref, title, show, actuate, href, role, arcrole, type_, PT_LocaleContainer, )
supermod.PT_LocaleContainer_PropertyType.subclass = PT_LocaleContainer_PropertyTypeSub
# end class PT_LocaleContainer_PropertyTypeSub


class LanguageCode_PropertyTypeSub(supermod.LanguageCode_PropertyType):
    def __init__(self, nilReason=None, LanguageCode=None):
        super(LanguageCode_PropertyTypeSub, self).__init__(nilReason, LanguageCode, )
supermod.LanguageCode_PropertyType.subclass = LanguageCode_PropertyTypeSub
# end class LanguageCode_PropertyTypeSub


class Country_PropertyTypeSub(supermod.Country_PropertyType):
    def __init__(self, nilReason=None, Country=None):
        super(Country_PropertyTypeSub, self).__init__(nilReason, Country, )
supermod.Country_PropertyType.subclass = Country_PropertyTypeSub
# end class Country_PropertyTypeSub


class AbstractDatumTypeSub(supermod.AbstractDatumType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, anchorDefinition=None, realizationEpoch=None, extensiontype_=None):
        super(AbstractDatumTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, anchorDefinition, realizationEpoch, extensiontype_, )
supermod.AbstractDatumType.subclass = AbstractDatumTypeSub
# end class AbstractDatumTypeSub


class DatumPropertyTypeSub(supermod.DatumPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractDatum=None):
        super(DatumPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractDatum, )
supermod.DatumPropertyType.subclass = DatumPropertyTypeSub
# end class DatumPropertyTypeSub


class GeodeticDatumTypeSub(supermod.GeodeticDatumType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, anchorDefinition=None, realizationEpoch=None, primeMeridian=None, ellipsoid=None):
        super(GeodeticDatumTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, anchorDefinition, realizationEpoch, primeMeridian, ellipsoid, )
supermod.GeodeticDatumType.subclass = GeodeticDatumTypeSub
# end class GeodeticDatumTypeSub


class GeodeticDatumPropertyTypeSub(supermod.GeodeticDatumPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, GeodeticDatum=None):
        super(GeodeticDatumPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, GeodeticDatum, )
supermod.GeodeticDatumPropertyType.subclass = GeodeticDatumPropertyTypeSub
# end class GeodeticDatumPropertyTypeSub


class EllipsoidTypeSub(supermod.EllipsoidType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, semiMajorAxis=None, secondDefiningParameter=None):
        super(EllipsoidTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, semiMajorAxis, secondDefiningParameter, )
supermod.EllipsoidType.subclass = EllipsoidTypeSub
# end class EllipsoidTypeSub


class secondDefiningParameterSub(supermod.secondDefiningParameter):
    def __init__(self, SecondDefiningParameter=None):
        super(secondDefiningParameterSub, self).__init__(SecondDefiningParameter, )
supermod.secondDefiningParameter.subclass = secondDefiningParameterSub
# end class secondDefiningParameterSub


class SecondDefiningParameterSub(supermod.SecondDefiningParameter):
    def __init__(self, inverseFlattening=None, semiMinorAxis=None, isSphere='true'):
        super(SecondDefiningParameterSub, self).__init__(inverseFlattening, semiMinorAxis, isSphere, )
supermod.SecondDefiningParameter.subclass = SecondDefiningParameterSub
# end class SecondDefiningParameterSub


class EllipsoidPropertyTypeSub(supermod.EllipsoidPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Ellipsoid=None):
        super(EllipsoidPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Ellipsoid, )
supermod.EllipsoidPropertyType.subclass = EllipsoidPropertyTypeSub
# end class EllipsoidPropertyTypeSub


class PrimeMeridianTypeSub(supermod.PrimeMeridianType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, greenwichLongitude=None):
        super(PrimeMeridianTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, greenwichLongitude, )
supermod.PrimeMeridianType.subclass = PrimeMeridianTypeSub
# end class PrimeMeridianTypeSub


class PrimeMeridianPropertyTypeSub(supermod.PrimeMeridianPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, PrimeMeridian=None):
        super(PrimeMeridianPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, PrimeMeridian, )
supermod.PrimeMeridianPropertyType.subclass = PrimeMeridianPropertyTypeSub
# end class PrimeMeridianPropertyTypeSub


class EngineeringDatumTypeSub(supermod.EngineeringDatumType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, anchorDefinition=None, realizationEpoch=None):
        super(EngineeringDatumTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, anchorDefinition, realizationEpoch, )
supermod.EngineeringDatumType.subclass = EngineeringDatumTypeSub
# end class EngineeringDatumTypeSub


class EngineeringDatumPropertyTypeSub(supermod.EngineeringDatumPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, EngineeringDatum=None):
        super(EngineeringDatumPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, EngineeringDatum, )
supermod.EngineeringDatumPropertyType.subclass = EngineeringDatumPropertyTypeSub
# end class EngineeringDatumPropertyTypeSub


class ImageDatumTypeSub(supermod.ImageDatumType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, anchorDefinition=None, realizationEpoch=None, pixelInCell=None):
        super(ImageDatumTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, anchorDefinition, realizationEpoch, pixelInCell, )
supermod.ImageDatumType.subclass = ImageDatumTypeSub
# end class ImageDatumTypeSub


class ImageDatumPropertyTypeSub(supermod.ImageDatumPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, ImageDatum=None):
        super(ImageDatumPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, ImageDatum, )
supermod.ImageDatumPropertyType.subclass = ImageDatumPropertyTypeSub
# end class ImageDatumPropertyTypeSub


class VerticalDatumTypeSub(supermod.VerticalDatumType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, anchorDefinition=None, realizationEpoch=None):
        super(VerticalDatumTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, anchorDefinition, realizationEpoch, )
supermod.VerticalDatumType.subclass = VerticalDatumTypeSub
# end class VerticalDatumTypeSub


class VerticalDatumPropertyTypeSub(supermod.VerticalDatumPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, VerticalDatum=None):
        super(VerticalDatumPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, VerticalDatum, )
supermod.VerticalDatumPropertyType.subclass = VerticalDatumPropertyTypeSub
# end class VerticalDatumPropertyTypeSub


class TemporalDatumBaseTypeSub(supermod.TemporalDatumBaseType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, extensiontype_=None):
        super(TemporalDatumBaseTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, extensiontype_, )
supermod.TemporalDatumBaseType.subclass = TemporalDatumBaseTypeSub
# end class TemporalDatumBaseTypeSub


class TemporalDatumPropertyTypeSub(supermod.TemporalDatumPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TemporalDatum=None):
        super(TemporalDatumPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, TemporalDatum, )
supermod.TemporalDatumPropertyType.subclass = TemporalDatumPropertyTypeSub
# end class TemporalDatumPropertyTypeSub


class AbstractCoordinateOperationTypeSub(supermod.AbstractCoordinateOperationType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, operationVersion=None, coordinateOperationAccuracy=None, sourceCRS=None, targetCRS=None, extensiontype_=None):
        super(AbstractCoordinateOperationTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, operationVersion, coordinateOperationAccuracy, sourceCRS, targetCRS, extensiontype_, )
supermod.AbstractCoordinateOperationType.subclass = AbstractCoordinateOperationTypeSub
# end class AbstractCoordinateOperationTypeSub


class coordinateOperationAccuracySub(supermod.coordinateOperationAccuracy):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractDQ_PositionalAccuracy=None):
        super(coordinateOperationAccuracySub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractDQ_PositionalAccuracy, )
supermod.coordinateOperationAccuracy.subclass = coordinateOperationAccuracySub
# end class coordinateOperationAccuracySub


class CoordinateOperationPropertyTypeSub(supermod.CoordinateOperationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractCoordinateOperation=None):
        super(CoordinateOperationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractCoordinateOperation, )
supermod.CoordinateOperationPropertyType.subclass = CoordinateOperationPropertyTypeSub
# end class CoordinateOperationPropertyTypeSub


class SingleOperationPropertyTypeSub(supermod.SingleOperationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractSingleOperation=None):
        super(SingleOperationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractSingleOperation, )
supermod.SingleOperationPropertyType.subclass = SingleOperationPropertyTypeSub
# end class SingleOperationPropertyTypeSub


class AbstractGeneralConversionTypeSub(supermod.AbstractGeneralConversionType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, coordinateOperationAccuracy=None, extensiontype_=None):
        super(AbstractGeneralConversionTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, coordinateOperationAccuracy, extensiontype_, )
supermod.AbstractGeneralConversionType.subclass = AbstractGeneralConversionTypeSub
# end class AbstractGeneralConversionTypeSub


class GeneralConversionPropertyTypeSub(supermod.GeneralConversionPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractGeneralConversion=None):
        super(GeneralConversionPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractGeneralConversion, )
supermod.GeneralConversionPropertyType.subclass = GeneralConversionPropertyTypeSub
# end class GeneralConversionPropertyTypeSub


class AbstractGeneralTransformationTypeSub(supermod.AbstractGeneralTransformationType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, operationVersion=None, coordinateOperationAccuracy=None, sourceCRS=None, targetCRS=None, extensiontype_=None):
        super(AbstractGeneralTransformationTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, operationVersion, coordinateOperationAccuracy, sourceCRS, targetCRS, extensiontype_, )
supermod.AbstractGeneralTransformationType.subclass = AbstractGeneralTransformationTypeSub
# end class AbstractGeneralTransformationTypeSub


class GeneralTransformationPropertyTypeSub(supermod.GeneralTransformationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractGeneralTransformation=None):
        super(GeneralTransformationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractGeneralTransformation, )
supermod.GeneralTransformationPropertyType.subclass = GeneralTransformationPropertyTypeSub
# end class GeneralTransformationPropertyTypeSub


class ConcatenatedOperationTypeSub(supermod.ConcatenatedOperationType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, operationVersion=None, coordinateOperationAccuracy=None, sourceCRS=None, targetCRS=None, aggregationType=None, coordOperation=None):
        super(ConcatenatedOperationTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, operationVersion, coordinateOperationAccuracy, sourceCRS, targetCRS, aggregationType, coordOperation, )
supermod.ConcatenatedOperationType.subclass = ConcatenatedOperationTypeSub
# end class ConcatenatedOperationTypeSub


class ConcatenatedOperationPropertyTypeSub(supermod.ConcatenatedOperationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, ConcatenatedOperation=None):
        super(ConcatenatedOperationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, ConcatenatedOperation, )
supermod.ConcatenatedOperationPropertyType.subclass = ConcatenatedOperationPropertyTypeSub
# end class ConcatenatedOperationPropertyTypeSub


class PassThroughOperationTypeSub(supermod.PassThroughOperationType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, operationVersion=None, coordinateOperationAccuracy=None, sourceCRS=None, targetCRS=None, aggregationType=None, modifiedCoordinate=None, coordOperation=None):
        super(PassThroughOperationTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, operationVersion, coordinateOperationAccuracy, sourceCRS, targetCRS, aggregationType, modifiedCoordinate, coordOperation, )
supermod.PassThroughOperationType.subclass = PassThroughOperationTypeSub
# end class PassThroughOperationTypeSub


class PassThroughOperationPropertyTypeSub(supermod.PassThroughOperationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, PassThroughOperation=None):
        super(PassThroughOperationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, PassThroughOperation, )
supermod.PassThroughOperationPropertyType.subclass = PassThroughOperationPropertyTypeSub
# end class PassThroughOperationPropertyTypeSub


class ConversionTypeSub(supermod.ConversionType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, coordinateOperationAccuracy=None, method=None, parameterValue=None):
        super(ConversionTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, coordinateOperationAccuracy, method, parameterValue, )
supermod.ConversionType.subclass = ConversionTypeSub
# end class ConversionTypeSub


class ConversionPropertyTypeSub(supermod.ConversionPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Conversion=None):
        super(ConversionPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Conversion, )
supermod.ConversionPropertyType.subclass = ConversionPropertyTypeSub
# end class ConversionPropertyTypeSub


class TransformationTypeSub(supermod.TransformationType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, operationVersion=None, coordinateOperationAccuracy=None, sourceCRS=None, targetCRS=None, method=None, parameterValue=None):
        super(TransformationTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, operationVersion, coordinateOperationAccuracy, sourceCRS, targetCRS, method, parameterValue, )
supermod.TransformationType.subclass = TransformationTypeSub
# end class TransformationTypeSub


class TransformationPropertyTypeSub(supermod.TransformationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Transformation=None):
        super(TransformationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Transformation, )
supermod.TransformationPropertyType.subclass = TransformationPropertyTypeSub
# end class TransformationPropertyTypeSub


class AbstractGeneralParameterValueTypeSub(supermod.AbstractGeneralParameterValueType):
    def __init__(self, extensiontype_=None):
        super(AbstractGeneralParameterValueTypeSub, self).__init__(extensiontype_, )
supermod.AbstractGeneralParameterValueType.subclass = AbstractGeneralParameterValueTypeSub
# end class AbstractGeneralParameterValueTypeSub


class AbstractGeneralParameterValuePropertyTypeSub(supermod.AbstractGeneralParameterValuePropertyType):
    def __init__(self, AbstractGeneralParameterValue=None):
        super(AbstractGeneralParameterValuePropertyTypeSub, self).__init__(AbstractGeneralParameterValue, )
supermod.AbstractGeneralParameterValuePropertyType.subclass = AbstractGeneralParameterValuePropertyTypeSub
# end class AbstractGeneralParameterValuePropertyTypeSub


class ParameterValueTypeSub(supermod.ParameterValueType):
    def __init__(self, value=None, dmsAngleValue=None, stringValue=None, integerValue=None, booleanValue=None, valueList=None, integerValueList=None, valueFile=None, operationParameter=None):
        super(ParameterValueTypeSub, self).__init__(value, dmsAngleValue, stringValue, integerValue, booleanValue, valueList, integerValueList, valueFile, operationParameter, )
supermod.ParameterValueType.subclass = ParameterValueTypeSub
# end class ParameterValueTypeSub


class ParameterValueGroupTypeSub(supermod.ParameterValueGroupType):
    def __init__(self, parameterValue=None, group=None):
        super(ParameterValueGroupTypeSub, self).__init__(parameterValue, group, )
supermod.ParameterValueGroupType.subclass = ParameterValueGroupTypeSub
# end class ParameterValueGroupTypeSub


class OperationMethodTypeSub(supermod.OperationMethodType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, formulaCitation=None, formula=None, sourceDimensions=None, targetDimensions=None, parameter=None):
        super(OperationMethodTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, formulaCitation, formula, sourceDimensions, targetDimensions, parameter, )
supermod.OperationMethodType.subclass = OperationMethodTypeSub
# end class OperationMethodTypeSub


class formulaCitationSub(supermod.formulaCitation):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, CI_Citation=None):
        super(formulaCitationSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, CI_Citation, )
supermod.formulaCitation.subclass = formulaCitationSub
# end class formulaCitationSub


class OperationMethodPropertyTypeSub(supermod.OperationMethodPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, OperationMethod=None):
        super(OperationMethodPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, OperationMethod, )
supermod.OperationMethodPropertyType.subclass = OperationMethodPropertyTypeSub
# end class OperationMethodPropertyTypeSub


class AbstractGeneralOperationParameterTypeSub(supermod.AbstractGeneralOperationParameterType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, minimumOccurs=None, extensiontype_=None):
        super(AbstractGeneralOperationParameterTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, minimumOccurs, extensiontype_, )
supermod.AbstractGeneralOperationParameterType.subclass = AbstractGeneralOperationParameterTypeSub
# end class AbstractGeneralOperationParameterTypeSub


class AbstractGeneralOperationParameterPropertyTypeSub(supermod.AbstractGeneralOperationParameterPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractGeneralOperationParameter=None):
        super(AbstractGeneralOperationParameterPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractGeneralOperationParameter, )
supermod.AbstractGeneralOperationParameterPropertyType.subclass = AbstractGeneralOperationParameterPropertyTypeSub
# end class AbstractGeneralOperationParameterPropertyTypeSub


class OperationParameterTypeSub(supermod.OperationParameterType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, minimumOccurs=None):
        super(OperationParameterTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, minimumOccurs, )
supermod.OperationParameterType.subclass = OperationParameterTypeSub
# end class OperationParameterTypeSub


class OperationParameterPropertyTypeSub(supermod.OperationParameterPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, OperationParameter=None):
        super(OperationParameterPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, OperationParameter, )
supermod.OperationParameterPropertyType.subclass = OperationParameterPropertyTypeSub
# end class OperationParameterPropertyTypeSub


class OperationParameterGroupTypeSub(supermod.OperationParameterGroupType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, minimumOccurs=None, maximumOccurs=None, parameter=None):
        super(OperationParameterGroupTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, minimumOccurs, maximumOccurs, parameter, )
supermod.OperationParameterGroupType.subclass = OperationParameterGroupTypeSub
# end class OperationParameterGroupTypeSub


class OperationParameterGroupPropertyTypeSub(supermod.OperationParameterGroupPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, OperationParameterGroup=None):
        super(OperationParameterGroupPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, OperationParameterGroup, )
supermod.OperationParameterGroupPropertyType.subclass = OperationParameterGroupPropertyTypeSub
# end class OperationParameterGroupPropertyTypeSub


class ProcedurePropertyTypeSub(supermod.ProcedurePropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, AbstractFeature=None):
        super(ProcedurePropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, AbstractFeature, )
supermod.ProcedurePropertyType.subclass = ProcedurePropertyTypeSub
# end class ProcedurePropertyTypeSub


class TargetPropertyTypeSub(supermod.TargetPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, AbstractFeature=None, AbstractGeometry=None):
        super(TargetPropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, AbstractFeature, AbstractGeometry, )
supermod.TargetPropertyType.subclass = TargetPropertyTypeSub
# end class TargetPropertyTypeSub


class ResultTypeSub(supermod.ResultType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, anytypeobjs_=None):
        super(ResultTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, anytypeobjs_, )
supermod.ResultType.subclass = ResultTypeSub
# end class ResultTypeSub


class TimeReferenceSystemTypeSub(supermod.TimeReferenceSystemType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, extensiontype_=None):
        super(TimeReferenceSystemTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, extensiontype_, )
supermod.TimeReferenceSystemType.subclass = TimeReferenceSystemTypeSub
# end class TimeReferenceSystemTypeSub


class TimeCoordinateSystemTypeSub(supermod.TimeCoordinateSystemType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, originPosition=None, origin=None, interval=None):
        super(TimeCoordinateSystemTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, originPosition, origin, interval, )
supermod.TimeCoordinateSystemType.subclass = TimeCoordinateSystemTypeSub
# end class TimeCoordinateSystemTypeSub


class TimeCalendarTypeSub(supermod.TimeCalendarType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, referenceFrame=None):
        super(TimeCalendarTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, referenceFrame, )
supermod.TimeCalendarType.subclass = TimeCalendarTypeSub
# end class TimeCalendarTypeSub


class TimeCalendarEraTypeSub(supermod.TimeCalendarEraType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, referenceEvent=None, referenceDate=None, julianReference=None, epochOfUse=None):
        super(TimeCalendarEraTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, referenceEvent, referenceDate, julianReference, epochOfUse, )
supermod.TimeCalendarEraType.subclass = TimeCalendarEraTypeSub
# end class TimeCalendarEraTypeSub


class TimeCalendarPropertyTypeSub(supermod.TimeCalendarPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, TimeCalendar=None):
        super(TimeCalendarPropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, TimeCalendar, )
supermod.TimeCalendarPropertyType.subclass = TimeCalendarPropertyTypeSub
# end class TimeCalendarPropertyTypeSub


class TimeCalendarEraPropertyTypeSub(supermod.TimeCalendarEraPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, TimeCalendarEra=None):
        super(TimeCalendarEraPropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, TimeCalendarEra, )
supermod.TimeCalendarEraPropertyType.subclass = TimeCalendarEraPropertyTypeSub
# end class TimeCalendarEraPropertyTypeSub


class TimeClockTypeSub(supermod.TimeClockType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, referenceEvent=None, referenceTime=None, utcReference=None, dateBasis=None):
        super(TimeClockTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, referenceEvent, referenceTime, utcReference, dateBasis, )
supermod.TimeClockType.subclass = TimeClockTypeSub
# end class TimeClockTypeSub


class TimeClockPropertyTypeSub(supermod.TimeClockPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, TimeClock=None):
        super(TimeClockPropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, TimeClock, )
supermod.TimeClockPropertyType.subclass = TimeClockPropertyTypeSub
# end class TimeClockPropertyTypeSub


class TimeOrdinalReferenceSystemTypeSub(supermod.TimeOrdinalReferenceSystemType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, component=None):
        super(TimeOrdinalReferenceSystemTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, component, )
supermod.TimeOrdinalReferenceSystemType.subclass = TimeOrdinalReferenceSystemTypeSub
# end class TimeOrdinalReferenceSystemTypeSub


class TimeOrdinalEraTypeSub(supermod.TimeOrdinalEraType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, relatedTime=None, start=None, end=None, extent=None, member=None, group=None):
        super(TimeOrdinalEraTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, relatedTime, start, end, extent, member, group, )
supermod.TimeOrdinalEraType.subclass = TimeOrdinalEraTypeSub
# end class TimeOrdinalEraTypeSub


class TimeOrdinalEraPropertyTypeSub(supermod.TimeOrdinalEraPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, remoteSchema=None, href=None, role=None, arcrole=None, owns='false', type_=None, TimeOrdinalEra=None):
        super(TimeOrdinalEraPropertyTypeSub, self).__init__(nilReason, title, show, actuate, remoteSchema, href, role, arcrole, owns, type_, TimeOrdinalEra, )
supermod.TimeOrdinalEraPropertyType.subclass = TimeOrdinalEraPropertyTypeSub
# end class TimeOrdinalEraPropertyTypeSub


class AbstractTimeTopologyPrimitiveTypeSub(supermod.AbstractTimeTopologyPrimitiveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, relatedTime=None, complex=None, extensiontype_=None):
        super(AbstractTimeTopologyPrimitiveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, relatedTime, complex, extensiontype_, )
supermod.AbstractTimeTopologyPrimitiveType.subclass = AbstractTimeTopologyPrimitiveTypeSub
# end class AbstractTimeTopologyPrimitiveTypeSub


class TimeTopologyPrimitivePropertyTypeSub(supermod.TimeTopologyPrimitivePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractTimeTopologyPrimitive=None):
        super(TimeTopologyPrimitivePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractTimeTopologyPrimitive, )
supermod.TimeTopologyPrimitivePropertyType.subclass = TimeTopologyPrimitivePropertyTypeSub
# end class TimeTopologyPrimitivePropertyTypeSub


class TimeTopologyComplexTypeSub(supermod.TimeTopologyComplexType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, primitive=None):
        super(TimeTopologyComplexTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, primitive, )
supermod.TimeTopologyComplexType.subclass = TimeTopologyComplexTypeSub
# end class TimeTopologyComplexTypeSub


class TimeTopologyComplexPropertyTypeSub(supermod.TimeTopologyComplexPropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TimeTopologyComplex=None):
        super(TimeTopologyComplexPropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, TimeTopologyComplex, )
supermod.TimeTopologyComplexPropertyType.subclass = TimeTopologyComplexPropertyTypeSub
# end class TimeTopologyComplexPropertyTypeSub


class TimeNodeTypeSub(supermod.TimeNodeType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, relatedTime=None, complex=None, previousEdge=None, nextEdge=None, position=None):
        super(TimeNodeTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, relatedTime, complex, previousEdge, nextEdge, position, )
supermod.TimeNodeType.subclass = TimeNodeTypeSub
# end class TimeNodeTypeSub


class TimeNodePropertyTypeSub(supermod.TimeNodePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TimeNode=None):
        super(TimeNodePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, TimeNode, )
supermod.TimeNodePropertyType.subclass = TimeNodePropertyTypeSub
# end class TimeNodePropertyTypeSub


class TimeEdgeTypeSub(supermod.TimeEdgeType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, relatedTime=None, complex=None, start=None, end=None, extent=None):
        super(TimeEdgeTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, relatedTime, complex, start, end, extent, )
supermod.TimeEdgeType.subclass = TimeEdgeTypeSub
# end class TimeEdgeTypeSub


class TimeEdgePropertyTypeSub(supermod.TimeEdgePropertyType):
    def __init__(self, nilReason=None, owns='false', title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TimeEdge=None):
        super(TimeEdgePropertyTypeSub, self).__init__(nilReason, owns, title, show, actuate, href, role, arcrole, remoteSchema, type_, TimeEdge, )
supermod.TimeEdgePropertyType.subclass = TimeEdgePropertyTypeSub
# end class TimeEdgePropertyTypeSub


class OperationPropertyTypeSub(supermod.OperationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractOperation=None):
        super(OperationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractOperation, )
supermod.OperationPropertyType.subclass = OperationPropertyTypeSub
# end class OperationPropertyTypeSub


class TemporalCSPropertyTypeSub(supermod.TemporalCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, TemporalCS=None):
        super(TemporalCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, TemporalCS, )
supermod.TemporalCSPropertyType.subclass = TemporalCSPropertyTypeSub
# end class TemporalCSPropertyTypeSub


class ObliqueCartesianCSPropertyTypeSub(supermod.ObliqueCartesianCSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, ObliqueCartesianCS=None):
        super(ObliqueCartesianCSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, ObliqueCartesianCS, )
supermod.ObliqueCartesianCSPropertyType.subclass = ObliqueCartesianCSPropertyTypeSub
# end class ObliqueCartesianCSPropertyTypeSub


class GeographicCRSTypeSub(supermod.GeographicCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, usesEllipsoidalCS=None, usesGeodeticDatum=None):
        super(GeographicCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, usesEllipsoidalCS, usesGeodeticDatum, )
supermod.GeographicCRSType.subclass = GeographicCRSTypeSub
# end class GeographicCRSTypeSub


class GeographicCRSPropertyTypeSub(supermod.GeographicCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, GeographicCRS=None):
        super(GeographicCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, GeographicCRS, )
supermod.GeographicCRSPropertyType.subclass = GeographicCRSPropertyTypeSub
# end class GeographicCRSPropertyTypeSub


class GeocentricCRSTypeSub(supermod.GeocentricCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, usesCartesianCS=None, usesSphericalCS=None, usesGeodeticDatum=None):
        super(GeocentricCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, usesCartesianCS, usesSphericalCS, usesGeodeticDatum, )
supermod.GeocentricCRSType.subclass = GeocentricCRSTypeSub
# end class GeocentricCRSTypeSub


class GeocentricCRSPropertyTypeSub(supermod.GeocentricCRSPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, GeocentricCRS=None):
        super(GeocentricCRSPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, GeocentricCRS, )
supermod.GeocentricCRSPropertyType.subclass = GeocentricCRSPropertyTypeSub
# end class GeocentricCRSPropertyTypeSub


class DMSAngleTypeSub(supermod.DMSAngleType):
    def __init__(self, degrees=None, decimalMinutes=None, minutes=None, seconds=None):
        super(DMSAngleTypeSub, self).__init__(degrees, decimalMinutes, minutes, seconds, )
supermod.DMSAngleType.subclass = DMSAngleTypeSub
# end class DMSAngleTypeSub


class DegreesTypeSub(supermod.DegreesType):
    def __init__(self, direction=None, valueOf_=None):
        super(DegreesTypeSub, self).__init__(direction, valueOf_, )
supermod.DegreesType.subclass = DegreesTypeSub
# end class DegreesTypeSub


class AngleChoiceTypeSub(supermod.AngleChoiceType):
    def __init__(self, angle=None, dmsAngle=None):
        super(AngleChoiceTypeSub, self).__init__(angle, dmsAngle, )
supermod.AngleChoiceType.subclass = AngleChoiceTypeSub
# end class AngleChoiceTypeSub


class ArrayAssociationTypeSub(supermod.ArrayAssociationType):
    def __init__(self, owns='false', AbstractObject=None):
        super(ArrayAssociationTypeSub, self).__init__(owns, AbstractObject, )
supermod.ArrayAssociationType.subclass = ArrayAssociationTypeSub
# end class ArrayAssociationTypeSub


class StringOrRefTypeSub(supermod.StringOrRefType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, valueOf_=None):
        super(StringOrRefTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, valueOf_, )
supermod.StringOrRefType.subclass = StringOrRefTypeSub
# end class StringOrRefTypeSub


class BagTypeSub(supermod.BagType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, member=None, members=None):
        super(BagTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, member, members, )
supermod.BagType.subclass = BagTypeSub
# end class BagTypeSub


class ArrayTypeSub(supermod.ArrayType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, members=None):
        super(ArrayTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, members, )
supermod.ArrayType.subclass = ArrayTypeSub
# end class ArrayTypeSub


class MetaDataPropertyTypeSub(supermod.MetaDataPropertyType):
    def __init__(self, nilReason=None, about=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractMetaData=None):
        super(MetaDataPropertyTypeSub, self).__init__(nilReason, about, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractMetaData, )
supermod.MetaDataPropertyType.subclass = MetaDataPropertyTypeSub
# end class MetaDataPropertyTypeSub


class AbstractMetaDataTypeSub(supermod.AbstractMetaDataType):
    def __init__(self, id=None, valueOf_=None, mixedclass_=None, content_=None, extensiontype_=None):
        super(AbstractMetaDataTypeSub, self).__init__(id, valueOf_, mixedclass_, content_, extensiontype_, )
supermod.AbstractMetaDataType.subclass = AbstractMetaDataTypeSub
# end class AbstractMetaDataTypeSub


class GenericMetaDataTypeSub(supermod.GenericMetaDataType):
    def __init__(self, id=None, anytypeobjs_=None, valueOf_=None, mixedclass_=None, content_=None):
        super(GenericMetaDataTypeSub, self).__init__(id, anytypeobjs_, valueOf_, mixedclass_, content_, )
supermod.GenericMetaDataType.subclass = GenericMetaDataTypeSub
# end class GenericMetaDataTypeSub


class LocationPropertyTypeSub(supermod.LocationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractGeometry=None, LocationKeyWord=None, LocationString=None, Null=None, extensiontype_=None):
        super(LocationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractGeometry, LocationKeyWord, LocationString, Null, extensiontype_, )
supermod.LocationPropertyType.subclass = LocationPropertyTypeSub
# end class LocationPropertyTypeSub


class PriorityLocationPropertyTypeSub(supermod.PriorityLocationPropertyType):
    def __init__(self, nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, AbstractGeometry=None, LocationKeyWord=None, LocationString=None, Null=None, priority=None):
        super(PriorityLocationPropertyTypeSub, self).__init__(nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, AbstractGeometry, LocationKeyWord, LocationString, Null, priority, )
supermod.PriorityLocationPropertyType.subclass = PriorityLocationPropertyTypeSub
# end class PriorityLocationPropertyTypeSub


class FeatureArrayPropertyTypeSub(supermod.FeatureArrayPropertyType):
    def __init__(self, AbstractFeature=None):
        super(FeatureArrayPropertyTypeSub, self).__init__(AbstractFeature, )
supermod.FeatureArrayPropertyType.subclass = FeatureArrayPropertyTypeSub
# end class FeatureArrayPropertyTypeSub


class BoundedFeatureTypeSub(supermod.BoundedFeatureType):
    def __init__(self, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None):
        super(BoundedFeatureTypeSub, self).__init__(metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, )
supermod.BoundedFeatureType.subclass = BoundedFeatureTypeSub
# end class BoundedFeatureTypeSub


class IndirectEntryTypeSub(supermod.IndirectEntryType):
    def __init__(self, DefinitionProxy=None):
        super(IndirectEntryTypeSub, self).__init__(DefinitionProxy, )
supermod.IndirectEntryType.subclass = IndirectEntryTypeSub
# end class IndirectEntryTypeSub


class DefinitionProxyTypeSub(supermod.DefinitionProxyType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, definitionRef=None):
        super(DefinitionProxyTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, definitionRef, )
supermod.DefinitionProxyType.subclass = DefinitionProxyTypeSub
# end class DefinitionProxyTypeSub


class partieDTTypeSub(supermod.partieDTType):
    def __init__(self, noConsultationDuTeleservice=None, noAffaireDuResponsableDuProjet=None, dateDeLaDeclaration=None, typeEntite=None, declarationConjointeDTDICT=None, responsableDuProjet=None, representantDuResponsableDeProjet=None, emplacementDuProjet=None, emprise=None, souhaitsPourLeRecepisse=None, projetEtSonCalendrier=None, investigationsComplementaires=None, signatureDuResponsableDuProjetOuDeSonRepresentant=None):
        super(partieDTTypeSub, self).__init__(noConsultationDuTeleservice, noAffaireDuResponsableDuProjet, dateDeLaDeclaration, typeEntite, declarationConjointeDTDICT, responsableDuProjet, representantDuResponsableDeProjet, emplacementDuProjet, emprise, souhaitsPourLeRecepisse, projetEtSonCalendrier, investigationsComplementaires, signatureDuResponsableDuProjetOuDeSonRepresentant, )
supermod.partieDTType.subclass = partieDTTypeSub
# end class partieDTTypeSub


class partieDICTTypeSub(supermod.partieDICTType):
    def __init__(self, noConsultationDuTeleservice=None, noAffaireDeLexecutantDesTravaux=None, dateDeLaDeclaration=None, natureDeLaDeclaration=None, executantDesTravaux=None, emplacementDesTravaux=None, emprise=None, souhaitsPourLeRecepisse=None, travauxEtLeurCalendrier=None, signatureDeLExecutantDesTravauxOuDeSonRepresentant=None):
        super(partieDICTTypeSub, self).__init__(noConsultationDuTeleservice, noAffaireDeLexecutantDesTravaux, dateDeLaDeclaration, natureDeLaDeclaration, executantDesTravaux, emplacementDesTravaux, emprise, souhaitsPourLeRecepisse, travauxEtLeurCalendrier, signatureDeLExecutantDesTravauxOuDeSonRepresentant, )
supermod.partieDICTType.subclass = partieDICTTypeSub
# end class partieDICTTypeSub


class emplacementDeLaCommuneConcerneeTypeSub(supermod.emplacementDeLaCommuneConcerneeType):
    def __init__(self, nomDeLaCommune=None, codeCommune=None, codeINSEE=None):
        super(emplacementDeLaCommuneConcerneeTypeSub, self).__init__(nomDeLaCommune, codeCommune, codeINSEE, )
supermod.emplacementDeLaCommuneConcerneeType.subclass = emplacementDeLaCommuneConcerneeTypeSub
# end class emplacementDeLaCommuneConcerneeTypeSub


class refLocationTypeSub(supermod.refLocationType):
    def __init__(self, AffinePlacement=None):
        super(refLocationTypeSub, self).__init__(AffinePlacement, )
supermod.refLocationType.subclass = refLocationTypeSub
# end class refLocationTypeSub


class rowsTypeSub(supermod.rowsType):
    def __init__(self, Row=None):
        super(rowsTypeSub, self).__init__(Row, )
supermod.rowsType.subclass = rowsTypeSub
# end class rowsTypeSub


class RowTypeSub(supermod.RowType):
    def __init__(self, posList=None, pos=None, pointProperty=None):
        super(RowTypeSub, self).__init__(posList, pos, pointProperty, )
supermod.RowType.subclass = RowTypeSub
# end class RowTypeSub


class rowsType1Sub(supermod.rowsType1):
    def __init__(self, Row=None):
        super(rowsType1Sub, self).__init__(Row, )
supermod.rowsType1.subclass = rowsType1Sub
# end class rowsType1Sub


class RowType2Sub(supermod.RowType2):
    def __init__(self, posList=None, pos=None, pointProperty=None):
        super(RowType2Sub, self).__init__(posList, pos, pointProperty, )
supermod.RowType2.subclass = RowType2Sub
# end class RowType2Sub


class controlPointTypeSub(supermod.controlPointType):
    def __init__(self, posList=None, pos=None, pointProperty=None):
        super(controlPointTypeSub, self).__init__(posList, pos, pointProperty, )
supermod.controlPointType.subclass = controlPointTypeSub
# end class controlPointTypeSub


class TemporalDatumTypeSub(supermod.TemporalDatumType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, origin=None):
        super(TemporalDatumTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, origin, )
supermod.TemporalDatumType.subclass = TemporalDatumTypeSub
# end class TemporalDatumTypeSub


class AbstractDQ_Completeness_TypeSub(supermod.AbstractDQ_Completeness_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None, extensiontype_=None):
        super(AbstractDQ_Completeness_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, extensiontype_, )
supermod.AbstractDQ_Completeness_Type.subclass = AbstractDQ_Completeness_TypeSub
# end class AbstractDQ_Completeness_TypeSub


class AbstractDQ_LogicalConsistency_TypeSub(supermod.AbstractDQ_LogicalConsistency_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None, extensiontype_=None):
        super(AbstractDQ_LogicalConsistency_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, extensiontype_, )
supermod.AbstractDQ_LogicalConsistency_Type.subclass = AbstractDQ_LogicalConsistency_TypeSub
# end class AbstractDQ_LogicalConsistency_TypeSub


class AbstractDQ_PositionalAccuracy_TypeSub(supermod.AbstractDQ_PositionalAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None, extensiontype_=None):
        super(AbstractDQ_PositionalAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, extensiontype_, )
supermod.AbstractDQ_PositionalAccuracy_Type.subclass = AbstractDQ_PositionalAccuracy_TypeSub
# end class AbstractDQ_PositionalAccuracy_TypeSub


class AbstractDQ_ThematicAccuracy_TypeSub(supermod.AbstractDQ_ThematicAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None, extensiontype_=None):
        super(AbstractDQ_ThematicAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, extensiontype_, )
supermod.AbstractDQ_ThematicAccuracy_Type.subclass = AbstractDQ_ThematicAccuracy_TypeSub
# end class AbstractDQ_ThematicAccuracy_TypeSub


class AbstractDQ_TemporalAccuracy_TypeSub(supermod.AbstractDQ_TemporalAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None, extensiontype_=None):
        super(AbstractDQ_TemporalAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, extensiontype_, )
supermod.AbstractDQ_TemporalAccuracy_Type.subclass = AbstractDQ_TemporalAccuracy_TypeSub
# end class AbstractDQ_TemporalAccuracy_TypeSub


class DQ_CompletenessCommission_TypeSub(supermod.DQ_CompletenessCommission_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_CompletenessCommission_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_CompletenessCommission_Type.subclass = DQ_CompletenessCommission_TypeSub
# end class DQ_CompletenessCommission_TypeSub


class DQ_CompletenessOmission_TypeSub(supermod.DQ_CompletenessOmission_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_CompletenessOmission_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_CompletenessOmission_Type.subclass = DQ_CompletenessOmission_TypeSub
# end class DQ_CompletenessOmission_TypeSub


class DQ_ConceptualConsistency_TypeSub(supermod.DQ_ConceptualConsistency_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_ConceptualConsistency_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_ConceptualConsistency_Type.subclass = DQ_ConceptualConsistency_TypeSub
# end class DQ_ConceptualConsistency_TypeSub


class DQ_DomainConsistency_TypeSub(supermod.DQ_DomainConsistency_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_DomainConsistency_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_DomainConsistency_Type.subclass = DQ_DomainConsistency_TypeSub
# end class DQ_DomainConsistency_TypeSub


class DQ_FormatConsistency_TypeSub(supermod.DQ_FormatConsistency_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_FormatConsistency_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_FormatConsistency_Type.subclass = DQ_FormatConsistency_TypeSub
# end class DQ_FormatConsistency_TypeSub


class DQ_TopologicalConsistency_TypeSub(supermod.DQ_TopologicalConsistency_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_TopologicalConsistency_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_TopologicalConsistency_Type.subclass = DQ_TopologicalConsistency_TypeSub
# end class DQ_TopologicalConsistency_TypeSub


class DQ_AbsoluteExternalPositionalAccuracy_TypeSub(supermod.DQ_AbsoluteExternalPositionalAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_AbsoluteExternalPositionalAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_AbsoluteExternalPositionalAccuracy_Type.subclass = DQ_AbsoluteExternalPositionalAccuracy_TypeSub
# end class DQ_AbsoluteExternalPositionalAccuracy_TypeSub


class DQ_GriddedDataPositionalAccuracy_TypeSub(supermod.DQ_GriddedDataPositionalAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_GriddedDataPositionalAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_GriddedDataPositionalAccuracy_Type.subclass = DQ_GriddedDataPositionalAccuracy_TypeSub
# end class DQ_GriddedDataPositionalAccuracy_TypeSub


class DQ_RelativeInternalPositionalAccuracy_TypeSub(supermod.DQ_RelativeInternalPositionalAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_RelativeInternalPositionalAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_RelativeInternalPositionalAccuracy_Type.subclass = DQ_RelativeInternalPositionalAccuracy_TypeSub
# end class DQ_RelativeInternalPositionalAccuracy_TypeSub


class DQ_ThematicClassificationCorrectness_TypeSub(supermod.DQ_ThematicClassificationCorrectness_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_ThematicClassificationCorrectness_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_ThematicClassificationCorrectness_Type.subclass = DQ_ThematicClassificationCorrectness_TypeSub
# end class DQ_ThematicClassificationCorrectness_TypeSub


class DQ_NonQuantitativeAttributeAccuracy_TypeSub(supermod.DQ_NonQuantitativeAttributeAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_NonQuantitativeAttributeAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_NonQuantitativeAttributeAccuracy_Type.subclass = DQ_NonQuantitativeAttributeAccuracy_TypeSub
# end class DQ_NonQuantitativeAttributeAccuracy_TypeSub


class DQ_QuantitativeAttributeAccuracy_TypeSub(supermod.DQ_QuantitativeAttributeAccuracy_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_QuantitativeAttributeAccuracy_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_QuantitativeAttributeAccuracy_Type.subclass = DQ_QuantitativeAttributeAccuracy_TypeSub
# end class DQ_QuantitativeAttributeAccuracy_TypeSub


class DQ_AccuracyOfATimeMeasurement_TypeSub(supermod.DQ_AccuracyOfATimeMeasurement_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_AccuracyOfATimeMeasurement_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_AccuracyOfATimeMeasurement_Type.subclass = DQ_AccuracyOfATimeMeasurement_TypeSub
# end class DQ_AccuracyOfATimeMeasurement_TypeSub


class DQ_TemporalConsistency_TypeSub(supermod.DQ_TemporalConsistency_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_TemporalConsistency_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_TemporalConsistency_Type.subclass = DQ_TemporalConsistency_TypeSub
# end class DQ_TemporalConsistency_TypeSub


class DQ_TemporalValidity_TypeSub(supermod.DQ_TemporalValidity_Type):
    def __init__(self, id=None, uuid=None, nameOfMeasure=None, measureIdentification=None, measureDescription=None, evaluationMethodType=None, evaluationMethodDescription=None, evaluationProcedure=None, dateTime=None, result=None):
        super(DQ_TemporalValidity_TypeSub, self).__init__(id, uuid, nameOfMeasure, measureIdentification, measureDescription, evaluationMethodType, evaluationMethodDescription, evaluationProcedure, dateTime, result, )
supermod.DQ_TemporalValidity_Type.subclass = DQ_TemporalValidity_TypeSub
# end class DQ_TemporalValidity_TypeSub


class DQ_QuantitativeResult_TypeSub(supermod.DQ_QuantitativeResult_Type):
    def __init__(self, id=None, uuid=None, valueType=None, valueUnit=None, errorStatistic=None, value=None):
        super(DQ_QuantitativeResult_TypeSub, self).__init__(id, uuid, valueType, valueUnit, errorStatistic, value, )
supermod.DQ_QuantitativeResult_Type.subclass = DQ_QuantitativeResult_TypeSub
# end class DQ_QuantitativeResult_TypeSub


class DQ_ConformanceResult_TypeSub(supermod.DQ_ConformanceResult_Type):
    def __init__(self, id=None, uuid=None, specification=None, explanation=None, pass_=None):
        super(DQ_ConformanceResult_TypeSub, self).__init__(id, uuid, specification, explanation, pass_, )
supermod.DQ_ConformanceResult_Type.subclass = DQ_ConformanceResult_TypeSub
# end class DQ_ConformanceResult_TypeSub


class MD_CoverageDescription_TypeSub(supermod.MD_CoverageDescription_Type):
    def __init__(self, id=None, uuid=None, attributeDescription=None, contentType=None, dimension=None, extensiontype_=None):
        super(MD_CoverageDescription_TypeSub, self).__init__(id, uuid, attributeDescription, contentType, dimension, extensiontype_, )
supermod.MD_CoverageDescription_Type.subclass = MD_CoverageDescription_TypeSub
# end class MD_CoverageDescription_TypeSub


class MD_FeatureCatalogueDescription_TypeSub(supermod.MD_FeatureCatalogueDescription_Type):
    def __init__(self, id=None, uuid=None, complianceCode=None, language=None, includedWithDataset=None, featureTypes=None, featureCatalogueCitation=None):
        super(MD_FeatureCatalogueDescription_TypeSub, self).__init__(id, uuid, complianceCode, language, includedWithDataset, featureTypes, featureCatalogueCitation, )
supermod.MD_FeatureCatalogueDescription_Type.subclass = MD_FeatureCatalogueDescription_TypeSub
# end class MD_FeatureCatalogueDescription_TypeSub


class MultiplicityRange_TypeSub(supermod.MultiplicityRange_Type):
    def __init__(self, id=None, uuid=None, lower=None, upper=None):
        super(MultiplicityRange_TypeSub, self).__init__(id, uuid, lower, upper, )
supermod.MultiplicityRange_Type.subclass = MultiplicityRange_TypeSub
# end class MultiplicityRange_TypeSub


class Multiplicity_TypeSub(supermod.Multiplicity_Type):
    def __init__(self, id=None, uuid=None, range=None):
        super(Multiplicity_TypeSub, self).__init__(id, uuid, range, )
supermod.Multiplicity_Type.subclass = Multiplicity_TypeSub
# end class Multiplicity_TypeSub


class MemberName_TypeSub(supermod.MemberName_Type):
    def __init__(self, id=None, uuid=None, aName=None, attributeType=None):
        super(MemberName_TypeSub, self).__init__(id, uuid, aName, attributeType, )
supermod.MemberName_Type.subclass = MemberName_TypeSub
# end class MemberName_TypeSub


class TypeName_TypeSub(supermod.TypeName_Type):
    def __init__(self, id=None, uuid=None, aName=None):
        super(TypeName_TypeSub, self).__init__(id, uuid, aName, )
supermod.TypeName_Type.subclass = TypeName_TypeSub
# end class TypeName_TypeSub


class AbstractEX_GeographicExtent_TypeSub(supermod.AbstractEX_GeographicExtent_Type):
    def __init__(self, id=None, uuid=None, extentTypeCode=None, extensiontype_=None):
        super(AbstractEX_GeographicExtent_TypeSub, self).__init__(id, uuid, extentTypeCode, extensiontype_, )
supermod.AbstractEX_GeographicExtent_Type.subclass = AbstractEX_GeographicExtent_TypeSub
# end class AbstractEX_GeographicExtent_TypeSub


class EX_Extent_TypeSub(supermod.EX_Extent_Type):
    def __init__(self, id=None, uuid=None, description=None, geographicElement=None, temporalElement=None, verticalElement=None):
        super(EX_Extent_TypeSub, self).__init__(id, uuid, description, geographicElement, temporalElement, verticalElement, )
supermod.EX_Extent_Type.subclass = EX_Extent_TypeSub
# end class EX_Extent_TypeSub


class EX_BoundingPolygon_TypeSub(supermod.EX_BoundingPolygon_Type):
    def __init__(self, id=None, uuid=None, extentTypeCode=None, polygon=None):
        super(EX_BoundingPolygon_TypeSub, self).__init__(id, uuid, extentTypeCode, polygon, )
supermod.EX_BoundingPolygon_Type.subclass = EX_BoundingPolygon_TypeSub
# end class EX_BoundingPolygon_TypeSub


class EX_VerticalExtent_TypeSub(supermod.EX_VerticalExtent_Type):
    def __init__(self, id=None, uuid=None, minimumValue=None, maximumValue=None, verticalCRS=None):
        super(EX_VerticalExtent_TypeSub, self).__init__(id, uuid, minimumValue, maximumValue, verticalCRS, )
supermod.EX_VerticalExtent_Type.subclass = EX_VerticalExtent_TypeSub
# end class EX_VerticalExtent_TypeSub


class EX_TemporalExtent_TypeSub(supermod.EX_TemporalExtent_Type):
    def __init__(self, id=None, uuid=None, extent=None, extensiontype_=None):
        super(EX_TemporalExtent_TypeSub, self).__init__(id, uuid, extent, extensiontype_, )
supermod.EX_TemporalExtent_Type.subclass = EX_TemporalExtent_TypeSub
# end class EX_TemporalExtent_TypeSub


class AbstractRS_ReferenceSystem_TypeSub(supermod.AbstractRS_ReferenceSystem_Type):
    def __init__(self, id=None, uuid=None, name=None, domainOfValidity=None):
        super(AbstractRS_ReferenceSystem_TypeSub, self).__init__(id, uuid, name, domainOfValidity, )
supermod.AbstractRS_ReferenceSystem_Type.subclass = AbstractRS_ReferenceSystem_TypeSub
# end class AbstractRS_ReferenceSystem_TypeSub


class MD_Identifier_TypeSub(supermod.MD_Identifier_Type):
    def __init__(self, id=None, uuid=None, authority=None, code=None, extensiontype_=None):
        super(MD_Identifier_TypeSub, self).__init__(id, uuid, authority, code, extensiontype_, )
supermod.MD_Identifier_Type.subclass = MD_Identifier_TypeSub
# end class MD_Identifier_TypeSub


class MD_ReferenceSystem_TypeSub(supermod.MD_ReferenceSystem_Type):
    def __init__(self, id=None, uuid=None, referenceSystemIdentifier=None):
        super(MD_ReferenceSystem_TypeSub, self).__init__(id, uuid, referenceSystemIdentifier, )
supermod.MD_ReferenceSystem_Type.subclass = MD_ReferenceSystem_TypeSub
# end class MD_ReferenceSystem_TypeSub


class RS_Identifier_TypeSub(supermod.RS_Identifier_Type):
    def __init__(self, id=None, uuid=None, authority=None, code=None, codeSpace=None, version=None):
        super(RS_Identifier_TypeSub, self).__init__(id, uuid, authority, code, codeSpace, version, )
supermod.RS_Identifier_Type.subclass = RS_Identifier_TypeSub
# end class RS_Identifier_TypeSub


class CI_Series_TypeSub(supermod.CI_Series_Type):
    def __init__(self, id=None, uuid=None, name=None, issueIdentification=None, page=None):
        super(CI_Series_TypeSub, self).__init__(id, uuid, name, issueIdentification, page, )
supermod.CI_Series_Type.subclass = CI_Series_TypeSub
# end class CI_Series_TypeSub


class CI_Date_TypeSub(supermod.CI_Date_Type):
    def __init__(self, id=None, uuid=None, date=None, dateType=None):
        super(CI_Date_TypeSub, self).__init__(id, uuid, date, dateType, )
supermod.CI_Date_Type.subclass = CI_Date_TypeSub
# end class CI_Date_TypeSub


class CI_Telephone_TypeSub(supermod.CI_Telephone_Type):
    def __init__(self, id=None, uuid=None, voice=None, facsimile=None):
        super(CI_Telephone_TypeSub, self).__init__(id, uuid, voice, facsimile, )
supermod.CI_Telephone_Type.subclass = CI_Telephone_TypeSub
# end class CI_Telephone_TypeSub


class CI_Contact_TypeSub(supermod.CI_Contact_Type):
    def __init__(self, id=None, uuid=None, phone=None, address=None, onlineResource=None, hoursOfService=None, contactInstructions=None):
        super(CI_Contact_TypeSub, self).__init__(id, uuid, phone, address, onlineResource, hoursOfService, contactInstructions, )
supermod.CI_Contact_Type.subclass = CI_Contact_TypeSub
# end class CI_Contact_TypeSub


class CI_OnlineResource_TypeSub(supermod.CI_OnlineResource_Type):
    def __init__(self, id=None, uuid=None, linkage=None, protocol=None, applicationProfile=None, name=None, description=None, function=None):
        super(CI_OnlineResource_TypeSub, self).__init__(id, uuid, linkage, protocol, applicationProfile, name, description, function, )
supermod.CI_OnlineResource_Type.subclass = CI_OnlineResource_TypeSub
# end class CI_OnlineResource_TypeSub


class CI_Address_TypeSub(supermod.CI_Address_Type):
    def __init__(self, id=None, uuid=None, deliveryPoint=None, city=None, administrativeArea=None, postalCode=None, country=None, electronicMailAddress=None):
        super(CI_Address_TypeSub, self).__init__(id, uuid, deliveryPoint, city, administrativeArea, postalCode, country, electronicMailAddress, )
supermod.CI_Address_Type.subclass = CI_Address_TypeSub
# end class CI_Address_TypeSub


class CI_Citation_TypeSub(supermod.CI_Citation_Type):
    def __init__(self, id=None, uuid=None, title=None, alternateTitle=None, date=None, edition=None, editionDate=None, identifier=None, citedResponsibleParty=None, presentationForm=None, series=None, otherCitationDetails=None, collectiveTitle=None, ISBN=None, ISSN=None):
        super(CI_Citation_TypeSub, self).__init__(id, uuid, title, alternateTitle, date, edition, editionDate, identifier, citedResponsibleParty, presentationForm, series, otherCitationDetails, collectiveTitle, ISBN, ISSN, )
supermod.CI_Citation_Type.subclass = CI_Citation_TypeSub
# end class CI_Citation_TypeSub


class CI_ResponsibleParty_TypeSub(supermod.CI_ResponsibleParty_Type):
    def __init__(self, id=None, uuid=None, individualName=None, organisationName=None, positionName=None, contactInfo=None, role=None):
        super(CI_ResponsibleParty_TypeSub, self).__init__(id, uuid, individualName, organisationName, positionName, contactInfo, role, )
supermod.CI_ResponsibleParty_Type.subclass = CI_ResponsibleParty_TypeSub
# end class CI_ResponsibleParty_TypeSub


class MD_GeometricObjects_TypeSub(supermod.MD_GeometricObjects_Type):
    def __init__(self, id=None, uuid=None, geometricObjectType=None, geometricObjectCount=None):
        super(MD_GeometricObjects_TypeSub, self).__init__(id, uuid, geometricObjectType, geometricObjectCount, )
supermod.MD_GeometricObjects_Type.subclass = MD_GeometricObjects_TypeSub
# end class MD_GeometricObjects_TypeSub


class MD_Dimension_TypeSub(supermod.MD_Dimension_Type):
    def __init__(self, id=None, uuid=None, dimensionName=None, dimensionSize=None, resolution=None):
        super(MD_Dimension_TypeSub, self).__init__(id, uuid, dimensionName, dimensionSize, resolution, )
supermod.MD_Dimension_Type.subclass = MD_Dimension_TypeSub
# end class MD_Dimension_TypeSub


class AbstractMD_SpatialRepresentation_TypeSub(supermod.AbstractMD_SpatialRepresentation_Type):
    def __init__(self, id=None, uuid=None, extensiontype_=None):
        super(AbstractMD_SpatialRepresentation_TypeSub, self).__init__(id, uuid, extensiontype_, )
supermod.AbstractMD_SpatialRepresentation_Type.subclass = AbstractMD_SpatialRepresentation_TypeSub
# end class AbstractMD_SpatialRepresentation_TypeSub


class MD_VectorSpatialRepresentation_TypeSub(supermod.MD_VectorSpatialRepresentation_Type):
    def __init__(self, id=None, uuid=None, topologyLevel=None, geometricObjects=None):
        super(MD_VectorSpatialRepresentation_TypeSub, self).__init__(id, uuid, topologyLevel, geometricObjects, )
supermod.MD_VectorSpatialRepresentation_Type.subclass = MD_VectorSpatialRepresentation_TypeSub
# end class MD_VectorSpatialRepresentation_TypeSub


class MD_GridSpatialRepresentation_TypeSub(supermod.MD_GridSpatialRepresentation_Type):
    def __init__(self, id=None, uuid=None, numberOfDimensions=None, axisDimensionProperties=None, cellGeometry=None, transformationParameterAvailability=None, extensiontype_=None):
        super(MD_GridSpatialRepresentation_TypeSub, self).__init__(id, uuid, numberOfDimensions, axisDimensionProperties, cellGeometry, transformationParameterAvailability, extensiontype_, )
supermod.MD_GridSpatialRepresentation_Type.subclass = MD_GridSpatialRepresentation_TypeSub
# end class MD_GridSpatialRepresentation_TypeSub


class MD_Metadata_TypeSub(supermod.MD_Metadata_Type):
    def __init__(self, id=None, uuid=None, fileIdentifier=None, language=None, characterSet=None, parentIdentifier=None, hierarchyLevel=None, hierarchyLevelName=None, contact=None, dateStamp=None, metadataStandardName=None, metadataStandardVersion=None, dataSetURI=None, locale=None, spatialRepresentationInfo=None, referenceSystemInfo=None, metadataExtensionInfo=None, identificationInfo=None, contentInfo=None, distributionInfo=None, dataQualityInfo=None, portrayalCatalogueInfo=None, metadataConstraints=None, applicationSchemaInfo=None, metadataMaintenance=None, series=None, describes=None, propertyType=None, featureType=None, featureAttribute=None):
        super(MD_Metadata_TypeSub, self).__init__(id, uuid, fileIdentifier, language, characterSet, parentIdentifier, hierarchyLevel, hierarchyLevelName, contact, dateStamp, metadataStandardName, metadataStandardVersion, dataSetURI, locale, spatialRepresentationInfo, referenceSystemInfo, metadataExtensionInfo, identificationInfo, contentInfo, distributionInfo, dataQualityInfo, portrayalCatalogueInfo, metadataConstraints, applicationSchemaInfo, metadataMaintenance, series, describes, propertyType, featureType, featureAttribute, )
supermod.MD_Metadata_Type.subclass = MD_Metadata_TypeSub
# end class MD_Metadata_TypeSub


class DS_DataSet_TypeSub(supermod.DS_DataSet_Type):
    def __init__(self, id=None, uuid=None, has=None, partOf=None):
        super(DS_DataSet_TypeSub, self).__init__(id, uuid, has, partOf, )
supermod.DS_DataSet_Type.subclass = DS_DataSet_TypeSub
# end class DS_DataSet_TypeSub


class AbstractDS_Aggregate_TypeSub(supermod.AbstractDS_Aggregate_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None, extensiontype_=None):
        super(AbstractDS_Aggregate_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, extensiontype_, )
supermod.AbstractDS_Aggregate_Type.subclass = AbstractDS_Aggregate_TypeSub
# end class AbstractDS_Aggregate_TypeSub


class AbstractCoordinateSystemTypeSub(supermod.AbstractCoordinateSystemType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None, extensiontype_=None):
        super(AbstractCoordinateSystemTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, extensiontype_, )
supermod.AbstractCoordinateSystemType.subclass = AbstractCoordinateSystemTypeSub
# end class AbstractCoordinateSystemTypeSub


class CoordinateSystemAxisTypeSub(supermod.CoordinateSystemAxisType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, uom=None, axisAbbrev=None, axisDirection=None, minimumValue=None, maximumValue=None, rangeMeaning=None):
        super(CoordinateSystemAxisTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, uom, axisAbbrev, axisDirection, minimumValue, maximumValue, rangeMeaning, )
supermod.CoordinateSystemAxisType.subclass = CoordinateSystemAxisTypeSub
# end class CoordinateSystemAxisTypeSub


class TemporalCRSTypeSub(supermod.TemporalCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, timeCS=None, usesTemporalCS=None, temporalDatum=None):
        super(TemporalCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, timeCS, usesTemporalCS, temporalDatum, )
supermod.TemporalCRSType.subclass = TemporalCRSTypeSub
# end class TemporalCRSTypeSub


class ImageCRSTypeSub(supermod.ImageCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, cartesianCS=None, affineCS=None, usesObliqueCartesianCS=None, imageDatum=None):
        super(ImageCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, cartesianCS, affineCS, usesObliqueCartesianCS, imageDatum, )
supermod.ImageCRSType.subclass = ImageCRSTypeSub
# end class ImageCRSTypeSub


class EngineeringCRSTypeSub(supermod.EngineeringCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, affineCS=None, cartesianCS=None, cylindricalCS=None, linearCS=None, polarCS=None, sphericalCS=None, userDefinedCS=None, coordinateSystem=None, engineeringDatum=None):
        super(EngineeringCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, affineCS, cartesianCS, cylindricalCS, linearCS, polarCS, sphericalCS, userDefinedCS, coordinateSystem, engineeringDatum, )
supermod.EngineeringCRSType.subclass = EngineeringCRSTypeSub
# end class EngineeringCRSTypeSub


class VerticalCRSTypeSub(supermod.VerticalCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, verticalCS=None, verticalDatum=None):
        super(VerticalCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, verticalCS, verticalDatum, )
supermod.VerticalCRSType.subclass = VerticalCRSTypeSub
# end class VerticalCRSTypeSub


class GeodeticCRSTypeSub(supermod.GeodeticCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, ellipsoidalCS=None, cartesianCS=None, sphericalCS=None, geodeticDatum=None):
        super(GeodeticCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, ellipsoidalCS, cartesianCS, sphericalCS, geodeticDatum, )
supermod.GeodeticCRSType.subclass = GeodeticCRSTypeSub
# end class GeodeticCRSTypeSub


class CompoundCRSTypeSub(supermod.CompoundCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, aggregationType=None, componentReferenceSystem=None):
        super(CompoundCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, aggregationType, componentReferenceSystem, )
supermod.CompoundCRSType.subclass = CompoundCRSTypeSub
# end class CompoundCRSTypeSub


class AbstractGeneralDerivedCRSTypeSub(supermod.AbstractGeneralDerivedCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, conversion=None, extensiontype_=None):
        super(AbstractGeneralDerivedCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, conversion, extensiontype_, )
supermod.AbstractGeneralDerivedCRSType.subclass = AbstractGeneralDerivedCRSTypeSub
# end class AbstractGeneralDerivedCRSTypeSub


class DictionaryEntryTypeSub(supermod.DictionaryEntryType):
    def __init__(self, owns='false', nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, Definition=None):
        super(DictionaryEntryTypeSub, self).__init__(owns, nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, Definition, )
supermod.DictionaryEntryType.subclass = DictionaryEntryTypeSub
# end class DictionaryEntryTypeSub


class UnitDefinitionTypeSub(supermod.UnitDefinitionType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, quantityType=None, quantityTypeReference=None, catalogSymbol=None, extensiontype_=None):
        super(UnitDefinitionTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, quantityType, quantityTypeReference, catalogSymbol, extensiontype_, )
supermod.UnitDefinitionType.subclass = UnitDefinitionTypeSub
# end class UnitDefinitionTypeSub


class AngleTypeSub(supermod.AngleType):
    def __init__(self, uom=None, valueOf_=None):
        super(AngleTypeSub, self).__init__(uom, valueOf_, )
supermod.AngleType.subclass = AngleTypeSub
# end class AngleTypeSub


class SpeedTypeSub(supermod.SpeedType):
    def __init__(self, uom=None, valueOf_=None):
        super(SpeedTypeSub, self).__init__(uom, valueOf_, )
supermod.SpeedType.subclass = SpeedTypeSub
# end class SpeedTypeSub


class VolumeTypeSub(supermod.VolumeType):
    def __init__(self, uom=None, valueOf_=None):
        super(VolumeTypeSub, self).__init__(uom, valueOf_, )
supermod.VolumeType.subclass = VolumeTypeSub
# end class VolumeTypeSub


class AreaTypeSub(supermod.AreaType):
    def __init__(self, uom=None, valueOf_=None):
        super(AreaTypeSub, self).__init__(uom, valueOf_, )
supermod.AreaType.subclass = AreaTypeSub
# end class AreaTypeSub


class GridLengthTypeSub(supermod.GridLengthType):
    def __init__(self, uom=None, valueOf_=None):
        super(GridLengthTypeSub, self).__init__(uom, valueOf_, )
supermod.GridLengthType.subclass = GridLengthTypeSub
# end class GridLengthTypeSub


class TimeTypeSub(supermod.TimeType):
    def __init__(self, uom=None, valueOf_=None):
        super(TimeTypeSub, self).__init__(uom, valueOf_, )
supermod.TimeType.subclass = TimeTypeSub
# end class TimeTypeSub


class ScaleTypeSub(supermod.ScaleType):
    def __init__(self, uom=None, valueOf_=None):
        super(ScaleTypeSub, self).__init__(uom, valueOf_, )
supermod.ScaleType.subclass = ScaleTypeSub
# end class ScaleTypeSub


class LengthTypeSub(supermod.LengthType):
    def __init__(self, uom=None, valueOf_=None):
        super(LengthTypeSub, self).__init__(uom, valueOf_, )
supermod.LengthType.subclass = LengthTypeSub
# end class LengthTypeSub


class AbstractGeometryTypeSub(supermod.AbstractGeometryType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, extensiontype_=None):
        super(AbstractGeometryTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, extensiontype_, )
supermod.AbstractGeometryType.subclass = AbstractGeometryTypeSub
# end class AbstractGeometryTypeSub


class RingTypeSub(supermod.RingType):
    def __init__(self, aggregationType=None, curveMember=None):
        super(RingTypeSub, self).__init__(aggregationType, curveMember, )
supermod.RingType.subclass = RingTypeSub
# end class RingTypeSub


class AbstractGeometricAggregateTypeSub(supermod.AbstractGeometricAggregateType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, extensiontype_=None):
        super(AbstractGeometricAggregateTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, extensiontype_, )
supermod.AbstractGeometricAggregateType.subclass = AbstractGeometricAggregateTypeSub
# end class AbstractGeometricAggregateTypeSub


class EnvelopeWithTimePeriodTypeSub(supermod.EnvelopeWithTimePeriodType):
    def __init__(self, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, lowerCorner=None, upperCorner=None, pos=None, coordinates=None, frame='#ISO-8601', beginPosition=None, endPosition=None):
        super(EnvelopeWithTimePeriodTypeSub, self).__init__(srsName, axisLabels, uomLabels, srsDimension, lowerCorner, upperCorner, pos, coordinates, frame, beginPosition, endPosition, )
supermod.EnvelopeWithTimePeriodType.subclass = EnvelopeWithTimePeriodTypeSub
# end class EnvelopeWithTimePeriodTypeSub


class AbstractFeatureTypeSub(supermod.AbstractFeatureType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, extensiontype_=None):
        super(AbstractFeatureTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, extensiontype_, )
supermod.AbstractFeatureType.subclass = AbstractFeatureTypeSub
# end class AbstractFeatureTypeSub


class AbstractTimeSliceTypeSub(supermod.AbstractTimeSliceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, validTime=None, dataSource=None, extensiontype_=None):
        super(AbstractTimeSliceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, validTime, dataSource, extensiontype_, )
supermod.AbstractTimeSliceType.subclass = AbstractTimeSliceTypeSub
# end class AbstractTimeSliceTypeSub


class DynamicFeatureMemberTypeSub(supermod.DynamicFeatureMemberType):
    def __init__(self, owns='false', nilReason=None, title=None, show=None, actuate=None, href=None, role=None, arcrole=None, remoteSchema=None, type_=None, DynamicFeature=None):
        super(DynamicFeatureMemberTypeSub, self).__init__(owns, nilReason, title, show, actuate, href, role, arcrole, remoteSchema, type_, DynamicFeature, )
supermod.DynamicFeatureMemberType.subclass = DynamicFeatureMemberTypeSub
# end class DynamicFeatureMemberTypeSub


class DynamicFeatureTypeSub(supermod.DynamicFeatureType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, validTime=None, history=None, dataSource=None, dataSourceReference=None, extensiontype_=None):
        super(DynamicFeatureTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, validTime, history, dataSource, dataSourceReference, extensiontype_, )
supermod.DynamicFeatureType.subclass = DynamicFeatureTypeSub
# end class DynamicFeatureTypeSub


class MovingObjectStatusTypeSub(supermod.MovingObjectStatusType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, validTime=None, dataSource=None, position=None, pos=None, locationName=None, locationReference=None, location=None, speed=None, bearing=None, acceleration=None, elevation=None, status=None, statusReference=None):
        super(MovingObjectStatusTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, validTime, dataSource, position, pos, locationName, locationReference, location, speed, bearing, acceleration, elevation, status, statusReference, )
supermod.MovingObjectStatusType.subclass = MovingObjectStatusTypeSub
# end class MovingObjectStatusTypeSub


class AbstractFeatureCollectionTypeSub(supermod.AbstractFeatureCollectionType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, featureMember=None, featureMembers=None, extensiontype_=None):
        super(AbstractFeatureCollectionTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, featureMember, featureMembers, extensiontype_, )
supermod.AbstractFeatureCollectionType.subclass = AbstractFeatureCollectionTypeSub
# end class AbstractFeatureCollectionTypeSub


class ObliqueCartesianCSTypeSub(supermod.ObliqueCartesianCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(ObliqueCartesianCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.ObliqueCartesianCSType.subclass = ObliqueCartesianCSTypeSub
# end class ObliqueCartesianCSTypeSub


class TemporalCSTypeSub(supermod.TemporalCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(TemporalCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.TemporalCSType.subclass = TemporalCSTypeSub
# end class TemporalCSTypeSub


class ObservationTypeSub(supermod.ObservationType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, validTime=None, using=None, target=None, resultOf=None, extensiontype_=None):
        super(ObservationTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, validTime, using, target, resultOf, extensiontype_, )
supermod.ObservationType.subclass = ObservationTypeSub
# end class ObservationTypeSub


class MD_ImageDescription_TypeSub(supermod.MD_ImageDescription_Type):
    def __init__(self, id=None, uuid=None, attributeDescription=None, contentType=None, dimension=None, illuminationElevationAngle=None, illuminationAzimuthAngle=None, imagingCondition=None, imageQualityCode=None, cloudCoverPercentage=None, processingLevelCode=None, compressionGenerationQuantity=None, triangulationIndicator=None, radiometricCalibrationDataAvailability=None, cameraCalibrationInformationAvailability=None, filmDistortionInformationAvailability=None, lensDistortionInformationAvailability=None):
        super(MD_ImageDescription_TypeSub, self).__init__(id, uuid, attributeDescription, contentType, dimension, illuminationElevationAngle, illuminationAzimuthAngle, imagingCondition, imageQualityCode, cloudCoverPercentage, processingLevelCode, compressionGenerationQuantity, triangulationIndicator, radiometricCalibrationDataAvailability, cameraCalibrationInformationAvailability, filmDistortionInformationAvailability, lensDistortionInformationAvailability, )
supermod.MD_ImageDescription_Type.subclass = MD_ImageDescription_TypeSub
# end class MD_ImageDescription_TypeSub


class EX_GeographicDescription_TypeSub(supermod.EX_GeographicDescription_Type):
    def __init__(self, id=None, uuid=None, extentTypeCode=None, geographicIdentifier=None):
        super(EX_GeographicDescription_TypeSub, self).__init__(id, uuid, extentTypeCode, geographicIdentifier, )
supermod.EX_GeographicDescription_Type.subclass = EX_GeographicDescription_TypeSub
# end class EX_GeographicDescription_TypeSub


class EX_SpatialTemporalExtent_TypeSub(supermod.EX_SpatialTemporalExtent_Type):
    def __init__(self, id=None, uuid=None, extent=None, spatialExtent=None):
        super(EX_SpatialTemporalExtent_TypeSub, self).__init__(id, uuid, extent, spatialExtent, )
supermod.EX_SpatialTemporalExtent_Type.subclass = EX_SpatialTemporalExtent_TypeSub
# end class EX_SpatialTemporalExtent_TypeSub


class EX_GeographicBoundingBox_TypeSub(supermod.EX_GeographicBoundingBox_Type):
    def __init__(self, id=None, uuid=None, extentTypeCode=None, westBoundLongitude=None, eastBoundLongitude=None, southBoundLatitude=None, northBoundLatitude=None):
        super(EX_GeographicBoundingBox_TypeSub, self).__init__(id, uuid, extentTypeCode, westBoundLongitude, eastBoundLongitude, southBoundLatitude, northBoundLatitude, )
supermod.EX_GeographicBoundingBox_Type.subclass = EX_GeographicBoundingBox_TypeSub
# end class EX_GeographicBoundingBox_TypeSub


class MD_Georectified_TypeSub(supermod.MD_Georectified_Type):
    def __init__(self, id=None, uuid=None, numberOfDimensions=None, axisDimensionProperties=None, cellGeometry=None, transformationParameterAvailability=None, checkPointAvailability=None, checkPointDescription=None, cornerPoints=None, centerPoint=None, pointInPixel=None, transformationDimensionDescription=None, transformationDimensionMapping=None):
        super(MD_Georectified_TypeSub, self).__init__(id, uuid, numberOfDimensions, axisDimensionProperties, cellGeometry, transformationParameterAvailability, checkPointAvailability, checkPointDescription, cornerPoints, centerPoint, pointInPixel, transformationDimensionDescription, transformationDimensionMapping, )
supermod.MD_Georectified_Type.subclass = MD_Georectified_TypeSub
# end class MD_Georectified_TypeSub


class MD_Georeferenceable_TypeSub(supermod.MD_Georeferenceable_Type):
    def __init__(self, id=None, uuid=None, numberOfDimensions=None, axisDimensionProperties=None, cellGeometry=None, transformationParameterAvailability=None, controlPointAvailability=None, orientationParameterAvailability=None, orientationParameterDescription=None, georeferencedParameters=None, parameterCitation=None):
        super(MD_Georeferenceable_TypeSub, self).__init__(id, uuid, numberOfDimensions, axisDimensionProperties, cellGeometry, transformationParameterAvailability, controlPointAvailability, orientationParameterAvailability, orientationParameterDescription, georeferencedParameters, parameterCitation, )
supermod.MD_Georeferenceable_Type.subclass = MD_Georeferenceable_TypeSub
# end class MD_Georeferenceable_TypeSub


class DS_Initiative_TypeSub(supermod.DS_Initiative_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None):
        super(DS_Initiative_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, )
supermod.DS_Initiative_Type.subclass = DS_Initiative_TypeSub
# end class DS_Initiative_TypeSub


class DS_Series_TypeSub(supermod.DS_Series_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None, extensiontype_=None):
        super(DS_Series_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, extensiontype_, )
supermod.DS_Series_Type.subclass = DS_Series_TypeSub
# end class DS_Series_TypeSub


class DS_OtherAggregate_TypeSub(supermod.DS_OtherAggregate_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None, extensiontype_=None):
        super(DS_OtherAggregate_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, extensiontype_, )
supermod.DS_OtherAggregate_Type.subclass = DS_OtherAggregate_TypeSub
# end class DS_OtherAggregate_TypeSub


class AffineCSTypeSub(supermod.AffineCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(AffineCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.AffineCSType.subclass = AffineCSTypeSub
# end class AffineCSTypeSub


class CylindricalCSTypeSub(supermod.CylindricalCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(CylindricalCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.CylindricalCSType.subclass = CylindricalCSTypeSub
# end class CylindricalCSTypeSub


class PolarCSTypeSub(supermod.PolarCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(PolarCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.PolarCSType.subclass = PolarCSTypeSub
# end class PolarCSTypeSub


class SphericalCSTypeSub(supermod.SphericalCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(SphericalCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.SphericalCSType.subclass = SphericalCSTypeSub
# end class SphericalCSTypeSub


class UserDefinedCSTypeSub(supermod.UserDefinedCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(UserDefinedCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.UserDefinedCSType.subclass = UserDefinedCSTypeSub
# end class UserDefinedCSTypeSub


class LinearCSTypeSub(supermod.LinearCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(LinearCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.LinearCSType.subclass = LinearCSTypeSub
# end class LinearCSTypeSub


class TimeCSTypeSub(supermod.TimeCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(TimeCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.TimeCSType.subclass = TimeCSTypeSub
# end class TimeCSTypeSub


class VerticalCSTypeSub(supermod.VerticalCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(VerticalCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.VerticalCSType.subclass = VerticalCSTypeSub
# end class VerticalCSTypeSub


class CartesianCSTypeSub(supermod.CartesianCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(CartesianCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.CartesianCSType.subclass = CartesianCSTypeSub
# end class CartesianCSTypeSub


class EllipsoidalCSTypeSub(supermod.EllipsoidalCSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, aggregationType=None, axis=None):
        super(EllipsoidalCSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, aggregationType, axis, )
supermod.EllipsoidalCSType.subclass = EllipsoidalCSTypeSub
# end class EllipsoidalCSTypeSub


class DerivedCRSTypeSub(supermod.DerivedCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, conversion=None, baseCRS=None, derivedCRSType=None, coordinateSystem=None):
        super(DerivedCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, conversion, baseCRS, derivedCRSType, coordinateSystem, )
supermod.DerivedCRSType.subclass = DerivedCRSTypeSub
# end class DerivedCRSTypeSub


class ProjectedCRSTypeSub(supermod.ProjectedCRSType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, domainOfValidity=None, scope=None, conversion=None, baseGeodeticCRS=None, baseGeographicCRS=None, cartesianCS=None):
        super(ProjectedCRSTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, domainOfValidity, scope, conversion, baseGeodeticCRS, baseGeographicCRS, cartesianCS, )
supermod.ProjectedCRSType.subclass = ProjectedCRSTypeSub
# end class ProjectedCRSTypeSub


class GridTypeSub(supermod.GridType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, dimension=None, limits=None, axisName=None, extensiontype_=None):
        super(GridTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, dimension, limits, axisName, extensiontype_, )
supermod.GridType.subclass = GridTypeSub
# end class GridTypeSub


class AbstractCoverageTypeSub(supermod.AbstractCoverageType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, domainSet=None, rangeSet=None, extensiontype_=None):
        super(AbstractCoverageTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, domainSet, rangeSet, extensiontype_, )
supermod.AbstractCoverageType.subclass = AbstractCoverageTypeSub
# end class AbstractCoverageTypeSub


class GeometricComplexTypeSub(supermod.GeometricComplexType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, element=None):
        super(GeometricComplexTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, element, )
supermod.GeometricComplexType.subclass = GeometricComplexTypeSub
# end class GeometricComplexTypeSub


class ConventionalUnitTypeSub(supermod.ConventionalUnitType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, quantityType=None, quantityTypeReference=None, catalogSymbol=None, conversionToPreferredUnit=None, roughConversionToPreferredUnit=None, derivationUnitTerm=None):
        super(ConventionalUnitTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, quantityType, quantityTypeReference, catalogSymbol, conversionToPreferredUnit, roughConversionToPreferredUnit, derivationUnitTerm, )
supermod.ConventionalUnitType.subclass = ConventionalUnitTypeSub
# end class ConventionalUnitTypeSub


class DerivedUnitTypeSub(supermod.DerivedUnitType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, quantityType=None, quantityTypeReference=None, catalogSymbol=None, derivationUnitTerm=None):
        super(DerivedUnitTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, quantityType, quantityTypeReference, catalogSymbol, derivationUnitTerm, )
supermod.DerivedUnitType.subclass = DerivedUnitTypeSub
# end class DerivedUnitTypeSub


class BaseUnitTypeSub(supermod.BaseUnitType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, remarks=None, quantityType=None, quantityTypeReference=None, catalogSymbol=None, unitsSystem=None):
        super(BaseUnitTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, remarks, quantityType, quantityTypeReference, catalogSymbol, unitsSystem, )
supermod.BaseUnitType.subclass = BaseUnitTypeSub
# end class BaseUnitTypeSub


class AbstractGeometricPrimitiveTypeSub(supermod.AbstractGeometricPrimitiveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, extensiontype_=None):
        super(AbstractGeometricPrimitiveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, extensiontype_, )
supermod.AbstractGeometricPrimitiveType.subclass = AbstractGeometricPrimitiveTypeSub
# end class AbstractGeometricPrimitiveTypeSub


class AbstractSurfaceTypeSub(supermod.AbstractSurfaceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, extensiontype_=None):
        super(AbstractSurfaceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, extensiontype_, )
supermod.AbstractSurfaceType.subclass = AbstractSurfaceTypeSub
# end class AbstractSurfaceTypeSub


class AbstractSolidTypeSub(supermod.AbstractSolidType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, extensiontype_=None):
        super(AbstractSolidTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, extensiontype_, )
supermod.AbstractSolidType.subclass = AbstractSolidTypeSub
# end class AbstractSolidTypeSub


class OrientableSurfaceTypeSub(supermod.OrientableSurfaceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, orientation='+', baseSurface=None):
        super(OrientableSurfaceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, orientation, baseSurface, )
supermod.OrientableSurfaceType.subclass = OrientableSurfaceTypeSub
# end class OrientableSurfaceTypeSub


class SurfaceTypeSub(supermod.SurfaceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, patches=None, extensiontype_=None):
        super(SurfaceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, patches, extensiontype_, )
supermod.SurfaceType.subclass = SurfaceTypeSub
# end class SurfaceTypeSub


class MultiSolidTypeSub(supermod.MultiSolidType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, solidMember=None, solidMembers=None):
        super(MultiSolidTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, solidMember, solidMembers, )
supermod.MultiSolidType.subclass = MultiSolidTypeSub
# end class MultiSolidTypeSub


class MultiSurfaceTypeSub(supermod.MultiSurfaceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, surfaceMember=None, surfaceMembers=None):
        super(MultiSurfaceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, surfaceMember, surfaceMembers, )
supermod.MultiSurfaceType.subclass = MultiSurfaceTypeSub
# end class MultiSurfaceTypeSub


class MultiCurveTypeSub(supermod.MultiCurveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, curveMember=None, curveMembers=None):
        super(MultiCurveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, curveMember, curveMembers, )
supermod.MultiCurveType.subclass = MultiCurveTypeSub
# end class MultiCurveTypeSub


class MultiPointTypeSub(supermod.MultiPointType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, pointMember=None, pointMembers=None):
        super(MultiPointTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, pointMember, pointMembers, )
supermod.MultiPointType.subclass = MultiPointTypeSub
# end class MultiPointTypeSub


class MultiGeometryTypeSub(supermod.MultiGeometryType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, geometryMember=None, geometryMembers=None):
        super(MultiGeometryTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, geometryMember, geometryMembers, )
supermod.MultiGeometryType.subclass = MultiGeometryTypeSub
# end class MultiGeometryTypeSub


class DynamicFeatureCollectionTypeSub(supermod.DynamicFeatureCollectionType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, validTime=None, history=None, dataSource=None, dataSourceReference=None, dynamicMembers=None):
        super(DynamicFeatureCollectionTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, validTime, history, dataSource, dataSourceReference, dynamicMembers, )
supermod.DynamicFeatureCollectionType.subclass = DynamicFeatureCollectionTypeSub
# end class DynamicFeatureCollectionTypeSub


class FeatureCollectionTypeSub(supermod.FeatureCollectionType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, featureMember=None, featureMembers=None):
        super(FeatureCollectionTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, featureMember, featureMembers, )
supermod.FeatureCollectionType.subclass = FeatureCollectionTypeSub
# end class FeatureCollectionTypeSub


class DirectedObservationTypeSub(supermod.DirectedObservationType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, validTime=None, using=None, target=None, resultOf=None, direction=None, extensiontype_=None):
        super(DirectedObservationTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, validTime, using, target, resultOf, direction, extensiontype_, )
supermod.DirectedObservationType.subclass = DirectedObservationTypeSub
# end class DirectedObservationTypeSub


class DS_StereoMate_TypeSub(supermod.DS_StereoMate_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None):
        super(DS_StereoMate_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, )
supermod.DS_StereoMate_Type.subclass = DS_StereoMate_TypeSub
# end class DS_StereoMate_TypeSub


class DS_ProductionSeries_TypeSub(supermod.DS_ProductionSeries_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None):
        super(DS_ProductionSeries_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, )
supermod.DS_ProductionSeries_Type.subclass = DS_ProductionSeries_TypeSub
# end class DS_ProductionSeries_TypeSub


class DS_Sensor_TypeSub(supermod.DS_Sensor_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None):
        super(DS_Sensor_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, )
supermod.DS_Sensor_Type.subclass = DS_Sensor_TypeSub
# end class DS_Sensor_TypeSub


class DS_Platform_TypeSub(supermod.DS_Platform_Type):
    def __init__(self, id=None, uuid=None, composedOf=None, seriesMetadata=None, subset=None, superset=None):
        super(DS_Platform_TypeSub, self).__init__(id, uuid, composedOf, seriesMetadata, subset, superset, )
supermod.DS_Platform_Type.subclass = DS_Platform_TypeSub
# end class DS_Platform_TypeSub


class RectifiedGridTypeSub(supermod.RectifiedGridType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, dimension=None, limits=None, axisName=None, origin=None, offsetVector=None):
        super(RectifiedGridTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, dimension, limits, axisName, origin, offsetVector, )
supermod.RectifiedGridType.subclass = RectifiedGridTypeSub
# end class RectifiedGridTypeSub


class AbstractContinuousCoverageTypeSub(supermod.AbstractContinuousCoverageType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, domainSet=None, rangeSet=None, coverageFunction=None):
        super(AbstractContinuousCoverageTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, domainSet, rangeSet, coverageFunction, )
supermod.AbstractContinuousCoverageType.subclass = AbstractContinuousCoverageTypeSub
# end class AbstractContinuousCoverageTypeSub


class DiscreteCoverageTypeSub(supermod.DiscreteCoverageType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, domainSet=None, rangeSet=None, coverageFunction=None):
        super(DiscreteCoverageTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, domainSet, rangeSet, coverageFunction, )
supermod.DiscreteCoverageType.subclass = DiscreteCoverageTypeSub
# end class DiscreteCoverageTypeSub


class CompositeSolidTypeSub(supermod.CompositeSolidType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, solidMember=None):
        super(CompositeSolidTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, solidMember, )
supermod.CompositeSolidType.subclass = CompositeSolidTypeSub
# end class CompositeSolidTypeSub


class CompositeSurfaceTypeSub(supermod.CompositeSurfaceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, surfaceMember=None):
        super(CompositeSurfaceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, surfaceMember, )
supermod.CompositeSurfaceType.subclass = CompositeSurfaceTypeSub
# end class CompositeSurfaceTypeSub


class AbstractCurveTypeSub(supermod.AbstractCurveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, extensiontype_=None):
        super(AbstractCurveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, extensiontype_, )
supermod.AbstractCurveType.subclass = AbstractCurveTypeSub
# end class AbstractCurveTypeSub


class PointTypeSub(supermod.PointType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, pos=None, coordinates=None):
        super(PointTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, pos, coordinates, )
supermod.PointType.subclass = PointTypeSub
# end class PointTypeSub


class PolygonTypeSub(supermod.PolygonType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, exterior=None, interior=None):
        super(PolygonTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, exterior, interior, )
supermod.PolygonType.subclass = PolygonTypeSub
# end class PolygonTypeSub


class SolidTypeSub(supermod.SolidType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, exterior=None, interior=None):
        super(SolidTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, exterior, interior, )
supermod.SolidType.subclass = SolidTypeSub
# end class SolidTypeSub


class TinTypeSub(supermod.TinType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, patches=None, stopLines=None, breakLines=None, maxLength=None, controlPoint=None):
        super(TinTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, patches, stopLines, breakLines, maxLength, controlPoint, )
supermod.TinType.subclass = TinTypeSub
# end class TinTypeSub


class OrientableCurveTypeSub(supermod.OrientableCurveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, orientation='+', baseCurve=None):
        super(OrientableCurveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, orientation, baseCurve, )
supermod.OrientableCurveType.subclass = OrientableCurveTypeSub
# end class OrientableCurveTypeSub


class CurveTypeSub(supermod.CurveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, segments=None):
        super(CurveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, segments, )
supermod.CurveType.subclass = CurveTypeSub
# end class CurveTypeSub


class DirectedObservationAtDistanceTypeSub(supermod.DirectedObservationAtDistanceType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, boundedBy=None, location=None, validTime=None, using=None, target=None, resultOf=None, direction=None, distance=None):
        super(DirectedObservationAtDistanceTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, boundedBy, location, validTime, using, target, resultOf, direction, distance, )
supermod.DirectedObservationAtDistanceType.subclass = DirectedObservationAtDistanceTypeSub
# end class DirectedObservationAtDistanceTypeSub


class CompositeCurveTypeSub(supermod.CompositeCurveType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, aggregationType=None, curveMember=None):
        super(CompositeCurveTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, aggregationType, curveMember, )
supermod.CompositeCurveType.subclass = CompositeCurveTypeSub
# end class CompositeCurveTypeSub


class LineStringTypeSub(supermod.LineStringType):
    def __init__(self, id=None, metaDataProperty=None, description=None, descriptionReference=None, identifier=None, name=None, srsName=None, axisLabels=None, uomLabels=None, srsDimension=None, pos=None, pointProperty=None, pointRep=None, posList=None, coordinates=None):
        super(LineStringTypeSub, self).__init__(id, metaDataProperty, description, descriptionReference, identifier, name, srsName, axisLabels, uomLabels, srsDimension, pos, pointProperty, pointRep, posList, coordinates, )
supermod.LineStringType.subclass = LineStringTypeSub
# end class LineStringTypeSub


def get_root_tag(node):
    tag = supermod.Tag_pattern_.match(node.tag).groups()[-1]
    rootClass = None
    rootClass = supermod.GDSClassesMapping.get(tag)
    if rootClass is None and hasattr(supermod, tag):
        rootClass = getattr(supermod, tag)
    return tag, rootClass


def parse(inFilename, silence=False):
    parser = None
    doc = parsexml_(inFilename, parser)
    rootNode = doc.getroot()
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'dossierConsultation'
        rootClass = supermod.dossierConsultation
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    doc = None
##     if not silence:
##         sys.stdout.write('<?xml version="1.0" ?>\n')
##         rootObj.export(
##             sys.stdout, 0, name_=rootTag,
##             namespacedef_='xmlns:t="http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.1"',
##             pretty_print=True)
    return rootObj


def parseEtree(inFilename, silence=False):
    parser = None
    doc = parsexml_(inFilename, parser)
    rootNode = doc.getroot()
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'dossierConsultation'
        rootClass = supermod.dossierConsultation
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    doc = None
    mapping = {}
    rootElement = rootObj.to_etree(None, name_=rootTag, mapping_=mapping)
    reverse_mapping = rootObj.gds_reverse_node_mapping(mapping)
##     if not silence:
##         content = etree_.tostring(
##             rootElement, pretty_print=True,
##             xml_declaration=True, encoding="utf-8")
##         sys.stdout.write(content)
##         sys.stdout.write('\n')
    return rootObj, rootElement, mapping, reverse_mapping


def parseString(inString, silence=False):
    from StringIO import StringIO
    parser = None
    doc = parsexml_(StringIO(inString), parser)
    rootNode = doc.getroot()
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'dossierConsultation'
        rootClass = supermod.dossierConsultation
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    doc = None
##     if not silence:
##         sys.stdout.write('<?xml version="1.0" ?>\n')
##         rootObj.export(
##             sys.stdout, 0, name_=rootTag,
##             namespacedef_='xmlns:t="http://www.reseaux-et-canalisations.gouv.fr/schema-teleservice/2.1"')
    return rootObj


def parseLiteral(inFilename, silence=False):
    parser = None
    doc = parsexml_(inFilename, parser)
    rootNode = doc.getroot()
    rootTag, rootClass = get_root_tag(rootNode)
    if rootClass is None:
        rootTag = 'dossierConsultation'
        rootClass = supermod.dossierConsultation
    rootObj = rootClass.factory()
    rootObj.build(rootNode)
    # Enable Python to collect the space used by the DOM.
    doc = None
##     if not silence:
##         sys.stdout.write('#from dtdict_api import *\n\n')
##         sys.stdout.write('import dtdict_api as model_\n\n')
##         sys.stdout.write('rootObj = model_.rootClass(\n')
##         rootObj.exportLiteral(sys.stdout, 0, name_=rootTag)
##         sys.stdout.write(')\n')
    return rootObj


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
    parse(infilename)


if __name__ == '__main__':
    #import pdb; pdb.set_trace()
    main()
