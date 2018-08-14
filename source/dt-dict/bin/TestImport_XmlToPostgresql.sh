#!/bin/sh

# Essai pour importer un xml dans postgresql

verification du fichier initial

apt-get install libxml2-utils

# telechargement du xsd

wget -O schemaTeleservice_2_2.xsd 'http://www.reseaux-et-canalisations.ineris.fr/gu-presentation/userfile?path=/fichiers/SchemaXml/schemaTeleservice_2_2.xsd'

xmllint --noout --schema schemaTeleservice_2_2.xsd direct_vlr_2018080100424T_DDC_description.xml

xmllint --noout --schema 'http://www.reseaux-et-canalisations.ineris.fr/gu-presentation/userfile?path=/fichiers/SchemaXml/schemaTeleservice_2_2.xsd' direct_vlr_2018080100424T_DDC_description.xml


# largement inspiré de ce post
# https://stackoverflow.com/questions/19007884/import-xml-files-to-postgresql

cat ../data/_sample/direct_vlr_2018080100424T_DDC_description.xml


# On place le fichier xml au bon endroit

scp \
  ../data/_sample/direct_vlr_2018080100424T_DDC_description.xml \
  fred@ssh.cdalr.fr:/var/lib/postgresql/9.6/main/

scp \
  ../data/_sample/direct_vlr_2018080100424T_DDC_description.xml \
  fred@ssh.cdalr.fr:

ssh fred@ssh.cdalr.fr

sudo cp direct_vlr_2018080100424T_DDC_description.xml \
        /var/lib/postgresql/9.6/main/

# puis, on met les bons droits

sudo chown postgres:postgres /var/lib/postgresql/9.6/main/direct_vlr_2018080100424T_DDC_description.xml

## sous pgadmin


DROP TABLE IF EXISTS mytable;
CREATE TEMP TABLE mytable AS

SELECT

    (xpath('//noConsultationDuTeleservice/text()', x))[1]::text AS "noConsultationDuTeleservice"
    --,(xpath('//Name/text()', x))[1]::text AS Name
    --,(xpath('//RFC/text()', x))[1]::text AS RFC
    --,(xpath('//Text/text()', x))[1]::text AS Text
    --,(xpath('//Desc/text()', x))[1]::text AS Desc
FROM unnest(xpath('//dtDictConjointes', myxml)) x
;

END$$;

-- select * from mytable limit 5;
SELECT * FROM mytable;
