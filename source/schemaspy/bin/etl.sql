
-- acte_deces

--use sieclev4;
--select * from EC_PERS_ACTE where nom='garel' and Prenoms Like 'Carmen%';
select --*
  EC_PERS_ACTE.NOM as ad_defunt_nom,
  EC_PERS_ACTE.PRENOMS as ad_defunt_prenoms,
  EC_PERS_ACTE.SEXE as ad_defunt_sexe,
  EC_PERS_ACTE.DT_NAIS_N as ad_defunt_naissance_date,
  EC_PERS_ACTE.COM_NAIS as ad_defunt_naissance_comune,
  EC_PERS_ACTE.DEP_NAIS as ad_defunt_naissance_departement,
  EC_PERS_ACTE.DT_DCD_N as ad_defunt_deces_date,
  EC_PERS_ACTE.PROFESSION as ad_defunt_profession,
  EC_PERS_ACTE.NATION as ad_defunt_nationalite,
  EC_PERS_ACTE.ETAT_MATR as ad_defunt_situation_matrimoniale,
  ec_tdeces_acte.NB_ENF as ad_defunt_nombre_enfant,
  ec_deces_acte.lieu_deces as ad_defunt_deces_lieu,
  ec_deces_acte.certif_med_confid as ad_certificat_medical,
  ec_deces_acte.txt_declrt as ad_declarant,
  ec_acte.num_acte as ad_acte_numero,
  ec_acte.dt_evn_n as ad_evenement_date,
  ec_acte.hr_evn_n as ad_evenement_heure,
  ec_acte.dt_dresse as ad_acte_dresse_date,
  ec_acte.hr_dresse as ad_acte_dresse_heure,
  ec_acte.lib_dresse as ad_acte_dresse_libelle,
  ec_acte.lib_oec_dresse as ad_acte_dresse_officier,
  --ec_acte_txt.num_ord,
  ec_acte_txt.texte as ad_acte_libelle,
  ec_mentions.txt_contenu as ad_acte_libelle_mention,
  ec_mentions.txt_apposition as ad_acte_libelle_mention_apposition,
  ec_mentions.dt_apposition as ad_acte_libelle_mention_apposition_date,
  ec_mentions.lib_oec_apposition as ad_acte_libelle_mention_apposition_officier
from EC_PERS_ACTE
  inner join ec_tdeces_acte on ec_pers_acte.id_pers = ec_tdeces_acte.id_defunt
  inner join ec_deces_acte on ec_tdeces_acte.id_ec_acte = ec_deces_acte.id_ec_tdeces_acte
  inner join ec_acte on ec_tdeces_acte.id_ec_acte = ec_acte.id_acte
  left outer join ec_acte_txt on ec_tdeces_acte.id_ec_acte = ec_acte_txt.id_acte
  inner join ec_mentions on ec_acte.id_acte = ec_mentions.id_acte
where EC_PERS_ACTE.nom='garel' and EC_PERS_ACTE.Prenoms Like 'Carmen%'
;
