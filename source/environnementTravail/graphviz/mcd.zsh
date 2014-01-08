with=(
    code_composante ''
    libelle_composante ''
) entity composante

with=(
    code_prestation ''
    libelle_prestation ''
    prix_unitaire ''
) entity prestation

with=(
    code_annee ''
    libelle_annee ''
    compteur_facture ''
    annee_en_cours ''
) entity annee

with=(
    code_demande ''
    nom_demandeur ''
    date_demande ''
    quantite ''
    montant_total ''
) entity demande

with=(
    code_nature ''
    libelle_nature ''
) entity nature

with=(
    trimestre
) entity facture

between=(
    0,n composante
    1,1 facture
) relation facturation

between=(
    1,n facture
    1,1 prestation
) relation emise_pour

between=(
    4 annee
    1 facture
) relation annee_emission

between=(
    0,n nature
    1,1 prestation
) relation est_de_nature

between=(
    1,1 demande
    1,1 prestation
) relation faite_pour

between=(
    1,1 demande
    0,n annee
) relation est_faite_pour

between=(
    1,1 demande
    0,n composante
) relation est_rattachee

with=(
    credit_ouvert ''
    credit_consomme ''
    credit_bloque ''
) between=(
    1,1 composante
    1,n annee
) relation est_creditee_pour
