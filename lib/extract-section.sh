#!/bin/sh

function extractSection() {
  local token=$1
  local before=$2
  local after=$3
  local input=$4
  local line=`grep -n $token $input | cut -f1 -d':' | head -1`
  if [[ $line ]]
  then
    cat -n $input | head -n $((line+after)) | tail -n $((before+after+1))
  fi
}
