#!/bin/bash

root_link="https://example.com/blabla/"

for (( i = 500; i < 10000; i++ ))
    do
        url="$root_link$i"
        curl -I --silent $url | grep 'needed word in response headers' | grep -v 'not needed word in response headers' # silent mode needed for output flexibility
    done
