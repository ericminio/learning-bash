#!/bin/bash

function is_home {
  if [ "$1" = "GET /" ]; then
    echo "true"
  else
    echo "false"
  fi
}

function home {
  local body=$(cat index.html)
  echo "HTTP/1.1 200\r\nContent-Type: text/html\r\n\r\n$body"
}

