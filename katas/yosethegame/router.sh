#!/bin/bash

function route {
  local request="$1"
  local routes=(
    $(is_home "$request") "home"
    $(is_ping "$request") "ping"
    $(is_primeFactors "$request") "primeFactors"
  )
  local matching_routes="notFound"
  for ((i=0; i<${#routes[@]}; i+=2)); do
    if [ "${routes[i]}" = "true" ]; then
      matching_routes="${routes[i+1]}"
      break
    fi
  done
  echo $matching_routes
}
