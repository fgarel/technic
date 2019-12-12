
-- creation et initialisation de la table avancement_gspreadsheet
-- à partir de données gspreadsheet

DROP TABLE if exists voirie_administratif.avancement_gspreadsheet;
CREATE TABLE voirie_administratif.avancement_gspreadsheet
as
  select * from mv_demande_gspreadsheet;

-- on efface tout...
TRUNCATE TABLE  voirie_administratif.avancement_gspreadsheet;
