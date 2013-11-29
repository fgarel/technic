--SELECT
--   theme.theme_id as ThemeId,
--   count(1)
--FROM Theme 
--GROUP BY theme_id
--ORDER by theme_id;

-- pour chaque theme, calcul du nombre de domaines
SELECT
   theme.theme_id as ThemeId,
   count(1)
FROM theme, domaine
WHERE theme.theme_id = domaine.theme_id 
GROUP BY theme.theme_id
ORDER BY theme.theme_id;


-- pour chaque theme, calcul du nombre de classes
SELECT
   theme.theme_id as ThemeId,
   count(1)
FROM theme, domaine, classe
WHERE theme.theme_id = domaine.theme_id 
  AND domaine.domaine_id = classe.domaine_id
GROUP BY theme.theme_id
ORDER BY theme.theme_id;

-- pour chaque theme, calcul du nombre d'objets
SELECT
   theme.theme_id as ThemeId,
   count(1)
FROM theme, domaine, classe, objet
WHERE theme.theme_id = domaine.theme_id 
  AND domaine.domaine_id = classe.domaine_id
  AND classe.classe_id = objet.classe_id
GROUP BY theme.theme_id
ORDER BY theme.theme_id;


-- pour chaque domaine, calcul du nombre de classes
SELECT
   theme.theme_id as ThemeId,
   domaine.domaine_id as DomaineId,
   count(1)
FROM theme, domaine, classe
WHERE theme.theme_id = domaine.theme_id 
  AND domaine.domaine_id = classe.domaine_id
GROUP BY theme.theme_id, domaine.domaine_id
ORDER BY theme.theme_id, domaine.domaine_id;

-- pour chaque domaine, calcul du nombre d'objets
SELECT
   theme.theme_id as ThemeId,
   domaine.domaine_id as DomaineId,
   count(1)
FROM theme, domaine, classe, objet
WHERE theme.theme_id = domaine.theme_id
  AND domaine.domaine_id = classe.domaine_id
  AND classe.classe_id = objet.classe_id
GROUP BY theme.theme_id, domaine.domaine_id
ORDER BY theme.theme_id, domaine.domaine_id;

-- pour chaque classe, calcul du nombre d'objets
SELECT
   theme.theme_id as ThemeId,
   domaine.domaine_id as DomaineId,
   classe.classe_id as Classe_id,
   count(1)
FROM theme, domaine, classe, objet
WHERE theme.theme_id = domaine.theme_id 
  AND domaine.domaine_id = classe.domaine_id
  AND classe.classe_id = objet.classe_id
GROUP BY theme.theme_id, domaine.domaine_id, classe.classe_id
ORDER BY theme.theme_id, domaine.domaine_id, classe.classe_id;




