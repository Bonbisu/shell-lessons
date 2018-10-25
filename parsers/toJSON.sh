#!/bin/bash

OLDIFS=$IFS
IFS=","
OUT=${2:-csvParsed}
HELP="-h"

if [[ $1 = $HELP ]]
    then
        echo -e "\nCSV to JSON parser. \n \
             Please call >> ./parseJSON.sh [input_file] [output_file*] \n \
             \n* If ommited output_file the default is $OUT.json"
else

    if [[ ! $1 ]]
        then
            echo "Please enter some file as arg. Use \"$0 -h\" to get help"
    else
        while read product price quantity
        do
            [[ $product = "product" ]] && continue
            echo -e "{\n\"Name\": \"$product\" \n\"Price\": $price \n\"Quantity\" : $quantity \n}\n" >> $OUT.json
        
        done < $1
        IFS=$OLDIFS
    fi
fi
