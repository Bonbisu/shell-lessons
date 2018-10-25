#!/bin/bash

OLDIFS=$IFS
IFS=","

while read product price quantity
do
    echo -e "{\n\
    \"Name\": \"$product\" \n\
    \"Price\": $price \n\
    \"Quantity\" : $quantity \n\
}\n"

done < $1
IFS=$OLDIFS
