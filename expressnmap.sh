#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path to file with ips>"
    exit 1
fi

FILE_PATH="$1"
TMP_CONFIG=$(mktemp)

# Записываем в конфиг каждый URL и указываем разделитель после каждого ответа
while read -r ip; do
    echo "url = \"https://internetdb.shodan.io/$ip\"" >> "$TMP_CONFIG"
    echo "write-out = \"\n\"" >> "$TMP_CONFIG"
done < "$FILE_PATH"

curl -s -K "$TMP_CONFIG" | grep -v "No information available"

# Удаляем временный конфигурационный файл
rm "$TMP_CONFIG"

#usage: ./expressnmap.sh ips_file
