#!/bin/bash

source 1-hello-yose.sh
source 2-ping.sh
source 3-prime-factors.sh

# inspired by https://dev.to/leandronsp/building-a-web-server-in-bash-part-ii-parsing-http-14kg
rm -f response
mkfifo response

function route {
  local request="$1"

  if [[ $request == "GET /" ]]; then
    echo "home"
  elif [[ $request == "GET /ping" ]]; then
    echo "ping"
  elif [[ $request =~ 'primeFactors' ]]; then
    echo "primeFactors"
  else
    echo "not-found"
  fi
}

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
    "home") RESPONSE="HTTP/1.1 200\r\nContent-Type: text/html\r\n\r\n$(home)" ;;
    "ping") RESPONSE="HTTP/1.1 200\r\nContent-Type: application/json\r\n\r\n$(pong)" ;;
    "primeFactors") RESPONSE=$(primeFactors $URL) ;;
          *) RESPONSE="HTTP/1.1 404 NotFound\r\n\r\n\r\nNot Found" ;;
  esac

  echo -ne $RESPONSE > response
}

while true; do cat response | nc -l -p 8333 | handler ; done