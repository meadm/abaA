#!/bin/bash
while read LINE; do
#make a variable that is just the p-value
    PVALUE=$(echo $LINE | cut -d ';' -f4,4 | cut -d '=' -f2,2)
#bash can't evaluate decimal points so have bc do it for me
#this says that if the p-value is less than the value you give the script as an argument, return a "true" statement
    if (( $(echo "$PVALUE < $2" | bc -l) )); then
#the double quotes are needed in order to maintain the tab-delimiters
        echo "$LINE" >> WetAUpstreamfimo_Matt_MATWCY_filtered.gff
    fi
done < $1
