#!/bin/sh



# 7ème Partie : Installation de postgresql et postgis
#####################################################
# Installation de postgresql et postgis
echo '# 7ème Partie : Installation de postgresql et postgis'
echo '#####################################################'
echo '#'
echo '# Creation des utilisateurs et des bases pour utiliser les données d OSM'
echo '#'
echo '# Pour l utilisateur ...'
echo "#  - fred"
echo '#'
echo '# ... nous allons attribuer une base de données ...'
echo '# - symbologie'
echo '# '
echo '# ... qui seront configurées avec les extensions ...'
echo '# - adminpack'
echo '# - postgis'
echo '# - postgis_topology'
echo '# - fuzzystrmatch'
echo '# - hstore'
echo '# - dblink'
echo '# - unaccent'
echo '#'
echo '# Extention dblink : permet d interroger une base de données externe'
echo '# A partir de la base espu, on va interroger les bases osm et voieadresse'
echo '#'
echo '# Extention unaccent : pour pouvoir comparer deux textes plus facilement,'
echo '# il faut ajouter à la base de données une extension "unaccent"'
echo '# cela est utile pour modifier les chaines de caractères accentués'
echo '# vu ici'
echo '#   http://stackoverflow.com/questions/13596638/function-to-remove-accents-in-postgresql'
echo '#'
echo '# Ici, le role fred a aussi le droit de créer des bases'
echo '#'
echo '# Creation des utilisateurs et des bases de données'
echo '# ================================================='


listdbtodrop='symbologie' ;
#listusertodrop='osmuser' ;
#listuser='osmuser'
postgresqluserowner='fred'  # le propriétaire des bases
listdb='symbologie' ;
listext='adminpack plpgsql postgis postgis_topology fuzzystrmatch hstore dblink unaccent' ;
listext='adminpack postgis postgis_topology fuzzystrmatch hstore dblink unaccent' ; # la meme, sans plpgsql
# liste des schemas pour la base espu
listschema='stockage travail'

for database in $listdbtodrop ;
    do
        echo "#" ;
        echo '# Suppression de la base de données :' $database ;
        sudo -u postgres \
             dropdb $database ;
    done

#for postgresqluser in $listusertodrop ;
#    do
#        echo '#' ;
#        echo '# Suppression de l utilisateur :' $postgresqluser ;
#        sudo -u postgres \
#             dropuser "$postgresqluser";
#    done

#for postgresqluser in $listuser ;
#    do
#        echo '#' ;
#        echo '# Création de l utilisateur :' $postgresqluser ;
#        echo '# -------------------------'
#        echo 'sudo -u postgres \' ;
#        echo '     createuser' $postgresqluser ;
#        sudo -u postgres \
#             createuser "$postgresqluser";
#        echo '# Modification du mot de passe et des droits'
#        echo "sudo -u postgres psql -c \"ALTER ROLE \\\"$postgresqluser\\\" WITH PASSWORD '$postgresqluser';\"" ;
#        #echo "sudo -u postgres psql -c \"ALTER ROLE \\\"$postgresqluser\\\" NOSUPERUSER NOCREATEDB NOCREATEROLE;\"" ;
#        echo '# ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !'
#        echo '# Attention, ici on se met en superuser pour la creation des schemas '
#        echo '# ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! ! !'
#        echo "sudo -u postgres psql -c \"ALTER ROLE \\\"$postgresqluser\\\" SUPERUSER NOCREATEDB NOCREATEROLE;\"" ;
#        sudo -u postgres psql -c "ALTER ROLE \"$postgresqluser\" WITH PASSWORD '$postgresqluser';" ;
#        sudo -u postgres psql -c "ALTER ROLE \"$postgresqluser\" SUPERUSER NOCREATEDB NOCREATEROLE;" ;
#    done

echo '#' ;
echo '# Creation des bases appartenant à :' $postgresqluserowner ;
echo '# --------------------------------' ;

for database in $listdb ;
    do
        echo "#" ;
        echo '# Création de la base de données :' $database ;
        echo "# ------------------------------------------" ;
        echo 'sudo -u postgres \' ;
        echo '     createdb --encoding=UTF8 \' ;
        echo '              --owner='$postgresqluserowner '\' ;
        echo '             ' $database ;
        sudo -u postgres \
             createdb --encoding=UTF8 \
                      --owner=$postgresqluserowner \
                      $database ;

        for extension in $listext ;
            do
                echo "#" ;
                echo '# Pour la base, ' $database ', installation de l extension :' $extension ;
                echo "# ------------------------------------------" ;
                echo 'sudo -u postgres \' ;
                echo '     psql --username=postgres \' ;
                echo '          --dbname='$database '\' ;
                echo "          -c \"CREATE EXTENSION $extension;\"" ;
                sudo -u postgres \
                     psql --username=postgres \
                          --dbname=$database \
                          -c "CREATE EXTENSION $extension;"
            done
    done


# pour la base symbologie, creation de deux schemas
# ajout des droits sur ces deux schemas et sur le shema public
# pour l'utilisateur fred
#
database='symbologie'
for schema in $listschema ;
    do
        echo "#" ;
        echo '# Pour la base, ' $database ', installation du schema :' $schema ;
        echo "# ------------------------------------------" ;
        echo 'sudo -u postgres \' ;
        echo '     psql --username=postgres \' ;
        echo '          --dbname='$database '\' ;
        echo "          -c \"CREATE SCHEMA $schema;\"" ;
        sudo -u postgres \
             psql --username=postgres \
                  --dbname=$database \
                  -c "CREATE SCHEMA $schema;"
        echo 'sudo -u postgres \' ;
        echo '     psql --username=postgres \' ;
        echo '          --dbname='$database '\' ;
        echo "          -c \"GRANT ALL ON SCHEMA $schema TO \\\"$postgresqluserowner\\\";\"" ;
        sudo -u postgres \
             psql --username=postgres \
                  --dbname=$database \
                  -c "GRANT ALL ON SCHEMA $schema TO \"$postgresqluserowner\";"
    done



echo "#"
echo ""
