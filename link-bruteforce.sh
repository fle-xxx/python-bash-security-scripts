#!/bin/bash

root_link="https://example.com/bla/"
not_needed_string="not_needed_string"
alphabet="A B C D E F G H I J K L O M N O P Q R S T U V X Y Z a b c d e f g h i j k l m n o p q r s t u v w x y z 0 1 2 3 4 5 6 7 8 9"


for a in $alphabet
    do
        for i in $alphabet
            do
                for j in $alphabet  
                    do
                        for k in $alphabet
                            do
                                url="$root_link$a$i$j$k" #creates links like https://example.com/bla/Abc1
                         
                                res=$(curl -i --silent $url | grep 'word_we_want_to_catch1.*word_we_want_to_catch2' | grep -v 'word_we_not_want_to_catch1\|word_we_not_want_to_catch2')
                                
                                if [[ ("$res" != "") && ("$res" != "$not_needed_string") ]]
                                    then echo $res; echo -e $url
                                fi
                            done   
                    done
            done
    done
