#!/bin/bash

function is_ping {
  if [ "$1" = "GET /ping" ]; then
    echo "true"
  else
    echo "false"
  fi
}

function ping {
  local body='{"pong":"hi there!"}'
  echo "HTTP/1.1 200\r\nContent-Type: application/json\r\n\r\n$body"
}

