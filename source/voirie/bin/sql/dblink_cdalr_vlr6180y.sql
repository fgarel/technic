-- View: voirie_travaux."inObjetSimplePoint"

-- DROP VIEW voirie_travaux."inObjetSimplePoint";

CREATE OR REPLACE VIEW voirie_travaux."inObjetSimplePoint" AS 
  SELECT
    "inObjetSimplePoint".id,
    "inObjetSimplePoint"."CodeObjet",
    "inObjetSimplePoint".shape
  FROM dblink(
   'dbname=espu
    port=53239
    host=localhost
    user=''fred''
    password=fgpass'::text,
   '-- selection des objets de la base interne
    select
      id,
      "CodeObjet",
      shape
    from voirie_travaux."inObjetSimplePoint";
   '::text) "inObjetSimplePoint" (
      id integer,
      "CodeObjet" character varying,
      shape geometry
    );

ALTER TABLE voirie_travaux."inObjetSimplePoint"
  OWNER TO fred;



CREATE OR REPLACE VIEW "voirie_travaux"."outObjetPpi" AS
  SELECT
  "FolderName",
  "PlacemarkName",
  "Latitude",
  "Longitude",
  "Address",
  "Template",
  "Title",
  "ImageUrl",
  "ImageWidth",
  "ImageHeight",
  "ParagraphText",
  "LinkUrl",
  "LinkText"
  FROM dblink(
   'dbname=espu
    port=53239
    host=localhost
    user=''fred''
    password=fgpass'::text,
   '-- selection des objets de la base interne
select
  "FolderName",
  "PlacemarkName",
  "Latitude",
  "Longitude",
  "Address",
  "Template",
  "Title",
  "ImageUrl",
  "ImageWidth",
  "ImageHeight",
  "ParagraphText",
  "LinkUrl",
  "LinkText"
from "voirie_travaux"."outObjetSimplePointPpi"
union
select
  "FolderName",
  "PlacemarkName",
  "Latitude",
  "Longitude",
  "Address",
  "Template",
  "Title",
  "ImageUrl",
  "ImageWidth",
  "ImageHeight",
  "ParagraphText",
  "LinkUrl",
  "LinkText"
from "voirie_travaux"."outObjetMultiPointPpi"
union
select
  "FolderName",
  "PlacemarkName",
  "Latitude",
  "Longitude",
  "Address",
  "Template",
  "Title",
  "ImageUrl",
  "ImageWidth",
  "ImageHeight",
  "ParagraphText",
  "LinkUrl",
  "LinkText"
from "voirie_travaux"."outObjetSimpleLinestringPpi"
union
select
  "FolderName",
  "PlacemarkName",
  "Latitude",
  "Longitude",
  "Address",
  "Template",
  "Title",
  "ImageUrl",
  "ImageWidth",
  "ImageHeight",
  "ParagraphText",
  "LinkUrl",
  "LinkText"
from "voirie_travaux"."outObjetMultiLinestringPpi"
union
select
  "FolderName",
  "PlacemarkName",
  "Latitude",
  "Longitude",
  "Address",
  "Template",
  "Title",
  "ImageUrl",
  "ImageWidth",
  "ImageHeight",
  "ParagraphText",
  "LinkUrl",
  "LinkText"
from "voirie_travaux"."outObjetSimplePolygonPpi"
union
select
  "FolderName",
  "PlacemarkName",
  "Latitude",
  "Longitude",
  "Address",
  "Template",
  "Title",
  "ImageUrl",
  "ImageWidth",
  "ImageHeight",
  "ParagraphText",
  "LinkUrl",
  "LinkText"
from "voirie_travaux"."outObjetMultiPolygonPpi"
;
   '::text) "outObjetPpi" (
  "FolderName" character varying,
  "PlacemarkName" character varying,
  "Latitude" numeric,
  "Longitude" numeric,
  "Address" character varying,
  "Template" character varying,
  "Title" character varying,
  "ImageUrl" character varying,
  "ImageWidth" integer,
  "ImageHeight" integer,
  "ParagraphText" character varying,
  "LinkUrl" character varying,
  "LinkText" character varying
    );

ALTER TABLE "voirie_travaux"."outObjetPpi"
  OWNER TO fred;
