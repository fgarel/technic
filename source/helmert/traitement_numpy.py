#!/usr/bin/env python
# -*- encoding: utf-8 -*-

# vu sur la page
# http://www.portailsig.org/content/les-transformations-affines-avec-numpy-ou-la-signification-geometrique-d-un-fichier-worldfil

import numpy as np

m = 12609
n = 8810

# matrice des pixels:
fp = np.matrix([[1, m, m, 1], [1, 1, n, n]])
# ajout des cordonnées homogènes
newligne = [1, 1, 1, 1]
fp = np.vstack([fp, newligne])
print fp
#matrix([[    1, 12609, 12609,     1],
#        [    1,     1,  8810,  8810],
#        [    1,     1,     1,     1]])
# matrice des coordonnées
tp = np.matrix([[1616411.91, 1617482.52, 1617503.82, 1616433.22],
                [9173672.33, 9173641.84, 9174389.85, 9174420.34]])

# solution = fp x inverse(tp)
M = tp * fp.I
print M
#matrix([[  8.49147367e-02,   2.41854921e-03,   1.61641183e+06],
#        [ -2.41830584e-03,   8.49142922e-02,   9.17367225e+06]])

# paramètres
A = M[:, 0][0]
B = M[:, 1][0]
C = M[:, 2][0]
D = M[:, 0][1]
E = M[:, 1][1]
F = M[:, 2][1]

# dans l'ordre d'un worldfile
print A, D, B, E, C, F
#[[ 0.08491474]] [[-0.00241831]] [[ 0.00241855]] [[ 0.08491429]] [[ 1616411.82516671]] [[ 9173672.24750401]]

# contrôle global
print M * fp
#matrix([[ 1616411.9125,1617482.5175,1617503.8225,1616433.2175],
#        [ 9173672.32999999,9173641.84,9174389.85,9174420.34]])

# contrôle par point
xfp = np.matrix([[1], [8810], [1]])
xtp  = M * xfp
print xtp
#matrix([[ 1616433.2175],
#        [ 9174420.34  ]])

# nouveau point
xfp = np.matrix([[0], [8810], [1]])
xtp = M * xfp
print xtp
#matrix([[ 1616433.13258526],
#        [ 9174420.34241831]])
