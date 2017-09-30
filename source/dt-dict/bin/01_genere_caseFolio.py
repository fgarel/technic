#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# script pour la creation des folios PCRS

#from database import database
#from database import parametresConnection
import sys
import math

"""
INSERT INTO a_pcrs."EmpriseEchangePCRS"(
            complement,
            "datePublication",
            gestionnaire,
            type,
            geometrie)
select
  'VLR-46-00197-01045-21-A-18' as "complement",
  date '2017-10-01' as "datePublication",
  '05' as "gestionnaire",
  '03' as "type",
  st_multi(
    st_geomfromtext('POLYGON((1379280 5225600, 1379280 5225700, 1379420 5225700, 1379420 5225600, 1379280 5225600))', 3946)
  ) as geometrie;

"""

class GenerateurCaseFolio(object):

    u""" Cette classe correspond à un generateur """

    def __init__(self):
        u""" Fonction lancée au moment de l'instanciation. """
        self.CCC = "CDA"
        self.PP = "46"
        self.separateur = "-"
        self.dictDiviseEn04 = { '0,1': 'A', '1,1': 'B',
                                '0,0': 'C', '1,0': 'D'}
        self.dictDiviseEn25 = { '0,4': '01', '1,4': '02', '2,4': '03', '3,4': '04', '4,4': '05',
                                '0,3': '06', '1,3': '07', '2,3': '08', '3,3': '09', '4,3': '10',
                                '0,2': '11', '1,2': '12', '2,2': '13', '3,2': '14', '4,2': '15',
                                '0,1': '16', '1,1': '17', '2,1': '18', '3,1': '19', '4,1': '20',
                                '0,0': '21', '1,0': '22', '2,0': '23', '3,0': '24', '4,0': '25'}
        self.case_010000_A1_07000_05000 = "LL-ppppp-qqqqq"
        self.case_005000_A1_03500_02500 = "LL-ppppp-qqqqq-A"
        self.case_002000_A1_01400_01000 = "LL-ppppp-qqqqq-AA"
        self.case_001000_A1_00700_00500 = "LL-ppppp-qqqqq-AA-B"
        self.case_000500_A1_00350_00250 = "LL-ppppp-qqqqq-AA-B-C"
        self.case_000200_A1_00140_00100 = "LL-ppppp-qqqqq-AA-B-CC"
        self.case_000200_A3_00070_00050 = "LL-ppppp-qqqqq-AA-B-CC-D"

    def chercheDans04(self, x, y):
        u""" """
        self.trouve4 = 0
        print("test = {}".format(self.dictDiviseEn04["1,1"]))
        return self.trouve4

    def chercheDans25(self, x, y):
        u""" """
        self.trouve4 = 0
        print("test = {}".format(self.dictDiviseEn25["1,3"]))
        return self.trouve4

    def casesFromXMYM(self, XM, YM):
        u""" """
        self.ppppp = '{:0>5}'.format(int(XM // 7000))
        self.qqqqq = '{:0>5}'.format(int(YM // 5000))
        self.case_010000_A1_07000_05000 = self.CCC + self.separateur + self.PP + self.separateur + self.ppppp + self.separateur + self.qqqqq
        print("case_010000_A1_07000_05000 = {}".format(self.case_010000_A1_07000_05000))
        self.restex010000 = round(XM % 7000, 8)
        self.restey010000 = round(YM % 5000, 8)
        self.p005000 = '{:0>1}'.format(int(self.restex010000 // 3500))
        self.q005000 = '{:0>1}'.format(int(self.restey010000 // 2500))
        self.A = "{}".format(self.dictDiviseEn04[self.p005000 + "," + self.q005000])
        self.case_005000_A1_03500_02500 = self.case_010000_A1_07000_05000 + self.separateur + self.A
        #print("ppppp = {}, qqqqq = {}, restex = {}, restey = {}".format(self.ppppp, self.qqqqq, self.restex, self.restey))
        print("case_005000_A1_03500_02500 = {}".format(self.case_005000_A1_03500_02500))
        self.p002000 = '{:0>1}'.format(int(self.restex010000 // 1400))
        self.q002000 = '{:0>1}'.format(int(self.restey010000 // 1000))
        self.AA = "{}".format(self.dictDiviseEn25[self.p002000 + "," + self.q002000])
        self.case_002000_A1_01400_01000 = self.case_010000_A1_07000_05000 + self.separateur + self.AA
        print("case_002000_A1_01400_01000 = {}".format(self.case_002000_A1_01400_01000))
        self.restex002000 = round(int(self.p002000) % 1400, 8)
        self.restey002000 = round(int(self.q002000) % 1000, 8)
        return


def main():
    u""" Fonction appelée par défaut. """
    mygenerateur = GenerateurCaseFolio()
    mygenerateur.chercheDans04(5,3)
    mygenerateur.chercheDans25(5,3)
    mygenerateur.casesFromXMYM(1379337.91,5225674.16)
    print('CCC        = {}'.format(mygenerateur.CCC))
    print('PP         = {}'.format(mygenerateur.PP))
    print('separateur = {}'.format(mygenerateur.separateur))
    print('trouve4    = {}'.format(mygenerateur.trouve4))

if __name__ == '__main__':
    #import pdb; pdb.set_trace()
    main()
