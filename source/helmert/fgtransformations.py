#!/usr/bin/env python
# -*- encoding: utf-8 -*-

# vu sur la page
#
u"""Transformations de coordonnées.

Ce script utilise les fonctions
du fichier transformations.py qui est récupéré ici
http://www.lfd.uci.edu/~gohlke/code/transformations.py.htmli

Nous avons eu connaissance de ce fichier, ainsi qu'un exemple
d'utilisation sur cette page
http://www.portailsig.org/content/les-transformations-affines-avec-numpy-ou-la-signification-geometrique-d-un-fichier-worldfil

Son utilisation est simple :
    deux fichiers csv en entrée :
        les points dans le système de départs
        et les points dans le système d'arrivée.

"""

#import csv
import transformations

# une image fait 12609 pixels par 8810 pixels
#m = 12609
#n = 8810
# matrice des pixels : coordonnées dans le 1er système
#fp = [[1, m, m, 1], [1, 1, n, n]]
# matrice des points dans le second système
#tp = [[1616411.91, 1617482.52, 1617503.82, 1616433.22],
#      [9173672.33, 9173641.84, 9174389.85, 9174420.34]]
#M = transformations.affine_matrix_from_points(fp, tp)
#print M
#array([[  8.49147367e-02,   2.41854921e-03,   1.61641183e+06],
#       [ -2.41830584e-03,   8.49142922e-02,   9.17367225e+06],
#       [  0.00000000e+00,   0.00000000e+00,   1.00000000e+00]])


def main():
    """Main entry point for the script."""

    with open('liste01.csv', 'r') as fginput:
        print fginput
        #pass
        #csvreader = csv.reader(fginput)
        #csvwriter.writerow([title, keywords])
        #print csvreader

    # début du code à tester
    # matrice des pixels : coordonnées dans le 1er système
    # la première ligne, ce sont les x
    # la seconde ligne, ce sont les y
    # liste01
    fp01 = [[0.00, 2.00, 2.00, 4.00, 4.00, 6.00, 5.00, 1.00],
            [2.00, 2.00, 5.00, 4.00, 2.00, 2.00, 0.00, 0.00]]
    # liste02
    fp02 = [[1.00, 3.00, 3.00, 5.00, 5.00, 7.00, 6.00, 2.00],
            [3.00, 3.00, 6.00, 5.00, 3.00, 3.00, 1.00, 1.00]]
    # liste03
    fp03 = [[3.00, 3.00, 0.00, 1.00, 3.00, 3.00, 5.00, 5.00],
            [0.00, 2.00, 2.00, 4.00, 4.00, 6.00, 5.00, 1.00]]
    # liste04
    fp04 = [[12.00, 8.00, 8.00, 4.00, 4.00, 0.00, 2.00, 10.00],
            [6.00, 6.00, 0.00, 2.00, 6.00, 6.00, 10.00, 10.00]]
    # liste05
    fp05 = [[6.00, 6.00, 15.00, 6.00, 12.00, 6.00, 0.00, 0.00],
            [15.00, 9.00, 9.00, 3.00, 3.00, -3.00, 0.00, 12.00]]
    # liste06
    fp06 = [[0.00, 0.00, 1.50, 1.00, 0.00, 0.00, -1.00, -1.00],
            [2.00, 1.00, 1.00, 0.00, 0.00, -1.00, -0.50, 1.50]]
    # liste07
    fp07 = [[-0.10, 2.00, 1.95, 4.05, 4.00, 6.10, 5.05, 0.95],
            [1.90, 2.00, 5.05, 3.95, 2.00, 2.10, 0.05, -0.05]]
    # liste08
    fp08 = [[0.90, 3.00, 2.95, 5.05, 5.00, 7.10, 6.05, 1.95],
            [2.90, 3.00, 6.05, 4.95, 3.00, 3.10, 1.05, 0.95]]
    # liste09
    fp09 = [[2.90, 3.00, -0.05, 1.05, 3.00, 3.10, 5.05, 4.95],
            [-0.10, 2.00, 2.05, 3.95, 4.00, 6.10, 5.05, 0.95]]
    # liste10
    fp10 = [[11.90, 8.00, 7.95, 4.05, 4.00, 0.10, 2.05, 9.95],
            [5.90, 6.00, 0.05, 1.95, 6.00, 6.10, 10.05, 9.95]]
    # liste11
    fp11 = [[5.90, 6.00, 14.95, 6.05, 12.00, 6.10, 0.05, -0.05],
            [14.90, 9.00, 9.05, 2.95, 3.00, -2.90, 0.05, 11.95]]
    # liste12
    fp12 = [[-0.10, 0.00, 1.45, 1.05, 0.00, 0.10, -0.95, -1.05],
            [1.90, 1.00, 1.05, -0.05, 0.00, -0.90, -0.45, 1.45]]
    # matrice des points dans le second système
    # la première ligne, ce sont les x
    # la seconde ligne, ce sont les y
    tp = [[0.00, 2.00, 2.00, 4.00, 4.00, 6.00, 5.00, 1.00],
          [2.00, 2.00, 5.00, 4.00, 2.00, 2.00, 0.00, 0.00]]
    M01ssu = transformations.affine_matrix_from_points(fp01, tp, shear=True, scale=True, usesvd=True)
    print "liste01, shear=True, scale=true, usesvd=True"
    print M01ssu
    M02ssu = transformations.affine_matrix_from_points(fp02, tp, shear=True, scale=True, usesvd=True)
    print "liste02, shear=True, scale=true, usesvd=True"
    print M02ssu
    M03ssu = transformations.affine_matrix_from_points(fp03, tp, shear=True, scale=True, usesvd=True)
    print "liste03, shear=True, scale=true, usesvd=True"
    print M03ssu
    M04ssu = transformations.affine_matrix_from_points(fp04, tp, shear=True, scale=True, usesvd=True)
    print "liste04, shear=True, scale=true, usesvd=True"
    print M04ssu
    M05ssu = transformations.affine_matrix_from_points(fp05, tp, shear=True, scale=True, usesvd=True)
    print "liste05, shear=True, scale=true, usesvd=True"
    print M05ssu
    M06ssu = transformations.affine_matrix_from_points(fp06, tp, shear=True, scale=True, usesvd=True)
    print "liste06, shear=True, scale=true, usesvd=True"
    print M06ssu
    M07ssu = transformations.affine_matrix_from_points(fp07, tp, shear=True, scale=True, usesvd=True)
    print "liste07, shear=True, scale=true, usesvd=True"
    print M07ssu
    M08ssu = transformations.affine_matrix_from_points(fp08, tp, shear=True, scale=True, usesvd=True)
    print "liste08, shear=True, scale=true, usesvd=True"
    print M08ssu
    M09ssu = transformations.affine_matrix_from_points(fp09, tp, shear=True, scale=True, usesvd=True)
    print "liste09, shear=True, scale=true, usesvd=True"
    print M09ssu
    M10ssu = transformations.affine_matrix_from_points(fp10, tp, shear=True, scale=True, usesvd=True)
    print "liste10, shear=True, scale=true, usesvd=True"
    print M10ssu
    M11ssu = transformations.affine_matrix_from_points(fp11, tp, shear=True, scale=True, usesvd=True)
    print "liste11, shear=True, scale=true, usesvd=True"
    print M11ssu
    M12ssu = transformations.affine_matrix_from_points(fp12, tp, shear=True, scale=True, usesvd=True)
    print "liste12, shear=True, scale=true, usesvd=True"
    print M12ssu
    #scale, shear, angles, translate, perspective = transformations.decompose_matrix(M12ssu)
    #print("scale %s", scale)


if __name__ == '__main__':
    main()
