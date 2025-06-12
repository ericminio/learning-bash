#!/bin/bash

function is_ping {
  if [ "$1" = "GET /ping" ]; then
    echo "true"
  else
    echo "false"
  fi
}

function pong {
  echo '{"pong":"hi there!"}'
}

