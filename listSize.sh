#!/usr/bin/env bash

for file in $(ls)
  do
    [[ ! -f $file ]] && continue
    LA=$(stat -c %x $file | cut -d " " -f1)
    # stat get status from $file and
    # -c forces a FORMAT for %x that extracts
    # human readable last time the file
    # was accessed in a timestamp.
    # 'cut -d' will splice the timestamp
    # on spaces (can be any charactere)
    # and take only the first 'field' thats
    # the date.
    SIZE=$(du -b $file | cut -d " " -f1)
    echo "$file is $SIZE bytes and was last accessed on $LA"
    # du extracts the size in -b (bytes)
  done
