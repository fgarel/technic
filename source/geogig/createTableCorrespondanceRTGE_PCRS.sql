
DROP TABLE if exists a_rtge."DXFVersRTGE";

CREATE TABLE a_rtge."DXFVersRTGE"
(
  "id" serial,
  "Schema" text,
  "DXF_Table" text,
  "DXF_Select" text,
  "DXF_Clause" text,
  "RTGE_Table" text,
  "RTGE_Champs" text,
  CONSTRAINT "DXFVersRTGE_pk" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE a_rtge."DXFVersRTGE"
  OWNER TO "Fred";


DROP TABLE if exists a_rtge."DXFVersPCRS";

CREATE TABLE a_rtge."DXFVersPCRS"
(
  "id" serial,
  "Schema" text,
  "DXF_Table" text,
  "DXF_Select" text,
  "DXF_Clause" text,
  "PCRS_Table" text,
  "PCRS_Champs" text,
  CONSTRAINT "DXFVersPCRS_pk" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE a_rtge."DXFVersPCRS"
  OWNER TO "Fred";


DROP TABLE if exists a_rtge."RTGEVersPCRS";

CREATE TABLE a_rtge."RTGEVersPCRS"
(
  "id" serial,
  "RTGE_Schema" text,
  "RTGE_Table" text,
  "RTGE_Select" text,
  "RTGE_Clause" text,
  "PCRS_Schema" text,
  "PCRS_Table" text,
  "PCRS_Champs" text,
  CONSTRAINT "RTGEVersPCRS_pk" PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE a_rtge."RTGEVersPCRS"
  OWNER TO "Fred";


INSERT INTO a_rtge."DXFVersRTGE"(
            "Schema", "DXF_Table", "DXF_Select", "DXF_Clause", "RTGE_Table", 
            "RTGE_Champs")
  
  SELECT distinct
        'a_rtge' as "Schema",
        'dxf_autre_l' as "DXF_Table",
        '0 as gid_fichier, ''PCRS_?_' || layer || ''' as calque, st_setsrid(shape, 3946) as geometrie, linetype' as "DXF_Select",
        'layer=''' || layer || ''' and linetype=''' || coalesce(linetype,'CONTINUE') || '''' as "DXF_Clause",
        'ligne' as "RTGE_Table",
        '(gid_fichier, layer, shape, linetype)' as "RTGE_Champs"

  FROM a_rtge.dxf_autre_l
  order by "DXF_Clause"
  ;


INSERT INTO a_rtge."DXFVersRTGE"(
            "Schema", "DXF_Table", "DXF_Select", "DXF_Clause", "RTGE_Table", 
            "RTGE_Champs")
  
  SELECT distinct
        'a_rtge' as "Schema",
        'dxf_autre_s' as "DXF_Table",
        '0 as gid_fichier, ''PCRS_?_' || layer || ''' as calque, st_setsrid(shape, 3946) as geometrie, linetype, text' as "DXF_Select",
        'layer=''' || layer || ''' and linetype=''' || coalesce(linetype,'CONTINUE') || ''' and text=''' || coalesce(text,'CONTINUE') || '''' as "DXF_Clause",
        'surface' as "RTGE_Table",
        '(gid_fichier, layer, shape, linetype, text)' as "RTGE_Champs"

  FROM a_rtge.dxf_autre_s
  order by "DXF_Clause"
  ;

INSERT INTO a_rtge."DXFVersRTGE"(
            "Schema", "DXF_Table", "DXF_Select", "DXF_Clause", "RTGE_Table", 
            "RTGE_Champs")
  
  SELECT distinct
        'a_rtge' as "Schema",
        'dxf_autre_i' as "DXF_Table",
        '0 as gid_fichier, ''PCRS_?_' || layer || ''' as calque, st_setsrid(shape, 3946) as geometrie, x_scale_factor, y_scale_factor, angle' as "DXF_Select",
        'layer=''' || layer || ''' and block_name=''' || coalesce(block_name,'') || '''' as "DXF_Clause",
        'point' as "RTGE_Table",
        '(gid_fichier, layer, shape, block_name, x_scale_factor, y_scale_factor, angle)' as "RTGE_Champs"

  FROM a_rtge.dxf_autre_i
  where upper(block_name) not like '%TCPOINT%'
  order by "DXF_Clause"
  ;

INSERT INTO a_rtge."DXFVersRTGE"(
            "Schema", "DXF_Table", "DXF_Select", "DXF_Clause", "RTGE_Table", 
            "RTGE_Champs")
  
  SELECT distinct
        'a_rtge' as "Schema",
        'dxf_autre_i' as "DXF_Table",
        '0 as gid_fichier, ''PCRS_?_' || layer || ''' as calque, st_setsrid(shape, 3946) as geometrie, attributs, substring(attributs,''MAT=([^\n]*)\n'') as "Matricule", substring(attributs,''ALT=([^\n]*)\n'') as "Altitude", substring(attributs,''COD=([^\n]*)\n'') as "Code"' as "DXF_Select",
        'layer=''' || layer || ''' and block_name=''' || coalesce(block_name,'') || '''' as "DXF_Clause",
        'point_leve' as "RTGE_Table",
        '(gid_fichier, layer, shape, block_name, attributs, "Matricule", "Altitude", "Code")' as "RTGE_Champs"

  FROM a_rtge.dxf_autre_i
  where upper(block_name) like '%TCPOINT%'
  order by "DXF_Clause"
  ;


