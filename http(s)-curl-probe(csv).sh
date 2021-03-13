#!/bin/bash


filein=$1
fileout=$2


        while IFS= read line

                do 

                        res1=$(curl -o /dev/null -s -w "%{http_code}\n" https://$line)
                        res2=$(curl -o /dev/null -s -w "%{http_code}\n" http://$line)

                        echo -n $line; echo -n ','; echo -n $res1; echo -n ','; echo -n $res2; echo -en '\n'; 


                done <"$filein" | grep -v '000,000' > "$fileout"

