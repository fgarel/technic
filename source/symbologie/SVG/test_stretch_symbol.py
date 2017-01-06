#!/usr/bin/env python3
# coding: utf-8

"""
Outil pour modifier un symbole svg à partir d'un template et de coef d'etirement.

Le fichier généré possede un nom qui est derivé des paramètres donnés en entrée.

Les 3 paramètres transmis sont :
- le nom du fichier svg template
- xy (x ou y selon que l'on agrandit x ou y)
- le ratio (ratio abs(round(x/y,1)) ou abs(round(y/x,1)))

Exemple d'utilisation
./stretch_symbol.py template_arbre.svg x .2

"""

# Import
# Sys pour les parametres
import stretch_symbol as ss


def main():

    for kx in [-3, -2, -1, 0.001, 1, 2, 3]:
        for ky in [-3, -2, -1, 0.001, 1, 2, 3]:
            # print("kx = {}, ky = {}".format(kx,ky))
            # if (kx > ky):
            #     xy = "x"
            # else:
            #     xy = "y"
            #mmin = min(abs(x), abs(y))
            #mmax = max(abs(x), abs(y))
            #signe = y * x / abs(x) / abs (y)
            #ratio = signe * round(mmax / mmin, 1)
            #print("xy = {}, min = {}, max = {}, signe = {}, ratio = {}".format(xy, mmin, mmax, signe, str(ratio)))
            #fichierSortie = 'ratios/' + 'Template' + '_' + xy + '_' +  str(ratio) + '.svg'
            #ss.main("Template.svg", fichierSortie, xy, str(ratio))

            fichierEntree = "Template.svg"
            kx = float(kx)
            ky = float(ky)
            nomx = str(round(kx / min(abs(kx), abs(ky)) * 1.0, 1))
            nomy = str(round(ky / min(abs(kx), abs(ky)) * 1.0, 1))
            fichierSortie = 'ratios/'+str("Template" + '_' + nomx + '_' + nomy + '.svg')
            #print('new = > {}, {}, {}, {}'.format(fichierEntree, fichierSortie, kx, ky))
            #main(fichierEntree, fichierSortie, XY, ratio)
            ss.stretch_symbol(fichierEntree, fichierSortie, kx, ky)



if __name__ == '__main__':
    """


    """


    main()
