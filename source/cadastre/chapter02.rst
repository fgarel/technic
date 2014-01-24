
******************************************
Utilisation de la base de données cadastre
******************************************

Manipulation des données littérales
===================================

Les fichiers littteraux
-----------------------
Les tables :
 - dgfip_parcelle       : parcelles non baties, nbat
     les attributs sont :
       id_parcelle      :
       infos_parcelle   : numero du compte communal, nom du proprietaire, etc
 - dgfip_batiment       :
     les attributs sont :
       id_parcelle      :
       lettre_batiment  :
       infos_batiment   : numero du compte communal, nom du propriétaire, etc
 - dgfip_local          : 
     les attributs sont :
       id_parcelle      :
       lettre_batiment  :
       invariant        :
       infos_local      : numero du compte communal, nom du propriétaire, etc
 - dgfip_pev            : 
     les attributs sont :
       id_parcelle      :
       lettre_batiment  :
       invariant        :
       pev              :
       infos_pev        : numero du compte communal, nom du propriétaire, etc
 - dgfip_desc           : 
     les attributs sont :
       id_parcelle      :
       lettre_batiment  :
       invariant        :
       pev              :
       desc             :
       infos_descriptif : numero du compte communal, nom du propriétaire, etc


Manipulation des données graphiques
===================================

 - Bati_G               : concatenation de la couche bati_dur et bati_leger du cadastre du plan cadastral (documentation graphique)
     les attributs sont :
       id_informatique  :
       the_geom         :
       id_parcelle      :
       type_bati        :
       lettre_batiment  :
       invariant        :
       pev              :
       desc             :

 - Parcelle_G           : couche parcelle du plan cadastral (documentation graphique)
     les attributs sont :
       id_informatique  :
       the_geom         :
       id_parcelle      :

Relation entre les deux sources de données
==========================================

 - Bati_G_L_P           : 
     les attributs sont :


