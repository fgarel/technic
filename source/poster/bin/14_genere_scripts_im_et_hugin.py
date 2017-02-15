#!/usr/bin/env python3
# coding: utf-8


#fabrication d'un dictionnaire de dictionnaire id, nom_yx, x, y
mon_dico = {}
liste_informations = {}

dalle_centre = {}

# emprise de la zone a survoler
# en mercator
x_min = -141375
y_min = 5798785
x_max = -119999 # -120 000 + 1 = (x_min + 19 * x_pas) + 1
y_max =  5812641 # 5 812 640 + 1 = (y_min + 17 * y_pas) + 1
x_pas = 1125
y_pas = 815
print('x_max_calcule = {}, x_max_renseigné = {}'.format(x_min + 19 * x_pas, x_max))
print('y_max_calcule = {}, y_max_renseigné = {}'.format(y_min + 17 * y_pas, y_max))
x_nb_pas = (x_max - x_min - 1) / x_pas
y_nb_pas = (y_max - y_min - 1) / y_pas
print('x_nb_pas = {}, y_nb_pas = {}'.format(x_nb_pas, y_nb_pas))
x_moyen = (x_max - x_min) / 2
y_moyen = (y_max - y_min) / 2
dalle_centre_nom_x = x_nb_pas / 2
dalle_centre_nom_y = y_nb_pas / 2
dalle_centre_i = x_nb_pas * y_nb_pas / 2

print('dalle_centre_nom_x = {}, dalle_centre_nom_y = {}, dalle_centre_i = {}'.format(dalle_centre_nom_x, dalle_centre_nom_y, dalle_centre_i))



countx = 0
county = 0
id = -1
for x in range (x_min, x_max, x_pas):
    countx += 1
    #print('x {} => x = {}'.format(countx, x))
    county = 0
    for y in range(y_min, y_max, y_pas):
        county += 1
        id += 1
        if (x > (x_moyen - (x_pas / 2))) \
          and (x < (x_moyen + (x_pas / 2))) \
          and (y > (y_moyen - (y_pas / 2))) \
          and (y < (y_moyen + (y_pas / 2))):
            dalle_centre_nom_x = nom_yx
            dalle_centre_nom_y = nom_yx
            dalle_centre_i = id
            print('dalle_centre_nom_x = {}, dalle_centre_nom_y = {}, dalle_centre_i = {}'.format(dalle_centre_nom_x, dalle_centre_nom_y, dalle_centre_i))

        nom = '{:0>2}.{:0>2}'.format(county, countx)
        mon_dico_temp = {}
        mon_dico_temp['nom_yx'] = nom
        mon_dico_temp['x'] = x
        mon_dico_temp['y'] = y
        liste_informations[id] = mon_dico_temp
        #print('id = {}, nom = yx = {}, x = {}, y = {}'.format(id, nom, x, y))

print(liste_informations[359])


nom_a_tester = '13.13'
for cle1, dico in liste_informations.items():
    for cle2, valeur in dico.items():
        #print("La clé 1 {} contient le dico qui contient la clé 2 {} et la valeur {}.".format(cle1, cle2, valeur))
        pass
