#!/bin/bash

function is_home {
  if [ "$1" = "GET /" ]; then
    echo "true"
  else
    echo "false"
  fi
}

function home {
  cat index.html
}

