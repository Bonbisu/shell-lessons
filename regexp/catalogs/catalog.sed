# This script can commarize 1000 number w/ imperial units

s/,/:/g
# Substitutes the comma to colon 
s/\(^\|[^0-9.]\)\([0-9]\+\)\([0-9]\{3\}\)/\1\2,\3/g
# Group by 1000s the price

# To apply changes in all catalog files use:
# sed -i -f catalog.sed catalog/*
