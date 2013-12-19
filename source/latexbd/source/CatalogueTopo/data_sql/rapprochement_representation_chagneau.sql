-- on recopie la table
DROP TABLE dirname_basename_fullname_chagneau;
CREATE TABLE dirname_basename_fullname_chagneau AS
SELECT *
FROM dirname_basename_fullname;
VACUUM ANALYSE dirname_basename_fullname_chagneau;


-- on fait le rapprochement
DROP TABLE rep_chagneau;
CREATE TABLE rep_chagneau AS
SELECT representation_chagneau.code,
       dirname_basename_fullname_chagneau.basename,   
       dirname_basename_fullname_chagneau.fullname
FROM dirname_basename_fullname_chagneau,
     representation_chagneau
WHERE dirname_basename_fullname_chagneau.basename = representation_chagneau.radical
ORDER BY representation_chagneau.code;
VACUUM ANALYSE rep_chagneau;
