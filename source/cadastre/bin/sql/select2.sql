drop view if exists local;
CREATE VIEW local AS
SELECT
  bati_article_00.ccosec,
  bati_article_00.dnupla,
  bati_article_00.invar,
  bati_article_00.cleinvar,
  bati_article_00.dnubat,
  bati_article_10.dnupro,
  bati_article_10.jdatat,
  bati_article_10.ccoeva,
  bati_article_10.dteloc,
  bati_article_10.cconlc,
  bati_article_10.dvltrt,
  bati_article_10.jannat,
  bati_article_10.dnbniv,
  bati_article_10.jdatcgl
FROM bati_article_00
left join bati_article_10 on bati_article_00.invar = bati_article_10.invar
WHERE bati_article_00.ccosec = 'CH'
  AND bati_article_00.dnupla = '0385';

drop view if exists pev;
CREATE VIEW pev AS
SELECT
  bati_article_10.dnupro as numero_communal, -- Compte communal du propriétaire de la suf
  --bati_article_10.drcsuba as revenu_imposable, -- Revenu cadastral revalorisé en valeur du 01/01 de l’année
  bati_article_00.ccosec as pbd_section, -- Section cadastrale
  bati_article_00.dnupla as pbd_numero_plan, -- Numéro de plan
  bati_article_00.ccoriv as pbd_code_rivoli, -- Code rivoli
  bati_article_00.dnubat as pbi_batiment, -- Numéro du batiment
  bati_article_21.invar as pbi_invar,
  bati_article_00.cleinvar as pbi_cleinvar,
  bati_article_21.dnupev as pbe_pev,
  bati_article_21.ccostb as pbe_lettre_serie_tarif, -- Lettre de série tarif bati
  bati_article_10.ccoeva as pbe_methode_evaluation, -- Methode evaluation
  ccoaff_signification as pbe_affectation, -- Affectation de la pev
  cconad_signification as pbe_nature_local, -- Nature de dépendance
  bati_article_40.cconad1, -- Nature de dépendance
  bati_article_21.dcapec as pbe_categorie, -- Categorie
  bati_article_36.bipevlac as pbe_revenu_cadastral, -- Base d imposition de la pev (valeur de l année)
  bati_article_36.bateom--, -- BASE ORDURES MENAGERES
  --bati_article_21.dcetlc, -- Coefficient d entretien
  --bati_article_21.dsupot, -- Surface Pondérée
  --bati_article_21.dvlper, -- Valeur Locative
  --bati_article_21.dvlpera, -- Valeur Locative, en valeur de l'année
  --bati_article_21.ccthp, -- Code occupation à la TH ou à la TP
  --bati_article_21.dnuref, -- Numéro de local Type
  --bati_article_21.dvltpe, -- Valeur Locative Totale de la PEV Majic2
  --bati_article_21.topcn, -- top construction nouvelle
  --bati_article_21.tpevtiom, -- top local passible de la teom
  --bati_article_21."DCSPLC-A", -- coefficient de situation particulière
  --bati_article_21."DCSGLC-A", -- coefficient de situation générale
  --bati_article_21."DCRALC-A", -- correctif d'ascenceur
  --bati_article_30.dnupev,
  --bati_article_30.ccolloc, -- Code de collectivité locale accordant exonération
  --bati_article_30.gnextl, -- Nature exoneration temporaire
  --bati_article_30.janimp, -- Année de retour à l imposition
  --bati_article_30.dvldif2a, -- Montant de la VL exonérée (valeur de l année)
  --bati_article_36.vlbaiac, -- Part de VL imposée (valeur de l année)
  --bati_article_40.dsueic1, --Surface réelle de l élément incorporé
  --bati_article_40.dcimei1, -- Coefficient de pondération
  --bati_article_40.geaulc, -- Présence d’eau
  --bati_article_40.gelelc, -- Présence d’électricité
  --bati_article_40.gesclc, -- présence d escalier de service
  --bati_article_40.ggazlc, -- présence du gaz
  --bati_article_40.gasclc, -- présence d ascenceur
  --bati_article_40.gchclc, -- presence de chauffage central
  --bati_article_40.gvorlc, -- presence de vide ordures
  --bati_article_40.gteglc, -- presence du tout à l egout
  --bati_article_40.dnbbai, -- Nombre de baignoires
  --bati_article_40.dnbdou, -- Nombre de douches
  --bati_article_40.dnblav, -- Nombre de lavabos
  --bati_article_40.dnbwc, -- Nombre de WC
  --bati_article_40.deqdha, -- Equivalence superficielle des éléments de confort
  --bati_article_40.dnbppr, -- Nombre de pièces principales
  --bati_article_40.dnbsam, -- Nombre de salles à manger
  --bati_article_40.dnbcha, -- Nombre de chambres
  --bati_article_40.dnbcu8, -- Nombre de cuisines de moins de 9 m2
  --bati_article_40.dnbcu9, -- Nombre  de  cuisines  d’au moins 9 m2
  --bati_article_40.dnbsea, -- Nombre de salles d’eau
  --bati_article_40.dnbann, -- Nombre de pièces annexes
  --bati_article_40.dnbpdc, -- Nombre de pièces
  --bati_article_40.dsupdc, -- Superficie des pièces
  --bati_article_40.dmatgm, -- Matériaux des gros murs
  --bati_article_40.dmatto, -- Matériaux des toitures
  --bati_article_40.jannat, -- Année d’achèvement
  --bati_article_40.detent, -- état d’entretien
  --bati_article_40.dnbniv, -- Nombre de niveaux
  --bati_article_50.dnudes, -- Numéro d'ordre du descriptif
  --bati_article_50.vsurzt, -- surface réelle totale
  --bati_article_60.dnudes, -- Numéro d’ordre de descriptif
  --bati_article_60.dsudep, -- Surface réelle de la dépendance
  --bati_article_60.asitet, -- Localisation (bat, esc, niv)
  --bati_article_60.dmatgm, -- Matériaux des gros murs
  --bati_article_60.dmatto, -- Matériaux des toitures
  --bati_article_60.dcimlc -- Coefficient de pondération
FROM bati_article_21
left join bati_article_30 on (bati_article_21.invar = bati_article_30.invar AND bati_article_21.dnupev = bati_article_30.dnupev)
left join bati_article_36 on (bati_article_21.invar = bati_article_36.invar AND bati_article_21.dnupev = bati_article_36.dnupev)
left join bati_article_40 on (bati_article_21.invar = bati_article_40.invar AND bati_article_21.dnupev = bati_article_40.dnupev)
left join bati_article_50 on (bati_article_21.invar = bati_article_50.invar AND bati_article_21.dnupev = bati_article_50.dnupev)
left join bati_article_60 on (bati_article_21.invar = bati_article_60.invar AND bati_article_21.dnupev = bati_article_60.dnupev)
join bati_article_10 on (bati_article_21.invar = bati_article_10.invar)
join bati_article_00 on (bati_article_21.invar = bati_article_00.invar)
left join liste_ccoaff on bati_article_21.ccoaff = liste_ccoaff.ccoaff
left join liste_cconad on bati_article_60.cconad = liste_cconad.cconad
--left join liste_cconad on bati_article_40.cconad1 = liste_cconad.cconad
where bati_article_21.invar = '3000065230'
  OR bati_article_21.invar = '3000065231'
limit 100;


