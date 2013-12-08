#!/usr/bin/env python


import csv
with open('data.txt', 'r') as csvinputfile:
    csvreader = csv.reader(csvinputfile, delimiter=':')
    with open('dataout.txt', 'w') as csvoutputfile:
        csvwriter = csv.writer(csvoutputfile, delimiter='-',lineterminator='\n')
        for row in csvreader:
            print ', '.join(row)
            csvwriter.writerow(row)
#       close csvoutputfile
#   close csvinputfile


#fic.close()
