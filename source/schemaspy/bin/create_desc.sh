#!/bin/bash
# à partir des fichiers *_desc.dump,
#on fabrique un fichier de metadonnées

# rm -f table.sql ;
rm -f metadata1.csv
rm -f metadata2.csv
rm -f metadata3.csv
rm -f metadata4.csv
rm -f metadata5.csv
#rm -f *_sample.dump
#rm -f *_sample2.dump
rm -f spatial_ref_sys_desc.dump
rm -f geometry_columns_desc.dump
rm -f create_desc2.sh


#  metadata.csv => table | champ | type | description
#####################################################

LISTE=`ls *_desc.dump`
#echo $LISTE

#ecriture de la premiere ligne du fichier metadata
echo "table|champ|type|description" > metadata1.csv

for FILE in $LISTE; do
  # affichage du nom du fichier
  #echo $FILE
  #echo $FILE >> metadata.csv
  FILE2=`echo $FILE | sed -e 's/\(.*\)_desc.dump/\1/g'` 

  # solution 1 : dans metadata.csv, on recupere nom_champ;type; 
  #tail -n+7 $FILE | head -n-6 | cut -f2,3 -d'|' | sed -e 's/ //g' | sed -e 's/|/\;/g' | xargs -i{} echo {}";" >> metadata.csv

  # solution 2 : dans metadata.csv, on recupere nom_table;nom_champ;type;nom_champ 
  tail -n+7 $FILE | head -n-6 | cut -f2,3 -d'|' | sed -e 's/ //g' | sed -e 's/\(.*\)|\(.*\)/\1\|\2|\1/g' | xargs -i{} echo $FILE2"|"{} >> metadata1.csv
done

#  metadata2.csv => table%champ | type | description
####################################################
tail -n+2 metadata1.csv | sed -e 's/|/%/'  > metadata2.csv

# fichiers *_second.dump => table | champ | valeur 
# fichiers *_second2.dump => table_champ | valeur 
#################################################

#ecriture des premieres lignes du fichier create_desc2.sh
echo "#!/bin/bash" > create_desc2.sh
echo "# attention, il faut avoir installer csvkit" >> create_desc2.sh
echo "# et il faut etre dans l'environnement python csvkit" >> create_desc2.sh
echo "# workon csvkit" >> create_desc2.sh
echo "# chmod +x create_desc2.sh" >> create_desc2.sh
echo "" >> create_desc2.sh
echo "rm -f *_second.dump" >> create_desc2.sh
echo "rm -f metadata3.csv" >> create_desc2.sh
echo "" >> create_desc2.sh

LISTE2=`ls *_first.dump`
for FILE in $LISTE2; do
  # affichage du nom du fichier
  #echo $FILE
  #echo $FILE >> sample.csv
  FILE2=`echo $FILE | sed -e 's/\(.*\)_first.dump/\1/g'` 

  # suppression de la ligne separant entete et données
  # suppression des blancs en début de ligne
  # et du caractere pipe en fin de ligne
  # suppression des blancs de part et d'autres du caractere pipe
  # et des lignes vides et transformation de ce pipe en retour chariot
  tail -n+5 $FILE \
    | head -n-2 \
    | sed -e 's/^-.*\+$//g' \
    | sed -e 's/^ *//g' \
          -e 's/\( *\)|\( *\)$//g' \
    | sed -e 's/\( *\)|\( *\)/\n/g' \
          -e '/^$/d' \
    > "$FILE2"_fdata.dump
  tail -n+3 $FILE \
    | head -n-4 \
    | sed -e 's/^-.*\+$//g' \
    | sed -e 's/^ *//g' \
          -e 's/\( *\)|\( *\)$//g' \
    | sed -e 's/\( *\)|\( *\)/\n/g' \
          -e '/^$/d' \
    > "$FILE2"_fentete.dump
    
    # dans les fichers *_second.dump, on ecrit table | champ | valeur
    echo "csvjoin "$FILE2"_fentete.dump "$FILE2"_fdata.dump | sed -e 's/,/|/' -e 's/^\(.*\)$/"$FILE2"|\1/' > "$FILE2"_second.dump" >> create_desc2.sh
    # dans le fichier metadata3.csv, on ecrit table%champ | valeur
    echo "csvjoin "$FILE2"_fentete.dump "$FILE2"_fdata.dump | sed -e 's/,/|/' -e 's/^\(.*\)$/"$FILE2"%\1/' >> metadata3.csv" >> create_desc2.sh
done

chmod +x create_desc2.sh


echo "" >> create_desc2.sh
# on va essayer de faire un csvjoin entre metadata2.csv et metadata3.csv
echo "# on va essayer de faire un csvjoin entre metadata2.csv et metadata3.csv" >> create_desc2.sh
# cela se fera avec la jointure sur la première colonne de chacun de ces deux fichiers
echo "# cela se fera avec la jointure sur la première colonne de chacun de ces deux fichiers" >> create_desc2.sh
# cette premiere colonne est table%champ
echo "# cette premiere colonne est table%champ" >> create_desc2.sh
echo "" >> create_desc2.sh
echo "csvjoin -d \"|\" -c 1 metadata2.csv metadata3.csv > metadata4.csv" >> create_desc2.sh
echo "" >> create_desc2.sh
echo "# avant la commande sed, la ligne est 1%2,3,4,5%6,7" >> create_desc2.sh
echo "#  1 = table" >> create_desc2.sh
echo "#  2 = champ" >> create_desc2.sh
echo "#  3 = type" >> create_desc2.sh
echo "#  4 = desc" >> create_desc2.sh
echo "#  5 = table = 1" >> create_desc2.sh
echo "#  6 = champ = 6" >> create_desc2.sh
echo "#  7 = valeur" >> create_desc2.sh
echo "# apres la commande sed, la ligne est 1|2|3|4|7" >> create_desc2.sh
#echo "sed -i -e 's/^\(.*\)|\(.*\)|\(.*\),\(.*\),\(.*\)|/\1|\2|\3|/' -e 's/,/|/' metadata4.csv" >> create_desc2.sh
#echo "sed -i -e 's/^\(.*\)%\(.*\),\(.*\),\(.*\),\(.*\)%\(.*\),/\1|\2|\3|\4|/' metadata4.csv" >> create_desc2.sh
#echo "sed -i -e 's/^\(.*\)%\(.*\),\(.*\),\(.*\),\(.*\)%/\1%\2|\3|\4|\5%/' -e 's/,/|/' metadata4.csv" >> create_desc2.sh
echo "sed -i -e 's/^\(.*\)%\(.*\),\(.*\),\(.*\),\(.*\)%/\1%\2|\3|\4|\5%/' -e 's/,/|/' -e 's/^\(.*\)%\(.*\)|\(.*\)|\(.*\)|\(.*\)%\(.*\)|/\1|\2|\3|\4|/' metadata4.csv" >> create_desc2.sh

# enfin, petite dernière chose :
# metadata4.csv est un pur csv
# aussi, on ajoute une fichier
# metadata5.csv qui sera plus adapté à une sortie imprimée
echo "" >> create_desc2.sh
echo "" >> create_desc2.sh
echo "# creation du fichier metadata5.csv" >> create_desc2.sh
echo "" >> create_desc2.sh
echo "( echo \"table|champ|type|desc|valeur\" ; cat metadata4.csv ) | csvlook -d \"|\" > metadata5.csv" >> create_desc2.sh
