#!/bin/bash


file=$1

        while IFS= read line

                do 

                        res1=$(curl -o /dev/null -s -w "%{http_code}\n" https://$line)
                        res2=$(curl -o /dev/null -s -w "%{http_code}\n" http://$line)

                        echo $line;
                        echo $res1;
                        echo $res2;

                done <"$file"
