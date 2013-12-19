SELECT representation_chagneau.code, representation_chagneau.radical, dirname_basename_fullname_chagneau.basename
FROM representation_chagneau,
     dirname_basename_fullname_chagneau
WHERE representation_chagneau.radical = dirname_basename_fullname_chagneau.basename
GROUP BY representation_chagneau.code, representation_chagneau.radical, dirname_basename_fullname_chagneau.basename
ORDER BY representation_chagneau.code DESC;

--select representation_chagneau.code, representation_chagneau.radical, dirname_basename_fullname_chagneau.basename
--from representation_chagneau,
--     dirname_basename_fullname_chagneau
--where representation_chagneau.radical = dirname_basename_fullname_chagneau.basename;