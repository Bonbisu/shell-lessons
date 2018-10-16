#!/bin/bash

if  (( $# < 1))
  then
    echo "Usage: $0 <name>"
    exit 1
  #statements
fi
echo "Hello $1"

# Using $n we cand take outside arguments to put in our script
# when we hit 2 digit arg we write ${nn} e.g. '${15}' $0 is the
# script name itself. Using $* will take all params except script
# name. $# will count all params except script name.

exit 0
