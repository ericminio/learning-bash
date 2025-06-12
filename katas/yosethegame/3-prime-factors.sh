#!/bin/bash

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
  local NUMBER_REGEX='.*number=(.*?)$'
  local number=$(echo $url | sed -E "s/$NUMBER_REGEX/\1/")
  local NUMBER_REGEX='^[0-9]+$'
  if [[ ! $number =~ $NUMBER_REGEX ]]; then
    echo "HTTP/1.1 400\r\nContent-Type: application/json\r\n\r\n{\"number\":\"$number\",\"error\":\"not a number\"}"
    return
  fi

  echo "HTTP/1.1 200\r\nContent-Type: application/json\r\n\r\n{\"number\":$number,\"decomposition\":[$(decompose $number)]}"
}