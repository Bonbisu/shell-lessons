#!/bin/bash

if  [[ ! -d $1 ]]
  then
  echo "Usage: $0 <directory>"
    exit 1
  #statements
fi

case $2 in

	"directory")
		find $1 -maxdepth 1 -type d
		;;

	"link")
    		find $1 -maxdepth 1 -type l
    		;;
        #symbolic links
	*)
		echo "Usage: $0 <directory> directory | link"
		;;
esac

exit 0
