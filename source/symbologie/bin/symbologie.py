#!/usr/bin/env python
"""
Define new functions using @qgsfunction. feature and parent must always be the
last args. Use args=-1 to pass a list of values as arguments
"""

from qgis.core import *
from qgis.gui import *

@qgsfunction(args='auto', group='Custom')
def axeDirectionFromXY(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Calcul de l'axe de Direction
    """
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
    else:
        Obs_AxeDirection = "y"
    #valeur = Obs_AxeDirection + "_" + str(Obs_LargeurX) + "_" + str(Obs_HauteurY)
    return Obs_AxeDirection

@qgsfunction(args='auto', group='Custom')
def ratioFromXY(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Calcul du ratio
    """
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_Ratio = 1.0
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_Ratio = round((Obs_LargeurX / Obs_HauteurY), 1)
    else:
        Obs_Ratio = round((Obs_HauteurY / Obs_LargeurX), 1)
    return Obs_Ratio

@qgsfunction(args='auto', group='Custom')
def suffixeFromXY(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Calcul du suffixe du nom
    """
    Obs_LargeurX = (Obs_LargeurX) * 1.0
    Obs_HauteurY = (Obs_HauteurY) * 1.0

    # debut
    signeSigne = "pp"
    if (Obs_LargeurX >= 0.0 and Obs_HauteurY >= 0.0):
        signeSigne = "pp"
    elif (Obs_LargeurX >= 0.0 and Obs_HauteurY < 0.0):
        signeSigne = "pm"
    elif (Obs_LargeurX < 0.0 and Obs_HauteurY < 0.0):
        signeSigne = "mm"
    elif (Obs_LargeurX < 0.0 and Obs_HauteurY >= 0.0):
        signeSigne = "mp"

    # milieu
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
    else:
        Obs_AxeDirection = "y"

    # fin
    Obs_Ratio = 1.0
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_Ratio = int(round((Obs_LargeurX / Obs_HauteurY)*10, 0))
    else:
        Obs_Ratio = int(round((Obs_HauteurY / Obs_LargeurX)*10, 0))

    Obs_Ratio = '{:0>3}'.format(Obs_Ratio)

    # suffixe
    valeur = signeSigne + "_" + Obs_AxeDirection + "_" + str(Obs_Ratio)
    return valeur


def suffixeFromXY2(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Calcul du suffixe du nom
    """
    Obs_LargeurX = (Obs_LargeurX) * 1.0
    Obs_HauteurY = (Obs_HauteurY) * 1.0

    # debut
    signeSigne = "pp"
    if (Obs_LargeurX >= 0.0 and Obs_HauteurY >= 0.0):
        signeSigne = "pp"
    elif (Obs_LargeurX >= 0.0 and Obs_HauteurY < 0.0):
        signeSigne = "pm"
    elif (Obs_LargeurX < 0.0 and Obs_HauteurY < 0.0):
        signeSigne = "mm"
    elif (Obs_LargeurX < 0.0 and Obs_HauteurY >= 0.0):
        signeSigne = "mp"

    # milieu
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
    else:
        Obs_AxeDirection = "y"

    # fin
    Obs_Ratio = 1.0
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_Ratio = int(round((Obs_LargeurX / Obs_HauteurY)*10, 0))
    else:
        Obs_Ratio = int(round((Obs_HauteurY / Obs_LargeurX)*10, 0))

    Obs_Ratio = '{:0>3}'.format(Obs_Ratio)

    # suffixe
    valeur = signeSigne + "_" + Obs_AxeDirection + "_" + str(Obs_Ratio)
    return valeur


@qgsfunction(args='auto', group='Custom')
def echelleInsertionFromXY(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Calcul de l'echelle d'insertion
    """
    Obs_LargeurX = (Obs_LargeurX) * 1.0
    Obs_HauteurY = (Obs_HauteurY) * 1.0
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
        echelleInsertion = round(Obs_LargeurX, 1)
    else:
        Obs_AxeDirection = "y"
        echelleInsertion = round(Obs_HauteurY, 1)

    return str(echelleInsertion)

def echelleInsertionFromXY2(Obs_LargeurX, Obs_HauteurY, feature, parent):
    """
    Calcul de l'echelle d'insertion
    """
    Obs_LargeurX = (Obs_LargeurX) * 1.0
    Obs_HauteurY = (Obs_HauteurY) * 1.0
    Obs_LargeurX = abs(Obs_LargeurX) * 1.0
    Obs_HauteurY = abs(Obs_HauteurY) * 1.0
    Obs_AxeDirection = "x"
    if (Obs_LargeurX >= Obs_HauteurY):
        Obs_AxeDirection = "x"
        echelleInsertion = round(Obs_LargeurX, 1)
    else:
        Obs_AxeDirection = "y"
        echelleInsertion = round(Obs_HauteurY, 1)

    return str(echelleInsertion)

if __name__ == '__main__':
    print("suffixe et prefixe")
    print(" 0.4,  0.4 > _" + suffixeFromXY2(0.4, 0.4, None, None) + " > " + echelleInsertionFromXY2(0.4, 0.4, None, None))
    print(" 0.4, -0.4 > _" + suffixeFromXY2(0.4, -0.4, None, None) + " > " + echelleInsertionFromXY2(0.4, -0.4, None, None))
    print("-0.4, -0.4 > _" + suffixeFromXY2(-0.4, -0.4, None, None) + " > " + echelleInsertionFromXY2(-0.4, -0.4, None, None))
    print("-0.4,  0.4 > _" + suffixeFromXY2(-0.4, 0.4, None, None) + " > " + echelleInsertionFromXY2(-0.4, 0.4, None, None))
    print(" 0.4,  0.3 > _" + suffixeFromXY2(0.4, 0.3, None, None) + " > " + echelleInsertionFromXY2(0.4, 0.3, None, None))
    print(" 0.4, -0.3 > _" + suffixeFromXY2(0.4, -0.3, None, None) + " > " + echelleInsertionFromXY2(0.4, -0.3, None, None))
    print("-0.4, -0.3 > _" + suffixeFromXY2(-0.4, -0.3, None, None) + " > " + echelleInsertionFromXY2(-0.4, -0.3, None, None))
    print("-0.4,  0.3 > _" + suffixeFromXY2(-0.4, 0.3, None, None) + " > " + echelleInsertionFromXY2(-0.4, 0.3, None, None))
    print(" 0.3,  0.4 > _" + suffixeFromXY2(0.3, 0.4, None, None) + " > " + echelleInsertionFromXY2(0.3, 0.4, None, None))
    print(" 0.3, -0.4 > _" + suffixeFromXY2(0.3, -0.4, None, None) + " > " + echelleInsertionFromXY2(0.3, -0.4, None, None))
    print("-0.3, -0.4 > _" + suffixeFromXY2(-0.3, -0.4, None, None) + " > " + echelleInsertionFromXY2(-0.3, -0.4, None, None))
    print("-0.3,  0.4 > _" + suffixeFromXY2(-0.3, 0.4, None, None) + " > " + echelleInsertionFromXY2(-0.3, 0.4, None, None))
    print("")
    print(" 1  ,  1   > _" + suffixeFromXY2(1, 1, None, None) + " > " + echelleInsertionFromXY2(1, 1, None, None))
    print(" 1  , -1   > _" + suffixeFromXY2(1, -1, None, None) + " > " + echelleInsertionFromXY2(1, -1, None, None))
    print("-1  , -1   > _" + suffixeFromXY2(-1, -1, None, None) + " > " + echelleInsertionFromXY2(-1, -1, None, None))
    print("-1  ,  1   > _" + suffixeFromXY2(-1, 1, None, None) + " > " + echelleInsertionFromXY2(-1, 1, None, None))
    print(" 1  ,  0.8 > _" + suffixeFromXY2(1, 0.8, None, None) + " > " + echelleInsertionFromXY2(1, 0.8, None, None))
    print(" 1  , -0.8 > _" + suffixeFromXY2(1, -0.8, None, None) + " > " + echelleInsertionFromXY2(1, -0.8, None, None))
    print("-1  , -0.8 > _" + suffixeFromXY2(-1, -0.8, None, None) + " > " + echelleInsertionFromXY2(-1, -0.8, None, None))
    print("-1  ,  0.8 > _" + suffixeFromXY2(-1, 0.8, None, None) + " > " + echelleInsertionFromXY2(-1, 0.8, None, None))
    print(" 0.8,  1   > _" + suffixeFromXY2(0.8, 1, None, None) + " > " + echelleInsertionFromXY2(0.8, 1, None, None))
    print(" 0.8, -1   > _" + suffixeFromXY2(0.8, -1, None, None) + " > " + echelleInsertionFromXY2(0.8, -1, None, None))
    print("-0.8, -1   > _" + suffixeFromXY2(-0.8, -1, None, None) + " > " + echelleInsertionFromXY2(-0.8, -1, None, None))
    print("-0.8,  1   > _" + suffixeFromXY2(-0.8, 1, None, None) + " > " + echelleInsertionFromXY2(-0.8, 1, None, None))
    print("")
    print(" 2  ,  2   > _" + suffixeFromXY2(2, 2, None, None) + " > " + echelleInsertionFromXY2(2, 2, None, None))
    print(" 2  , -2   > _" + suffixeFromXY2(2, -2, None, None) + " > " + echelleInsertionFromXY2(2, -2, None, None))
    print("-2  , -2   > _" + suffixeFromXY2(-2, -2, None, None) + " > " + echelleInsertionFromXY2(-2, -2, None, None))
    print("-2  ,  2   > _" + suffixeFromXY2(-2, 2, None, None) + " > " + echelleInsertionFromXY2(-2, 2, None, None))
    print(" 2  ,  1.6 > _" + suffixeFromXY2(2, 1.6, None, None) + " > " + echelleInsertionFromXY2(2, 1.6, None, None))
    print(" 2  , -1.6 > _" + suffixeFromXY2(2, -1.6, None, None) + " > " + echelleInsertionFromXY2(2, -1.6, None, None))
    print("-2  , -1.6 > _" + suffixeFromXY2(-2, -1.6, None, None) + " > " + echelleInsertionFromXY2(-2, -1.6, None, None))
    print("-2  ,  1.6 > _" + suffixeFromXY2(-2, 1.6, None, None) + " > " + echelleInsertionFromXY2(-2, 1.6, None, None))
    print(" 1.6,  2   > _" + suffixeFromXY2(1.6, 2, None, None) + " > " + echelleInsertionFromXY2(1.6, 2, None, None))
    print(" 1.6, -2   > _" + suffixeFromXY2(1.6, -2, None, None) + " > " + echelleInsertionFromXY2(1.6, -2, None, None))
    print("-1.6, -2   > _" + suffixeFromXY2(-1.6, -2, None, None) + " > " + echelleInsertionFromXY2(-1.6, -2, None, None))
    print("-1.6,  2   > _" + suffixeFromXY2(-1.6, 2, None, None) + " > " + echelleInsertionFromXY2(-1.6, 2, None, None))
