domain=$1

curl -fsSL -path-as-is "https://crt.sh/?CN=%25.""{$domain}" | grep $domain | sort -n | uniq -c | sort -r | column -t | grep -v '\*\|\#' | sed 's/^....//' | sed 's/[[:space:]]*$//' | grep '<TD>' | grep -oE '[[:alnum:]]+[.][[:alnum:]_.-]+' | grep $domain
