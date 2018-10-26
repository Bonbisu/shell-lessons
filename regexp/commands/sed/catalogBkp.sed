/^\// s/^/tar -rf catalog.tar /e
#  /^\// is the range, matches strings thats beging w/
# / (like a full path)

# tar -rf have -r to append inside a tar file 
# and -f to set the name of the file 

/^\// s/^/rm -f /e
# This expression is used to clean the folder 

# sed -f catalogBkp.sed cat.list 
