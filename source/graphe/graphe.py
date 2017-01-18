#!/usr/bin/env python3
# coding: utf-8

"""



"""

import sys
import argparse
import networkx as nx
from networkx.readwrite import json_graph
import pygraphml as pgml
import pygraphviz as pgv
import yaml



def volume_carburant(x1, y1, x2, y2):
    """
    volume de carburant nécessaire pour circuler entre deux points
    à partir des coordonnées de ces deux points
    """
    volume_carburant = (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1)
    return volume_carburant

def volume_carburant_point_point(point_ini, point_fin):
    """
    volume de carburant nécessaire pour aller d'un point a une station
    """
    print('volume_carburant_point_station = {}'.format(volume_carburant(point["a"], point["b"], station["x"], station["y"])))
    print('volume_carburant_point_station = {}'.format(volume_carburant(point["c"], point["d"], station["x"], station["y"])))


def volume_carburant_point_station(point, station):
    """
    volume de carburant nécessaire pour aller d'un point a une station
    """
    print('volume_carburant_point_station = {}'.format(volume_carburant(point["a"], point["b"], station["x"], station["y"])))
    print('volume_carburant_point_station = {}'.format(volume_carburant(point["c"], point["d"], station["x"], station["y"])))



def liste_volume_carburant_point_point():
    """
    liste de tous les volume_carburant_point_point
    """
    for point_ini in requetes:
        for point_fin in requetes:
            volume_carburant_point_point(point_ini, point_fin)

def liste_volume_carburant_point_station():
    """
    liste de tous les volume_carburant_point_station
    """
    for point in requetes:
        for station in stations:
            volume_carburant_point_station(point, station)

def taxi_des_neiges0(n, m, stations, requetes):
    """Inserez votre code ici"""
    print('volume_carburant = {}'.format(volume_carburant(requetes[0]["a"], requetes[0]["b"], requetes[0]["c"], requetes[0]["d"])))
    liste_volume_carburant_point_station()


def G_2_graphml(graphe, outfile):
    nx.write_graphml(graphe, outfile)

def G_2_json(graphe, outfile):
    node_link = json_graph.node_link_data(graphe)
    json = "{}"
    #json = json_graph.dumps(node_link)

	# Write to file
    fo = open(outfile, "w")
    fo.write(json)
    fo.close()

def G_2_yaml(graphe, outfile):
	# Write to file
    #fo = open(outfile, "w")
    #fo.write(str(graphe))
    nx.write_yaml(graphe, outfile)
    #fo.close()

def bipoints_2_G(bipoints):
    """
    constructeur d'un graphe a partir d'une liste de bipoints
    """
    #print("bipoints = {}".format(bipoints))
    graphe = nx.DiGraph()
    i = -1
    for bipoint in bipoints:
        i += 2
        noeud_ini = i
        noeud_fin = i + 1
        #print("bipoint = {}, ini = {}, fin = {}".format(bipoint, noeud_ini, noeud_fin))
        graphe.add_node(noeud_ini)
        graphe.add_node(noeud_fin)
        graphe.add_edge(noeud_ini, noeud_fin)
    #print("graphe = {}, nodes = {}, edges = {}".format(graphe, graphe.number_of_nodes(), graphe.number_of_edges()))
    return graphe

def points_2_G(points, indice_initial):
    """
    constructeur d'un graphe a partir d'une liste de points
    """
    #print("bipoints = {}".format(bipoints))
    graphe = nx.DiGraph()
    i = indice_initial - 1
    for point in points:
        i += 1
        noeud_ini = i
        #print("bipoint = {}, ini = {}, fin = {}".format(bipoint, noeud_ini, noeud_fin))
        graphe.add_node(noeud_ini)
    #print("graphe = {}, nodes = {}, edges = {}".format(graphe, graphe.number_of_nodes(), graphe.number_of_edges()))
    return graphe


if __name__ == '__main__':

    """
    # Cas generique

    n, m = map(int, input().split())
    stations = [None] * n
    for i in range(n):
        sx, sy = map(int, input().split())
        stations[i] = {"x": sx, "y": sy}
    requetes = [None] * m
    for j in range(m):
        ra, rb, rc, rd = map(int, input().split())
        requetes[j] = {"a": ra, "b": rb, "c": rc, "d": rd}
    """

    # exemple 1
    n = 1
    m = 1
    stations = [None] * n
    stations[0] = {"x": 0, "y": 0}
    requetes = [None] * m
    requetes[0] = {"a": -1, "b": 0, "c": 1, "d": 1}

    """
    # exemple 2
    n = 3
    m = 2
    stations = [None] * n
    stations[0] = {"x": 0, "y": 0}
    stations[1] = {"x": 0, "y": 1}
    stations[2] = {"x": 1, "y": 1}
    requetes = [None] * m
    requetes[0] = {"a": 42, "b": 0, "c": 3, "d": 3}
    requetes[1] = {"a": -1, "b": -1, "c": 2, "d": 2}
    """

    # creation d'un graphe orienté à partir de ces bipoints
    bipoints = requetes
    graphe_des_trajets = bipoints_2_G(bipoints)

    # creation d'un autre graphe à partir de la liste des stations
    indice_initial = graphe_des_trajets.number_of_nodes() + 1
    points = stations
    graphe_des_stations = points_2_G(points, indice_initial)


    # enregistrement de ce graphe dans un fichier dit "adjlist"
    #G_2_adjlist(DG, "graphe.adjlist")
    nx.write_adjlist(graphe_des_trajets, "trajets.adjlist")

    graphe_des_trajets.add_nodes_from(graphe_des_stations)
    nx.write_adjlist(graphe_des_trajets, "trajets_plus_stations.adjlist")

    # enregistrement de ce graphe dans un fichier dit "edgelist"
    #nx.write_edgelist(DG, "graphe.edgelist")

    # enregistrement de ce graphe dans un fichier graphml
    #G_2_graphml(DG, "graphe.graphml")

    # enregistrement de ce graphe dans un fichier json
    #G_2_json(DG, "graphe.json")

    # enregistrement de ce graphe dans un fichier yaml
    #G_2_yaml(DG, "graphe.yaml")


	#parser = argparse.ArgumentParser(description='Convert from GraphML to json. ')
	#parser.add_argument('-i','--input', help='Input file name (graphml)',required=True)
	#parser.add_argument('-o','--output', help='Output file name/path',required=True)
	#args = parser.parse_args()
    #graphmltojson(args.input, args.output)
