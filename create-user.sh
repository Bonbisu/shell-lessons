#!/bin/bash

for u in $*
  do
    useradd $u
    echo Password1 | passwd --stdin $u 
    # passwd sets a new Password to user 
    passwd -e $u
    # -e makes passwd expired, the user needs to set
    # another password at the first login
  done
echo "Finished"