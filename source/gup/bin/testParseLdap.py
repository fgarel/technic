#!/usr/bin/env python3
# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility

# installation du module
# sudo apt-get install python3-ldif3


# http://ldap3.readthedocs.io/ldif.html

import ldap3
from ldap3 import Server, Connection, ALL

conn = Connection('aul.larochelle.fr', auto_bind=True)
print(conn)

#('ldap://:389',)
# >>> con.simple_bind_s(u'login', u'secret_password')
#results = con.search_s(u'ou=people,dc=larochelle,dc=fr', ldap.SCOPE_SUBTREE, u"(cn=GAREL Frédéric)")


# request a few objects from the ldap server
result = conn.search(u'ou=people,dc=larochelle,dc=fr', '(cn=*)', SUBTREE, attributes = ['sn', 'objectClass'])
ldif_output = c.response_to_ldif()
