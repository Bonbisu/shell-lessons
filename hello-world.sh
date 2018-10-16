#!/bin/bash -x

# Shegang calls what interpreter will runs the script
# Inserting -x on shebang will runs on debug mode,
# we can also call '$ bash -x script.sh' to debug.
# pound sign (#) can be used to comment code.

## If we want to access some script anywhere, we need to permit this
## by calling '$ chmod +x script.sh' and putting the file in 
## some path included in $PATH variable.

echo "Hello World"

exit 0
