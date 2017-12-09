select * from
(select * from b_urbanisme.ads_lt
where dos_nomdossier like '%17300%'
union
select * from b_urbanisme.ads_pa
where dos_nomdossier like '%17300%') rq
where annee >= 1996
  and dos_nomdossier like '%17300%'
order by annee

