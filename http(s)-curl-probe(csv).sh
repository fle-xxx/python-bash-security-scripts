#!/bin/bash


file=$1

        while IFS= read line

                do 

                        res1=$(curl -o /dev/null -s -w "%{http_code}\n" https://$line)
                        res2=$(curl -o /dev/null -s -w "%{http_code}\n" http://$line)

                        echo -n $line; echo -n ','; echo -n $res1; echo -n ','; echo -n $res2; echo -en '\n'; 


                done <"$file"

