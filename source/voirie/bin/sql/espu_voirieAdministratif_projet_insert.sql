
-- connexion a la base espu
-- identifiant : fred
-- password : fgpass


-- une fois que la vue numvoie_vue est créée, nous allons initiailiser la table numvoie avec cette source de données

select count(*) from voirie_administratif.numvoie_vue;


truncate voirie_administratif.numvoie;
insert into voirie_administratif.numvoie
  select
    nextval('voirie_administratif.numvoie_id_seq'::regclass) as id,
    id_vo_adresse,
    id_cleabs,
    code_demande,
    numvoie,
    numvoie_num,
    numvoie_complement,
    nomvoie,
    '' as batiment,
    angle,
    shape
  from voirie_administratif.numvoie_vue;

  --update voirie_administratif.numvoie
  --set numvoie_num = voirie_administratif.numvoie_vue.numvoie_num
  --from voirie_administratif.numvoie_vue
  --where voirie_administratif.numvoie.id = voirie_administratif.numvoie_vue.id;

  --update voirie_administratif.numvoie
  --set numvoie_complement = voirie_administratif.numvoie_vue.numvoie_complement
  --from voirie_administratif.numvoie_vue
  --where voirie_administratif.numvoie.id = voirie_administratif.numvoie_vue.id;
