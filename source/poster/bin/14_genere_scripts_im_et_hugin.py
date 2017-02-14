#!/usr/bin/env python3
# coding: utf-8


#fabrication d'un dictionnaire de dictionnaire id, nom_yx, x, y
mon_dico = {}
liste_informations = {}

countx = 0
county = 0
id = -1
for x in range (-141375, -119999, 1125):
    countx += 1
    #print('x {} => x = {}'.format(countx, x))
    county = 0
    for y in range(5798785, 5813250, 815):
        county += 1
        id += 1
        nom = '{:0>2}.{:0>2}'.format(county, countx)
        mon_dico_temp = {}
        mon_dico_temp['nom_yx'] = nom
        mon_dico_temp['x'] = x
        mon_dico_temp['y'] = y
        liste_informations[id] = mon_dico_temp
        print('id = {}, nom = yx = {}, x = {}, y = {}'.format(id, nom, x, y))

print(liste_informations[3])


nom_a_tester = '13.13'
for cle1, dico in liste_informations.items():
    for cle2, valeur in dico.items():
        print("La clé 1 {} contient le dico qui contient la clé 2 {} et la valeur {}.".format(cle1, cle2, valeur))
