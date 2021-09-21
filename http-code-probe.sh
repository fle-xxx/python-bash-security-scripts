#!/bin/bash


filein=$1 # http/s:// url file
fileout=$2


        while IFS= read line

                do 

                        res1=$(curl -o /dev/null -s -w "%{http_code}\n" $line)

                        echo -n $line; echo -n ','; echo -n $res1; echo -en '\n'; 


                done <"$filein" | grep -v '000' > "$fileout"
