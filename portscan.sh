#!/bin/bash

filein=$1

fileout=$2

tmpfile="tmp.txt"


if [[ ("$filein" == "-h") || ("$filein" == "") || ("$fileout" == "")]]; then

	echo "Type domains filename first, and space separated output filename second";

	exit 1;

fi



while IFS= read -r line
	
	do

		echo -e $line;

                echo -en '\n';
        	
        	nmap -F $line | grep -v 'Starting\|scanned\|report';

                echo -en '\n';
                                 
        done < "$filein" > "$fileout"


