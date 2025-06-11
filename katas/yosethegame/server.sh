#!/bin/bash

# inspired by https://dev.to/leandronsp/building-a-web-server-in-bash-part-ii-parsing-http-14kg

rm -f response
mkfifo response

function home {
  cat index.html
}

function pong {
  echo '{"pong":"hi there!"}'
}

function handler {
  while read line; do
    trline=`echo $line | tr -d '[\r\n]'`    

    HEADLINE_REGEX='(.*?)\s(.*?)\sHTTP.*?'
    if [[ $trline =~ $HEADLINE_REGEX ]]; then
      REQUEST=$(echo $trline | sed -E "s/$HEADLINE_REGEX/\1 \2/")
      echo "$REQUEST"
      break
    fi
  done

  case "$REQUEST" in
    "GET /") RESPONSE="HTTP/1.1 200\r\nContent-Type: text/html\r\n\r\n$(home)" ;;
    "GET /ping") RESPONSE="HTTP/1.1 200\r\nContent-Type: application/json\r\n\r\n$(pong)" ;;
          *) RESPONSE="HTTP/1.1 404 NotFound\r\n\r\n\r\nNot Found" ;;
  esac

  echo -ne $RESPONSE > response
}

while true; do cat response | nc -l -p 8333 | handler ; done