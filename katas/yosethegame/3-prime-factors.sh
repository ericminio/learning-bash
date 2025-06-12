#!/bin/bash

function is_primeFactors {
  if [[ $1 =~ 'primeFactors' ]]; then
    echo "true"
  else
    echo "false"
  fi
}

function decompose {
  local number="$1"

  local factors=()
  local factor=2

  while [ $((number % factor)) -eq 0 ]; do
    factors+=($factor)
    number=$((number / factor))
  done

  local joined_with_comma=$(IFS=,; echo "${factors[*]}")
  
  echo "$joined_with_comma"
}

function primeFactors {
  local url="$1"
  local INCOMING_REGEX='.*number=(.*?)$'
  local number=$(echo $url | sed -E "s/$INCOMING_REGEX/\1/")
  local IS_NUMBER_REGEX='^[0-9]+$'
  if [[ ! $number =~ $IS_NUMBER_REGEX ]]; then
    echo "HTTP/1.1 400\r\nContent-Type: application/json\r\n\r\n{\"number\":\"$number\",\"error\":\"not a number\"}"
    return
  fi

  echo "HTTP/1.1 200\r\nContent-Type: application/json\r\n\r\n{\"number\":$number,\"decomposition\":[$(decompose $number)]}"
}