#!/usr/bin/env python
# -*- encoding: utf-8 -*-

# vu sur la page
#

import transformations
m = 12609
n = 8810
fp = [[1, m, m, 1], [1, 1, n, n]]
tp = [[1616411.91, 1617482.52, 1617503.82, 1616433.22],
      [9173672.33, 9173641.84, 9174389.85, 9174420.34]]
M = transformations.affine_matrix_from_points(fp, tp)
print M
#array([[  8.49147367e-02,   2.41854921e-03,   1.61641183e+06],
#       [ -2.41830584e-03,   8.49142922e-02,   9.17367225e+06],
#       [  0.00000000e+00,   0.00000000e+00,   1.00000000e+00]])
