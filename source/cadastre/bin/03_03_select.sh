#!/bin/sh

HOST=10.2.10.56

# Selection de certains enregistrements
# =====================================
psql -h $HOST -U contrib -d cadastre -f ./sql/select.sql

