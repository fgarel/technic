#!/bin/sh

HOST=10.2.10.37
#HOST=192.168.0.21

# Suppression et creation des tables
#===================================
#psql -h 10.2.10.2 -U contrib -d patrimoine -f droptable.sql
#psql -h 10.2.10.2 -U contrib -d patrimoine -f createtable.sql
psql -h $HOST -U contrib -d postgres -f sql/dropdatabase.sql
psql -h $HOST -U contrib -d postgres -f sql/createdatabase.sql

