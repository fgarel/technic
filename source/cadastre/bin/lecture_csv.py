#!/usr/bin/env python


import csv
import psycopg2

with open('data/e030717b/Point_generic.csv', 'r') as csvinputfile:
    csvreader = csv.reader(csvinputfile, delimiter=';')
    with open('data/dataout.txt', 'w') as csvoutputfile:
        csvwriter = csv.writer(csvoutputfile, delimiter='-',lineterminator='\n')
        for row in csvreader:
            print ', '.join(row)
            csvwriter.writerow(row)
#       close csvoutputfile
#   close csvinputfile


#fic.close()
