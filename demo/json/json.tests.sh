#!/bin/bash

source './demo/json/json.sh'
source './demo/support/inspect.sh'

function test_json {
    local input=$' { \n   "alive": true, \n  "value": 42 \n}'
    local body=$(printf "%s" "$input" | json)    

    assertequals "$body" '{ "alive":true, "value":42 }'
}

