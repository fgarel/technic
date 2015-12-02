#!/usr/bin/python3
#

class FileReader:
    """
    Lecture des fichiers initaux
    """

    def __init__(self, fileini=""):
        """ initialisation """
        self.fileini = fileini
        self.points =[]

    def parser(self):
        fluxfichier = open(self.fileini, "r")
        # on saute la première ligne
        #entete = fluxfichier.readline().rstrip('\n\r')
        fluxfichier.readline()
        # on lit les lignes suivantes
        for ligne in fluxfichier:
            #print("ligne=", ligne)
            ligne = ligne.rstrip('\n\r')
            #print("ligne=", ligne)
            n,x,y = ligne.split(' ')
            #print("N =", n, " ; X =", x, " ; Y =", y)
            point = Point(n, x, y)
            #print(point)
            self.points.append(point)

        fluxfichier.close()
        return self.points

class Point:
    """
    Point = sommet d'un triangle
    """

    def __init__(self, n=0, x=0, y=0):
        """ Create a new point at x, y """
        self.n = int(n)
        self.x = float(x)
        self.y = float(y)

    def __repr__(self):
        return repr((self.n, self.x, self.y))

    def __str__(self):
        return "Point N°{0} = ({1}, {2})".format(self.n, self.x, self.y)

class Delaunay:
    """
    Delaunay = graphe
    """

    def __init__(self, nodes=[], arcs=[]):
        """ Create a new graph """
        self.nodes = nodes
        self.arcs = arcs

    def __str__(self):
        for node in self.nodes:
            pass
        for arc in self.arcs:
            pass
    def triInitial(self):
        # tri des points dans lordre des y croissant
        nodesTriesEnY = sorted(self.nodes, key=lambda point: point.y)
        # puis tri de cette nouvelle liste dans l'ordre des x croissants
        #print(sorted(self.nodes, key=lambda tri: point.x))
        nodesTriesEnXY = sorted(nodesTriesEnY, key=lambda point: point.x)
        return nodesTriesEnXY
        #for point in sorted(self.nodes, key=lambda tri: point.x):
        #for point in sorted(self.nodes, key=lambda point: point.x):
        #    print(point)
        #return sorted(self.nodes, key=lambda point: point.x)

class Triangle:
    """
    Create a new Triangle
    """

    def __init__(self, Sommet1, Sommet2, Sommet3):
        """ Create a new Triangle """
        self.Sommet1 = Sommet1
        self.Sommet2 = Sommet2
        self.Sommet3 = Sommet3

    def __str__(self):
        return "({0}, {1}), ({2}, {3}), ({4}, {5})".format(self.Sommet1.x, self.Sommet1.y, self.Sommet2.x, self.Sommet2.y, self.Sommet3.x, self.Sommet3.y)



if __name__=='__main__':
    # Lecture d'un fichier point initial
    fileini="points.csv"
    points = FileReader(fileini).parser()
    # lancement de la triangulation de delaunay
    graph_points = Delaunay(nodes = points, arcs = []).triInitial()
    for point in graph_points:
        print(point)
