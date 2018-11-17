-- Comparaison des 2 libellés des deux tables

-- les vues :
--   - ListeParcelle_From_cadlr
--   - ListeParcelleVLR_From_cadlr
-- pour détecter les voies privées


SET search_path = stockage, travail, public;


-- ------------------------------ --
-- Creation des vues parcelles --
-- ------------------------------ --

CREATE OR REPLACE VIEW travail."ListeParcelle_From_cadlr" AS
 SELECT
    "cadlr".parcelle,
    "cadlr".ccosec,
    "cadlr".dnupla,
    "cadlr".dnuplaccosec,
    "cadlr".proprio,
    "cadlr".adressep,
    "cadlr".dcntpa,
    "cadlr".gparbat,
    "cadlr".geom
   FROM dblink('dbname=cadlr port=5432
   host=dsibdd09 user=sig password=Mie3Bhoutan'::text, '


 SELECT groupe.parcelle, groupe.ccosec, groupe.dnupla, groupe.dnuplaccosec, array_to_string(ARRAY( SELECT btrim(source2.ddenom::text) AS btrim
           FROM proprietaire source2
          WHERE source2.dnupro::text = groupe.dnupro::text), '', ''::text) AS proprio, groupe.adressep, groupe.dcntpa, groupe.gparbat, geo_parcelle.geom
   FROM ( SELECT p.parcelle, p.dnupla, p.ccosec, (p.ccosec::text || '' ''::text) || p.dnupla::text AS dnuplaccosec, p.dnupro, (((((p.dnvoiri::text || '' ''::text) || p.dindic::text) || '' ''::text) || p.cconvo::text) || '' ''::text) || p.dvoilib::text AS adressep, p.dcntpa, p.gparbat
           FROM ( SELECT parcelle.parcelle, parcelle.dnupla, parcelle.ccosec, parcelle.dnupro, parcelle.dnvoiri, parcelle.dindic, parcelle.cconvo, parcelle.dvoilib, parcelle.dcntpa, parcelle.gparbat, parcelle.dnupla::integer AS dnupla2
                   FROM parcelle) p
          WHERE (p.dnupro::text IN ( SELECT proprietaire.dnupro
                   FROM proprietaire
                  --WHERE btrim(proprietaire.ddenom::text) = ''COMMUNE DE LA ROCHELLE''::text OR btrim(proprietaire.ddenom::text) = ''VILLE DE LA ROCHELLE''::text OR btrim(proprietaire.ddenom::text) = ''LA REGIE MUNICIPALE DU PORT DE PLAISANCE DE LA ROCHELLE''::text OR btrim(proprietaire.ddenom::text) = ''LA ROCHELLE''::text
                  ))
          GROUP BY p.parcelle, p.dnupla, p.ccosec, (p.ccosec::text || '' ''::text) || p.dnupla::text, p.dnupro, (((((p.dnvoiri::text || '' ''::text) || p.dindic::text) || '' ''::text) || p.cconvo::text) || '' ''::text) || p.dvoilib::text, p.dcntpa, p.gparbat) groupe
   LEFT JOIN geo_parcelle ON groupe.parcelle::text = geo_parcelle.parcelle::text
  ORDER BY groupe.dnuplaccosec;

      '::text)
      "cadlr"(
      parcelle character varying(19),
      ccosec character varying(2),
      dnupla character varying(4),
      dnuplaccosec text,
      proprio text,
      adressep text,
      dcntpa integer,
      gparbat character varying(1),
      geom geometry);


CREATE OR REPLACE VIEW travail."ListeParcelleVLR_From_cadlr" AS
 SELECT
    "cadlr".parcelle,
    "cadlr".ccosec,
    "cadlr".dnupla,
    "cadlr".dnuplaccosec,
    "cadlr".proprio,
    "cadlr".adressep,
    "cadlr".dcntpa,
    "cadlr".gparbat,
    "cadlr".geom
   FROM dblink('dbname=cadlr port=5432
   host=dsibdd09 user=sig password=Mie3Bhoutan'::text, '


 SELECT groupe.parcelle, groupe.ccosec, groupe.dnupla, groupe.dnuplaccosec, array_to_string(ARRAY( SELECT btrim(source2.ddenom::text) AS btrim
           FROM proprietaire source2
          WHERE source2.dnupro::text = groupe.dnupro::text), '', ''::text) AS proprio, groupe.adressep, groupe.dcntpa, groupe.gparbat, geo_parcelle.geom
   FROM ( SELECT p.parcelle, p.dnupla, p.ccosec, (p.ccosec::text || '' ''::text) || p.dnupla::text AS dnuplaccosec, p.dnupro, (((((p.dnvoiri::text || '' ''::text) || p.dindic::text) || '' ''::text) || p.cconvo::text) || '' ''::text) || p.dvoilib::text AS adressep, p.dcntpa, p.gparbat
           FROM ( SELECT parcelle.parcelle, parcelle.dnupla, parcelle.ccosec, parcelle.dnupro, parcelle.dnvoiri, parcelle.dindic, parcelle.cconvo, parcelle.dvoilib, parcelle.dcntpa, parcelle.gparbat, parcelle.dnupla::integer AS dnupla2
                   FROM parcelle) p
          WHERE (p.dnupro::text IN ( SELECT proprietaire.dnupro
                   FROM proprietaire
                  WHERE btrim(proprietaire.ddenom::text) = ''COMMUNE DE LA ROCHELLE''::text OR btrim(proprietaire.ddenom::text) = ''VILLE DE LA ROCHELLE''::text OR btrim(proprietaire.ddenom::text) = ''LA REGIE MUNICIPALE DU PORT DE PLAISANCE DE LA ROCHELLE''::text OR btrim(proprietaire.ddenom::text) = ''LA ROCHELLE''::text
                  ))
          GROUP BY p.parcelle, p.dnupla, p.ccosec, (p.ccosec::text || '' ''::text) || p.dnupla::text, p.dnupro, (((((p.dnvoiri::text || '' ''::text) || p.dindic::text) || '' ''::text) || p.cconvo::text) || '' ''::text) || p.dvoilib::text, p.dcntpa, p.gparbat) groupe
   LEFT JOIN geo_parcelle ON groupe.parcelle::text = geo_parcelle.parcelle::text
  ORDER BY groupe.dnuplaccosec;

      '::text)
      "cadlr"(
      parcelle character varying(19),
      ccosec character varying(2),
      dnupla character varying(4),
      dnuplaccosec text,
      proprio text,
      adressep text,
      dcntpa integer,
      gparbat character varying(1),
      geom geometry);

--select parcelle
--from travail."ListeParcelle_From_cadlr"
--limit 10;

--insert into stockage."typeVoieManuel" values ( , 'VDEP');
