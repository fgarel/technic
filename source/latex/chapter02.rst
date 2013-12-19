**********************
Inclure des graphiques
**********************


Incorporer des graphiques (des photos, des images) est une opération un peu complexe mais qui a été simplifiéie.

La documentation
================

La doc générale sur latex

Les cours de Thierry Masson

http://science.thilucmic.fr/spip.php?article30

http://science.thilucmic.fr/spip.php?article5

Framabook

http://framabook.org/5-tout-ce-que-vous-avez-toujours-voulu-savoir-sur-latex-sans-jamais-oser-le-demander/

Latex pour les sciences humaines

https://github.com/maieul/latexhumain

http://geekographie.maieul.net/
http://geekographie.maieul.net/Xe-LaTeX-applique-aux-sciences

Les autres bouquins

https://github.com/vhf/free-programming-books
http://math.univ-lyon1.fr/irem/IMG/pdf/LatexPourProfMaths.pdf


figure, sous-figure et flottant
-------------------------------
La commande pour inclure des graphique c'est includegraphics du paquet graphicx.

La documentation concernant son utilisation est ici

sharelatex

https://www.sharelatex.com/blog/2013/08/06/thesis-series-pt2.html#.UrLSWd_gFTN

wikibooks

http://en.wikibooks.org/wiki/LaTeX/Floats,_Figures_and_Captions

http://monbloginformatique.blogspot.fr/



Des problèmes de bounding box nous ont obligés à creuser les options de viewport....

Ces développements sont dans le fichier chapter/appendix02.tex




Aller plus loin
---------------
Inclure des graphique, c'est bien, mais pouvoir les annoter c'est mieux.

Pour cela, plusieurs possiblités :

 - overpic
 - tikzpicture
 
la comparaison de ces deux méthodes se touve ici

http://tex.stackexchange.com/questions/95273/tikz-overlay-png-or-pdf-image-over-another-pdf-figure

Un exemple de overpic est décrit ici :

http://www.tug.org/pracjourn/2005-3/hoeppner/hoeppner.pdf

Un exemple de tikz est détaillé ici : drawing-on-an-image-with-tikz

http://tex.stackexchange.com/questions/9559/drawing-on-an-image-with-tikz

Enfin, l'utilisation de beamer détaille la superposition d'éléments sur les images

http://lesfichesabebert.fr/index.php/Beamer/Overlay

http://lesfichesabebert.fr/index.php/Beamer/Tikz


La mise en oeuvre
=================

Dans le rapport_facade_hdv, les graphiques sont importés en annexe.

Mais pour faciliter l'import, nous avons réalisé des nouvelles commandes (macros latex)




