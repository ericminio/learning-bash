#!/bin/bash

source 0-not-found.sh
source 1-hello-yose.sh
source 2-ping.sh
source 3-prime-factors.sh
source router.sh

function handler {
  while read line; do
    trline=`echo $line | tr -d '[\r\n]'`    

    HEADLINE_REGEX='(.*?)\s(.*?)\sHTTP.*?'
    if [[ $trline =~ $HEADLINE_REGEX ]]; then
      METHOD=$(echo $trline | sed -E "s/$HEADLINE_REGEX/\1/")
      URL=$(echo $trline | sed -E "s/$HEADLINE_REGEX/\2/")
      echo $METHOD $URL
      REQUEST="$METHOD $URL"
      break
    fi
  done

  
  case $(route "$REQUEST") in
    "home") RESPONSE=$(home) ;;
    "ping") RESPONSE=$(ping) ;;
    "primeFactors") RESPONSE=$(primeFactors $URL) ;;
    
    "notFound") RESPONSE=$(notFound);;
  esac

  echo -ne $RESPONSE > response
}

# inspired by https://dev.to/leandronsp/building-a-web-server-in-bash-part-ii-parsing-http-14kg
rm -f response
mkfifo response

while true; do cat response | nc -l -p 8333 | handler ; done