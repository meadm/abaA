#!/bin/bash
#read each line of the file one by one
while read LINE; do
#establish a variable that is just the first character of each line
    CARROTCHECK=$(echo $LINE | cut -c1)
#if the first character of each line is a carrot (a locus id) then...
    if [[ $CARROTCHECK == ">" ]]; then
#make a variable that is only the protein id
#removes everything after the first space
        SPECIES=$(echo $LINE | cut -d '|' -f2,2 | cut -d ' ' -f2-3)
        echo ">$SPECIES" >> $2
#if the first character of the line isn't a carrot (aka it's a line of sequence)
    else
#just echo the line to the new file
        echo $LINE >> $2
    fi
done < $1
