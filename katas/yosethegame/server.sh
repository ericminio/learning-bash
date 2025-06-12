#!/bin/bash

source 0-not-found.sh
source 1-hello-yose.sh
source 2-ping.sh
source 3-prime-factors.sh
source router.sh

# inspired by https://dev.to/leandronsp/building-a-web-server-in-bash-part-ii-parsing-http-14kg
function incoming {
  while read line; do
    trline=`echo $line | tr -d '[\r\n]'`    

    HEADLINE_REGEX='(.*?)\s(.*?)\sHTTP.*?'
    if [[ $trline =~ $HEADLINE_REGEX ]]; then
      REQUEST=$(echo $trline | sed -E "s/$HEADLINE_REGEX/\1 \2/")
      break
    fi
  done
  echo $REQUEST
}

function handler {
  REQUEST=$(incoming)
  RESPONSE=$($(route "$REQUEST") $REQUEST)

  echo -ne $RESPONSE > response
}

rm -f response
mkfifo response
while true; do cat response | nc -l -p 8333 | handler ; done