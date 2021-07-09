#!/bin/bash
while read LINE; do
    CARROTCHECK=$(echo $LINE | cut -c1)
    if [ $CARROTCHECK == ">" ]; then
        echo $LINE | cut -c 2- | cut -d '|' -f1,2 >> species_check.txt
    fi
done < $1
