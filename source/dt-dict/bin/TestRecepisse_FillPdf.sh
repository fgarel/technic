#!/bin/sh


# Le but de ce script est de remplir un ou plusieurs recepissé de manière automatique


# le recepisse (formulaire dt-dict) est recupéré ici :
# https://www.service-public.fr/professionnels-entreprises/vosdroits/R23301
# https://www.reseaux-et-canalisations.ineris.fr/gu-presentation/userfile?path=/fichiers/textes_reglementaires/formulaire_cerfa_recepisse.pdf

# nous utilions pdftk qui permet de manipuler des pdfFabric
# apt-get install pdftk
# La doc de pdftk (pdftk-server est le mode cli) est ici
# https://www.pdflabs.com/docs/pdftk-man-page/
# https://www.pdflabs.com/docs/pdftk-cli-examples/


# la procédure pour rempir un formulaire est ici
# https://www.sitepoint.com/filling-pdf-forms-pdftk-php/

# 1 Récupeartion du fichier fpf a parit du formulaire

pdftk ../data/cerfa_14435-03.pdf dump_data_fields > ../data/cerfa_field_names.txt
